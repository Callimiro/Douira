package controle;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modele.GestionUtilisateur;
import modele.Utilisateur;
import modele.Client;
import modele.Commentaire;
import modele.Contrat;
import modele.GestionAgent;
import modele.GestionContrat;
import modele.Bien;

@WebServlet("/CtrlAdministration")
public class CtrlAdministration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CtrlAdministration() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        Utilisateur user = new Utilisateur();
        
        HttpSession session = request.getSession();
        
        String email=(String) session.getAttribute("EMAIL");
        
        System.out.println("hey " +email);
        
        user.setEmail(request.getParameter("email"));

        user.setPassword(request.getParameter("password"));
        
        System.out.println(user.getEmail() + " " + user.getPassword());
        System.out.println((new GestionAgent()).verifierA(user.getEmail(), user.getPassword()));
        if((new GestionAgent()).verifierA(user.getEmail(), user.getPassword())||(new GestionUtilisateur()).verifier(email))
        {
            session.setAttribute("EMAIL", user.getEmail());
            
            session.setAttribute("role", "admin");
            
            ArrayList<Bien> ListSignalBien = (new GestionAgent()).getBienSignale();

            ArrayList<Commentaire> ListSignalCommentaire = (new GestionAgent()).getCommentaireSignale();

            ArrayList<Client> ListSignalClient = (new GestionAgent()).getClientSignale();
            
            ArrayList<Contrat> ListAprContrat = (new GestionContrat()).getListContrat();

            session.setAttribute("ListSignalClient",ListSignalClient);

            session.setAttribute("ListSignalBien",ListSignalBien);

            session.setAttribute("ListSignalCommentaire",ListSignalCommentaire);
            
            session.setAttribute("ListAprContrat", ListAprContrat);


            this.getServletContext().getRequestDispatcher("/Administration.jsp").forward( request, response );

        }
        else
        {

            System.out.println("donnees invalides");

            request.setAttribute("msgErr", "email ou mot de passe incorrect");

            this.getServletContext().getRequestDispatcher("/AuthAdmin.jsp").forward( request, response );

            //this.getServletContext().getRequestDispatcher("/Authentification.jsp").forward( request, response );
        }

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
