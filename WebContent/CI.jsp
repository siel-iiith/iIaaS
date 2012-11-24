<%@page import="org.jclouds.compute.domain.Processor"%>
<%@page import="org.jclouds.compute.domain.Hardware"%>
<%@page import="com.dashboard.utils.Utils"%>
<%@page import="org.jclouds.compute.domain.NodeMetadata.Status"%>
<%@page import="com.dashboard.resources.Instance"%>
<%@page import="com.dashboard.openstack.utils.OpenstackUtils"%>
<%@page import="com.dashboard.utils.Connection"%>
<%@page import="com.dashboard.servlets.Constants"%>
<%@ page import="java.util.*"%>
<%@page
	import="org.jclouds.compute.domain.Image,java.util.Map,org.jclouds.compute.domain.Hardware,java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"	href="css/CI.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="js/CI.js"></script>
<script type="text/javascript" src="js/test.js"></script>
<title>IAAS</title>
</head>
<body>


<div id="ci-wrapper">
<div id="ci-contentWrapper" class="ci-pageContent" style="display: block; min-width: 555px; height: 620px; margin-left: 150px;">
	<div id="subNavWrapper">
		<div id="subNav" style="display: block;">
			<a id="ci-images" class="subNavItemActive" style="background-color:#F60;cursor:pointer">Images</a>
			<a id="ci-flavors" style="background-color:#F60;cursor:pointer">Flavors</a>
		</div>
	</div>
	<div id="ci-content" style="margin-left: 0px; display: block;">
		<h1 class="margin-t-0">Create Instance</h1>
		<em style="margin-left:20px;">Add image and flavor</em>
		<div class="hidden" id="ci_error"> <code>Creation Failed!!</code></div>
		<div class="hidden" id="ci_error1"> <code>OS Type already exists!!First remove it.</code></div>
		<div class="hidden" id="ci_error2"> <code>Flavor Type already exists!!First remove it.</code></div>
		<div class="hidden" id="ci-loading-image-div"><img src="images/ajax-loader.gif"></div>
		<div class="hidden" id="ci_success"> <code>Instance created Sucessfully!</code></div>
		<br>
		<br>
		<ul id="cl-image-list">
		<%
		Connection connection = (Connection) session.getAttribute(Constants.connection);
		if (connection == null) {
			RequestDispatcher rd = request
					.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
			return;
		}
		int count = 2,width = 200,left = 0,flag=0,top=45;
		String bgColor[] = new String[4];
		bgColor[0]="rgb(120, 150, 0)";
		bgColor[1]="rgb(204, 51, 51)";
		bgColor[2]="rgb(255, 153, 0)";
		bgColor[3]="rgb(59, 101, 156)";
		Map<Integer, Image> imgsMap = (Map<Integer, Image>)session.getAttribute(Constants.imagesMapAttrName);
		for (Integer id : imgsMap.keySet()) {
			Image img = imgsMap.get(id);
			String imgId = img.getId().replaceFirst(".*/", "");
			System.out.println(imgId + " " + img.getName());
		%>
		<li class="ci-image-li">		 	
		 	<a class="tile" title <%=img.getName()%> id="<%="os" + id%>" 
		 		style="margin-top: <%=top%>px; margin-left: <%=left%>px; 
		 		width: <%=width %>px; height: 95px; 
		 		background: none repeat scroll 0% 0%  <%=bgColor[flag%4]%> ; display: inline; "
		 		onclick="ttt();" >
			<div class="tileTitle" style="margin-left:14px;margin-top:24px">
				<%=img.getName()%>
			</div>
			<% left = left + width +10;
				if( left > 212)
					left = 0;
				count++;
				flag++;
				if (flag %2 == 0)
					top = top + 105;
				if (count >2)
				{
					if (width == 200)
						width = 145;
					else
						width = 200;
					count = 1;
				}
			%>
		</a>
		 </li>
		<%
			}
		%>
				
		</ul>
		<ul id="cl-flavor-list" class="hidden">
		<%
		Map<Integer, Hardware> flavorsMap = (Map<Integer, Hardware>)session.getAttribute(Constants.flavorsMapAttrName);
		count = 2;width = 200;left = 0;flag=0;top=45;
		for (Integer id : flavorsMap.keySet()) {
			Hardware hw = flavorsMap.get(id);
			String hwId = hw.getId().replaceFirst(".*/", "");
			List<? extends Processor> procList = hw.getProcessors();
			Processor p = procList.get(0);
			String cpus = "" + p.getCores();
		
		%>
		
		<li class="ci-flavor-li"><a class="tile" id="<%="hw" + id%>" style='margin-top: <%=top%>px; margin-left: <%=left%>px; width: <%=width %>px; height: 95px; background: none repeat scroll 0% 0%  <%=bgColor[flag%4]%> ; display: inline;' >
			<div class="tileTitle" style="margin-left:10px;margin-top:24px">
				<%=hw.getRam() + " MB"%><br /> <%=cpus + " CPUs"%>
			</div>
			<% left = left + width +10;
				if( left > 212)
					left = 0;
				count++;
				flag++;
				if (flag %2 == 0)
					top = top + 105;
				if (count >2)
				{
					if (width == 200)
						width = 145;
					else
						width = 200;
					count = 1;
				}
			%>
		</a></li>
		
		<%
			}
		%>
		</ul>
		
		<div id="ci-flavor-dropzone-div">
		<div id="ci-dropzone">
			<a class="tileSlideshow tile" id="dropzone" style="margin-top: 45px; margin-left: 600px; width: 300px; height: 300px; display: inline;">
			<img id="slideshow_200" class="tileSlideshowImage" src="images/img2.jpg" style="display: block;">
			<div class="tileLabelWrapper top" style="border-top-color:#789600;">
					<div class="tileLabel top">New Instance</div>
			</div>


			</a>
		</div>			
			<button id="ci-create-button">Create</button>
			

		</div>

		
	</div>
</div>
</div>
</body>
</html>