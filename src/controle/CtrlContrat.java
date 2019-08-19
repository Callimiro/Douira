package controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modele.GestionContrat;

@WebServlet("/CtrlContrat")
public class CtrlContrat extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlContrat() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		long idContrat=Long.parseLong(request.getParameter("idContrat"));
		
		switch (request.getParameter("sub")){
		case "delete" : 
			
			(new GestionContrat()).AnnulerContrat(idContrat);
			break;
			
		case "ignore" :

			
			(new GestionContrat()).ApprouverContrat(idContrat);

			break;
		}
		response.sendRedirect("./CtrlAdministration");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
