package controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modele.GestionCommentaire;

@WebServlet("/CtrlAjoutCommentaire")
public class CtrlAjoutCommentaire extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlAjoutCommentaire() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String commentaire=(String) request.getParameter("commentaire");
		System.out.println("le commentaire est : "+commentaire);
		long idbien=Long.parseLong(request.getParameter("idbien"));
		System.out.println(idbien);
		String email = (String) request.getParameter("EMAIL");
		System.out.println(email);
		
		(new GestionCommentaire()).AjouterCommentaire(idbien, email, commentaire);
		
		response.sendRedirect("./CtrlListeBiens");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
