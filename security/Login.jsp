<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%
String moduleID= request.getParameter("moduleID");
%>
<!DOCTYPE HTML>
<html>
<head>
<title>PGMMIS</title>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<!--Google Fonts-->
<SCRIPT LANGUAGE="JavaScript">

</script>    
</head>
<body>
<form name="frmLogin" action="/pgmis/security/ProcessLogin.jsp" method="post"> 
<!--header start here-->
	<div class="login">
		 <div class="login-main">
		 		<div class="login-top">
		 			<img src="images/head-img.png" alt=""/>
                                        <h1>PGMIS</span> </h1>
		 			<h1><font size=4>Login to your Account</font></h1>
                                        <input type="hidden" name="moduleID" value="<%=moduleID%>">
		 			<input type="text" name="userID" placeholder="Login ID" required="">
		 			<input type="password" name="password" placeholder="Password" required="">
		 			<div class="login-bottom">
		 			  <div class="login-check">
			 			<label class="checkbox"><input type="checkbox" name="checkbox" checked><i> </i> Remember Me</label>
			 		  </div>
			 		  <div class="login-para">
			 			<p><a href="/pgmis/indexmain.html"> Back to Home Page</a></p>
			 		 </div>
			 			<div class="clear"> </div>
		 			</div>
		 			<input type="submit" value="Login"/>
		 			
		 		</div>
		 	</div>
  </div>
  <div class="copyright">
		 <p>Designed by PGMIS</p>
	</div>
<!--header end here-->
</form>
</body>
</html>