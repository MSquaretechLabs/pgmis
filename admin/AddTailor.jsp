<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
<jsp:setProperty name="upBean" property="overwrite" value="true" />
</jsp:useBean>
<html>
<head>
<jsp:useBean id="mast" scope="request" class="administration.POMaster"></jsp:useBean>
<jsp:setProperty name="mast" property="*"/>
<jsp:setProperty name="upBean" property="folderstore" value="/usr/local/tomcat/webapps/www.pushkarganesh.com/pgmis/images/tailors"/>
<script language="javascript" type="text/javascript" src="/pgmis/misc/calendar_us.js"></script>
<script type="text/javascript" language="JavaScript1.2" src="/pgmis/misc/date_format.js"></script>
<script language="javascript" type="text/javascript" src="/pgmis/misc/datetimepicker.js"></script>
<title>Administration:Pushkar Ganesh Cotton Club Export Pvt. Ltd.</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="css/lines.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!----webfonts--->

<!---//webfonts--->  
<!-- Nav CSS -->
<link href="css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<!-- Graph JavaScript -->
<script src="js/d3.v3.js"></script>
<script src="js/rickshaw.js"></script>
</head>
<script language="JavaScript1.2">

function submitClick(){

if(validateForm()){ 
    document.POMaster.submit(); 
    }
  }  

function validateForm(){

 if(validateFormFields())
 {  if(document.POMaster.display.value != "display"){
   var check = confirm("Do you want to Save?")
   if(check){
   document.POMaster.display.value="save";
   return true; 
   }
   else return false;
   }
   return true;
 } 
 return false;
}   


function validateFormFields()
{

 if(document.POMaster.display.value != "display")
 {
   var reason = "";
  
   if(document.POMaster.name.value=="0")
   {
   reason+="Please Enter Tailor Name .\n";
   }else if(document.POMaster.location.value=="")
   {
   reason+="Please Enter Location.\n";
   }else if(document.POMaster.accountNo.value=="")
   {
   reason+="Please Enter  Account No\n";
   }else if(document.POMaster.registration.value=="")
   {
   reason+="Please Enter  Registration No\n";
   }else if(document.POMaster.fImage.value=="")
   {
   reason+="Please Select  Photo (less than 10 KB)\n";
   }
   if (reason != "") {
    alert("Some fields need correction:\n" + reason);
    return false;
  }
 
}
return true;
}

  function showData()
  {
  document.POMaster.display.value = "display";
  document.POMaster.submit();
  }
</script>

