<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="lib.util.BaseBean" %>
<%@ page import="lib.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<jsp:useBean id="auth" scope="session" class="lib.util.Authenticate"></jsp:useBean>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Home:- MSME Energy Saving Project(Phase - III ongoing)</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

    <!-- CSS FILES -->
    <link rel="stylesheet" href="/jica/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/jica/css/style.css">
    <link rel="stylesheet" type="text/css" href="/jica/css/style.css" media="screen" data-name="skins">
    <link rel="stylesheet" href="/jica/css/layout/wide.css" data-name="layout">
    
    
    <link rel="stylesheet" type="text/css" href="/jica/css/switcher.css" media="screen" />
       <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<%
Statement st =null;
ResultSet rs=null;
Statement st1 =null;
ResultSet rs1=null;
String userName="";
String qry1="",qry2="";
CallableStatement cstmt = null;
String userId = auth.getUserId();

	Connection conn = null;
   try {
   
      userName=auth.getUsername();
      String display = request.getParameter("display");
      if(display== null) display = "";
       String newPassword = request.getParameter("newPassword");
      if(newPassword== null) newPassword = "";
        String businessUnit = auth.getBusinessUnit();
        String fullName = auth.getFullName();
   
    conn = new DBConnLT().getConn();
      st1=conn.createStatement(); 
      qry1="SELECT * FROM g_user WHERE ID='"+userId+"'";
     //out.println(qry1);
      rs1=st1.executeQuery(qry1);
      rs1.next();  
     String  oldPassword1 = rs1.getString("PASSWORD");
try
   {
    
   if(display.equals("display"))
      {
         
      String sql= "UPDATE g_user SET PASSWORD = '"+newPassword+"' WHERE ID='"+userId+"'";   
      st1.executeQuery(sql);
      %><script>
       var check = confirm("Your password has been changed")
           if(check) {
          window.location.href="/jica/Home.jsp";
          }
      </script>
      
       <%}
       
      
  }catch (Exception e)
  {
    //e.printStackTrace();
  } 
                  
      %>

<td align="center" width="90%" valign="top">
<title>JICA:: CHANGE USER PASSWORD</title>

<script>
function validateForm(){

if(document.ChangePassword.oldpassword.value=="")
   {
  alert("Please Enter old password .\n");
  return false;
   }
 if(window.document.all("newPassword").value=="")
		 {
			alert("Pl enter New password.");
			window.document.all("newPassword").focus();
			return false;
		 }      
  if(window.document.all("confirmPassword").value=="")
		 {
			alert("Pl confirm password.");
			window.document.all("confirmPassword").focus();
			return false;
		 }
            
  if(window.document.all("oldpassword1").value != window.document.all("oldpassword").value)
		 {
			alert("Old password entered is incorrect.  Please enter again.");
			window.document.all("oldpassword").focus();
			return false;
		 }
		 
        if(window.document.all("confirmPassword").value=="")
		 {
			alert("Pl Confirm password.");
			window.document.all("confirmPassword").focus();
			return false;
		 }
 if(window.document.all("newPassword").value != window.document.all("confirmPassword").value)
		 {
			alert("Pl confirm password again.");
			window.document.all("confirmPassword").focus();
			return false;
		 }
 
document.ChangePassword.display.value="display";
document.ChangePassword.submit();


}
</script>
<form method="post" name = "ChangePassword" action = "ChangePassword.jsp">
	<!--Start Header-->
       <%@ include file="/security/UserHeader.jsp" %>
	<!--End Header-->
	
	<!--start wrapper-->
	<section class="wrapper">
        <section class="page_head" data-href="/jica/images/page_header.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="page_title">
                            <h2>Change Password</h2>
                            <span class="sub_heading"></span>
                        </div>
                        <nav id="breadcrumbs">
                            <ul>
                                <li>You are here:</li>
                                <li><a href="index.html">Home- Change Password</a></li>
                               
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <section class="content right_sidebar">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
						<div class="blog_large">
                                                <article class="post">
<P> The password can be modified once a particular user is authenticated. Enter the details of the old password, desired new password and retype the new password in the box against Confirm password and press <b>Save</b>.<br>
It is recommended that you use a password that you can easily remember.The details will be saved in the system and a confirmation message will be displayed on the screen: <b>Password Changed Successfully</b>.On click of the Ok button the user will be navigated to the Home page.  
</b><br></td>
</tr>
<tr><td colspan="2"><input type="HIDDEN" name="display" value=""></input></td></tr>

</table><table align="center" class="table table-striped table-hover">

<TR>
  <TD align="right"> <b>User ID.:</TD><td><%=userName%></td>
 </TR>
<TR>
  <TD align="right"><b>Old Password:</TD>
  <TD>
  <INPUT type=hidden name="oldpassword1"  value=<%=oldPassword1%>>
  <INPUT type="PASSWORD" name="oldpassword" size="20" value=""/> 
    </td>
</TR>
<TR>
  <TD align="right"><b> New Password:</TD>
  <TD><INPUT type="PASSWORD" name="newPassword" size="20" value=""/> 
    </td>
</TR>
<TR>
  <TD align="right"><b>Confirm Password:</TD>
  <TD><INPUT type="PASSWORD" name="confirmPassword" size="20" value=""/> 
    </td>
</TR>
</table>

  <div class="row" align=center><br>
                                <div class="col-md-12">
                                    <input type="reset" data-loading-text="Loading..." class="btn btn-default btn-lg" value="Save" onclick="javascript:validateForm()">
                               
                                                                
                                    <input type="reset" data-loading-text="Loading..." class="btn btn-default btn-lg"  value="Back"  onClick="document.location.href='/jica/Logout.jsp'">
                                </div>
                            </div>
	</article>
						</div>
					</div>
</div>

</section>
</section>
 <%@ include file="/security/Footer.jsp" %> 
 
 <%

			if(conn != null) conn.close();
			if(st!=null) st.close();
			if(rs != null) rs.close();
			if(st1!=null) st1.close();
			if(rs1 != null) rs1.close();
			if(cstmt != null) cstmt.close();

	}catch( Exception er )
	{
		out.println("Exception::"+er.getMessage());
	}finally{
		try{
			if(conn != null) conn.close();
			if(st!=null) st.close();
			if(rs != null) rs.close();
			if(st1!=null) st1.close();
			if(rs1 != null) rs1.close();
			if(cstmt != null) cstmt.close();
		   }catch(SQLException sqle){}
		}
