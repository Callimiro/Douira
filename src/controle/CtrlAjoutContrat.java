package controle;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modele.Contrat;
import modele.GestionBien;
import modele.GestionContrat;

@WebServlet("/CtrlAjoutContrat")
public class CtrlAjoutContrat extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlAjoutContrat() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Contrat contrat = new Contrat();
		
		if((new GestionBien()).ModifierCapacite(Long.parseLong((request.getParameter("idbien")))))
		{
		
		contrat.setIdbien(Long.parseLong((request.getParameter("idbien"))));
		
		contrat.setDatedebut((request.getParameter("datedebut")));
		
		contrat.setDureebail(Integer.parseInt((request.getParameter("dureebail"))));
		
		long idcontrat = new GestionContrat().ajouterContrat(contrat);
		
		request.setAttribute("idcontrat", idcontrat);
		
		String payement = request.getParameter("payement");
		
		if(payement.equals("hebdo"))
		{
			request.setAttribute("nbfactures", Math.ceil((float)contrat.getDureebail()/7));
			
			request.setAttribute("payement", 7);
		}

		if(payement.equals("mensuel"))
		{
			request.setAttribute("nbfactures", Math.ceil((float)contrat.getDureebail()/30));
			
			request.setAttribute("payement", 30);
		}

		if(payement.equals("trim"))
		{
			request.setAttribute("nbfactures", Math.ceil((float)contrat.getDureebail()/90));
			
			request.setAttribute("payement", 90);
		}

		if(payement.equals("quad"))
		{
			request.setAttribute("nbfactures", Math.ceil((float)contrat.getDureebail()/120));
			
			request.setAttribute("payement", 120);
		}

		if(payement.equals("sem"))
		{
			request.setAttribute("nbfactures", Math.ceil(contrat.getDureebail()/180));
			
			request.setAttribute("payement", 180);
		}

		if(payement.equals("annuel"))
		{
			request.setAttribute("nbfactures", Math.ceil(contrat.getDureebail()/365));
			
			request.setAttribute("payement", 365);
		}
		
		request.setAttribute("datedebut", contrat.getDatedebut());
		
		this.getServletContext().getRequestDispatcher("/CtrlAjoutFacture").forward( request, response );

		}
		else
		{
			request.setAttribute("msgAjoutContrat", "Erreur lors de location");
			this.getServletContext().getRequestDispatcher("/Accueil.jsp").forward( request, response );
		}
	}

}
