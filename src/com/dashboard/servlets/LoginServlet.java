package com.dashboard.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jclouds.compute.domain.ComputeMetadata;
import org.jclouds.compute.domain.Hardware;
import org.jclouds.compute.domain.Image;
import org.jclouds.compute.domain.NodeMetadata;

import com.dashboard.openstack.utils.OpenstackUtils;
import com.dashboard.resources.Instance;
import com.dashboard.utils.Connection;
import com.dashboard.utils.Utils;

public class LoginServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		String provider = req.getParameter(Constants.provider); 
		String tenantName = req.getParameter("tenant");
		
		RequestDispatcher rd = null;
		
		//Authenticate user
		Connection connection = Utils.authenticate(username, password, provider, tenantName);
		if(connection != null) {
			System.out.println("Authenticated User");
			rd = req.getRequestDispatcher("home.jsp");
			HttpSession session = req.getSession();

			session.setAttribute(Constants.provider, provider);
			session.setAttribute(Constants.connection, connection);
			
			//Get the list of images
			Map<Integer, Image> imagesMap = Utils.getImages( provider, connection.compute);
			session.setAttribute(Constants.imagesMapAttrName, imagesMap);
			
			//Get the list of flavors
			Map<Integer, Hardware> flavorsMap = Utils.getFlavors( provider, connection.compute);
			session.setAttribute(Constants.flavorsMapAttrName, flavorsMap);
			
			//Get the list of instances
			//Map<Integer, Instance> instancesMap = Utils.getInstances(provider, connection.compute, flavorsMap);
			//req.setAttribute(Constants.instancesMapAttrName, instancesMap);
			
			//System.out.println("Number of Instances : " + instancesMap.size());
		} else {
			System.out.println("Invalid credentials");
			rd = req.getRequestDispatcher("error.html"); //TODO: Add error message
		}
		
		if (rd != null) 
			rd.include(req, resp);
	}
	
}
