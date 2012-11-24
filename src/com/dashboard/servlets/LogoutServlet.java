/**
 * @author amulya,pallavi,mrinalini,anshul,rashi,sindhusha
 * Purpose : Servlet for Logout
 */

package com.dashboard.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {

	/**
	 * @param req - HttpServiceRequest Object
	 * @param resp - HttpService Response Object
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.removeAttribute(Constants.connection);
		/*RequestDispatcher rd = null;
		rd = req.getRequestDispatcher("login.jsp");
		if (rd != null)
			rd.include(req, resp);*/
	}
}
