package modele;

import java.sql.PreparedStatement;
import java.sql.Statement;

public class GestionClient {
	
	Connexion con = new Connexion();
	
	public void ajouterClient(Client client)
	{
		String query="insert into client values(? , ?);";
		PreparedStatement st = con.connectP(query);
		
		try
		{
			st.setLong(1, client.getIdusr());
			st.setString(2, client.getEtat());
			st.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
