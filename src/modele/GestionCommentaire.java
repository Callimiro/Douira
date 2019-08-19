package modele;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class GestionCommentaire {
	
	Connexion con = new Connexion();
	
	public List<Object> recupererListeCommentaires(Long idbien)
	{
		List<Object> listeCommentaires = new ArrayList<Object>();
		
		ArrayList<Commentaire> commentaires = new ArrayList<Commentaire>();
		
		ArrayList<Utilisateur> commentateurs = new ArrayList<Utilisateur>();
		
		Statement st = con.connect();
		
		try
		{
			ResultSet rs = st.executeQuery("select * from commentaire where idbien=" + idbien + " order by datepub desc;");
			
			while(rs.next())
			{
				Commentaire comment = new Commentaire();
				
				comment.setContenu(rs.getString("contenu"));
				
				comment.setDatepub(rs.getString("datepub"));
				
				comment.setIdcomment(rs.getLong("idcomment"));
				
				Statement st2 = con.connect();
				
				ResultSet rs2 = st2.executeQuery("select prenom from utilisateur where idusr=" + rs.getLong("idclient") + ";");
				
				while(rs2.next())
				{
					Utilisateur utilisateur = new Utilisateur();
					
					utilisateur.setPrenom(rs2.getString("prenom"));
					
					commentateurs.add(utilisateur);
				}
				
				commentaires.add(comment);
			}
			
			listeCommentaires.add(0,commentateurs);
			
			listeCommentaires.add(1,commentaires);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return listeCommentaires;
	}
	
	public String SignalerCommentaire(Long idcomment, String raison)
	{
		Statement st = con.connect();
		
		String raisonsignal = "";
		
		try
		{
			ResultSet rs = st.executeQuery("select raisonsignal from commentaire where idcomment=" + idcomment);
			
			while(rs.next())
			{
				raisonsignal = raison + rs.getString("raisonsignal");
			}
			
			System.out.println("raison : "+raison);
			
			st.executeUpdate("update commentaire set etat='signal' where idcomment=" + idcomment + ";");
			
			st.executeUpdate("update commentaire set raisonsignal='"+ raisonsignal + "' where idcomment=" + idcomment + ";");
			
			ResultSet rs2 = st.executeQuery("select idclient from commentaire where idcomment=" + idcomment +";");
			
			rs2.next();
			
			st.executeUpdate("update client set etat='signal' where idclient=" + rs2.getString("idclient"));
			
			System.out.println("modification faite");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
			return "Erreur !";
		}
		
		return "Commentaire Signalé avec succès, merci pour votre contribution !";
	}
	
public void AjouterCommentaire(long idbien,String email,String commentaire){
		
	try{
		String prenom=null;
		long idClient = 0;
		Statement st = con.connect();
        ResultSet rslt = st.executeQuery("SELECT idusr, prenom FROM utilisateur where email= '"+email+"';");
        while(rslt.next()){
        idClient = rslt.getLong("idusr");
        prenom = rslt.getString("prenom");
        }
        String query="INSERT INTO commentaire(idbien, idclient,contenu,datepub,etat) Values("+idbien+","+idClient+",'"+commentaire+"',now(),'nonsignal');";
        int rslt1 =st.executeUpdate(query);
        
        ResultSet rslt2 = st.executeQuery("select email from bien as a, utilisateur as b where a.idproprietaire=b.idusr and a.idbien=" + idbien);
        rslt2.next();
        SendEmail.send(rslt2.getString("email"), "COMMENTAIRE",  prenom + " a commenté '" + commentaire + "' sur votre bien ayant comme référence: " + idbien, "douiraproject@gmail.com", "wedidwhatwecan");
	}catch (Exception e) {
		// TODO: handle exception
	}
	}

}
