package modele;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;
import static org.quartz.JobBuilder.newJob;
import static org.quartz.SimpleScheduleBuilder.simpleSchedule;
import static org.quartz.TriggerBuilder.newTrigger;
import org.quartz.JobDetail;

@WebListener
public class MyAppServletContextListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent arg0)
	{
		System.out.println("ServletContextListener destroyed");
	}
	
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		
		System.out.println("ServletContextListener started");
		
		SchedEnvoyerFactures.envoyerFactures();
		
		SchedGererFinLocation.gererFinLocation();
		
		SchedIgnorerLocation.ignorerLocation();
	}
}
