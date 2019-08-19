package controle;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modele.Bien;
import modele.Contrat;
import modele.Facture;
import modele.GestionListeBiens;


@WebServlet("/CtrlListeBiens")
public class CtrlListeBiens extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CtrlListeBiens() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String email = (String) session.getAttribute("EMAIL");
		
		GestionListeBiens gestionListeBiens = new GestionListeBiens();
		
		ArrayList<Bien> ListBienLoues = gestionListeBiens.GetListBienLoues(email);
		
		ArrayList<Contrat> ListContratLoues = gestionListeBiens.GetListContratLoues(ListBienLoues);
		
		ArrayList<Facture> ListLocataire = gestionListeBiens.getLocataire(ListContratLoues);
		
		ArrayList<Bien> ListBienEnAtt = gestionListeBiens.GetListBienEnAtt(email);
		
		ArrayList<Bien> ListLocation = gestionListeBiens.GetListLocation(email);
		
		ArrayList<Contrat> ContratLocation = gestionListeBiens.getContratLocation();

		System.out.println("ListBien size : "+ListBienLoues.size());
		System.out.println("ContralLocation size :" + ContratLocation.size());
		session.setAttribute("ListBienLoues", ListBienLoues);
		session.setAttribute("ListContratLoues", ListContratLoues);
		session.setAttribute("ListLocataire", ListLocataire);
		session.setAttribute("ListBienEnAtt", ListBienEnAtt);
		session.setAttribute("ListLocation", ListLocation);
		session.setAttribute("ContratLocation", ContratLocation);
		
		
		
		
		response.sendRedirect("./ListeBiens.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
