package modele;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class GestionBien {

	Connexion con = new Connexion();

	public ArrayList<Bien> rechercheNormale(Bien bien) {

		System.out.println("recherche normale");

		ArrayList<Bien> bienList = new ArrayList<Bien>();

		Statement st = con.connect();

		String acc = "";

		try {
			if (bien.getAccessoires().equals("%") != true) {
				ArrayList<String> accessoires = new ArrayList<>();

				String Str = new String(bien.getAccessoires());

				for (String accessoire : Str.split("%")) {
					accessoires.add(accessoire);
				}
				for (int i = 1; i < accessoires.size(); i++) {
					if (i == 1)
						acc = acc + " and (match(accessoires) against('"
								+ accessoires.get(i) + "'))";
					else
						acc = acc + " or (match(accessoires) against('"
								+ accessoires.get(i) + "'))";
				}

			}
		} catch (Exception e) {
			e.printStackTrace();

		}

		try {
			System.out.print(bien.getType());
			System.out.print(bien.getColocation());

			ResultSet rs;

			if (bien.getColocation().equals("oui"))

				rs = st.executeQuery("select * from bien where idproprietaire!="
						+ bien.getIdproprietaire()
						+ " and type like '"
						+ bien.getType()
						+ "' and match(adresse) against('"
						+ bien.getAdresse()
						+ "') and prix>="
						+ bien.getPrixmin()
						+ " and prix<="
						+ bien.getPrixmax()
						+ " and surface>="
						+ bien.getSurfacemin()
						+ " and surface<="
						+ bien.getSurfacemax()
						+ " and npieces="
						+ bien.getNpieces()
						+ " and netages="
						+ bien.getNetages()
						+ " and nfacades="
						+ bien.getNfacades()
						+ " and meuble='"
						+ bien.getMeuble()
						+ "' and (colocation='oui' and capacite>0)");

			else

				rs = st.executeQuery("select * from bien where idproprietaire!="
						+ bien.getIdproprietaire()
						+ " and type like '"
						+ bien.getType()
						+ "' and match(adresse) against('"
						+ bien.getAdresse()
						+ "') and prix>="
						+ bien.getPrixmin()
						+ " and prix<="
						+ bien.getPrixmax()
						+ " and surface>="
						+ bien.getSurfacemin()
						+ " and surface<="
						+ bien.getSurfacemax()
						+ " and npieces="
						+ bien.getNpieces()
						+ " and netages="
						+ bien.getNetages()
						+ " and nfacades="
						+ bien.getNfacades()
						+ " and meuble='"
						+ bien.getMeuble()
						+ "' and colocation='non' and idbien not in (select a.idbien from contratlocation as a where a.etat='pret' or a.etat='valide');");

			while (rs.next()) {
				Bien b = new Bien();

				b.setIdbien(rs.getLong("idbien"));

				b.setType(rs.getString("type"));

				b.setAdresse(rs.getString("adresse"));

				b.setNpieces(rs.getInt("npieces"));

				b.setSurfacemax(rs.getFloat("surface"));

				b.setPrixmax(rs.getFloat("prix"));

				b.setPayement(rs.getString("payement"));

				bienList.add(b);

			}

			for (Bien b : bienList) {
				System.out.println(b.getIdbien());
			}
			return bienList;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return bienList;

	}

	public ArrayList<Bien> rechercheAvancee(Bien bien) {

		System.out.println("recherche avancée");

		Statement st = con.connect();

		ArrayList<Bien> bienList = new ArrayList<Bien>();

		ArrayList<String> typesbiens = new ArrayList<>();

		String Str = new String(bien.getType());

		for (String retval : Str.split("%")) {
			typesbiens.add(retval);
		}

		String sql = "select * from bien where(";

		for (int i = 0; i < typesbiens.size(); i++) {
			if (i == 0)
				sql = sql + " type='" + typesbiens.get(i) + "'";
			else
				sql = sql + " or type='" + typesbiens.get(i) + "'";
		}

		try {

			ResultSet rs = st
					.executeQuery(sql
							+ ") and idproprietaire!="
							+ bien.getIdproprietaire()
							+ " and match(adresse)against('"
							+ bien.getAdresse()
							+ "') and prix <="
							+ bien.getPrixmax()
							+ " and prix>="
							+ bien.getPrixmin()
							+ " and surface <="
							+ bien.getSurfacemax()
							+ " and surface >= "
							+ bien.getSurfacemin()
							+ " and colocation='non' and idbien not in (select a.idbien from contratlocation as a where etat='pret' or etat='valide') union "
							+ sql + ") and idproprietaire!="
							+ bien.getIdproprietaire()
							+ " and match(adresse)against('"
							+ bien.getAdresse() + "') and prix <="
							+ bien.getPrixmax() + " and prix>="
							+ bien.getPrixmin() + " and surface <="
							+ bien.getSurfacemax() + " and surface >= "
							+ bien.getSurfacemin()
							+ " and (colocation='oui' and capacite>0) union "
							+ sql + ") and idproprietaire!="
							+ bien.getIdproprietaire()
							+ " and match(adresse)against('"
							+ bien.getAdresse() + "') and prix <="
							+ bien.getPrixmax() + " and prix>="
							+ bien.getPrixmin() + " and surface <="
							+ bien.getSurfacemax() + " and surface >= "
							+ bien.getSurfacemin() + " and idbien not in (select a.idbien from contratlocation as a where etat='pret' or etat='valide');");

			while (rs.next()) {
				Bien b = new Bien();

				b.setIdbien(rs.getLong("idbien"));

				b.setType(rs.getString("type"));

				b.setAdresse(rs.getString("adresse"));

				b.setNpieces(rs.getInt("npieces"));

				b.setSurfacemax(rs.getFloat("surface"));

				b.setPrixmax(rs.getFloat("prix"));

				b.setPayement(rs.getString("payement"));

				bienList.add(b);

			}

			for (Bien b : bienList) {
				System.out.println(b.getIdbien());
			}

			return bienList;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return bienList;

	}

	@SuppressWarnings("finally")
	public Bien detailsBien(Long idbien) {
		Statement st = con.connect();

		Bien bien = new Bien();

		try {
			ResultSet rs = st.executeQuery("select * from bien where idbien="
					+ idbien);

			while (rs.next()) {
				bien.setIdbien(rs.getLong("idbien"));
				bien.setType(rs.getString("type"));
				bien.setAdresse(rs.getString("adresse"));
				bien.setPrixmax(rs.getFloat("prix"));
				bien.setPayement(rs.getString("payement"));
				bien.setDescription(rs.getString("description"));
				bien.setSurfacemax(rs.getFloat("surface"));
				bien.setNpieces(rs.getInt("npieces"));
				bien.setNetages(rs.getInt("netages"));
				bien.setNfacades(rs.getInt("nfacades"));
				bien.setColocation(rs.getString("colocation"));
				bien.setMeuble(rs.getString("meuble"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return bien;
		}
	}

	public ArrayList<Bien> ListeTopAnnonces(String adresse, long idprop) {
		ArrayList<Bien> topannonces = new ArrayList<Bien>();

		Statement st = con.connect();

		try {
			ResultSet rs = st
					.executeQuery("select * from bien where idproprietaire!="
							+ idprop
							+ " and match(adresse) against('"
							+ adresse
							+ "') and (colocation='oui' and capacite>0) union "
							+ "select * from bien where idproprietaire!="
							+ idprop
							+ " and match(adresse) against('"
							+ adresse
							+ "') and colocation='non' and idbien not in (select a.idbien from contratlocation as a where etat='pret' or etat='valide') union "
							+ "select * from bien where idproprietaire!="
							+ idprop
							+ " and match(adresse) against('"
							+ adresse
							+ "') and idbien not in (select a.idbien from contratlocation as a where etat='pret' or etat='valide')");

			while (rs.next()) {
				Bien bien = new Bien();

				bien.setIdbien(rs.getLong("idbien"));
				bien.setType(rs.getString("type"));
				bien.setAdresse(rs.getString("adresse"));
				bien.setPrixmax(rs.getFloat("prix"));
				bien.setPayement(rs.getString("payement"));
				bien.setDescription(rs.getString("description"));
				bien.setSurfacemax(rs.getFloat("surface"));
				bien.setNpieces(rs.getInt("npieces"));
				bien.setNetages(rs.getInt("netages"));
				bien.setNfacades(rs.getInt("nfacades"));

				topannonces.add(bien);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return topannonces;
		}
	}

	public String SignalerBien(Long idbien, String raison) {

		Statement st = con.connect();

		String raisonsignal = "";

		try {

			ResultSet rs = st
					.executeQuery("select raisonsignal from bien where idbien="
							+ idbien);

			while (rs.next()) {
				raisonsignal = raison + "" + rs.getString("raisonsignal");
			}

			st.executeUpdate("update bien set etat='signal' where idbien="
					+ idbien + ";");

			st.executeUpdate("update bien set raisonsignal='" + raisonsignal
					+ "' where idbien=" + idbien + ";");

			ResultSet rs2 = st
					.executeQuery("select idproprietaire from bien where idbien="
							+ idbien + ";");

			rs2.next();

			st.executeUpdate("update client set etat='signal' where idclient="
					+ rs2.getString("idproprietaire"));
		} catch (Exception e) {
			e.printStackTrace();

			return "Erreur !";
		}

		return "Bien signalé avec succès, merci pour votre contribution !";

	}

	public long AjouterBien(Bien bien) {
		Statement st = con.connect();

		try {
			if (bien.getType().equals("garage")
					|| bien.getType().equals("lotdeterrain")
					|| bien.getType().equals("localcommercial")) {
				st.executeUpdate("insert into bien(idproprietaire, type, adresse, prix, payement, surface, description, etat, dateajout) values("
						+ bien.getIdproprietaire()
						+ ",'"
						+ bien.getType()
						+ "','"
						+ bien.getAdresse()
						+ "',"
						+ bien.getPrixmax()
						+ ", '"
						+ bien.getPayement()
						+ "',"
						+ bien.getSurfacemax()
						+ ",'"
						+ bien.getDescription()
						+ "', 'nonsignal', NOW());");
			} else if (bien.getColocation().equals("oui")) {
				st.executeUpdate("insert into bien(idproprietaire, type, adresse, prix, payement, surface, npieces, netages, nfacades, description, etat, colocation, capacite, meuble, accessoires, dateajout) values("
						+ bien.getIdproprietaire()
						+ ",'"
						+ bien.getType()
						+ "','"
						+ bien.getAdresse()
						+ "',"
						+ bien.getPrixmax()
						+ ", '"
						+ bien.getPayement()
						+ "',"
						+ bien.getSurfacemax()
						+ ","
						+ bien.getNpieces()
						+ ","
						+ bien.getNetages()
						+ ","
						+ bien.getNfacades()
						+ ",'"
						+ bien.getDescription()
						+ "', 'nonsignal','"
						+ bien.getColocation()
						+ "',"
						+ bien.getCapacite()
						+ ", '"
						+ bien.getMeuble()
						+ "', '"
						+ bien.getAccessoires() + "', NOW());");
			} else {
				System.out.println(bien.getAdresse() + " " + bien.getType());
				st.executeUpdate("insert into bien(idproprietaire, type, adresse, prix, payement, surface, npieces, netages, nfacades, description, etat, colocation, meuble, accessoires, dateajout) values("
						+ bien.getIdproprietaire()
						+ ",'"
						+ bien.getType()
						+ "','"
						+ bien.getAdresse()
						+ "',"
						+ bien.getPrixmax()
						+ ", '"
						+ bien.getPayement()
						+ "',"
						+ bien.getSurfacemax()
						+ ","
						+ bien.getNpieces()
						+ ","
						+ bien.getNetages()
						+ ","
						+ bien.getNfacades()
						+ ",'"
						+ bien.getDescription()
						+ "', 'nonsignal','"
						+ bien.getColocation()
						+ "', '"
						+ bien.getMeuble()
						+ "', '" + bien.getAccessoires() + "', NOW());");
			}

			ResultSet rs = st
					.executeQuery("select idbien from bien as a where idproprietaire="
							+ bien.getIdproprietaire()
							+ " and dateajout = (select max(dateajout) from bien as b);");

			rs.next();

			return (rs.getLong("idbien"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	public boolean ModifierCapacite(long idbien) {

		Statement st = con.connect();

		try {
			ResultSet rs = st
					.executeQuery("select capacite from bien where colocation='oui' and idbien="
							+ idbien);

			if (rs.next())
			{
				if(rs.getInt("capacite")>0)
				{
				
					int capacite = rs.getInt("capacite") - 1;
				
				
					st.executeUpdate("update bien set capacite=" + capacite
						+ " where idbien=" + idbien + ";");
					
					return true;
					
				}
				else
				{
					return false;
				}
			}
			else
			{
				ResultSet rslt = st.executeQuery("select idbien from contratlocation where idbien="+idbien);
				
				if(rslt.next())
				{
					return false;
				}
				else
				{
					return true;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public void SupprimerBien(long idbien) {
		Statement st = con.connect();

		try {
			st.executeUpdate("delete from bien where idbien=" + idbien + ";");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void ModifierPrix(long idbien, double Prix) {

		Statement stm = con.connect();

		try {

			stm.executeUpdate("update bien set prix=" + Prix + " where idbien="
					+ idbien + ";");

		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
