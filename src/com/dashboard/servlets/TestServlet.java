package com.dashboard.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username=req.getParameter("user");
		System.out.println("here" + username);
		resp.setContentType("text/html");
		PrintWriter pw = resp.getWriter();
		pw.write("username");
		pw.close();
	}
}
