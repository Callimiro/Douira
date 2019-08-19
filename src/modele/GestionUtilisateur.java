package modele;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class GestionUtilisateur {
	
	Connexion con = new Connexion();
	
	public boolean verifier(String email)
	{
		
		Statement st = con.connect();
		
		try
		{
			
			ResultSet rs = st.executeQuery("select * from utilisateur where email='" + email + "';");
			
			if(rs.next())
			{
				
				return true;
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return false;
		
	}
	
	public boolean verifier(String email, String password)
	{
		Statement st = con.connect();
		
		try
		{
			
			ResultSet rs = st.executeQuery("select idusr from utilisateur as u, client as c where u.idusr=c.idclient and email='" + email + "' and password='" + password + "';");
			
			if(rs.next())
			{
				
				return true;
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public long ajouterUtilisateur(Utilisateur user)
	{
		
		Statement st = con.connect();
		
		try
		{
			
			st.executeUpdate("insert into utilisateur (email, password, nom, prenom, daten, ntel) values ('" + user.getEmail() + "', '" + user.getPassword() + "' , '" + user.getNom() + "' , '" + user.getPrenom() + "' , '"  + user.getDaten() + "' , '" + user.getNtel() + "');");
			
			ResultSet rs = st.executeQuery("select idusr from utilisateur where email='" + user.getEmail() + "';");
			
			rs.next();
			
			return (rs.getLong("idusr"));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return 0;
	}

	public long recupererID(String email) {

		try
		{
			Statement st = con.connect();
			
			ResultSet rs = st.executeQuery("select idusr from utilisateur where email='" + email + "';");
			
			rs.next();
			
			return (rs.getLong("idusr"));
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		return 0;
	}
	
	public String recupererPSWD(String email)
	{
		Statement st = con.connect();
		
		try
		{
			
			ResultSet rs = st.executeQuery("select password from utilisateur where email='" + email + "';");
			
			rs.next();
			
			return rs.getString("password");
			
		}
		catch(Exception e)
		{
			
		}
		
		return null;
	}

	public String recupererEmail(long idcontrat) {
		
		Statement st = con.connect();
		
		try
		{
			
			ResultSet rs = st.executeQuery("select a.email from utilisateur as a, bien as b, contratlocation as c where b.idbien=c.idbien and b.idproprietaire=a.idusr and c.idcontrat=" + idcontrat + ";");
			
			rs.next();
			
			return rs.getString("email");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public Utilisateur GetInfos(String email){
		Utilisateur utilisateur=new Utilisateur();
		String query="SELECT * FROM utilisateur WHERE email=? ;";
		try{
			PreparedStatement st = con.connectP(query);
			st.setString(1, email);
			ResultSet rslt = st.executeQuery();
			if(rslt.next()){
				utilisateur.setNom(rslt.getString("nom"));
				utilisateur.setPrenom(rslt.getString("prenom"));
				utilisateur.setDaten(rslt.getString("daten"));
				utilisateur.setSexe(rslt.getString("sexe"));
				utilisateur.setNtel(rslt.getString("ntel"));
				return utilisateur;
			}
		}catch (Exception e) {
		}
		return utilisateur;
		
	}
	
	public void majinfos(Utilisateur utilisateur){
		String query="UPDATE utilisateur SET ";
		
		try{
			
			if(!utilisateur.getNom().equals("")){
			PreparedStatement st  = con.connectP(query+" nom =? where email=?;");
				st.setString(1, utilisateur.getNom());
				st.setString(2, utilisateur.getEmail());
				st.executeUpdate();
			}
			
			if(!utilisateur.getPrenom().equals("")){
				PreparedStatement st  = con.connectP(query+" prenom =? where email=?;");
				st.setString(1, utilisateur.getPrenom());
				st.setString(2, utilisateur.getEmail());
				st.executeUpdate();
			}
			
			if(!utilisateur.getDaten().equals(null)){
				PreparedStatement st  = con.connectP(query+" daten =? where email=?;");
				st.setString(1, utilisateur.getDaten());
				st.setString(2, utilisateur.getEmail());
				st.executeUpdate();
			}
			
			if(!utilisateur.getSexe().equals(null)){
				/*PreparedStatement st  = con.connectP(query+" sexe =? where email=?;");
				st.setString(1, utilisateur.getSexe());
				st.setString(2, utilisateur.getEmail());
				st.executeUpdate();*/
				
				Statement st = con.connect();
				
				st.executeUpdate(query + "sexe='" + utilisateur.getSexe() + "' where email='" + utilisateur.getEmail() + "';");
				
			}
			
			if(!utilisateur.getNtel().equals("")){
				PreparedStatement st  = con.connectP(query+" ntel =? where email=?;");
				st.setString(1, utilisateur.getNtel());
				st.setString(2, utilisateur.getEmail());
				st.executeUpdate();
			}
			
			
			
			if(!utilisateur.getPassword().equals("")){
				PreparedStatement st  = con.connectP(query+" password =? where email=?;");
				st.setString(1, utilisateur.getPassword());
				st.setString(2, utilisateur.getEmail());
				st.executeUpdate();
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void SupprimerCompte(String email){
		
		String query="DELETE FROM utilisateur WHERE email=?;";
		PreparedStatement st = con.connectP(query);
		
		try
		{
			st.setString(1, email);
			st.executeUpdate();
			
		}catch (Exception e) {
		}
	
	}

}
