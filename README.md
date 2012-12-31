iIaaS
=====

A smarter interface for managing IaaS. 

This project has been developed to have a common web interface to manage instances and volumes across multiple cloud providers. This interface is mainly designed for the mobile devices like tablets, iphone and smart phones. 

The following are the details as to how to use this project:

Tools and Technologies:
  Apache Tomcat 6
  Java 6
  Javascript
  Ajax
  HTML5 
  CSS
  Servlets
  Eclipse IDE

Libraries
  Jclouds – This is the third party library that allows us to connect different cloud providers with a single api call. The code can be found at https://github.com/jclouds/jclouds. Follow the instructions in this guide to download and install jclouds http://www.jclouds.org/documentation/userguide/installation-guide/. In case of any problems following the installation guide, please run the script found at https://gist.github.com/3360972

Directory Structure:
  After downloading the jclouds jars, place them in the folder IAAS/WebContent/WEB-INF/lib. 
Now the complete IAAS can be imported as an Dynamic Web project in Eclipse IDE and run using Apache Tomcat 6. The project would run on the url http://localhost:8080/IAAS/login.jsp. 

Work done so far
	The website developed is completely functional for the features Instance Management (create, terminate, suspend and resume an instance) and Volume Management (create,attach, detach, delete a volume) on Openstack.

Details of Source Code:

JSPs :
  login.jsp – This is the login page displayed on visiting the website.
  home.jsp - This is the home page that is displayed on authentication.
  listinstances.jsp - This is the page that lists the instances available on the authenticated user's account. It also gives options of suspend, resume and terminate instance.
  CI.jsp - This page provides the interface to create a new instance.
  lv.jsp - This page displays the list of volumes created by the user. It also provides options to attach or detach a volume.
  cv.jsp - This page provides an interface to create a volume.
  dv.jsp - This page lists the instances and allows the user to delete a volume.

Java packages:
  com.dashboard.openstack.utils – contains the api for accessing openstack.
  com.dashboard.resources – contains the internal data structures used to represent a instance in the project.
  com.dashboard.servlets – contains the servlets that service the incoming requests from the web pages.
  com.dashboard.utils – contains the utilities.

Javascripts :
  CI.js – Used by CI.jsp.
  cv.js – Used by cv.jsp
  dv.js – Used by dv.jsp
  home.js  - Used by home.jsp
  listIN.js – Used by listinstances.jsp
  login.js – Used by login.jsp
  lv.js – Used by lv.jsp
  menu.js – Used for the title bar.
  tiles.js – Used by the tiles styling.

CSS :
  CI.css – Used for the styling of CI.jsp page.
  cv.css  - Used for the styling of cv.jsp page.
  dv.css  - Used for the styling of dv.jsp page.
  home.css  - Used for the styling of home.jsp page.
  listIN.css  - Used for the styling of listinstances.jsp page.
  login_style.css  - Used for the styling of login.jsp page.
  menu.css  - Used for the styling of title bar.
  NewLogin.css  - Used for the styling of login.jsp page.
  new_lv.css  - Used for the styling of lv.jsp page.
  tiles.css - Used for the styling of tiles theme used.

WebContent/plugin : This folder contains the third-party plugins used for the scroller in this project.

Future Work
	Network Management for OpenStack should be done. And the similar functionalities for AWS, etc can be implemented.

References
  http://www.jclouds.org/documentation/index
  https://github.com/jclouds/jclouds
  http://www.jclouds.org/documentation/userguide/installation-guide/
  https://gist.github.com/3360972
  http://blog.phymata.com/2012/08/15/getting-started-with-jclouds/
