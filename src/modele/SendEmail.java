package modele;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	
	public static void send(String to, String sub, String msg, final String user, final String pass)
	{
		Properties props = new Properties();
		
		 
	    props.put("mail.transport.protocol", "smtp");
	        
		props.put("mail.smtp.host", "smtp.gmail.com");
		
		props.put("mail.smtp.port", "587");
		
		props.put("mail.smtp.auth", "true");
		
		props.put("mail.smtp.starttls.enable", "enable");
		
		props.put("mail.smtp.starttls.required", "true");
		
		props.put("mail.debug", "true");
		
		props.put("mail.smtp.user", "DouiraProject@gmail.com");
		
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		

		Session session = Session.getInstance(props);
		
		try
		{
			MimeMessage message = new MimeMessage(session);
			
			message.setFrom(new InternetAddress(user));
			
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			
			message.setSubject(sub);
			
			message.setText(msg);
			
			System.out.println("sending...");
			
			//Transport.send(message);
			Transport tr = session.getTransport("smtp");
			tr.connect(user, pass);
			message.saveChanges();      
			tr.sendMessage(message, message.getAllRecipients());
			tr.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
