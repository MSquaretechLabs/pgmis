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
<jsp:setProperty name="upBean" property="folderstore" value="/usr/local/tomcat/webapps/www.pushkarganesh.com/pgmis/images/prints"/>

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
function validateFormFields()
{

 if(document.customer.display.value != "display")
 {
   var reason = "";
  
   if(document.customer.var.value=="0")
   {
   reason+="Please Select Variety Name .\n";
   }else if(document.customer.name.value=="")
   {
   reason+="Please Enter Name.\n";
   }else if(document.customer.code.value=="")
   {
   reason+="Please Enter  Code\n";
   }else if(document.customer.varUpdate.value=="0")
   {
   reason+="Please Select Variety Name .\n";
   }
   if (reason != "") {
    alert("Some fields need correction:\n" + reason);
    return false;
  }
 
}
return true;
}
function deleteClick(){
    
    if(document.customer.plain.value!="0")
    {
   
       var check = confirm("Do you want to Delete?")
       if(check){
       document.customer.display.value="delete";
       document.customer.submit(); 
       }
       
    }else{
    alert("Please select Plain ");
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
 try{
 if (MultipartFormDataRequest.isMultipartFormData(request))
      {
      // out.println(" in save");
       MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
      
       
         String var=mrequest.getParameter("var"); if(var==null)var="0";
         String fab=mrequest.getParameter("fab"); if(fab==null)fab="0";
         mast.setFab(fab);
         mast.setVar(var);
         String varUpdate=mrequest.getParameter("varUpdate"); if(varUpdate==null)varUpdate="0";
         mast.setVarUpdate(varUpdate);
         String name=mrequest.getParameter("name"); if(name==null)name="";
         String code=mrequest.getParameter("code"); if(code==null)code="";
         String savedImage=mrequest.getParameter("image"); if(savedImage==null)savedImage="";
         display=mrequest.getParameter("display"); if(display==null)display="";
         String plain= mrequest.getParameter("plain"); if(plain==null)plain="0";
         mast.setPlain(plain);
         
           if(display.equalsIgnoreCase("save"))
           {
           
             String fImage="",imagePath="/pgmis/images/prints/";
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
                        uploadFileTemp1 = plain+"_plain_"+uploadFileTemp1;
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
                 
                if(fImage.equalsIgnoreCase("")) // no image selected
                {
                fImage= savedImage;
                
                }
                 
                 
                  String sqlUpdate="UPDATE t_plain_master"+
                   " SET NAME='"+name+"',CODE='"+code+"', VAR_ID="+varUpdate+", IMAGE='"+fImage+"' "+
                   " WHERE ID="+plain+" AND VAR_ID="+var+"";
                   
                      int x=st.executeUpdate(sqlUpdate);
                     message= "New Plain Code has been updated successfully.";
                                 
                 
           
           }// if save
           
           // perform delete option
           
           
            if(display.equalsIgnoreCase("delete"))
           {
           
             boolean deleteAllow=true;
                 
             //first check data in stock_master
             
             String sqlCheck="SELECT ID FROM t_stock_master WHERE TYPE_CHECK='Plain' AND TYPE_ID="+plain+" "+
             " AND QTY>0 AND VAR_ID="+var+"";
            // out.println(sqlCheck);
             rs= st.executeQuery(sqlCheck);
             if(rs.next())
             {
             deleteAllow= false;
             message+= "Data for selected Plain Code Available in Stock.Plain can not be deleted. ";
             }
            // second check with dyer and printer 
            //deleteAllow= true;
            
             if(deleteAllow)
             {
                 sqlCheck="SELECT ID FROM t_po_dp_details WHERE TYPE_CHECK='Plain' AND TYPE_ID="+plain+" "+
                 " AND QTY_SENT>0";
                 //out.println(sqlCheck);
                 rs= st.executeQuery(sqlCheck);
                 if(rs.next())
                 {
                 deleteAllow= false;
                 message+= "Data for selected Plain Code Available with Dyer/ Printer.Plain can not be deleted. ";
                 }
             }
             
             // third check in so combo details
            if(deleteAllow)
             {
                 sqlCheck="SELECT ID FROM t_so_combo_details WHERE TYPE_CHECK='Plain' AND TYPE_ID="+plain+"";
               
                 rs= st.executeQuery(sqlCheck);
                 if(rs.next())
                 {
                 deleteAllow= false;
                 message+= "Data for selected Plain Code Available in SO Item Details.Plain can not be deleted. ";
                 }
             }  
            // deleteAllow= true;
             if(deleteAllow)
             {
                  String sqlUpdate="DELETE FROM  t_plain_master"+
                   " WHERE ID="+plain+" AND VAR_ID="+var+"";
                   
                      int x=st.executeUpdate(sqlUpdate);
                     message+= "Selected Plain Code has been deleted successfully.";
                     
                     // deleting file 
                            try{ 
                            boolean success = false;
                            String path="/usr/local/tomcat/webapps/www.pushkarganesh.com/pgmis/images/prints/";
                            
                            //String path="C:/Tomcat 6.0/webapps/pgmis/images/prints/";
                            String fileName = path + savedImage;
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
  message+= "Plain is not updated successfully."+rt.getMessage();
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
                    <h4 class="panel-title">Update Plain Code </h4>
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
                           
                                    <label for="selector1" class="col-sm-2 control-label">Select Fabric</label>
                                    <div class="col-sm-4">
                                     <input type="HIDDEN" name="display" value=""></input>
                                            <%=mast.getFabricListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new POMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div>
                            <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Select Variety</label>
                                    <div class="col-sm-4">
                                            <%=mast.getVarietyListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new POMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div>
                            <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Select Plain </label>
                                    <div class="col-sm-4">
                                            <%=mast.getPlainCodeListOnChange(mast.getVar())%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new POMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div>
                            
                            
      <%
      String nameTemp="",fabTemp="0",codeTemp="",varTemp="",image="";
      //out.println("reached herer"+mast.getFab());
      if(!mast.getPlain().equalsIgnoreCase("0")&& !mast.getPlain().equalsIgnoreCase(""))
      
      {
        String sqlDisplay= "SELECT P.NAME PNAME, P.CODE PCODE, FAB.ID FABRIC_ID,VAR.ID VAR_ID,FAB.NAME FAB_NAME, VAR.NAME VAR_NAME, P.IMAGE "+
                    " FROM t_fabric_master FAB, t_var_master VAR, t_plain_master P WHERE P.VAR_ID= VAR.ID "+
                    " AND VAR.FABRIC_ID= FAB.ID "+
                    " AND FAB.ID="+mast.getFab()+" "+
                    " AND VAR.ID="+mast.getVar()+" "+
                    " and P.ID="+mast.getPlain()+" "+
                    " ORDER BY FABRIC_ID, VAR_ID, P.NAME";
                 
         
          rs= st.executeQuery(sqlDisplay);
     
         if(rs.next())
         {
         nameTemp= rs.getString("PNAME");
         codeTemp= rs.getString("PCODE"); if(codeTemp==null)codeTemp="";
         fabTemp=  rs.getString("FABRIC_ID");
         varTemp= rs.getString("VAR_ID");
         image=rs.getString("IMAGE");if(image==null)image="";
                       
         }else {
         fabTemp="0";
         nameTemp="";
         codeTemp="";
         varTemp="";
          }
         mast.setVarUpdate(varTemp);  
      
   
      
      %>
      <div class="alert alert-info">
                            Please fill details to update                         </div>
                        <hr>
      
   
                 
                            <div class="form-group">
                           
                                    <label for="focusedinput" class="col-sm-2 control-label">Name of Plain</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name= "name" id="name" value="<%=nameTemp%>" placeholder="Name of Plain">
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new customer name!</p>-->
                                    </div>
                                    
                                    
                            </div>
                            
                              <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Select Variety</label>
                                    <div class="col-sm-4">
                                            <%=mast.getVarListUpdate()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new POMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div>
                            
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Code</label>
                                    <div class="col-sm-2">
                                            <input type="text" class="form-control1" name="code" id="code" value="<%=codeTemp%>" placeholder="Code">
                                    </div>
                            </div>
                            
                          
                             <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Image</label>
                                    <div class="col-sm-2">
                                    <input type=hidden name="image" value="<%=image%>"></input>
                                    <%
                                     if(!image.equalsIgnoreCase(""))
                                     {%>
                                    <img height="60" width="60" src="/pgmis/images/prints/<%=image%>" alt=""/>
                                     <%}%>   
                                             <input type="file" name="fImage" id="fImage">
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