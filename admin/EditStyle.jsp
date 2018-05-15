<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>

<%@ page import="java.io.File" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.IOException" %>


<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
<jsp:setProperty name="upBean" property="overwrite" value="true" />
</jsp:useBean>
<!DOCTYPE HTML>
<html>
<head>
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
<jsp:useBean id="mast" scope="request" class="administration.POMaster"></jsp:useBean>
<jsp:setProperty name="mast" property="*"/>
<jsp:setProperty name="upBean" property="folderstore" value="/usr/local/tomcat/webapps/www.pushkarganesh.com/pgmis/docs/styles"/>

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
    document.customer.submit(); 
    }
  }  

function validateForm(){

 if(validateFormFields())
 {  if(document.customer.display.value != "display"){
   var check = confirm("Do you want to Save?")
   if(check){
   document.customer.display.value="save";
   return true; 
   }
   else return false;
   }
   return true;
 } 
 return false;
}   

 function showData()
  {
 
  document.customer.display.value = "display";
  document.customer.submit();
  }
  function showDataCustomer()
  {
  
  document.customer.style.value = "0";
  document.customer.display.value = "display";
  document.customer.submit();
  }
function validateFormFields()
{

 if(document.customer.display.value != "display")
 {
   var reason = "";
  
   if(document.customer.style.value=="0")
   {
   reason+="Please Select Style .\n";
   }else if(document.customer.name.value=="")
   {
   reason+="Please Enter Name.\n";
   }
   if (reason != "") {
    alert("Some fields need correction:\n" + reason);
    return false;
  }
 
}
return true;
}
function deleteClick(){
    
    if(document.customer.style.value!="0")
    {
   
       var check = confirm("Do you want to Delete?")
       if(check){
       document.customer.display.value="delete";
       document.customer.submit(); 
       }
       
    }else{
    alert("Please select Style ");
    }
  
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
 //mast.set("0")
 try{
 if (MultipartFormDataRequest.isMultipartFormData(request))
      {
      // out.println(" in save");
       MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
      
       
         
            String name = mrequest.getParameter("name");if(name==null)name="";
            String customer = mrequest.getParameter("customer");if(customer==null)customer="0";
            String customerUpdate=mrequest.getParameter("customerUpdate"); if(customerUpdate==null)customerUpdate="0";
            // out.println("customerUpdate0-"+customerUpdate);
            mast.setCustomerUpdate(customerUpdate);
            mast.setCustomer(customer);
          
            
            String savedImage=mrequest.getParameter("image1"); if(savedImage==null)savedImage="";
            String savedImage2=mrequest.getParameter("image2"); if(savedImage2==null)savedImage2="";
            String style=mrequest.getParameter("style"); if(style==null)style="0";
            mast.setStyle(style);
            display = mrequest.getParameter("display");if(display==null)display="";
            //out.println("reache dere"+display);
           if(display.equalsIgnoreCase("save"))
           {
           
             String fImage="",bImage="",imagePath="/pgmis/docs/style";
             String todo = null;
            
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
                        uploadFileTemp1 = style+"_front_"+uploadFileTemp1;
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
                    
                    //back image 
                    UploadFile file2 = (UploadFile) files.get("bImage");
                    String uploadFileTemp2="";
                    
                    try{
                    uploadFileTemp2=file2.getFileName();
                    }catch(Exception r){}
                    
                  
                
                   
                
                    
                   try{    
		   if (uploadFileTemp2!= null){
                   //out.println("reacdh inside"+uploadFileTemp1);
                        uploadFileTemp2 = style+"_rear_"+uploadFileTemp2;
                        file1.setFileName(uploadFileTemp2);  
                        
		        upBean.store(mrequest, "bImage");
                        uploadFileName= file2.getFileName(); 
                        bImage=uploadFileName;
                      
                    }else {
                    bImage="";
                    }
                    }catch(Exception r){
                    bImage="";
                    }
                    
                  
                    
                    
                  //out.println("fImage-"+fImage);
                  //out.println("bImage-"+bImage);
		    
		}
                 
                if(fImage.equalsIgnoreCase("")) // no image selected
                {
                fImage= savedImage;
                
                }
                 
                if(bImage.equalsIgnoreCase("")) // no image selected
                {
                bImage= savedImage2;
                
                }  
                 
                  String sqlUpdate="UPDATE t_style_master"+
                   " SET NAME='"+name+"', CUST_ID="+customerUpdate+", F_IMAGE_NAME='"+fImage+"', B_IMAGE_NAME='"+bImage+"' "+
                   " WHERE ID="+style+" AND CUST_ID="+customer+"";
                   //out.println(sqlUpdate);
                      int x=st.executeUpdate(sqlUpdate);
                     message= "Style has been updated successfully.";
                                 
                 
           
           }// if save
           
           // perform delete option
           
           
            if(display.equalsIgnoreCase("delete"))
           {
           
             boolean deleteAllow=true;
                 
             //first check data in stock_master
             
             String sqlCheck="SELECT ID FROM t_style_details WHERE STYLE_ID="+style+"";
            // out.println(sqlCheck);
             rs= st.executeQuery(sqlCheck);
             if(rs.next())
             {
             deleteAllow= false;
             message+= "Data for selected Style Available.Style can not be deleted. ";
             }
            // second check with dyer and printer 
            //deleteAllow= true;
            
              
            // deleteAllow= true;
             if(deleteAllow)
             {
                  String sqlUpdate="DELETE FROM  t_style_master"+
                   " WHERE ID="+style+" AND CUST_ID="+customer+"";
                   
                      int x=st.executeUpdate(sqlUpdate);
                     message+= "Selected Style has been deleted successfully.";
                     
                     // deleting file 1
                            try{ 
                            boolean success = false;
                            String path="/usr/local/tomcat/webapps/www.pushkarganesh.com/pgmis/docs/styles/";
                            
                            //String path="C:/Tomcat 6.0/webapps/pgmis/docs/styles/";
                            String fileName = path + savedImage;
                           // out.println(fileName);
                            success = new File(fileName).delete();
                            }catch(Exception rt)
                            {
                            out.println(rt.getMessage());
                            }
                            
                             // deleting file 2
                            try{ 
                            boolean success = false;
                            String path="/usr/local/tomcat/webapps/www.pushkarganesh.com/pgmis/docs/styles/";
                            
                            //String path="C:/Tomcat 6.0/webapps/pgmis/images/prints/";
                            String fileName = path + savedImage2;
                           // out.println(fileName);
                            success = new File(fileName).delete();
                            }catch(Exception rt)
                            {
                            out.println(rt.getMessage());
                            }
                                 
              }   
           
           }// if delete
           
           
           
           
      
      
    }  
 }catch(Exception rt)
 {
  message+= "Style is not updated successfully."+rt.getMessage();
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
                    <h4 class="panel-title">Update Style </h4>
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
                 
                   
                    <form class="form-horizontal" name="customer" method=post enctype="multipart/form-data">
                     
                            
                           <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-4 control-label">Select Customer</label>
                                    <div class="col-sm-4">
                                     <input type="HIDDEN" name="display" value=""></input>
                                            <%=mast.getCustomerListStyleOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new POMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div>  
                             <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-4 control-label">Select Style</label>
                                    <div class="col-sm-4">
                                            <%=mast.getStyleListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new POMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div>    
                            
                            
                           
                            
                            
      <%
      String nameTemp="",fabTemp="0",codeTemp="",varTemp="",image="";
      String bImageName ="",id="",stName="",fab="",descr="",fImage="",bImage ="",monthYear="",custTemp="0";
      String month="",year="";
      //out.println("reached herer"+mast.getFab());
     if(!mast.getStyle().equalsIgnoreCase("0"))
     
     { 
    String dtlSql = "SELECT S.ID, S.NAME STYLE_NAME,S.DESCR,C.NAME CUSTOMER_NAME, F_IMAGE_NAME,B_IMAGE_NAME, IMAGE_PATH,"+
  " concat(S.MONTH,' - ',S.YEAR)  MONTH_YEAR, S.MONTH, S.YEAR, C.ID CUST_ID "+
  " FROM t_product_master P, t_product_sub_master PS,t_customer_master C, t_style_master S  "+
            " WHERE S.CUST_ID= C.ID AND S.PROD_SUB_CATG_ID=PS.ID AND PS.PRODUCT_ID= P.ID "+
            " AND S.ID = "+mast.getStyle()+"";
    //out.println(dtlSql);
    rs = st.executeQuery(dtlSql);
   
    id="";
    
    if(rs.next()){
    id = rs.getString("ID");
    stName =rs.getString("STYLE_NAME"); if (stName == null) stName="";
    descr = rs.getString("DESCR"); if (descr == null) descr="";
    fImage = rs.getString("F_IMAGE_NAME");if (fImage == null) fImage="";
    bImage = rs.getString("B_IMAGE_NAME");if(bImage ==null)bImage ="";
    monthYear=  rs.getString("MONTH_YEAR");if(monthYear==null)monthYear="";
    month=  rs.getString("MONTH");if(month==null)month="";
    year=  rs.getString("YEAR");if(year==null)year="";
    custTemp= rs.getString("CUST_ID");
    mast.setCustomerUpdate(custTemp);  
    }
      
   
      
      %>
      <div class="alert alert-info">
                            Please fill details to update                         </div>
                        <hr>
      
   
                 
                             
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-4 control-label">Name of Style</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="name" value="<%=stName%>" id="name" placeholder="Name">
                                    </div>
                            </div>
                            
                          <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-4 control-label">Customer</label>
                                    <div class="col-sm-4">
                                            <%=mast.getCustomerListUpdate()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new POMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div>
                
                                              
                             
                          
                             <div class="form-group">
                            <label for="focusedinput" class="col-sm-4 control-label">Front Image</label>
                                    <div class="col-sm-2">
                                    <input type=hidden name="image1" value="<%=fImage%>"></input>
                                    <%
                                     if(!fImage.equalsIgnoreCase(""))
                                     {%>
                                    <img height="60" width="60" src="/pgmis/docs/styles/<%=fImage%>" alt=""/>
                                     <%}%>   
                                             <input type="file" name="fImage" id="fImage">
                                    </div>
                            </div>
                            
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-4 control-label">Rear Image</label>
                                    <div class="col-sm-2">
                                    <input type=hidden name="image2" value="<%=bImage%>"></input>
                                    <%
                                     if(!bImage.equalsIgnoreCase(""))
                                     {%>
                                    <img height="60" width="60" src="/pgmis/docs/styles/<%=bImage%>" alt=""/>
                                     <%}%>   
                                             <input type="file" name="bImage" id="bImage">
                                    </div>
                            </div>
                            
                            <div class="but_list" align=center>
                           
                                <p>        
                                 <button type="button" accesskey="Enter" class="btn btn_5 btn-lg btn-warning warning_11" onclick="javascript:submitClick()" >Update</button> 
                                 <button type="button" class="btn btn_5 btn-lg btn-success success_11" onclick="javascript:deleteClick()" >Delete</button> 
                                 
                                 </p>
                            </div>
                  <%}%>          
                   
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