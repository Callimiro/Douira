package controle;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modele.Bien;
import modele.GestionBien;

@WebServlet("/CtrlTopAnnonce")
public class CtrlTopAnnonce extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlTopAnnonce() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Bien> topannonces = new GestionBien().ListeTopAnnonces(request.getParameter("topplace"), Long.parseLong(request.getParameter("idprop")));
		
		if(topannonces.isEmpty())
		{
			request.setAttribute("recherchevide", "Aucun résultat trouvé");
		}
		else
		{
			request.setAttribute("SearchResult", topannonces);
		}
		
		this.getServletContext().getRequestDispatcher("/Resultat2.jsp").forward( request, response );
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
