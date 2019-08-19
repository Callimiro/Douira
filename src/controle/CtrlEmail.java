package controle;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modele.SendEmail;

@WebServlet("/CtrlEmail")
public class CtrlEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlEmail() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		long code = Long.parseLong(request.getParameter("code"));
		
		if(code==(long)session.getAttribute("USER"))
		{
			response.sendRedirect("./Accueil.jsp");
		}
		else
			this.getServletContext().getRequestDispatcher("/ConfirmerEmail.jsp").forward( request, response );
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
