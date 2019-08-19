package controle;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modele.GestionImage;

@WebServlet("/CtrlImagesDetailsBien")
public class CtrlImagesDetailsBien extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlImagesDetailsBien() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Blob image = (new GestionImage().recupererImagesBien(Long.parseLong(request.getParameter("idbien")), Long.parseLong(request.getParameter("idimage"))));
		
		response.setContentType("image/jpg");
		
		ServletOutputStream out = response.getOutputStream();
		
		InputStream in = null;
		
		try 
		{

			int bufferSize = 1024;
			
			byte[] buffer = new byte[bufferSize];
			
			in = image.getBinaryStream();
			
			int length = (int) image.length();
			
			while ((length = in.read(buffer)) != -1)
			{
				out.write(buffer, 0, length);
			}
			
			
			
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		in.close();
	     
		out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
