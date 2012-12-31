iIaaS
=====

A smarter interface for managing IaaS. <br>

This project has been developed to have a common web interface to manage instances and volumes across multiple cloud providers. This interface is mainly designed for the mobile devices like tablets, iphone and smart phones. <br>

<b>The following are the details as to how to use this project: </b> <br>

Tools and Technologies: 
<ul>
  <li>Apache Tomcat 6 </li>
  <li>Java 6 </li>
  <li>Javascript </li>
  <li>Ajax </li>
  <li>HTML5 </li>
  <li>CSS </li>
  <li>Servlets </li>
  <li>Eclipse IDE </li>
</ul>

Libraries <br>
  Jclouds – This is the third party library that allows us to connect different cloud providers with a single api call. The code can be found at https://github.com/jclouds/jclouds. Follow the instructions in this guide to download and install jclouds http://www.jclouds.org/documentation/userguide/installation-guide/. In case of any problems following the installation guide, please run the script found at https://gist.github.com/3360972
<br><br>
Directory Structure: <br>
  After downloading the jclouds jars, place them in the folder IAAS/WebContent/WEB-INF/lib. 
Now the complete IAAS can be imported as an Dynamic Web project in Eclipse IDE and run using Apache Tomcat 6. The project would run on the url http://localhost:8080/IAAS/login.jsp. <br>
<br>

<b> Work done so far </b> : <br>
	The website developed is completely functional for the features Instance Management (create, terminate, suspend and resume an instance) and Volume Management (create,attach, detach, delete a volume) on Openstack.
<br><br>
<b>
Details of Source Code:
</b>
<br>
JSPs : <br>
<ul>
  <li>login.jsp – This is the login page displayed on visiting the website.</li>
  <li>home.jsp - This is the home page that is displayed on authentication.</li>
  <li>listinstances.jsp - This is the page that lists the instances available on the authenticated user's account. It also gives options of suspend, resume and terminate instance.</li>
  <li>CI.jsp - This page provides the interface to create a new instance.</li>
  <li>lv.jsp - This page displays the list of volumes created by the user. It also provides options to attach or detach a volume.</li>
  <li>cv.jsp - This page provides an interface to create a volume. </li>
  <li>dv.jsp - This page lists the instances and allows the user to delete a volume. </li>
</ul>

Java packages:
  <ul><li>com.dashboard.openstack.utils – contains the api for accessing openstack.</li>
  <li>com.dashboard.resources – contains the internal data structures used to represent a instance in the project.</li>
  <li>com.dashboard.servlets – contains the servlets that service the incoming requests from the web pages.</li>
  <li>com.dashboard.utils – contains the utilities.</li></ul>

Javascripts :
  <ul><li>CI.js – Used by CI.jsp.</li>
  <li>cv.js – Used by cv.jsp</li>
  <li>dv.js – Used by dv.jsp</li>
  <li>home.js  - Used by home.jsp</li>
  <li>listIN.js – Used by listinstances.jsp</li>
  <li>login.js – Used by login.jsp</li>
  <li>lv.js – Used by lv.jsp</li>
  <li>menu.js – Used for the title bar.</li>
  <li>tiles.js – Used by the tiles styling.</li></ul>

CSS :
  <ul><li>CI.css – Used for the styling of CI.jsp page.</li>
  <li>cv.css  - Used for the styling of cv.jsp page.</li>
  <li>dv.css  - Used for the styling of dv.jsp page.</li>
  <li>home.css  - Used for the styling of home.jsp page.</li>
  <li>listIN.css  - Used for the styling of listinstances.jsp page.</li>
  <li>login_style.css  - Used for the styling of login.jsp page.</li>
  <li>menu.css  - Used for the styling of title bar.</li>
  <li>NewLogin.css  - Used for the styling of login.jsp page.</li>
  <li>new_lv.css  - Used for the styling of lv.jsp page.</li>
  <li>tiles.css - Used for the styling of tiles theme used.</li></ul>

WebContent/plugin : This folder contains the third-party plugins used for the scroller in this project.
<br> <br>
<b>
Future Work :
</b> <br>
	Network Management for OpenStack should be done. And the similar functionalities for AWS, etc can be implemented.

<br>
<b>
References
</b> <br>
<ul>
  <li>http://www.jclouds.org/documentation/index</li>
  <li>https://github.com/jclouds/jclouds</li>
  <li>http://www.jclouds.org/documentation/userguide/installation-guide/</li>
  <li>https://gist.github.com/3360972</li>
  <li>http://blog.phymata.com/2012/08/15/getting-started-with-jclouds/</li>
</ul>
