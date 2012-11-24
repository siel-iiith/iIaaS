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

public class TerminateInstanceServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		System.out.println("inside terminate");
		PrintWriter pw = resp.getWriter();
		
		// String provider = (String)session.getAttribute(Constants.provider); //TODO
		String provider = "openstack";
		String nodeId = req.getParameter("node");
		
		Connection conn = (Connection) session.getAttribute(Constants.connection);  //TODO
//		Connection conn = OpenstackUtils.authenticate("demo", "demo", "default");
		if(conn==null){
			pw.write("Invalid User!");
			pw.close();
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.include(req, resp);
			return;
		}
		
		Utils.destroyNode(conn.compute, "siel/" + nodeId, provider); //TODO
		

	}
}
