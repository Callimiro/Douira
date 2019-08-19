package controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modele.GestionBien;


@WebServlet("/CtrlModifierMontantBien")
public class CtrlModifierMontantBien extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlModifierMontantBien() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long idbien=Long.parseLong(request.getParameter("idbien"));
		double prix=Double.parseDouble(request.getParameter("montant"));
		
		System.out.println(idbien + " " + prix);
			
			(new GestionBien()).ModifierPrix(idbien, prix);
		
		response.sendRedirect("./CtrlListeBiens");
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
