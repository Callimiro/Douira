package modele;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class Connexion {
	
	public Statement connect()
	{
		Statement stmnt = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost/locationbiens", "root", "admin");
			
			stmnt = myConn.createStatement(); 
			
			return stmnt;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return stmnt;
	}
	
	public PreparedStatement connectPS()
	{
		PreparedStatement stmnt = null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost/locationbiens", "root", "root");
			
			stmnt = myConn.prepareStatement("insert into image(idbien, img) values(?,?)"); 
			
			return stmnt;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return stmnt;
	}
	
	public PreparedStatement connectP(String query)
	{
		PreparedStatement stmnt = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost/locationbiens", "root", "root");
			
			stmnt = myConn.prepareStatement(query);
			
			return stmnt;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return stmnt;
	}
}
