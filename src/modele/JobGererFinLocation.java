package modele;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class JobGererFinLocation implements Job{

	@Override
	synchronized public void execute(JobExecutionContext arg0) throws JobExecutionException {

		Connexion con = new Connexion();
		
		Statement st = con.connect();
		
		try
		{
			
			int r = st.executeUpdate("update contratlocation set etat='nonvalide' where etat='valide' and date_add(datedebut, interval dureebail day)<curdate();");
			
			System.out.println("contrats mis en fin : " + r);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
