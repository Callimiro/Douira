package controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modele.GestionBien;
import modele.GestionContrat;

@WebServlet("/CtrlSuppressionBien")
public class CtrlSuppressionBien extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlSuppressionBien() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		long idBien=Long.parseLong(request.getParameter("idbien"));
		
			
			(new GestionBien()).SupprimerBien(idBien);
			
			
		response.sendRedirect("./CtrlListeBiens");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
