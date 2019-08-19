package controle;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modele.GestionUtilisateur;
import modele.Utilisateur;

@WebServlet("/CtrlModificationCompte")
public class CtrlModificationCompte extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlModificationCompte() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		Utilisateur utilisateur=(new GestionUtilisateur()).GetInfos((String) session.getAttribute("EMAIL"));
		session.setAttribute("utilisateur", utilisateur);
		response.sendRedirect("./ModificationProfil.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		Utilisateur utilisateur = new Utilisateur();
		utilisateur.setEmail((String) session.getAttribute("EMAIL"));
		utilisateur.setNom(request.getParameter("nom"));
		utilisateur.setPrenom(request.getParameter("prenom"));
		utilisateur.setDaten(request.getParameter("daten"));
		utilisateur.setSexe(request.getParameter("sexe"));
		utilisateur.setPassword(request.getParameter("nvpassword"));
		utilisateur.setNtel(request.getParameter("ntel"));
		(new GestionUtilisateur()).majinfos(utilisateur);
		utilisateur=(new GestionUtilisateur()).GetInfos((String) session.getAttribute("EMAIL"));
		session.setAttribute("utilisateur", utilisateur);
		response.sendRedirect("./ModificationProfil.jsp");
	}

}
