package modele;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class JobEnvoyerFactures implements Job{
	
	Connexion con = new Connexion();
	
	Statement st = con.connect();
	
	ArrayList<String> emails = new ArrayList<String>();
	
	ArrayList<Facture> factures = new ArrayList<Facture>();

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		
		try
		{
			ResultSet rs = st.executeQuery("select * from facture as a, utilisateur as b, contratlocation as c where a.idcontrat=c.idcontrat and a.idlocataire=b.idusr and etat='valide' and a.datefacture=curdate();");
			
			while(rs.next())
			{
				Facture facture = new Facture();
				
				emails.add(rs.getString("email"));
				
				facture.setIdcontrat(rs.getLong("idcontrat"));
				
				facture.setIdfacture(rs.getLong("idfacture"));
				
				facture.setContenu(rs.getString("contenu"));
				
				factures.add(facture);
			}
			
			int co = 0;
			
			for(String email : emails)
			{
				SendEmail.send(email, "FACTURE", factures.get(co).getIdfacture() + ", " + factures.get(co).getIdcontrat() + ", " + factures.get(co).getContenu(), "douiraproject@gmail.com", "wedidwhatwecan");
				
				co++;
			}
		}
		catch (SQLException e) {

			System.out.println("un problème est survenu lors de l'envoi des emails");
			
			e.printStackTrace();
		}
		
	}
}
