<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Home:Pushkar Ganesh Cotton Club Export Pvt. Ltd.</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Edification Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<!--//fonts-->
</head>
<jsp:useBean id="mast" scope="request" class="administration.Contact"></jsp:useBean>
<jsp:setProperty name="mast" property="*" />
<script>

function validateForm()
 {
   
   var check = confirm("Do you want to Send Query?")
   if(check)
   {
    document.upform.display.value = "save";
    document.upform.submit();
   }
    else return false;
   }
</script>

<%
    String display = request.getParameter("display");
    
  try
    {
      String userName="",mailId="",sub="",desc="",qry="",sql="";  
      //out.println("value of display "+display);
      
      if (display.equals("save"))
      {
      mast.insertMessage();
      String message= mast.returnMessage();
      
      
      
      //out.println("after message "+message);
      %>
       <script>
                        alert("<%=message%>");
                        
      </script>
      <%
      }
    }
      catch (Exception e)
  {
    e.printStackTrace();
  }
%>

<!--header-->
<form autocomplete="off"  method=post action="contact.jsp"  name="upform" >
<div class="header">
			<div class="container">
			<div class="header-top">
			<input type="HIDDEN" name="display" value="">	
				<div class="logo">
					<h1><a href="index.html"><span>P</span>ushkar Ganesh Cotton Club Export Pvt. Ltd.</a></h1>
                                        
                                        
				<p><h3><font color=white>Manufacturer and Exporter of  Garments & Accessories</a></h3></p>
				</div>
				
				<div class="clearfix"> </div>
		</div>
			
			
				<div class="top-nav">
					<span class="menu"><img src="images/menu.png" alt=" "/> </span>
					<ul>
						<li ><a href="index.html">Home </a></li>
						<li><a href="about.html" >About</a></li>
						<li><a href="services.html" >Services</a></li>
						<li><a href="gallery.html" >Gallery</a></li>
						<li class="active"><a href="contact.jsp" >Contact</a></li>	
					<div class="clearfix"> </div>
					</ul>	
				<script>
					$("span.menu").click(function(){
						$(".top-nav ul").slideToggle(500, function(){
						});
					});
				</script>
					
						
			</div>
		</div>
		</div>
<!--end-banner-->	
<!--content--->

<div class="container">
	
<div class="contact">
	 <div class="contact-md">
			 <h3>Get in Touch</h3>
			 <h4>Thank you for your interest in our services. Please provide the following information about your query to help us serve you better.</h4>
                         <p><font color=black><b>Contact:<br><p><font color=black>Pushkar Ganesh Cotton Club Exp Pvt Ltd</p>
					<font color=black>Opposite Tehsil, New Bus Stand, Pushkar, Rajasthan 305022<br> Phone: 0091-145-2772661<b</p>
                                       <br>Mangilal Choudhary (Director) : + 91-9414667265 ,<br>Vijendra Choudhary : +91-9929795847,  Kishan Choudhary : +91-9636566939, Vishram Choudhary: +91-9680153585</b></p>		
		        <p> <font color=black>Email:<b><a href="mailto:infopushkarganesh2013@gmail.com">infopushkarganesh2013@gmail.com</a>, <a href="mailto:mlchoudhary@yahoo.com">mlchoudhary@yahoo.com</a>
                         
                 </div>
				<div class="col-md-6 contact-top">
					<h3></h3>
						<div>
							<span><font color=black>Your Name </span>		
							<input type="text" name="name" value="" >						
						</div>
						<div>
							<span><font color=black>Your Email </span>		
							<input type="text" name="mailId" value="" >						
						</div>
						<div>
							<span><font color=black>Subject</span>		
							<input type="text" name="sub" value="" >	
						</div>
						<div>
							<span><font color=black>Your Message</span>		
							<textarea name ="desc"> </textarea>	
						</div>
						<input type="submit" value="SEND" onclick="javascript:validateForm()">	
				</div>
				<div class="col-md-6 contact-top">
					<h3><font color=black>Address</h3>
					
					  		
					<div class="map">
						<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14283.875263453407!2d74.5609206!3d26.4889489!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x578afe201c97db7a!2sPushkar+Ganesh+Cotton+Club+Exp+Pvt+Ltd!5e0!3m2!1sen!2sin!4v1449169178779" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
					</div>
				</div>
			<div class="clearfix"> </div>
			</div>

	</div>

<!--content--->
	<!--footer-->
	<div class=" footer">
	<div class="footer-grid">
				<div class="container">
					<div class="footer-top">
					<h3>Follow Us</h3>
					<ul class="social">
						<li><a href="#"><i> </i></a></li>						
						<li><a href="#"><i class="twitter"> </i></a></li>
						<li><a href="#"><i class="rss"> </i></a></li>
						<li><a href="#"><i class="gmail"> </i></a></li>
						
					</ul>
					<div class="clearfix"> </div>
				</div>
				</div>
			</div>
			<div class="footer-bottom">
				<div class="container">
			<div class="footer-top-at">
				<div class="col-md-4 amet-sed">
				<h4>Navigation</h4>
				<ul class="nav-bottom">
							<li ><a href="index.html">Home </a></li>
						<li><a href="about.html" >About</a></li>
						<li><a href="services.html" >Services</a></li>
						<li><a href="gallery.html" >Gallery</a></li>
						<li><a href="contact.jsp" >Contact</a></li>	
					</ul>	
				</div>
				<div class="col-md-4 amet-sed ">
				<h4>Get In Touch</h4>
				<i class="line"> </i>
					<ul class="nav-bottom">
						<li><a href="contact.html">Contact Us</a> </li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Terms &amp; Conditions </a></li>					
					</ul>
					<p>Email: <a href="mailto:infopushkarganesh2013@gmail.com">infopushkarganesh2013@gmail.com</a></p>
				</div>
				<div class="col-md-4 amet-sed">
					<h4>Newsletter</h4>
					
						<input type="text" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
						<input type="button" value="SUBSCRIBE">
					
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		</div>
		<div class="class-footer">
					 <p > Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
			 	</div>
	</div>
        
</body>
</form>
</html>
	
	