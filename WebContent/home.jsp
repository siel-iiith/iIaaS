<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Description"
	content="Easily create Windows 8 Metro UI-style websites with this free framework and template. Many features like live-tiles, slideshows and content-scrollers." />
<meta name="keywords"
	content="template, windows 8, website, design, download, metro ui, metro template" />
<title>Graphical Dashboard for iaaS</title>
<meta name="viewport" content="width=200, initial-scale=1">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600'
	rel='stylesheet' type='text/css'>
<!-- Include a nice font -->
<link rel="stylesheet" type="text/css" href="css/home.css" />
<link rel="stylesheet" type="text/css" href="css/cv.css" />
<link rel="stylesheet" type="text/css" href="css/CI.css" />
<link rel="stylesheet" type="text/css" href="css/dv.css" />
<link rel="stylesheet" type="text/css" href="css/listIN.css" />

<style type="text/css">
@
-moz-document url-prefix         () { div .h_tileLabel.top {
	top: -5px;
}
}
</style>
<script>
	siteTitle = "Graphical Dashboard for iaaS";
	siteTitleHome = "Instances";
	mobileDevice = "";
	theme = "theme_default";
</script>
<script type="text/javascript" language="javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script type="text/javascript" language="javascript" src="plugin/carousel/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" language="javascript" src="plugin/carousel/jquery.carouFredSel-6.1.0-packed.js"></script>

		<!-- optionally include helper plugins -->
		<script type="text/javascript" language="javascript" src="plugin/carousel/helper-plugins/jquery.mousewheel.min.js"></script>
		<script type="text/javascript" language="javascript" src="plugin/carousel/helper-plugins/jquery.touchSwipe.min.js"></script>
		<script type="text/javascript" language="javascript" src="plugin/carousel/helper-plugins/jquery.ba-throttle-debounce.min.js"></script>
<script type="text/javascript">
	window.jQuery
			|| document
					.write('<script type="text/javascript" src="js/jquery-1.8.2.js"><\/script>')
</script>
 <script type="text/javascript" src="js/home.js">
		</script>
		<script type="text/javascript" src="js/lv.js">
		</script>
		<script type="text/javascript" src="js/CI.js">
		</script> 
		<script type="text/javascript" src="js/dv.js">
		</script>
		<script type="text/javascript" src="js/listIN.js">
		</script>  
		<script type="text/javascript" src="js/cv.js">
		</script>   
</head>
<body>
	<div id="headerWrapper">
		<div id="header">
			<div id="headerTitles">
				<h1>
					<a href="#!">Graphical Dashboard for iaaS</a>
				</h1>
			</div>
			<div id="nav">
				<a id="instances" class="navItem navActive" href="#&instances"
					onclick="highlightFunc(this);"> <img src="images/instances.png" /><br />
					INSTANCES </a> <a id="volumes" class="navItem" href="#&volumes"
					onclick="highlightFunc(this);"> <img src="images/volumes.png" /><br />
					VOLUMES </a> <a id="logout" class="navItem" href="#&logout"
					onclick="logout();"> <img
					src="images/logout.png" "/><br /> LOGOUT </a>
			</div>
		</div>
	</div>
	<div id="instances_div">
		<a id="h_listInstances_link" class="h_tile home_verticalBar selected_tile" onclick="loadLI();">
			<div class="h_tileTitle" style="margin-left: 5px;margin-top:12px;margin-bottom:10px;">View Instances</div> </a>
		<a id="h_createInstances_link" class="h_tile home_verticalBar" style="margin-top: 200px;" onclick="loadCI();">
			<div class="h_tileTitle" style="margin-left: 5px;margin-top:12px;margin-bottom:10px;">Create	Instance</div> </a>
	</div>

	<div id="volumes_div" class="hidden">
		<a id="h_listVolumes_link" class="h_tile home_verticalBar" style="background: rgb(120, 150, 0);" onclick="loadLV();">
		<div class="h_tileTitle" style="margin-left: 5px;margin-top:12px;margin-bottom:10px;">View Volumes</div> </a>
		 <a	id="h_createVolumes_link" class="h_tile home_verticalBar" style="margin-top: 200px; background: rgb(120, 150, 0);" onclick="loadCV();">
			<div class="h_tileTitle" style="margin-left: 5px;margin-top:12px;margin-bottom:10px;">Create Volume</div>
		</a>
		
		<a	id="h_deleteVolumes_link" class="h_tile home_verticalBar" style="margin-top: 340px; background: rgb(120, 150, 0);" onclick="loadDV();">
			<div class="h_tileTitle" style="margin-left: 5px;margin-top:12px;margin-bottom:10px;">Delete Volume</div>
		</a>
	</div>

	<%-- <div id="h_list_instances">
		<%@ include file="listinstances.jsp"%>
	</div> --%>
	<div>
		<div id="loading-lv-image" class="hidden" style="margin-left:600px; margin-top: 20px; margin-bottom: 20px"><img src="images/ajax-loader.gif" /></div>
		<div id="contentDiv">
			<%@ include file="listinstances.jsp"%>
		</div>
	</div>
	
	<%-- <div id="h_create_volumes" class="hidden">
		<%@ include file="cv.jsp"%>
	</div>
	
	<div id="h_create_instances" class="hidden">
		<%@ include file="CI.jsp"%>
	</div>  --%>
	
	<%-- <div id="h_list_volumes" class="hidden">
		<%@ include file="lv.jsp"%>
	</div>  --%>

</body>

</html>