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
	<head>
		<link rel="stylesheet" href="css/new_lv.css" type="text/css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
		<script type="text/javascript" language="javascript" src="plugin/carousel/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" language="javascript" src="plugin/carousel/jquery.carouFredSel-6.1.0-packed.js"></script>

		<!-- optionally include helper plugins -->
		<script type="text/javascript" language="javascript" src="plugin/carousel/helper-plugins/jquery.mousewheel.min.js"></script>
		<script type="text/javascript" language="javascript" src="plugin/carousel/helper-plugins/jquery.touchSwipe.min.js"></script>
		<script type="text/javascript" language="javascript" src="plugin/carousel/helper-plugins/jquery.ba-throttle-debounce.min.js"></script>
		<script type="text/javascript" src="js/lv.js"></script>
		
<!-- thumbnailScroller script -->
<!-- <script src="plugin/js/jquery.thumbnailScroller.js"></script> -->
<script type="text/javascript" language="javascript">
				$(function() {
				$("#volumes_ul").carouFredSel({
					auto: false,
					prev: '#prevVol',
					next: '#nextVol',
					mousewheel: true,
					swipe: {
						onMouse: true,
						onTouch: true
					}
				});
				
});
		</script>

</head>
<div id="lvcontentWrapper" class="lvpageContent">
		<% 
			Connection lvconn = OpenstackUtils.authenticate("demo", "demo",	"default");
			Map<Integer, Volume> lvvolumesMap = Utils.getVolumes(lvconn.context,"openstack");
			int number_of_volumes=lvvolumesMap.size();
			int width_of_scrollbar=number_of_volumes * 120 +100;
			String[] colors={"59,101,156","204,51,51","102,128,0","245,153,0"};
			%>
	<table>
		<tr>
			<td>
				<a id="prevVol" class="prev" href="#"><img src="images/arrowLeft.png" /></a>
			</td>
			<td>
				<div class="wrapper">
					<div class="list_carousel">
						<ul id="volumes_ul">
							<% 
								int margin_left=0;
								int lv_i=100;
								for (Integer volLocalId : lvvolumesMap.keySet()) {
										Volume volume = lvvolumesMap.get(volLocalId);
										//System.out.println("Volume " + volume);
										String volumeId = volume.getId();
										System.out.println("Voleme ID  " + volumeId+" size " + volume.getSize());
								%>
								<li volumeid="<%=volumeId%>" no_of_volumes="<%=number_of_volumes%>" 
											current_vol_no="<%=lv_i%>" onclick="displayinfo_lv(this);" id="<%="volume"+lv_i%>" style='background: rgb(<%=colors[(lv_i-100)%4]%>)'>
									<a href="#">
										<span  style="margin-left:5px;"><%=volume.getName()%></span><br/>
										<span style="margin-left:5px;"><%=volume.getSize()%> GB</span>
										<% 
										if ((volume.getStatus()).equals(Volume.Status.AVAILABLE)) {
										%>
											<span  volumeid="<%=volumeId%>" no_of_volumes="<%=number_of_volumes%>" 
														current_vol_no="<%=lv_i%>" style="margin-left:15px;">Attach</span>
											<%
										}
										else {	
										%>
											<span  volumeid="<%=volumeId%>" 
												no_of_volumes="<%=number_of_volumes%>" current_vol_no="<%=lv_i%>" 
												style="margin-left:15px;" onclick="displayinfo_lv(this);">Dettach</span>
										<% 
										}
										%>
									</a>
								</li>
								<%
							lv_i++;
						}
						%>
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</td>
			<td>
				<a id="nextVol" class="next" href="#"><img src="images/arrowRight.png" /></a>
			</td>
		</tr>
	</table>
	<% 
	Map<Integer, Hardware> lvflvrsMap= Utils.getFlavors("openstack",lvconn.compute);
	Map<String, Instance> lvinstancesMap = Utils.getInstances("openstack", lvconn.compute, lvflvrsMap);
	width_of_scrollbar=lvinstancesMap.size()* 120+100;
	%>
	<div id="instances_vol" style="margin-top:100px;margin-left:0px">
	<%
		lv_i=100;
		int j;
		for (Integer volLocalId : lvvolumesMap.keySet()) {
	%>
	<div id="<%="inst"+lv_i%>" style="display: none">
		<table>
		<tr>
		<td>
			<a id="<%="prev"+lv_i%>" class="prev" href="#"><img src="images/arrowLeft.png" /></a>
		</td>
		<td>
			<div class="wrapper">
				<div class="list_carousel">
					<ul id="<%="inst_ul_"+lv_i%>" >
						<%
						System.out.println("local Voleme ID  " + volLocalId);
						Volume volume = lvvolumesMap.get(volLocalId);
						String volumeId = volume.getId();
						System.out.println("Voleme ID " + volumeId+ " " + volume.getName());
			            if ((volume.getStatus()).equals(Volume.Status.AVAILABLE)) {
			            	System.out.println("free");
							j=0;
							for (String id : lvinstancesMap.keySet()) {
								Instance instance = lvinstancesMap.get(id);
								System.out.println(" Instance Id "+id+" "+instance.getState().toString());
								if(instance.getState().toString().equals("RUNNING"))
								{
									System.out.println("RUNNING INSTANCE " + id);
								%>
									<li volumeid="<%=volumeId%>" instanceid="<%=instance.getId()%>" 
																	onclick="attachVolume(this);" id="<%="volume_to_use" + lv_i%>">
										<a href='#'>
											<span style="margin-left:5px;"><%=instance.getName()%></span>
											<br/>
											<span style="margin-left:10px;" >Attach to</span>
											<span style="margin-left:10px;"><%=volume.getName()%></span>
										</a>
									</li>									
									<%
									j++;
								} 
							}//end inner for
			            }//end outer if
						else { 
							System.out.println("not free");
					       	VolumeAttachment va	 = Iterables.getLast(volume.getAttachments());
							Instance attached_instance= lvinstancesMap.get(va.getServerId());
							String instance_name=attached_instance.getName();
						%>
							<li volumeid="<%=volumeId%>" instanceid="<%=attached_instance.getId()%>"  
									 onclick="detachVolume(this);" id="<%="volume_to_use" + lv_i%>">
								<a href='#'>
									<span style="margin-left:5px;"><%=attached_instance.getName()%></span>
									<span >Dettach <%=volumeId%></span>
								</a>
							</li>
							<%
						}//end outer else
			            %>
						</ul>
					<div class="clearfix"></div>
					
					
					</div>
					</div>
					</td>
			<td>
				<a id="<%="next"+lv_i%>" class="next" href="#"><img src="images/arrowRight.png" /></a>
			</td>
			</tr>
			</table>
					</div>
						<%
						lv_i++;
						
					}//end outer for%>			
</div>
</div>
