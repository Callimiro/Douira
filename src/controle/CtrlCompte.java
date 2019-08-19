package controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modele.GestionSignaux;

@WebServlet("/CtrlCompte")
public class CtrlCompte extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlCompte() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		long idclient=Long.parseLong(request.getParameter("idUsr"));
		
		switch (request.getParameter("sub")){
		case "delete" : 
			
			(new GestionSignaux()).SupprimerCompte(idclient);
			break;
			
		case "ignore" :

			
			(new GestionSignaux()).IgnoreScompte(idclient);

			break;
		}
		response.sendRedirect("./CtrlAdministration");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
