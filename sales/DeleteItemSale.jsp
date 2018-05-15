f<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Pushkar Ganesh Cotton Club Export Pvt. Ltd.</title>
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

<body>
<%
Connection con = null;
Statement st =null;
ResultSet rs=null;
con = new DBConnLT().getConn(); 
String message="";
try
{   
     
 st= con.createStatement();

 
 String type=request.getParameter("type"); if(type==null)type="";
 String tableName=request.getParameter("tableName"); if(tableName==null)tableName="";
 String id=request.getParameter("id"); if(id==null)id="";
 String module= request.getParameter("module"); if(module==null)module="";
 String backURL="";
 
 if(type.equalsIgnoreCase("styleDetails"))
 {
 String product= request.getParameter("product");
 String subProduct= request.getParameter("subProduct");
 String customer= request.getParameter("customer");
 String style= request.getParameter("style");
 backURL="/pgmis/admin/AddStylePosition.jsp?display=display&product="+product+"&subProduct="+subProduct+"&customer="+customer+"&style="+style+"";
 }else if (type.equalsIgnoreCase("poDetails"))
 {
 String po= request.getParameter("po");
 backURL="/pgmis/purchase/PODetails.jsp?display=display&po="+po+"";
 }
 
// out.println(display);

     try{
    
          
     String deleteSql="DELETE FROM "+tableName+" "+
     " WHERE ID="+id+"";
     //out.println(sqlUpdate);
     int x=st.executeUpdate(deleteSql);
     message= "Selected Record has been deleted successfully. Please Click Back to go back to previous page.";
     
     String insertLog= " INSERT INTO t_delete_log (TRANS_DATE,QUERY) VALUES (NOW(),'"+deleteSql+"')";
     int y=st.executeUpdate(insertLog);
  
  }catch(Exception rt)
  {
   message= "Selected Record  is not deleted successfully."+rt.getMessage();
  }
  
  
 
 

 
 
%>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <%
         if(module.equalsIgnoreCase("admin"))
         {%>
              <%@ include file="AdminHeader.jsp" %>
         <%}%>                 <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
        <div class="graphs">
     	
      <div class="col_1">
		   <div class="col-md-12 span_6">
                 <div class="panel-heading">
                    <h4 class="panel-title">Delete Record</h4>
                </div>
               <%
                if(!message.equalsIgnoreCase(""))
                {%>
                      <div class="alert alert-success" role="alert">
                <strong></strong> <%=message%>
               </div>
                <%}
                %>
		  <div class="bs-example1" data-example-id="contextual-table">
		 <div class="tab-pane active" id="horizontal-form">
                 
                   
                    
                            
                            <div class="but_list" align=center>
                           
                                <p>
                                
                                 <button type="button" class="btn btn_5 btn-lg btn-warning warning_11" onclick="window.location.href='<%=backURL%>'">Back</button> 
                                 
                                 
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
               

		}
                catch(SQLException sqle)
                {
                  
                }

	}
%>
