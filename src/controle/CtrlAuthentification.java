package controle;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modele.GestionUtilisateur;
import modele.Utilisateur;

@WebServlet("/CtrlAuthentification")
public class CtrlAuthentification extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlAuthentification() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Utilisateur user = new Utilisateur();
		
		user.setEmail(request.getParameter("email"));
		
		user.setPassword(request.getParameter("password"));
		
		if((new GestionUtilisateur()).verifier(user.getEmail(), user.getPassword()))
		{
			
			HttpSession session = request.getSession();
			
			session.setAttribute("USER", (new GestionUtilisateur()).recupererID(user.getEmail()));
			
			session.setAttribute("EMAIL", user.getEmail());
			
			session.setAttribute("role", "user");
			
			response.sendRedirect("./Accueil.jsp");
			
		}
		else
		{
			
			System.out.println("données invalides");
			
			request.setAttribute("msgErr", "email ou mot de passe incorrect");
			
			/*RequestDispatcher rd = request.getRequestDispatcher("/Authentification.jsp");
			rd.include(request,response);*/
			
			this.getServletContext().getRequestDispatcher("/Authentification.jsp").forward( request, response );
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
