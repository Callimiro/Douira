package modele;

import static org.quartz.JobBuilder.newJob;
import static org.quartz.SimpleScheduleBuilder.simpleSchedule;
import static org.quartz.TriggerBuilder.newTrigger;

import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;

public class SchedEnvoyerFactures {
	
	public static void envoyerFactures()
	{
		Scheduler sched;
		
		try {
			
			sched = new StdSchedulerFactory().getScheduler();
			
			JobDetail job = newJob(JobEnvoyerFactures.class).withIdentity("myJob", "group1").build();
			
			Trigger trigger = newTrigger().withIdentity("mytrigger", "group1").startNow().withSchedule(simpleSchedule().withIntervalInHours(6).repeatForever()).build();
			
			sched.scheduleJob(job, trigger);
			
			sched.start();
		} 
		catch (SchedulerException e) {
			
			e.printStackTrace();
		}
	}

}
