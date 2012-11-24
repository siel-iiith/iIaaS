<%@page import="com.dashboard.utils.Utils"%>
<%@page import="org.jclouds.compute.domain.Hardware"%>
<%@page import="com.dashboard.utils.Connection"%>
<%@page import="org.jclouds.compute.domain.NodeMetadata.Status"%>
<%@page import="com.dashboard.resources.Instance"%>
<%@page import="com.dashboard.openstack.utils.OpenstackUtils"%>
<%@page import="com.dashboard.servlets.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html>
<head>
<link rel="stylesheet" href="css/home.css" type="text/css">
<link rel="stylesheet" href="css/listIN.css" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="js/home.js"></script>
<script type="text/javascript" src="js/listIN.js"></script>
<script src="js/jquery.min.js"></script>
<!-- <script type="text/javascript" language="javascript" src="plugin/carousel/jquery-1.8.2.min.js"></script> -->
		<script type="text/javascript" language="javascript" src="plugin/carousel/jquery.carouFredSel-6.1.0-packed.js"></script>

		<!-- optionally include helper plugins -->

<script type="text/javascript">
function displayinfo_li(ele)
{
	 
	 //alert(element.getAttribute("volumeid"));
	var max_instances=ele.getAttribute("max_instance");
	var current_instance=ele.getAttribute("current_instance");
	//alert(max_instances+" "+ current_instance);
	for(var i=0; i< max_instances;i++)
		{
		
			document.getElementById(i).style.display = "none";
		
		}
	document.getElementById(current_instance).style.display = "block";
}

$(function() {

	//	Scrolled by user interaction
	$('#list_instances_ul').carouFredSel({
		auto: false,
		prev: '#prev_instance',
		next: '#next_instance',
		mousewheel: true,
		swipe: {
			onMouse: true,
			onTouch: true
		}
	});
	
});
</script>
</head>
<body>
<div id="licontentWrapper" class="lipageContent"><!-- style="margin-top:80px;margin-left:350px" id="list_instances_page" class="pageContent"> -->	
	<div class="hidden" id="li-loading-image-div" style="margin-left: 400px" ><img src="images/ajax-loader.gif"></div>
	<div class="box-download hidden" id="li_terminate_success"> <code>Instance terminated Sucessfully!</code></div>
	<div class="box-warning hidden" id="li_terminate_error"> <code>Unable to terminate instance!</code></div>
	<div class="box-download hidden" id="li_resume_success"> <code>Instance resumed Sucessfully!</code></div>
	<div class="box-warning hidden" id="li_resume_error"> <code>Unable to resume instance!</code></div>
	<div class="box-download hidden" id="li_suspend_success"> <code>Instance suspended Sucessfully!</code></div>
	<div class="box-warning hidden" id="li_suspend_error"> <code>Unable to suspend instance!</code></div>
	<%
	String color_arr[]={"59, 101, 156","204, 51, 51","120, 150, 0","255, 153, 0"}; /*Blue Red Green Orange RGB codes respectively */
	int curr_color=0;
	Connection conn = (Connection) session.getAttribute(Constants.connection); 
	if (conn == null) {
		System.out.println("not established connection");
		RequestDispatcher rd = request.getRequestDispatcher("NewLogin.jsp");
		rd.include(request, response);
		return;
	}
	Map<Integer, Hardware> flvrsMap = Utils.getFlavors("openstack",conn.compute);
	String path = "";
	Map<String, Instance> instancesMap = Utils.getInstances("openstack", conn.compute, flvrsMap);
	int instancesColorCount = 3;
	%>
	<table style="margin-left: 100px;  padding: 40px">
	<tr>
	<td>
		<a id="prev_instance" class="prev" href="#"><img src="images/arrowLeft.png" /></a>
	</td>
	<td style="width: 30px"> &nbsp; </td>
	<td>
	<div class="wrapper">
		<div class="list_carousel" style="background: rgba(180, 180, 180, 0.2)">
			<ul id="list_instances_ul">
				<% 	
				int InstanceId=0;
				int prev_indx=0;
				if(instancesMap.size()%2 == 0) {
					instancesColorCount = 4;
				} else {
					instancesColorCount = 3;
				}
				for (String id : instancesMap.keySet()) {
					Instance instance = instancesMap.get(id);
				%>
				<li class="hoverSelection" current_instance="<%=InstanceId%>" instance_id="<%=id%>" max_instance="<%=instancesMap.size()%>" 
							onclick="displayinfo_li(this)" style='background: rgb(<%=color_arr[curr_color]%>)' >
					<a href="#">
					<div style="margin-left: 5px; font-size:16px;font-weight:bold;color: #FFFFFF; word-wrap:break-word;" ><%=instance.getName() %></div>
					</a>
				</li>
				<%
				prev_indx+=120;
				InstanceId++;
				curr_color=(curr_color+1)%instancesColorCount;
				}%>
			</ul>
			<div class="clearfix"></div>
		</div>
	</div>
	</td>
	<td style="width: 30px"> &nbsp; </td>
	<td>
		<a id="next_instance" class="next" href="#"><img src="images/arrowRight.png" /></a>
	</td>
	
	<td>
	</tr>
	</table>

	<%
	String ButtonText="";
	int i=0;
	boolean isFirstLegend = true;
	for (String id : instancesMap.keySet()) {
		boolean redFlag=true;
		Instance instance = instancesMap.get(id);
		path = "";
		if (instance.getState() == Status.RUNNING) {
			redFlag=false;
			ButtonText="Suspend";
		} else {
			ButtonText="Resume";
		}
		Hardware h=flvrsMap.get(instance.getFlavorId());
		int processors=h.getProcessors().size();
		int ram=h.getRam();
		int disks=h.getVolumes().size();
		System.out.println("first " + isFirstLegend);
		if(isFirstLegend) {
			isFirstLegend = false;
		
		%>
		<div id="<%=i%>" class="lin-pos-class">
		<%} else { 	
		%>
			<div id="<%=i%>" class="hidden lin-pos-class">
		<% } %>
				<form>
					<fieldset style="color: #000000; font-size: 20px;">
					  <%if(redFlag==true)
						{%>
							<legend class="suspended"  ><%=instance.getName()%></legend>
					  <%}
						else
						{%>
							<legend class="running"  ><%=instance.getName()%></legend>
					  <%}%>
						<dl class="separator" >
							<dt><label>Status</label></dt>
								<dd><%=instance.getState().toString()%></dd>
							<dt>IP</dt>
								<dd><%=instance.getIp()%></dd>
							<dt>Flavour</dt>
								<dd><%="VCPUs "+processors %></dd>
								<dd><%="Disk "+disks %></dd>
								<dd><%="RAM "+ram+" MB" %></dd>
							</dl>
					<% if(redFlag==true)
					   {%>
							<button class="greenbutton" value="SusRes" id="<%="TN" + id%>" onclick="resume(this);"><%=ButtonText %></button>
					<% }
					   else
					   {%>
							<button class="redbutton" value="SusRes" id="<%="TN" + id%>" onclick="suspend(this);"><%=ButtonText %></button>
							<button class="bluebutton" value="Terminate" id="<%="TN" + id%>" onclick="terminate(this);">Terminate</button>	
					 <%}%>
						
					</fieldset>
				</form>
			</div>
		<%
			i++;	
		}isFirstLegend = true;
		%>
		</div>
	</div>
	</body>
	</html>
