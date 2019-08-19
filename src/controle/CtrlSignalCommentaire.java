package controle;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modele.GestionBien;
import modele.GestionCommentaire;

@WebServlet("/CtrlSignalCommentaire")
public class CtrlSignalCommentaire extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlSignalCommentaire() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println(request.getParameter("idcomment"));
		
		System.out.println(request.getParameter("raisonsignal"));
		
		HttpSession session = request.getSession(false);
		
		session.setAttribute("msgSignalCommentaire", (new GestionCommentaire()).SignalerCommentaire(Long.parseLong(request.getParameter("idcomment")), request.getParameter("raisonsignal")));
		
		String referer = request.getHeader("Referer");
		
		response.sendRedirect(referer);
		
		//this.getServletContext().getRequestDispatcher("/DetailsBien.jsp").forward( request, response );
	}

}
