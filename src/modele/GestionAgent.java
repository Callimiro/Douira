package modele;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.PreparedStatement;

public class GestionAgent {
	Connexion con = new Connexion();

	public ArrayList<Bien> getBienSignale() {
		ArrayList<Bien> List = new ArrayList<Bien>();

		String query = "SELECT * FROM bien WHERE etat='signal'";
		try {
			PreparedStatement st = con.connectP(query);
			ResultSet rslt = st.executeQuery();

			while (rslt.next()) {
				Bien bien = new Bien();
				bien.setIdbien(rslt.getLong("idbien"));
				bien.setIdproprietaire(rslt.getLong("idproprietaire"));
				List.add(bien);
			}
			return List;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<Commentaire> getCommentaireSignale() {
		ArrayList<Commentaire> List = new ArrayList<Commentaire>();

		String query = "SELECT * FROM commentaire WHERE etat='signal'";
		try {
			PreparedStatement st = con.connectP(query);
			ResultSet rslt = st.executeQuery();

			while (rslt.next()) {
				Commentaire commentaire = new Commentaire();
				commentaire.setIdbien(rslt.getLong("idbien"));
				commentaire.setIdclient(rslt.getLong("idclient"));
				commentaire.setIdcomment(rslt.getLong("idcomment"));
				List.add(commentaire);
			}

			for (Commentaire commentairee : List)

				System.out.println(commentairee.getContenu());
			return List;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<Client> getClientSignale() {
		ArrayList<Client> List = new ArrayList<Client>();

		String query = "SELECT * FROM client WHERE etat='signal'";
		try {
			PreparedStatement st = con.connectP(query);
			ResultSet rslt = st.executeQuery();

			while (rslt.next()) {
				Client client = new Client();
				client.setIdusr(rslt.getLong("idclient"));
				if (!List.contains(client.getIdusr()))
					List.add(client);
			}
			return List;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean verifierA(String email, String password) {
		Statement st = con.connect();
		String query = "Select a.idagent from agent as a where a.idagent in (SELECT idusr From utilisateur where email='"+email+"' and password='"+password+"');";
		try {
			ResultSet rs = st.executeQuery(query);
			if(rs.next()){
				return true;
			}
			else{
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
