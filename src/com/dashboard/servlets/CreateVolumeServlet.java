/**
 * @author amulya
 * Purpose : Servlet to Create Volume
 */
package com.dashboard.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dashboard.openstack.utils.OpenstackUtils;
import com.dashboard.utils.Connection;
import com.dashboard.utils.Utils;

public class CreateVolumeServlet extends HttpServlet {

	/**
	 * @param req - HttpServletRequest Object
	 * @param resp -HttpServletResponse Object
	 * @throws ServletException 
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//HttpSession session = req.getSession();
System.out.println("create volume");
		// String provider = (String)session.getAttribute(Constants.provider);
		// //TODO
		String provider = "openstack";
		String name = req.getParameter("name");
		String size = req.getParameter("size");

		//Connection conn = (Connection)session.getAttribute(Constants.connection);
		PrintWriter pw = resp.getWriter();
		Connection conn = OpenstackUtils.authenticate("demo", "demo", "default");
		//System.out.println("CREATE: " + conn + " " + provider);
		if (conn == null) {
			pw.write("Invalid User!");
			pw.close();
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
			return;
		}
		
		boolean isCreated=Utils.createVolume(conn.context,name , size, provider);
		if(isCreated) {
			pw.write("Successfully created the volume!");
		} else {
			pw.write("Error in creating the volume!");
		}
		pw.close();
	}
	
}
