package modele;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

public class GestionContrat {
	
	Connexion con = new Connexion();

	synchronized public long ajouterContrat(Contrat contrat) {

		Statement st = con.connect();
		
		try
		{
			st.executeUpdate("insert into contratlocation(idbien, datecontrat, datedebut, dureebail, contenu, etat) values(" + contrat.getIdbien() +", now(), '" + contrat.getDatedebut() + "', " + contrat.getDureebail() + ", 'je suis un contrat', 'pret');");
			
			ResultSet rs = st.executeQuery("select a.idcontrat from contratlocation as a where a.datecontrat=(select max(b.datecontrat) from contratlocation as b);");
			
			rs.next();
			
			return rs.getLong("idcontrat");
		}
		catch(Exception e)
		{
			System.out.println("failed");
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<Contrat> getListContrat(){
		 ArrayList<Contrat> List = new ArrayList<Contrat>();
	        
	        String query = "SELECT * FROM contratlocation WHERE etat=?";
	        try {
	            PreparedStatement st = con.connectP(query);
	            st.setString(1, "pret");
	            ResultSet rslt = st.executeQuery();

	            while (rslt.next()){
	            	Contrat contrat = new Contrat();
	                contrat.setIdbien(rslt.getLong("idbien"));
	                contrat.setIdcontrat(rslt.getLong("idcontrat"));
	                contrat.setContenu(rslt.getString("contenu"));
	                contrat.setDatecontrat(rslt.getString("datecontrat"));
	                List.add(contrat);
	            }
	            return List;
	        }catch (Exception e){
	            e.printStackTrace();
	        }
	        return null;
   	
   }

	public void AnnulerContrat(long idContrat) {
		Statement st = con.connect();
		
		try
		{
			st.executeUpdate("update contratlocation set etat='nonvalide' where idcontrat=" + idContrat + ";");
		}
		catch(Exception e)
		{
		e.printStackTrace();	
		}
			
	}

	public void ApprouverContrat(long idContrat) {
		
		Statement st = con.connect();
		
		try
		{
			st.executeUpdate("update contratlocation set etat='valide' where idcontrat=" + idContrat + ";");
		}
		catch(Exception e)
		{
		e.printStackTrace();	
		}
	}
}
