package com.dashboard.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jclouds.compute.domain.Hardware;
import org.jclouds.compute.domain.Image;

import com.dashboard.openstack.utils.OpenstackUtils;
import com.dashboard.utils.Connection;
import com.dashboard.utils.Utils;

public class CreateInstanceServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String provider = (String)session.getAttribute(Constants.provider);
		//String provider = "openstack";
		String imgIdFromUser = req.getParameter("image");
		String flvrIdFromUser = req.getParameter("flavor");
		PrintWriter pw = resp.getWriter();
		
		Connection conn = (Connection) session.getAttribute(Constants.connection);
		
		//Connection conn = OpenstackUtils.authenticate("demo", "demo", "default");
		if(conn==null){
			pw.write("Invalid User!");
			pw.close();
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
			return;
		}
		
		//Map<Integer, Image> imgsMap = Utils.getImages("openstack", conn.compute);
		//Map<Integer, Hardware> flvrsMap = Utils.getFlavors("openstack", conn.compute);
		
		Map<Integer, Image> imgsMap = (Map<Integer, Image>) session.getAttribute(Constants.imagesMapAttrName); 
		Map<Integer, Hardware> flvrsMap = (Map<Integer, Hardware>) session.getAttribute(Constants.flavorsMapAttrName);
		
		Image img = imgsMap.get(Integer.parseInt(imgIdFromUser));
		Hardware hw = flvrsMap.get(Integer.parseInt(flvrIdFromUser));
		
		boolean isCreated = Utils.createInstance(conn.compute, img.getId(), hw.getId(), provider);
		
		if(isCreated) {
			pw.write("Successfully created the instance!");
		} else {
			pw.write("Error in creating the instance!");
		}
		pw.close();
	}
}
