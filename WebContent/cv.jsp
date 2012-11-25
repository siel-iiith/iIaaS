<!-- <html> -->
<head>
	<link href="css/cv.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" async="" src="js/ga.js"></script>
    <script src="js/jquery-1.8.2.min.js" language="javascript" type="text/javascript"></script> 
    <script type="text/javascript">window.jQuery || document.write('&lt;script type="text/javascript" src="js/inc/jquery182.js"&gt;&lt;\/script&gt;')</script>
    <script type="text/javascript" src="js/cv.js"></script>
</head>
<!-- <body> -->
<div id="create_volume_page" class="pageContent" style="margin-left: 400px;">
<div class="box-warning hidden" id="cv_error_form" style= "width: 250px; margin-left: 100px"> <code>Please enter all the fields!</code></div>
<div class="box-warning hidden" id="cv_error_size" style= "width: 250px; margin-left: 100px"> <code>Please enter a number in size!</code></div>
<div class="box-download hidden" id="cv_success" style= "width: 250px; margin-left: 100px"> <code>Volume created Sucessfully!</code></div>
<div class="box-warning hidden" id="cv_error" style= "width: 250px; margin-left: 100px"> <code>Unable to create Volume!</code></div>
<fieldset style= "width: 500px;">
<legend class="cv-legend">Create Volume</legend>
<table>
<tr>
<td> <label for="cv-volume-name">Volume Name:</label> </td>
<td> <input type="text"  id="cv-volume-name"> </td>
</tr>
<tr>
<td> <label for="cv-size">Volume Size (in GB):</label> </td>
<td> <input type="text"  id="cv-size"> </td>
</tr>
</table>
<!-- <label for="f4">Select:</label>
<select id="f4">
	<option>One</option>
	<option>Two</option>
</select><br><br>
 -->
</fieldset>
<button class="greenButton" id="cv_create_button" style="margin-left: 450px" onclick="cv_create();">Create</button>
</div>
<!-- </body>
</html> -->