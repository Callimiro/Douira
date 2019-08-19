package controle;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modele.Bien;
import modele.Commentaire;
import modele.GestionBien;
import modele.GestionCommentaire;
import modele.GestionImage;
import modele.Utilisateur;

@WebServlet("/CtrlDetailsBien")
public class CtrlDetailsBien extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlDetailsBien() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Long idbien = Long.parseLong(request.getParameter("idbien"));
		
		System.out.println("idbien: " + idbien);
		
		Bien bien = new GestionBien().detailsBien(idbien);
		
		List<Object> listeCommentaires = new GestionCommentaire().recupererListeCommentaires(idbien);

		try
		{
			ArrayList<Commentaire> commentaires = (ArrayList<Commentaire>) listeCommentaires.get(1);
			
			ArrayList<Utilisateur> commentateurs = (ArrayList<Utilisateur>) listeCommentaires.get(0);
			
			request.setAttribute("DetailsBien", bien);
			
			request.setAttribute("CommentairesBien", commentaires);
			
			request.setAttribute("Commentateurs", commentateurs);
			
			request.setAttribute("nombreimages", ((new GestionImage()).nombreImages(idbien)));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		this.getServletContext().getRequestDispatcher("/DetailsBien.jsp").forward( request, response );
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
