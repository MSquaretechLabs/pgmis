<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
<jsp:setProperty name="upBean" property="overwrite" value="true" />
</jsp:useBean>
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="mast" scope="request" class="administration.POMaster"></jsp:useBean>
<jsp:setProperty name="mast" property="*"/>
<jsp:setProperty name="upBean" property="folderstore" value="/usr/local/tomcat/webapps/www.pushkarganesh.com/pgmis/docs/styles"/>
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


<link href="/pgmis/admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="/pgmis/admin/css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="/pgmis/admin/css/lines.css" rel='stylesheet' type='text/css' />
<link href="/pgmis/admin/css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="/pgmis/admin/js/jquery.min.js"></script>
<!----webfonts--->

<!---//webfonts--->  
<!-- Nav CSS -->
<link href="/pgmis/admin/css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="/pgmis/admin/js/metisMenu.min.js"></script>
<script src="/pgmis/admin/js/custom.js"></script>
<!-- Graph JavaScript -->
<script src="/pgmis/admin/js/d3.v3.js"></script>
<script src="/pgmis/admin/js/rickshaw.js"></script>



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
  
   if(document.POMaster.subProduct.value=="0")
   {
   reason+="Please Select Product Sub Category .\n";
   }else if(document.POMaster.name.value=="")
   {
   reason+="Please Enter Name.\n";
   }else if(document.POMaster.desc.value=="")
   {
   reason+="Please Enter  Description\n";
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
String uploadTypeFile="";
try
{   
     
 st= con.createStatement();
 st2= con.createStatement();
 

uploadTypeFile=request.getParameter("uploadTypeFile");
String documentNameIn = "";
String uploadFileName="";

   
           

//out.println("reached herer");       
if (MultipartFormDataRequest.isMultipartFormData(request))
      {
   //out.println("reached herer2"); 
   
          MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
        
            String name = mrequest.getParameter("name");if(name==null)name="";
            String desc = mrequest.getParameter("desc");if(desc==null)desc="";
            String subProduct = mrequest.getParameter("subProduct");if(subProduct==null)subProduct="";
            String product = mrequest.getParameter("product");if(product==null)product="0";
            String customer = mrequest.getParameter("customer");if(customer==null)customer="0";
            String optMonth = mrequest.getParameter("optMonth");if(optMonth==null)optMonth="";
            String optYear = mrequest.getParameter("optYear");if(optYear==null)optYear="";
            mast.setProduct(product);   
         
         String display=mrequest.getParameter("display"); if(display==null)display="";
         //out.println(display);
         if(display.equalsIgnoreCase("save"))
         {
	 // Uses MultipartFormDataRequest to parse the HTTP request.
        
               
	     String fImage="",bImage="",imagePath="/pgmis/docs/styles/";
             String todo = null;
             
             String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_style_master";
                 //out.println(maxIdSql);
                 rs= st.executeQuery(maxIdSql);
                 int maxId=1;
                 if(rs.next())
                 {
                 maxId= rs.getInt("MAX_ID");
                 }else maxId=1;
                 if(maxId==0)maxId=1;    
	
                  // out.println("reached here 5");
		Hashtable files = mrequest.getFiles();
                int cnt=0;
                String fieldName="";
                
		if ((files != null) && (!files.isEmpty()) )
		{
		  
                    UploadFile file1 = (UploadFile) files.get("fImage");
                    
                    UploadFile file2 = (UploadFile) files.get("bImage");
                    
                    String uploadFileTemp1="",uploadFileTemp2="";
                    
                    try{
                    uploadFileTemp1=file1.getFileName();
                    }catch(Exception r){}
                    
                      try{
                    uploadFileTemp2=file2.getFileName();
                    }catch(Exception r){}
                
                   
                 bImage = maxId+"_back_"+bImage;
                    
                   try{    
		   if (uploadFileTemp1 != null){
                   //out.println("reacdh inside"+uploadFileTemp1);
                        uploadFileTemp1 = maxId+"_front_"+uploadFileTemp1;
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
                    
                    try{ 
                    
                         if (uploadFileTemp2 != null){
                            uploadFileTemp2 = maxId+"_rear_"+uploadFileTemp2;
                            file2.setFileName(uploadFileTemp2);  
                            upBean.store(mrequest, "bImage");
                            uploadFileName= file2.getFileName(); 
                            bImage=uploadFileName;
                          
                        }else {
                        bImage="";
                        }
                    }catch(Exception r)
                    {
                    bImage="";
                    }
                    
                    
                  //out.println("fImage-"+fImage);
                  //out.println("bImage-"+bImage);
		    
		}
		else
		{
		 // out.println("<li>No uploaded files");
		}
	     
                
                 
                
                 
                 String sqlInsert="INSERT INTO t_style_master(ID,NAME,PROD_SUB_CATG_ID,DESCR, F_IMAGE_NAME, B_IMAGE_NAME,IMAGE_PATH,CUST_ID,MONTH,YEAR) VALUES "+
                 " ("+maxId+",'"+name+"','"+subProduct+"','"+desc+"','"+fImage+"', '"+bImage+"','"+imagePath+"','"+customer+"','"+optMonth+"','"+optYear+"')"; 
                 //out.println(sqlInsert);
                 //poNo= maxId+1000;
                 int x=st.executeUpdate(sqlInsert);
                 message= "New Style has been created successfully.";
                 
                 }// save condition
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
                    <h4 class="panel-title">Add New Style</h4>
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
                                    <label for="selector1" class="col-sm-4 control-label">Select Product Category</label>
                                    <div class="col-sm-4">
                                            <%=mast.getProductCategoryListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new POMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div>
                             <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-4 control-label">Select Product Sub-category</label>
                                    <div class="col-sm-4">
                                            <%=mast.getProductSubCategoryList()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new POMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div>
                            <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-4 control-label">Select Customer</label>
                                    <div class="col-sm-4">
                                            <%=mast.getCustomerList()%>
                                    </div>
                                    
                                    
                                    
                            </div>
                            
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-4 control-label">Name of Style</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="name" id="name" placeholder="Name">
                                    </div>
                            </div>
                            
                          
                            
                          
                             <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-4 control-label">Description </label>
                                    <div class="col-sm-6">
                                             <input type="text" class="form-control1" name="desc" id="desc" placeholder="Description">

                                    </div>
                                 
                               <div class="form-group">
                            <label for="focusedinput" class="col-sm-4 control-label" align=left>Month and Year</label>
                                    <label class="col-sm-2 control-label">
                                         <%@ include file="MonthYear.jsp" %>
                                    </label>
                            </div>      
                                    
                            </div>   
                           
                             <div class="form-group">
                                <label for="fImage" class="col-sm-4 control-label">Front Image</label>
                                <input type="file" name="fImage" id="fImage">
                               
                              </div>
                           
                              <div class="form-group">
                                <label for="fImage" class="col-sm-4 control-label">Rear Image</label>
                                <input type="file" name="bImage" id="bImage">
                               
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
		
			<link rel="stylesheet" href="/pgmis/admin/css/clndr.css" type="text/css" />
			<script src="/pgmis/admin/js/underscore-min.js" type="text/javascript"></script>
			<script src= "/pgmis/admin/js/moment-2.2.1.js" type="text/javascript"></script>
			<script src="/pgmis/admin/js/clndr.js" type="text/javascript"></script>
			<script src="/pgmis/admin/js/site.js" type="text/javascript"></script>

			<!----End Calender -------->
		</div>
		<div class="col-md-6 col_5">
		  
	      <!-- map -->
<link href="/pgmis/admin/css/jqvmap.css" rel='stylesheet' type='text/css' />
<script src="/pgmis/admin/js/jquery.vmap.js"></script>
<script src="/pgmis/admin/js/jquery.vmap.sampledata.js" type="text/javascript"></script>
<script src="/pgmis/admin/js/jquery.vmap.world.js" type="text/javascript"></script>
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

 <script src="/pgmis/admin/js/bootstrap.min.js"></script>
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