package controle;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import modele.Bien;
import modele.GestionBien;
import modele.GestionImage;

@MultipartConfig
@WebServlet("/CtrlAjoutBien")
public class CtrlAjoutBien extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlAjoutBien() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		Bien bien = new Bien();
		
		int capacite = 0;
		
		String accessoires = "";
		
		int npieces = 0;
		
		int netages = 0;
		
		int nfacades = 0;
		
		String colocation = "non";
		
		String meuble = "non";
		
		try
		{
			String adresse = request.getParameter("adresse");

			String type = request.getParameter("type");
			
			float surface = Float.parseFloat(request.getParameter("surface"));
			
			float montant = Float.parseFloat(request.getParameter("montant"));

			String payement = request.getParameter("payement");
			
			if(request.getParameter("piece")!=null)
				npieces = Integer.parseInt(request.getParameter("piece"));

			if(request.getParameter("etage")!=null)
				netages = Integer.parseInt(request.getParameter("etage"));
			
			if(request.getParameter("facade")!=null)
				nfacades = Integer.parseInt(request.getParameter("facade"));
			
			if(request.getParameter("colocation")!=null)
				colocation = request.getParameter("colocation");
			
			if(request.getParameter("capacite")!=null)
				capacite = Integer.parseInt(request.getParameter("capacite"));
			
			if(request.getParameter("meuble")!=null)
				meuble = request.getParameter("meuble");
			
			for(int i=0; i<7; i++)
			{
				if(request.getParameter("accessoire"+i)!=null)
				{
					accessoires = accessoires + " " + request.getParameter("accessoire"+i);
				}
			}
			
			String description = request.getParameter("description");
			
			bien.setIdproprietaire((long)session.getAttribute("USER"));
			
			bien.setType(type);
			
			bien.setAdresse(adresse);
			
			bien.setPrixmax(montant);
			
			bien.setPayement(payement);
			
			bien.setSurfacemax(surface);
			
			bien.setNpieces(npieces);
			
			bien.setNetages(netages);
			
			bien.setNfacades(nfacades);
			
			bien.setColocation(colocation);
			
			bien.setCapacite(capacite);
			
			bien.setMeuble(meuble);
			
			bien.setAccessoires(accessoires);
			
			bien.setDescription(description);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		long idbien = new GestionBien().AjouterBien(bien);
		
		/////////////////////////////////////////////////////////////// image upload
		
		if(request.getParts()!=null)
		{
			request.setAttribute("msgAjoutBien", new GestionImage().AjouterImage(request.getParts(), idbien));
		}
		
		this.getServletContext().getRequestDispatcher("/Accueil.jsp").forward( request, response );
		
	}
}
