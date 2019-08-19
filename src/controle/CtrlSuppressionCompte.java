package controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modele.GestionUtilisateur;

@WebServlet("/CtrlSuppressionCompte")
public class CtrlSuppressionCompte extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlSuppressionCompte() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String email =(String) session.getAttribute("USER");
		(new GestionUtilisateur()).SupprimerCompte(email);
		session.invalidate();
		response.sendRedirect("./index.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
