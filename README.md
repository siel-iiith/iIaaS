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
Future Work :
</b> <br>
	Network Management for OpenStack should be done. And the similar functionalities for AWS, etc can be implemented.

<br>
<b>
References
</b> <br>
<ul>
  <li>https://github.com/jclouds/jclouds</li>
  <li>http://www.jclouds.org/documentation/userguide/installation-guide/</li>
  <li>https://gist.github.com/3360972</li>
</ul>
