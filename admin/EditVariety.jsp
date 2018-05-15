<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
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
  
   if(document.customer.fab.value=="0")
   {
   reason+="Please Select  Fabric  Name .\n";
   }
   if(document.customer.var.value=="0")
   {
   reason+="Please Select  Variety  Name .\n";
   }
   if(document.customer.name.value=="")
   {
   reason+="Please Enter Variety Name .\n";
   }
   if(document.customer.fabUpdate.value=="0")
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
    
    if(document.customer.var.value!="0")
    {
   
       var check = confirm("Do you want to Delete?")
       if(check){
       document.customer.display.value="delete";
       document.customer.submit(); 
       }
       
    }else{
    alert("Please select Variety");
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
 
 String display=request.getParameter("display"); if(display==null)display="";
// out.println(display);
try{
 if(display.equalsIgnoreCase("save"))
 {
     
     String name=request.getParameter("name"); if(name==null)name="";
  
     String sqlUpdate="UPDATE t_var_master SET NAME='"+name+"', FABRIC_ID="+mast.getFabUpdate()+""+
     " WHERE ID="+mast.getVar()+" AND FABRIC_ID= "+mast.getFab()+"";
  
     
     int x=st.executeUpdate(sqlUpdate);
     message= "Selected Variety Item has been updated successfully.";
  
  }
 
 if(display.equalsIgnoreCase("delete"))
 {
     
     String sqlUpdate="DELETE FROM t_var_master WHERE ID= "+mast.getVar()+"";
  
     
     int x=st.executeUpdate(sqlUpdate);
     message= "Selected Variety  has been deleted successfully.";
  
  }
 }catch(Exception rt)
  {
   message= "Variety is not deleted successfully."+rt.getMessage();
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
                    <h4 class="panel-title">Update Variety </h4>
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
                 
                   
                    <form class="form-horizontal" name="customer">
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
                            
      <%
      String nameTemp="",fabTemp="0";
      //out.println("reached herer"+mast.getFab());
      if(!mast.getVar().equalsIgnoreCase("0")&& !mast.getVar().equalsIgnoreCase(""))
      
      {
         
         String sqlDisplay="SELECT NAME, FABRIC_ID FROM t_var_master where ID="+mast.getVar()+" AND FABRIC_ID="+mast.getFab()+"";
         //out.println(sqlDisplay);
         rs= st.executeQuery(sqlDisplay);
     
         if(rs.next())
         {
         nameTemp= rs.getString("NAME");
         fabTemp=  rs.getString("FABRIC_ID");
         }else {
         fabTemp="0";
         nameTemp="";
          }
         mast.setFabUpdate(fabTemp);  
      
   
      
      %>
      <div class="alert alert-info">
                            Please fill details to update details
                        </div>
                        <hr>
      
   
                 
                            <div class="form-group">
                           
                                    <label for="focusedinput" class="col-sm-2 control-label">Name of Variety</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name= "name" id="name" value="<%=nameTemp%>" placeholder="Name of Variety">
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new customer name!</p>-->
                                    </div>
                                    
                                    
                            </div>
                            
                              <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Select Fabric</label>
                                    <div class="col-sm-4">
                                            <%=mast.getFabricListUpdate()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new POMaster name!</p>-->
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