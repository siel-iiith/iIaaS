<%@page import="org.jclouds.openstack.nova.v2_0.domain.VolumeAttachment"%>
<%@page import="org.jclouds.compute.domain.Hardware"%>
<%@page import="org.jclouds.openstack.nova.v2_0.domain.Volume"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="com.google.common.collect.Iterables"%>
<%@page import="com.dashboard.openstack.utils.OpenstackUtils"%>
<%@page import="com.dashboard.utils.Utils"%>
<%@page import="com.dashboard.utils.Connection"%>
<%@page import="com.dashboard.resources.Instance"%>
<%@page import="com.dashboard.servlets.Constants"%>
<html>
	<head>
		<link rel="stylesheet" href="css/dv.css" type="text/css">
		<link rel="stylesheet" href="css/home.css" type="text/css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
		<!-- <script src="plugin/js/jquery-ui-1.8.13.custom.min.js"></script> -->
		<script type="text/javascript" src="js/dv.js"></script>
		<script type="text/javascript" language="javascript" src="plugin/carousel/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" language="javascript" src="plugin/carousel/jquery.carouFredSel-6.1.0-packed.js"></script>

		<!-- optionally include helper plugins -->
		<script type="text/javascript" language="javascript" src="plugin/carousel/helper-plugins/jquery.mousewheel.min.js"></script>
		<script type="text/javascript" language="javascript" src="plugin/carousel/helper-plugins/jquery.touchSwipe.min.js"></script>
		<script type="text/javascript" language="javascript" src="plugin/carousel/helper-plugins/jquery.ba-throttle-debounce.min.js"></script>
		<script type="text/javascript">
		$(function() {

			//	Scrolled by user interaction
			$('#delete_vol_ul').carouFredSel({
				auto: false,
				prev: '#prev_delete_vol',
				next: '#next_delete_vol',
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
	<div id="dv-volumes-list" class="fontclass">
	<div id="dv-contentWrapper" class="dv-pageContent">
	<div class="hidden" id="dv_success"> <code>Volume Deleted Sucessfully!</code></div>
	<div class="dv-warning hidden" id="dv_error"> <code>Delete Failed!! Volume is attached to instance.</code></div>
	<div class="dv-warning hidden" id="dv_error-1"> <code>Delete Failed!!</code></div>
	<div class="hidden" id="dv-loading-image-div"><img src="images/ajax-loader.gif"></div>
		<% 
		Connection dvconn = (Connection) session.getAttribute(Constants.connection);
		Map<Integer, Volume> dv_volumesMap = Utils.getVolumes(dvconn.context,"openstack");
		int dv_number_of_volumes=dv_volumesMap.size();
		int dv_width_of_scrollbar=dv_number_of_volumes * 120 +100;
		String[] dv_colors={"59,101,156","204,51,51","120,150,0","255,153,0"};
		%>
			
		<div id="dv-view_volume" style="margin-left:60px">
		<fieldset class="dv-fieldset" >
		<legend class="dv-legend"> Volumes</legend>
		<table style="margin-left: 100px;margin-top:-20px;  padding: 40px">
			<tr>
				<td>
					<a id="prev_delete_vol" class="prev" href="#"><img src="images/arrowLeft.png" /></a>
				</td>
				<td style="width: 30px"> &nbsp; </td>
				<td>
				<div class="wrapper">
				<div class="list_carousel">
					<ul id="delete_vol_ul">
		
		
		<% 
		int dv_margin_left=0;
		int dv_i=100;
		for (Integer volLocalId : dv_volumesMap.keySet()) {
			Volume dv_volume = dv_volumesMap.get(volLocalId);
			String dv_volumeId = dv_volume.getId();
			System.out.println("Voleme ID  " + dv_volumeId+" size " + dv_volume.getSize());
		%>
		
							<li  class="hoverSelection" dv_volumeid="dv<%=dv_volumeId%>" dv_no_of_volumes="<%=dv_number_of_volumes%>"
								onclick="deleteVolume(this);" style="background: rgb(<%=dv_colors[(dv_i-100)%4]%>);" >
									<span  style="color:white"><%=dv_volume.getName()%><img style="margin-left:15px" src="images/delete6.png"></img></span><br/>
									<span style="margin-left:-35px;color:white"><%=dv_volume.getSize()%> GB</span>
										
		
		<% 
		System.out.println("status is " + dv_volume.getStatus());
		int status = -1;
		if ((dv_volume.getStatus()).equals(Volume.Status.AVAILABLE)) 
			status=1;
		else
			status=0;
		System.out.println("now statis is " + status);
		
		%>
		
		<span id="dv-status<%=dv_volumeId%>" style="margin-left:5px;color:white"  status="<%=status%>"></span>
		</li>
		<%

			dv_i++;

		}
		%>
		
		
		</ul>
		<div class="clearfix"></div>
			</div>
			</div>
					</td>
		<td style="width: 30px"> &nbsp; </td>
			<td>
				<a id="next_delete_vol" class="next" href="#"><img src="images/arrowRight.png" /></a>
			</td>
		</tr>
	</table>
		</fieldset>

		</div>
		
		
		
		
	</div>
	</div>

</body>
</html>