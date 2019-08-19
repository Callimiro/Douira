package controle;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modele.Client;
import modele.GestionUtilisateur;
import modele.GestionClient;
import modele.SendEmail;
import modele.Utilisateur;

@WebServlet("/CtrlInscription")
public class CtrlInscription extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlInscription() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Utilisateur user = new Utilisateur();
		
		Client client = new Client();
		
		client.setEtat("nonsignal");
		
		user.setNom(request.getParameter("nom"));
		
		user.setPrenom(request.getParameter("prenom"));
		
		user.setEmail(request.getParameter("email"));
		
		user.setNtel(request.getParameter("ntel"));
		
		user.setPassword(request.getParameter("password"));
		
		user.setDaten(request.getParameter("daten"));

		user.setSexe(request.getParameter("sexe"));
		
		if((new GestionUtilisateur()).verifier(user.getEmail()))
		{
			
			System.out.println("email déjà existant");
			
			request.setAttribute("msgErr", "email déjà existant");
			
			/*RequestDispatcher rd = request.getRequestDispatcher("/Inscription.jsp");
			rd.include(request,response);*/
			
			this.getServletContext().getRequestDispatcher("/Inscription.jsp").forward( request, response );
			
		}
		else
		{
			
			client.setIdusr((new GestionUtilisateur()).ajouterUtilisateur(user));
			
			(new GestionClient()).ajouterClient(client);
			
			HttpSession session = request.getSession();
			
			session.setAttribute("USER", client.getIdusr());
			
			SendEmail.send(user.getEmail(), "EMAIL CONFIRM",Long.toString(client.getIdusr()), "douiraproject@gmail.com", "wedidwhatwecan");
			
			RequestDispatcher rd = request.getRequestDispatcher("/ConfirmerEmail.jsp");
			
			rd.include(request,response);
			
			//response.sendRedirect("./CtrlEmail");
			
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
