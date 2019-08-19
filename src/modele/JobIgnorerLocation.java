package modele;

import java.sql.ResultSet;
import java.sql.Statement;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class JobIgnorerLocation implements Job{

	@Override
	synchronized public void execute(JobExecutionContext arg0) throws JobExecutionException {

		Connexion con = new Connexion();
		
		Statement st = con.connect();
		
		Statement st2 = con.connect();
		 
		try
		{
			
			ResultSet rs = st.executeQuery("select a.capacite from bien as a, contratlocation as b where a.idbien=b.idbien and ((b.etat='pret' and date_add(b.datecontrat, INTERVAL 24 HOUR)<now()) or (b.etat='nonvalide'));");
			
			while(rs.next())
			{
				int capacite = rs.getInt("a.capacite")+1;
				
				System.out.println(capacite);
				
				st2.executeUpdate("update bien as a set a.capacite=" + capacite + " where a.idbien in(select b.idbien from (select c.idbien from contratlocation as c where ((c.etat='pret' and adddate(c.datecontrat, INTERVAL 24 HOUR)<now()) or (c.etat='nonvalide'))) as b);");
			}
			
			int r = st.executeUpdate("delete from contratlocation where (etat='pret' and date_add(datecontrat, INTERVAL 24 HOUR)<now()) or (etat='nonvalide');");
			
			System.out.println("contrats supprimés : " + r);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
