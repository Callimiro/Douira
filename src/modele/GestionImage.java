package modele;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Part;

public class GestionImage {
	
	Connexion con = new Connexion();
	
	public String AjouterImage(Collection<Part> collection, long idbien)
	{
		PreparedStatement st = con.connectPS();

		try
		{
			for(Part part : collection)
			{
				
				if(part.getSize()>10000)
				{
					st.setLong(1, idbien);
					
					st.setBinaryStream(2, part.getInputStream(), (int) part.getSize());
					
					st.executeUpdate();
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
			return "Echec lors de l'ajout de votre bien :(";
		}
		
		return "Bien ajouté avec succès, vous serez notifié lorsqu'il y aura une demande de location !";
	}
	
	public Blob recupererCardImage(long idbien)
	{
		Statement st = con.connect();
		
		Blob input = null;
		
		try
		{
			ResultSet rs = st.executeQuery("select * from image as a where a.idbien=" + idbien + " and a.idimage = (select max(b.idimage) from image as b where b.idbien=" + idbien +");");
			
			if (rs.next())
			{

				input = rs.getBlob("img");
				
				System.out.println(input.length());

			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return input;
		
	}
	
	public ArrayList<Long> nombreImages(long idbien)
	{
		Statement st = con.connect();
		
		ArrayList<Long> idimages = new ArrayList<Long>();
		
		try
		{
			
			ResultSet rs = st.executeQuery("select idimage from image where idbien=" + idbien + ";");
			
			while(rs.next())
			{
				idimages.add(rs.getLong("idimage"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		
		return idimages;
	}
	
	public Blob recupererImagesBien(long idbien, long idimage)
	{
		Statement st = con.connect();
		
		Blob input = null;
		
		try
		{
			ResultSet rs = st.executeQuery("select img from image where idbien=" + idbien + " and idimage=" + idimage + ";");
			
			if (rs.next())
			{

				input = rs.getBlob("img");
				
				System.out.println(input.length());

			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return input;
	}

}