%>



    <script type="text/javascript" src="/jica/js/jquery-1.10.2.min.js"></script>
    <script src="/jica/js/bootstrap.min.js"></script>
    <script src="/jica/js/jquery.easing.1.3.js"></script>
    <script src="/jica/s/retina-1.1.0.min.js"></script>
    <script type="text/javascript" src="/jica/js/jquery.cookie.js"></script> <!-- jQuery cookie -->
    <script type="text/javascript" src="/jica/js/styleswitch.js"></script> <!-- Style Colors Switcher -->
    <script type="text/javascript" src="/jica/js/jquery.smartmenus.min.js"></script>
    <script type="text/javascript" src="/jica/js/jquery.smartmenus.bootstrap.min.js"></script>
    <script type="text/javascript" src="/jica/js/jquery.jcarousel.js"></script>
    <script type="text/javascript" src="/jica/js/jflickrfeed.js"></script>
    <script type="text/javascript" src="/jica/js/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="js/jquery.isotope.min.js"></script>
    <script type="text/javascript" src="/jica/js/swipe.js"></script>
    <script type="text/javascript" src="/jica/js/jquery.blurr.js"></script>
    <!--<script type="text/javascript" src="/jica/js/jquery-scrolltofixed-min.js"></script>-->

    <script src="/jica/js/main.js"></script>

    <!-- Start Style Switcher -->
    <div class="switcher"></div>
    <!-- End Style Switcher -->
</body>
</html>
