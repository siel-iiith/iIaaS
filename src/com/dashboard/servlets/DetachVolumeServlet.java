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

public class DetachVolumeServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();

		 String provider = (String)session.getAttribute(Constants.provider);
		// //TODO
		//String provider = "openstack";
		String nodeid = req.getParameter("nodeid");
		String volumeid = req.getParameter("volumeid");

		Connection conn = (Connection)session.getAttribute(Constants.connection);
		PrintWriter pw = resp.getWriter();
		//Connection conn = OpenstackUtils.authenticate("demo", "demo", "default");
		System.out.println("DETACH: " + conn + " " + provider);
		if (conn == null) {
			pw.write("Invalid User!");
			pw.close();
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
			return;
		}
		System.out.println("Detaching volume " + volumeid + " nodeid " + nodeid);
		Utils.detachVolume(conn.context, volumeid, nodeid, provider);
		pw.write("Success");
		pw.close();
	}
}
