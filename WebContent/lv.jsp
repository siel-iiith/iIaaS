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
		<script type="text/javascript" src="js/lv.js"></script>
		
		<script type="text/javascript" language="javascript" src="plugin/carousel/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" language="javascript" src="plugin/carousel/jquery.carouFredSel-6.1.0-packed.js"></script>


		
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
<script type="text/javascript" language="javascript">
function loadInstances_lv(element) {
	alert("HHHHH");
	var max_volumes = parseInt(100+parseInt("current_vol_no"));
	for(var i=100; i<max_volume; i++) {
		document.getElementById("inst"+i).style.display = "none";
	}
	var instid="inst" + current_vol;
	document.getElementById(instid).style.display = "block";
	showInst(current_vol);
}
</script>
</head>
<div id="lvcontentWrapper" class="lvpageContent">
		<% 
			Connection lvconn = OpenstackUtils.authenticate("demo", "demo",	"default");
			Map<Integer, Volume> lvvolumesMap = Utils.getVolumes(lvconn.context,"openstack");
			int number_of_volumes=lvvolumesMap.size();
			int width_of_scrollbar=number_of_volumes * 120 +100;
			String[] colors={"59,101,156", "255,153,0", "120,150,0", "204, 51, 51"}; //59, 101, 156 - blue; 255, 153, 0 - orange; 204, 51, 51 - red; 120, 150, 0
			String[] colorsAttached = {"204, 51, 51", "120, 150, 0", "255,153,0", "59,101,156"};
			int volumesColorCount = 3;
			int instancesColorCount = 3;
			/* int volumesDivSize = 362;
			if(lvvolumesMap.size()==0) {
				
			} */
			%>
			<div class="hidden" id="lv-loading-image-div" style="margin-left: 400px"><img src="images/ajax-loader.gif"></div>
			
	<div class="box-download hidden" id="lv_attach_success"> <code>Volume attached Successfully!</code></div>
	<div class="box-warning hidden" id="lv_attach_failure"> <code>Unable to attach volume!</code></div>
	<div class="box-download hidden" id="lv_dettach_success"> <code>Volume detached Successfully!</code></div>
	<div class="box-warning hidden" id="lv_dettach_failure"> <code>Unable to detach volume!</code></div>
			
			
			<fieldset class="lvfieldset"  style="margin-top:40px">
				<legend class="lvlegend"> Volumes </legend>
		<table style="margin-left: 100px;margin-top:-30px;  padding: 40px">
			<tr>
				<td style="width: 100px;">
					<a id="prevVol" class="prev" href="#"><img src="images/arrowLeft.png" /></a>
				</td>	
				<td style="width: 30px"> &nbsp; </td>
				<td>
				<div class="wrapper">
					<div class="list_carousel" >
						<ul id="volumes_ul">
							<% 
								int margin_left=0;
								int lv_i=100;
								if(lvvolumesMap.size()%2 == 0) {
									volumesColorCount = 4;
								} else {
									volumesColorCount = 3;
								}
								for (Integer volLocalId : lvvolumesMap.keySet()) {
										Volume volume = lvvolumesMap.get(volLocalId);
										//System.out.println("Volume " + volume);
										String volumeId = volume.getId();
										System.out.println("Voleme ID  " + volumeId+" size " + volume.getSize());
								%>
								<li class="hoverSelection" volumeid="<%=volumeId%>" no_of_volumes="<%=number_of_volumes%>" 
											current_vol_no="<%=lv_i%>" onclick="displayinfo_lv(this);" id="<%="volume"+lv_i%>" 
											style='background: rgb(<%=colors[(lv_i-100)%volumesColorCount]%>)'>
									<a href="#">
										<span  style="margin-left:5px;color: #FFFFFF; font-weight: bold"><%=volume.getName()%></span><br/>
										<span style="margin-left:5px; color: #FFFFFF;"><%=volume.getSize()%> GB</span> <br>
										<% 
										if ((volume.getStatus()).equals(Volume.Status.AVAILABLE)) {
										%>
											<span  volumeid="<%=volumeId%>" no_of_volumes="<%=number_of_volumes%>" 
														current_vol_no="<%=lv_i%>" style="margin-left:15px; color: #FFFFFF;">Attach</span>
											<%
										}
										else {	
										%>
											<span  volumeid="<%=volumeId%>" 
												no_of_volumes="<%=number_of_volumes%>" current_vol_no="<%=lv_i%>" 
												style="margin-left:15px; color: #FFFFFF;">Dettach</span>
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
			<td style="width: 30px"> &nbsp; </td>
			<td style="width: 100px;">
				<a id="nextVol" class="next" href="#"><img src="images/arrowRight.png" /></a>
			</td>
		</tr>
	</table>
	</fieldset>
	<% 
	Map<Integer, Hardware> lvflvrsMap= Utils.getFlavors("openstack",lvconn.compute);
	Map<String, Instance> lvinstancesMap = Utils.getInstances("openstack", lvconn.compute, lvflvrsMap);
	width_of_scrollbar=lvinstancesMap.size()* 120+100;
	%>
	<div id="instances_vol" style="margin-left:0px">
	<%
		lv_i=100;
		int j;
		for (Integer volLocalId : lvvolumesMap.keySet()) {
	%>
	<br/>
	<div id="<%="inst"+lv_i%>" style="display: none">
		<fieldset class="lvfieldset">
		<legend class="lvlegend"> Instances </legend>
		<table style="margin-left: 100px; margin-top:-30px; padding: 30px;">
		<tr>
		<td style="width: 100px;">
			<a id="<%="prev"+lv_i%>" class="prev" href="#"><img src="images/arrowLeft.png" /></a>
		</td>
		<td style="width: 30px"> &nbsp; </td>
		<td>
			<div class="wrapper">
					
						<%
						System.out.println("local Voleme ID  " + volLocalId);
						Volume volume = lvvolumesMap.get(volLocalId);
						String volumeId = volume.getId();
						System.out.println("Voleme ID " + volumeId+ " " + volume.getName());
			            if ((volume.getStatus()).equals(Volume.Status.AVAILABLE)) {
			            	%>
			            	<div class="list_carousel">
			            	<ul id="<%="inst_ul_"+lv_i%>" >
			            	<%
			            	System.out.println("free");
							j=0;
							
							for (String id : lvinstancesMap.keySet()) {
								Instance instance = lvinstancesMap.get(id);
								System.out.println(" Instance Id "+id+" "+instance.getState().toString());
								if(instance.getState().toString().equals("RUNNING"))
								{
									System.out.println("RUNNING INSTANCE " + id);
									
								%>
									<li class="hoverSelection" volumeid="<%=volumeId%>" instanceid="<%=instance.getId()%>" 
																	onclick="attachVolume(this);" id="<%="volume_to_use" + lv_i%>"
																	style='background: rgb(<%=colorsAttached[j%instancesColorCount]%>)'>
										
											<span style="margin-left:5px; color: #FFFFFF;"><%=instance.getName()%></span>
											<br/>
											<span style="margin-left:10px; color: #FFFFFF;" >Attach to</span>
											<span style="margin-left:10px; color: #FFFFFF;"><%=volume.getName()%></span>
										</a>
									</li>									
									<%
									j++;
								} 
							}//end inner for
			            }//end outer if
						else { 
							%>
							<div class="list_carousel_inst" style="margin-left:200px; margin-top:0px">
							<ul id="<%="inst_ul_"+lv_i%>" >
							<%
							System.out.println("not free");
					       	VolumeAttachment va	 = Iterables.getLast(volume.getAttachments());
							Instance attached_instance= lvinstancesMap.get(va.getServerId());
							String instance_name=attached_instance.getName();
						%>
							<li class="hoverSelection" volumeid="<%=volumeId%>" instanceid="<%=attached_instance.getId()%>"  
									 onclick="detachVolume(this);" id="<%="volume_to_use" + lv_i%>"
									 style="background: rgb(204, 51, 51);">
								<a href='#'>
									<span style="align: center;  color: #FFFFFF;"><%=attached_instance.getName()%></span> <br/>
									<span style=" color: #FFFFFF;" >Dettach <%=volumeId%></span>
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
			<td style="width: 30px"> &nbsp; </td>
			<td style="width: 100px;">
				<a id="<%="next"+lv_i%>" class="next" href="#"><img src="images/arrowRight.png" /></a>
			</td>
			</tr>
			</table>
			</fieldset>
					</div>
						<%
						lv_i++;
						
					}//end outer for%>			
</div>
</div>
