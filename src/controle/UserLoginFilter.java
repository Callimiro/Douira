package controle;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter(filterName = "UserLoginFilter", urlPatterns = {"/Accueil.jsp","/AjouterBien.jsp","/DetailsBiens.jsp","/ListeBiens.jsp","/ModificationProfil.jsp","/Resultat2.jsp"})
public class UserLoginFilter implements Filter {

    public UserLoginFilter() {
        
    }

	public void destroy() {
		
	}


	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        if ((session == null || session.getAttribute("user") == null) &&( session.getAttribute("role")==null || session.getAttribute("role")!="user")) {
           response.sendRedirect( "./Authentification.jsp"); // No logged-in user found, so redirect to login page.
           
        } 
        chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
