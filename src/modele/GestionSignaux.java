package modele;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GestionSignaux {
	Connexion con = new Connexion();
	String query;

	public void SupprimerBien(long idbien) {
		query="DELETE FROM bien  WHERE idbien ="+idbien+";";
		Statement stmnt=con.connect();
		try {
			ResultSet rs = stmnt.executeQuery("SELECT email FROM bien as a, utilisateur as b where a.idproprietaire=b.idusr and a.idbien=" + idbien + ";");

			rs.next();
			
			SendEmail.send(rs.getString("email"), "ALERT", "Votre bien ayant comme référence: " + idbien +" a été supprimé", "douiraproject@gmail.com", "wedidwhatwecan");
			
			stmnt.executeUpdate(query);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void SupprimerCompte(long idclient){
		query="DELETE FROM utilisateur  WHERE idusr ="+idclient+";";
		Statement stmnt=con.connect();
		try {
			ResultSet rs = stmnt.executeQuery("SELECT email FROM utilisateur where idusr=" + idclient + ";");

			rs.next();
			
			SendEmail.send(rs.getString("email"), "ALERT", "Votre compte a été supprimé", "douiraproject@gmail.com", "wedidwhatwecan");

			stmnt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void SupprimerCommentaire(long idcomment){
		query="DELETE FROM commentaire  WHERE idcomment ="+idcomment+";";
		Statement stmnt=con.connect();
		try {

			ResultSet rs = stmnt.executeQuery("SELECT email, contenu FROM commentaire as a, utilisateur as b where a.idclient=b.idusr and a.idcomment=" + idcomment + ";");

			rs.next();
			
			SendEmail.send(rs.getString("email"), "ALERT", "Votre commentaire: '" + rs.getString("contenu") +"' a été supprimé", "douiraproject@gmail.com", "wedidwhatwecan");

			stmnt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void IgnoreSbien(long idbien){
		query="UPDATE bien SET etat='nonsignal' WHERE idbien="+idbien+";";
		Statement stmnt=con.connect();
		try {
			stmnt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void IgnoreScompte(long idclient){
		query="UPDATE client SET etat='nonsignal' WHERE idclient="+idclient+";";
		Statement stmnt=con.connect();
		try {
			stmnt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void IgnoreScommentaire(long idcommentaire){
		query="UPDATE commentaire SET etat='nonsignal' WHERE idcomment="+idcommentaire+";";
		Statement stmnt=con.connect();
		try {
			stmnt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
}
