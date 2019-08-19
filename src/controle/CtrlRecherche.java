package controle;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modele.Bien;
import modele.GestionBien;

@WebServlet("/CtrlRecherche")
public class CtrlRecherche extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CtrlRecherche() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		
		ArrayList<Bien> bienList= new ArrayList<Bien>();
		
		Bien bien = new Bien();
		
		String typesBiens = "%";
		
		String accessoires = "%";
		
		int co = 0;
		
		bien.setAdresse(request.getParameter("adresse"));
		
		for(int i=0; i<8; i++)
		{
			if(request.getParameter("ch"+i)!=null)
			{
				typesBiens = typesBiens + request.getParameter("ch"+i) + "%";
				
				co++;
			}

		}
		
		System.out.println("types séléctionnés : " + co);
		
		bien.setType(typesBiens);
		
		if(request.getParameter("colocation")==null)
		{
			bien.setColocation("non");
		}
		else
		{
			bien.setColocation(request.getParameter("colocation"));
		}
		
		if(request.getParameter("meuble")==null)
		{
			bien.setMeuble("non");
		}
		else
		{
			bien.setMeuble(request.getParameter("meuble"));
		}
		
		bien.setPrixmax(Float.parseFloat(request.getParameter("prixmax")));
		
		bien.setPrixmin(Float.parseFloat(request.getParameter("prixmin")));
		
		bien.setSurfacemax(Float.parseFloat(request.getParameter("surfacemax")));
		
		bien.setSurfacemin(Float.parseFloat(request.getParameter("surfacemin")));

		if(session!=null && session.getAttribute("USER")!=null)
			bien.setIdproprietaire((long)session.getAttribute("USER"));
		else
			bien.setIdproprietaire(0);
		
		if(co==1 && ((bien.getType().equals("%appartement%")) || (bien.getType().equals("%villa%")) || (bien.getType().equals("%maison%")) || (bien.getType().equals("%immeuble%"))))
		{
			
			try
			{
				if(request.getParameter("netages").equals("5+"))
				{
					bien.setNetages(5);
				}
				else
				{
					bien.setNetages(Integer.parseInt(request.getParameter("netages")));
				}
				
				if(request.getParameter("nfacades").equals("5+"))
				{
					bien.setNfacades(5);
				}
				else
				{
					bien.setNfacades(Integer.parseInt(request.getParameter("nfacades")));
				}
				
				
				if(request.getParameter("npieces").equals("5+"))
				{
					bien.setNpieces(5);
				}
				else
				{
					bien.setNpieces(Integer.parseInt(request.getParameter("npieces")));
				}
				
				for(int i=0; i<7; i++)
				{
					if(request.getParameter("accessoire"+i)!=null)
					{
						accessoires = accessoires + request.getParameter("accessoire"+i) + "%";
					}
				}
				
				bien.setAccessoires(accessoires);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		
			bienList = (new GestionBien().rechercheNormale(bien));
		}
		else
		{
			bienList = (new GestionBien().rechercheAvancee(bien));
		}
		
		if(bienList.isEmpty())
		{
			request.setAttribute("recherchevide", "Aucun résultat trouvé");
		}
		else
		{
			request.setAttribute("SearchResult", bienList);
		}
		
		if(session!=null && session.getAttribute("USER")!=null)
		{
			this.getServletContext().getRequestDispatcher("/Resultat2.jsp").forward( request, response );
		}
		else
		{
			this.getServletContext().getRequestDispatcher("/Resultat1.jsp").forward( request, response );
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
