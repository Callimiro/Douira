package controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import modele.GestionSignaux;

@WebServlet("/CtrlBien")
public class CtrlBien extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlBien() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		long idbien=Long.parseLong(request.getParameter("idbien"));
		
		switch (request.getParameter("sub")){
		case "delete" : 
			
			(new GestionSignaux()).SupprimerBien(idbien);
			break;
			
		case "ignore" :

			
			(new GestionSignaux()).IgnoreSbien(idbien);

			break;
		}
		response.sendRedirect("./CtrlAdministration");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
