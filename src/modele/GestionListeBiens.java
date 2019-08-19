package modele;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;

public class GestionListeBiens {
	private ArrayList<Contrat> ContratLocation = new ArrayList<Contrat>();
	Connexion con = new Connexion();

	/* ----liste des bien loués---- */
	public ArrayList<Bien> GetListBienLoues(String email) {
		ArrayList<Bien> List = new ArrayList<Bien>();
		try {
			long idClient = 0;
			String query = "SELECT idusr FROM utilisateur where email= ? ;";
			PreparedStatement st = con.connectP(query);
			st.setString(1, email);
			ResultSet rslt = st.executeQuery();
			if (rslt.next()) {
				idClient = rslt.getLong("idusr");
			}

			/*
			 * String query1 =
			 * "SELECT * FROM bien as a, contratlocation as b, facture as c  WHERE a.idbien=b.idbien and b.idcontrat=c.idcontrat and a.idproprietaire="
			 * + idClient + " and b.etat='valide''"; st = con.connectP(query1);
			 * st.setLong(1, idClient); st.setString(2, "valide"); rslt =
			 * st.executeQuery();
			 */

			Statement stm = con.connect();

			rslt = stm
					.executeQuery("SELECT * FROM bien as a, contratlocation as b WHERE a.idbien=b.idbien and a.idproprietaire="
							+ idClient + " and b.etat='valide'");
			while (rslt.next()) {
				Bien bien = new Bien();

				bien.setIdbien(rslt.getLong("idbien"));

				bien.setType(rslt.getString("type"));

				bien.setAdresse(rslt.getString("adresse"));

				bien.setPrixmax(rslt.getInt("prix"));

				List.add(bien);
			}

			for (Bien bieen : List)
				System.out.println("idbien : " + bieen.getIdbien());
			return List;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return List;
	}

	public ArrayList<Contrat> GetListContratLoues(ArrayList<Bien> List) {

		ArrayList<Contrat> List1 = new ArrayList<Contrat>();

		try {
			for (Bien bien : List) {

				String query = "SELECT * FROM contratlocation WHERE idbien=? and etat=?;";

				PreparedStatement st = con.connectP(query);
				st.setLong(1, bien.getIdbien());
				st.setString(2, "valide");
				ResultSet rslt = st.executeQuery();

				while (rslt.next()) {

					Contrat contrat = new Contrat();

					contrat.setDatedebut(rslt.getString("datedebut"));
					
					contrat.setDatecontrat((LocalDate.parse(rslt.getString("datedebut")).plusDays(Integer.parseInt(rslt.getString("dureebail")))).toString());

					contrat.setIdcontrat(Long.parseLong(rslt.getString("idcontrat")));

					List1.add(contrat);
				}
			}

			for (Contrat coontrat : List1)
				System.out.println(coontrat.getIdcontrat());

			return List1;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return List1;

	}

	public ArrayList<Facture> getLocataire(ArrayList<Contrat> List) {
		Facture facture = new Facture();
		ArrayList<Facture> List1 = new ArrayList<Facture>();

		for (Contrat contrat : List) {

			String query = "SELECT idlocataire FROM facture WHERE idcontrat=?;";
			try {

				PreparedStatement st = con.connectP(query);
				st.setLong(1, contrat.getIdcontrat());
				ResultSet rslt = st.executeQuery();

				rslt.next();
				facture.setIdlocataire(Long.parseLong(rslt
						.getString("idlocataire")));
				System.out.println(facture.getIdlocataire());

				List1.add(facture);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		for (Facture facturee : List1)
			System.out.println("idlocataire: " + facturee.getIdlocataire());

		return List1;

	}

	/* ----liste de beins en attente---- */

	public ArrayList<Bien> GetListBienEnAtt(String email) {
		ArrayList<Bien> List = new ArrayList<Bien>();

		System.out.println(email);
		String query = "SELECT idusr FROM utilisateur where email= ? ;";
		try {
			long idClient = 0;
			PreparedStatement st = con.connectP(query);
			st.setString(1, email);
			ResultSet rslt = st.executeQuery();
			while (rslt.next()) {
				idClient = rslt.getLong("idusr");

				System.out.println(idClient);

			}

			
			String query1 = "SELECT * FROM bien b WHERE b.idproprietaire=? and (b.idbien not in (Select c.idbien from contratlocation c) or b.idbien in(SELECT d.idbien from contratlocation d where d.etat=?) );";

			st = con.connectP(query1);
			st.setLong(1, idClient);
			st.setString(2, "nonvalide");
			rslt = st.executeQuery();

			while (rslt.next()) {
				Bien bien = new Bien();
				bien.setIdbien(rslt.getLong("idbien"));

				bien.setType(rslt.getString("type"));

				bien.setAdresse(rslt.getString("adresse"));

				bien.setPrixmax(rslt.getInt("prix"));

				List.add(bien);
			}
			System.out.print("size of the list is " + List.size());
			return List;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return List;

	}

	/* ----liste des locations----*/
	public ArrayList<Bien> GetListLocation(String email){
		
		ArrayList<Bien> List = new ArrayList<Bien>();
		try{
			long idClient = 0;
			Statement st = con.connect();
            ResultSet rslt = st.executeQuery("SELECT idusr FROM utilisateur where email= '"+email+"';");
            while(rslt.next()){
            idClient = rslt.getLong("idusr");
            System.out.println("idClient :"+idClient);
            }

		
        
        String query = "SELECT * FROM bien as a, contratlocation as b, facture as c where a.idbien=b.idbien and b.idcontrat=c.idcontrat and c.idlocataire=" + idClient + " and b.etat='valide' and c.idfacture in (select max(d.idfacture) from facture as d group by d.idcontrat);";
        	st = con.connect();
            rslt = st.executeQuery(query);

            while (rslt.next()){
            	Bien bien = new Bien();
                Contrat contrat = new Contrat();
            	bien.setIdbien(rslt.getLong("idbien"));
            	System.out.println("idBien :"+bien.getIdbien());
                bien.setType(rslt.getString("type"));
                
                bien.setAdresse(rslt.getString("adresse"));
                
                bien.setPrixmax(rslt.getInt("prix"));
                
                contrat.setDatedebut(rslt.getString("datedebut"));
                
                System.out.println(contrat.getDatedebut());
                
                contrat.setDureebail(rslt.getInt("dureebail"));
                
                contrat.setDatecontrat((LocalDate.parse(contrat.getDatedebut()).plusDays(contrat.getDureebail())).toString());
                
                System.out.println(contrat.getDureebail());
                
                ContratLocation.add(contrat);
                
                List.add(bien);
            }
            return List;
        }catch (Exception e){
            e.printStackTrace();
        }
        return List;
	}


	public ArrayList<Contrat> getContratLocation() {
		return ContratLocation;
	}

}
