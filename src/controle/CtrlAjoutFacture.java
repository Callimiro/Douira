package controle;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modele.Facture;
import modele.GestionFacture;
import modele.GestionUtilisateur;
import modele.SendEmail;

@WebServlet("/CtrlAjoutFacture")
public class CtrlAjoutFacture extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlAjoutFacture() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		
		Double d = (double) request.getAttribute("nbfactures");
		
		int nbfactures = d.intValue();
		
		System.out.println(nbfactures);
		
		if(nbfactures==0)
		{
			nbfactures = 1;
		}
		
		int payement = (int) request.getAttribute("payement");
		
		String datedebut = (String) request.getAttribute("datedebut");
		
		Facture facture = new Facture();
		
		facture.setIdcontrat((long)(request.getAttribute("idcontrat")));
		
		facture.setIdlocataire((long)(session.getAttribute("USER")));
		
		String msg = new GestionFacture().ajouterFacture(facture, nbfactures, payement, datedebut);
		
		request.setAttribute("msgAjoutContrat", msg);
		
		String email = new GestionUtilisateur().recupererEmail(facture.getIdcontrat());
		
		if(msg.equals("Bien loué avec succès ! Veuillez vous présenter dans un délai de 24h à notre agence pour compléter la procédure de la location"))
		{
			SendEmail.send(email, "DEMANDE DE LOCATION", "Un client veut louer votre bien, on vous contacte lorsqu'il se présente à notre agence !", "douiraproject@gmail.com", "wedidwhatwecan");
		}
		
		this.getServletContext().getRequestDispatcher("/Accueil.jsp").forward( request, response );
	}

}