<body>
<%
Connection con = null;
Statement st =null,st2=null;
ResultSet rs=null,rs2=null;
con = new DBConnLT().getConn(); 
String message="";
try
{   
     
 st= con.createStatement();
 st2= con.createStatement();
 String uploadFileName="";
 String display=request.getParameter("display"); if(display==null)display="";
 
 if (MultipartFormDataRequest.isMultipartFormData(request))
      {
      // out.println(" in save");
       MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
      
       
         String accountNo=mrequest.getParameter("accountNo"); if(accountNo==null)accountNo="";
         String registration=mrequest.getParameter("registration"); if(registration==null)registration="";
         String location=mrequest.getParameter("location"); if(location==null)location="";
         String address=mrequest.getParameter("address"); if(address==null)address="";
         String phone=mrequest.getParameter("phone"); if(phone==null)phone="";
         
         String name=mrequest.getParameter("name"); if(name==null)name="";
     
         display=mrequest.getParameter("display"); if(display==null)display="";
         
         
         
           if(display.equalsIgnoreCase("save"))
           {
           
             String fImage="",imagePath="/pgmis/images/tailors/";
             String todo = null;
             
              String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_tailor_master";
                 //out.println(maxIdSql);
                 rs= st.executeQuery(maxIdSql);
                 int maxId=1;
                 if(rs.next())
                 {
                 maxId= rs.getInt("MAX_ID");
                 }else maxId=1;
                     
                 if(maxId==0)maxId=1; 
                 
                Hashtable files = mrequest.getFiles();
                int cnt=0;
                String fieldName="";
                
		if ((files != null) && (!files.isEmpty()) )
		{
		  
                    UploadFile file1 = (UploadFile) files.get("fImage");
                    String uploadFileTemp1="";
                    
                    try{
                    uploadFileTemp1=file1.getFileName();
                    }catch(Exception r){}
                    
                  
                
                   
                
                    
                   try{    
		   if (uploadFileTemp1 != null){
                   //out.println("reacdh inside"+uploadFileTemp1);
                        uploadFileTemp1 = maxId+"_tailor_"+uploadFileTemp1;
                        file1.setFileName(uploadFileTemp1);  
                        
		        upBean.store(mrequest, "fImage");
                        uploadFileName= file1.getFileName(); 
                        fImage=uploadFileName;
                      
                    }else {
                    fImage="";
                    }
                    }catch(Exception r){
                    fImage="";
                    }
                    
                  
                    
                    
                  //out.println("fImage-"+fImage);
                  //out.println("bImage-"+bImage);
		    
		}
                 
                 
                  String sqlInsert="INSERT INTO t_tailor_master(ID,NAME,ADDRESS,ACC_NO,REG_NO,PHONE,LOCATION,IMAGE, IMAGE_PATH) VALUES "+
                     " ("+maxId+",'"+name+"','"+address+"','"+accountNo+"','"+registration+"','"+phone+"','"+location+"','"+fImage+"', '"+imagePath+"')"; 
                    // out.println(sqlInsert);
                     //poNo= maxId+1000;
                     int x=st.executeUpdate(sqlInsert);
                     message= "New Tailor- Group has been created successfully.";
                                 
                 
           
           }
      
      
    }  

 
 
%>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            
               <%@ include file="AdminHeader.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
        <div class="graphs">
     	
      <div class="col_1">
		   <div class="col-md-12 span_6">
                 <div class="panel-heading">
                    <h4 class="panel-title">Add New Tailor Group</h4>
                </div>
                <%
                if(!message.equalsIgnoreCase(""))
                {%>
                      <div class="alert alert-success" role="alert">
                <strong>Well done!</strong> <%=message%>
               </div>
                <%}
                %>
           		  <div class="bs-example1" data-example-id="contextual-table">
		 <div class="tab-pane active" id="horizontal-form">
                    <form class="form-horizontal" method=post name="POMaster" enctype="multipart/form-data">
                            
                            
                            
                            
                           <div class="form-group">
                            <input type="HIDDEN" name="display" value=""></input>
                                    <label for="focusedinput" class="col-sm-2 control-label">Name of Tailor Group</label>
                                    <div class="col-sm-6">
                                            <input type="text" class="form-control1" name= "name" id="name" placeholder="Tailor Group Name">
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new customer name!</p>-->
                                    </div>
                                    
                                    
                            </div>
                            
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Location</label>
                                    <div class="col-sm-8">
                                            <input type="text" class="form-control1" name="location" id="location" placeholder="Pushkar/ Jaipur">
                                    </div>
                            </div>
                              <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Address</label>
                                    <div class="col-sm-8">
                                            <input type="text" class="form-control1" name="address" id="address" placeholder="Address">
                                    </div>
                            </div>
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Registration No</label>
                                    <div class="col-sm-6">
                                            <input type="text" class="form-control1" name="registration" id="registration" placeholder="Registration No">
                                    </div>
                            </div>
                             <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Account No</label>
                                    <div class="col-sm-6">
                                            <input type="text" class="form-control1" name="accountNo" id="accountNo" placeholder="Account No">
                                    </div>
                            </div>
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Mobile No.</label>
                                    <div class="col-sm-8">
                                            <input type="text" class="form-control1" name="phone" id="phone" placeholder="Mobile No.">
                                    </div>
                            </div>
                         
			    
                          
                           <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Photo</label>
                                    <div class="col-sm-6">
                                             <input type="file" name="fImage" id="fImage">
                                    </div>
                            </div>
                            
                          
                            <div class="but_list" align=center>
                           
                                 <p>        
                                 <button type="button" class="btn btn_5 btn-lg btn-warning warning_11" onclick="javascript:submitClick()" >Save</button> 
                                 </p>
                            </div>
                            
                   
                   </form>
                   </div>
                   
		   </div>
                   
                   
	   </div>
            <div class="clearfix"> </div>
	  </div>
         
	  <div class="span_11">
		<div class="col-md-6 col_4">
		
			<link rel="stylesheet" href="css/clndr.css" type="text/css" />
			<script src="js/underscore-min.js" type="text/javascript"></script>
			<script src= "js/moment-2.2.1.js" type="text/javascript"></script>
			<script src="js/clndr.js" type="text/javascript"></script>
			<script src="js/site.js" type="text/javascript"></script>
			<!----End Calender -------->
		</div>
		<div class="col-md-6 col_5">
		  
	      <!-- map -->
<link href="css/jqvmap.css" rel='stylesheet' type='text/css' />
<script src="js/jquery.vmap.js"></script>
<script src="js/jquery.vmap.sampledata.js" type="text/javascript"></script>
<script src="js/jquery.vmap.world.js" type="text/javascript"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery('#vmap').vectorMap({
		    map: 'world_en',
		    backgroundColor: '#333333',
		    color: '#ffffff',
		    hoverOpacity: 0.7,
		    selectedColor: '#666666',
		    enableZoom: true,
		    showTooltip: true,
		    values: sample_data,
		    scaleColors: ['#C8EEFF', '#006491'],
		    normalizeFunction: 'polynomial'
		});
	});
</script>
<!-- //map -->
       </div>
       <div class="clearfix"> </div>
    </div>
   
    
		<div class="copy">
            <p>Copyright &copy; 2015 Modern. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
	    </div>
		</div>
       </div>
      <!-- /#page-wrapper -->
   </div>
    <!-- /#wrapper -->
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
<%
                if(con != null) con.close();
		if(st!=null) st.close();
		if(rs!=null) rs.close();
                if(st2!=null) st2.close();
		if(rs2!=null) rs2.close();
   }
	catch( Exception er )
	{
           //esponse.sendRedirect("/cms/security/AuthenticationFailure.jsp");
           out.println("in error"+er.getMessage());
            
            %>
            <script>
                 var error = "<%= er.getMessage() %>";
                 if(!error ==""){
                 alert(error);
                 
                }
               </script>
               <%
 	}
        
	finally
	{
		try
		{
		if(con != null) con.close();
		if(st!=null) st.close();
		if(rs!=null) rs.close();
                if(st2!=null) st2.close();
		if(rs2!=null) rs2.close();

		}
                catch(SQLException sqle)
                {
                  
                }

	}
%>
<script>
     var dis = "<%= message %>";
     if(!dis ==""){
     alert(dis);
     
    }
   </script