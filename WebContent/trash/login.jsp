<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="css/login_style.css" type="text/css">
<script type="text/javascript"
	src="js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Graphical Dashboard for IAAS</title>
</head>
<body class="body">
	<div class="toplabel">
		<label>Graphical Dashboard for IaaS</label>
	</div class="center">
	<div>
		<form action="./login" method="post">
			<div class="grid16">
				<table>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="left"><label>Username</label></td>
						<td><input type="text" name="username"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><label>Password</label>
						</td>
						<td><input type="text" name="password"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><label>Tenant Name</label>
						</td>
						<td><input type="text" name="tenant">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><label>Choose Provider</label>
						</td>
						<td class="checklabel"><select class="custom-select"
							name="cloud_provider">
								<option class="taboption" value="openstack">Openstack</option>
								<option class="taboption" value="openstack">AWS</option>
						</select></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan=2 class="center" class="tabbutton"><input
							type="image" src="images/login_button.png"
							name="login_button" width="100" height="30"
							onclick='return validate(this.form)'>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>
