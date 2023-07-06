/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Start;

/**
 *
 * @author esraa
 */

    import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SessionFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code, if any
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("username") != null);

        if (isLoggedIn) {
            // User is authenticated, allow access to the requested resource
            chain.doFilter(request, response);
        } else {
            // User is not authenticated, redirect to the login page
            httpResponse.sendRedirect("index.jsp");
        }
    }

    public void destroy() {
        // Cleanup code, if any
    }
}

