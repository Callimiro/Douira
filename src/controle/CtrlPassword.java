package controle;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modele.GestionClient;
import modele.GestionUtilisateur;
import modele.SendEmail;
import modele.Utilisateur;

@WebServlet("/CtrlPassword")
public class CtrlPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlPassword() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Utilisateur user = new Utilisateur();
		
		user.setEmail(request.getParameter("email"));
		
		if((new GestionUtilisateur()).verifier(user.getEmail())==false)
		{
			
			System.out.println("email n'existe pas !");
			
			request.setAttribute("emailErr", "l'email n'existe pas !");
			
			this.getServletContext().getRequestDispatcher("/RecuperationPassword.jsp").forward( request, response );
			
		}
		else
		{
			user.setPassword((new GestionUtilisateur()).recupererPSWD(user.getEmail()));
			
			SendEmail.send(user.getEmail(), "PASSWORD RECOVER","Votre mot de passe est: "+user.getPassword(), "douiraproject@gmail.com", "wedidwhatwecan");
			
			request.setAttribute("msgErr", "Le mot de passe vous a été envoyé, consulter votre boîte email pour le récupérer");
			
			RequestDispatcher rd = request.getRequestDispatcher("/Authentification.jsp");
			
			rd.include(request,response);
			
			//response.sendRedirect("./CtrlEmail");
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
