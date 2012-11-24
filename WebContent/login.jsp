<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet"
	href="css/home.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>LOGIN</title>

		</script>
		<script type="text/javascript" src="js/NewLogin.js" />
		<script type="text/javascript" src="js/tiles.js" />
		</script>
<link rel="stylesheet" href="css/NewLogin.css" type="text/css">
<link rel="stylesheet" href="css/tiles.css" type="text/css">

</head>

<body> 
<div id="headerWrapper">
		<div id="header">
			<div id="headerTitles">
				<h1 >
					<a href="#!">Graphical Dashboard for iaaS</a>
				</h1>
			</div>
		</div>
	</div>


<a class="tile group0 " style="margin-top: 45px; margin-left: 30px; width: 300px; height: 145px; background: none repeat scroll 0% 0% rgb(59, 101, 156); display: inline;" href="#!/About">
<img width="45/" height="45" src="img/icons/box_info.png" style="float:left; margin-top:2px;margin-left:5px;">
<div class="tileTitle" "></div>
<div class="tileDesc" style="margin-left:56px;text-align:center;font-size:25px;padding-top:45px">OPENSTACK</div>
</a>


<a class="tile group0 " style="margin-top: 45px; margin-left: 350px; width: 145px; height: 145px; background: none repeat scroll 0% 0% rgb(204, 51, 51); display: inline;">
<div class="tileTitle" style="margin-left:5px;text-align:center"></div>
<div id="livetile_020" class="livetile" style="text-align:center;font-size:20px;padding-top:15px; margin-left: 10px; opacity: 1; margin-top: 0px;">AMAZON WEB SERVICES</div>
</a>

<a class="tileFlip support3D tile group0" style="margin-top: 200px; margin-left: 50px; width: 145px; height: 145px; display: inline;" href="#!/Typography">
<div class="flipContainer" style="border:1px solid #C33;">

<div class="flipFront">
<img style="width: 145px; height:145px;" src="images/img1.png">
</div>
<div class="flipBack" style="background:#C33;">
<h5 class="white"></h5>
</div>
<div class="tileLabelWrapper bottom">
<div class="tileLabel bottom" style="border-bottom-color:#C33;">iaaS</div>
</div>
</div>
</a>

<a class="tile group0 " style=" margin-top: 200px; margin-left: 225px; width: 300px; height: 145px; background: none repeat scroll 0% 0% rgb(102, 128, 0); display: inline;" href="#!/Features">
<div class="tileTitle" style="text-align:center;font-size:25px;padding-top:35px;">EUCALYPTUS</div>
<div class="tileDesc"> </div>
</a>


<div class="box-warning  hidden" id="error_all_field"> <code>All the fields are mandatory</code></div>
<div class="box-warning  hidden" id="error_username"> <code>Username cannot be empty</code></div>
<div class="box-warning  hidden" id="error_password"> <code>Password cannot be empty</code></div>
<div class="box-warning  hidden" id="error"> <code>Tenant-name cannot be empty</code></div>

<div class="pageContent" style="margin-left:650px;
    margin-right:150px; margin-top:70px">
	<form action="./login" method="post">

<fieldset class="login-fieldset">


<dl class="separator">
							<dt>Username</dt>
								<dd><input name="username" type="text" ></dd>
							<dt>Password</dt>
								<dd><input name="password" type="password" ></dd>
							<dt>Tenant Name</dt>
								<dd><input name="tenant" type="text" ></dd>
								
							<dt>Choose Provider</dt>
								<dd>
								<select name="cloud_provider">
								<option>OpenStack</option>
<option>AWS</option></select></dd>
	<br/>							
</dl>

<center><input type="submit" name="login_button" style="background-color: #426EA0; color: white !important;" onclick='return validate(this.form);' value="Sign in"/>
</center>

</fieldset>

</form>


</div>
</body>
</html>