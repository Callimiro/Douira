package controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modele.GestionSignaux;

@WebServlet("/CtrlCommentaire")
public class CtrlCommentaire extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlCommentaire() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long idcomment=Long.parseLong(request.getParameter("idcomment"));
		
		switch (request.getParameter("sub")){
		case "delete" : 
			
			(new GestionSignaux()).SupprimerCommentaire(idcomment);
			break;
			
		case "ignore" :

			
			(new GestionSignaux()).IgnoreScommentaire(idcomment);

			break;
		}
		response.sendRedirect("./CtrlAdministration");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
