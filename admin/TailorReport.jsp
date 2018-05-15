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
<!---//webfonts--->  
<!-- Nav CSS -->
<link href="css/custom.css" rel="stylesheet">
<link href="/pgmis/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
<link href="/pgmis/bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">
<script src="/pgmis/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="/pgmis/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<!-- Graph JavaScript -->
<script src="js/d3.v3.js"></script>
<script src="js/rickshaw.js"></script>
</head>
<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>
<body>
<%
Connection con = null;
Statement st =null,st2=null;
ResultSet rs=null,rs2=null;
con = new DBConnLT().getConn();        
try
{   
     
 st= con.createStatement();
 st2= con.createStatement();
 
%>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            
               <%@ include file="AdminHeader.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
        <div class="graphs">
     	<div class="col_3">
        	<div class="col-md-3 widget widget1">
        		<div class="r3_counter_box">
                    <i class="pull-left fa fa-thumbs-up icon-rounded"></i>
                    <div class="stats">
                      <h5><strong>45%</strong></h5>
                      <span>New Orders</span>
                    </div>
                </div>
        	</div>
        	<div class="col-md-3 widget widget1">
        		<div class="r3_counter_box">
                    <i class="pull-left fa fa-users user1 icon-rounded"></i>
                    <div class="stats">
                      <h5><strong>1019</strong></h5>
                      <span>New Customers</span>
                    </div>
                </div>
        	</div>
        	<div class="col-md-3 widget widget1">
        		<div class="r3_counter_box">
                    <i class="pull-left fa fa-comment user2 icon-rounded"></i>
                    <div class="stats">
                      <h5><strong>1012</strong></h5>
                      <span>New Users</span>
                    </div>
                </div>
        	</div>
        	<div class="col-md-3 widget">
        		<div class="r3_counter_box">
                    <i class="pull-left fa fa-dollar dollar1 icon-rounded"></i>
                    <div class="stats">
                      <h5><strong>$450</strong></h5>
                      <span>Daily Sales</span>
                    </div>
                </div>
        	 </div>
        	<div class="clearfix"> </div>
      </div>
      <div class="panel-heading">
                    <h4 class="panel-title">Tailor Report</h4>
                </div>
      <div class="col_1">
		   <div class="col-md-10 span_3">
		  <div class="bs-example1" data-example-id="contextual-table">
		    
                    <%
                    
                    String sql= "SELECT NAME,ADDRESS, LOCATION, REG_NO, ACC_NO, PHONE, IMAGE "+
                    " FROM t_tailor_master ORDER BY NAME";
                   // out.println(sql);
                    int count=1;
                    rs= st.executeQuery(sql);
                    String name="",address="",location="",regNo="",phone,image="",accNo="";
                    float qty=0,qtyTotal=0;
                    int cnt=0;
                    String trClass="info";
                    %>
                    
                    <table class="table table-striped" id="dataTables-example">
		      <thead>
		        <tr class="warning">
		          <th>#</th>
		          <th>Name</th>
                          <th>Address</th>
                          <th>Location </th>
                          <th>Registration No</th>
                          <th>Account No.</th>
                          <th>Contact</th>
                          <th>Image</th>
		         
		        </tr>
		      </thead>
		      <tbody>
                      <%
                       while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                       name= rs.getString("NAME");if(name==null)name="";
                       location= rs.getString("LOCATION");if(location==null)location="";
                       address= rs.getString("ADDRESS");if(address==null)address="";
                       regNo= rs.getString("REG_NO");if(regNo==null)regNo="";
                       phone= rs.getString("PHONE");if(phone==null)phone="";
                       accNo= rs.getString("ACC_NO");if(accNo==null)accNo="";
                       image=rs.getString("IMAGE");if(image==null)image="";
                       
                  
                       %> 
                        <tr scope="row" class="<%=trClass%>">
		          <th scope="row"><%= cnt%></th>
                           <td align=left><%=name%></td>
		          <td align=left><%=address%></td>
                          <td align=left><%=location%></td>
                          <td align=left><%=regNo%></td>
                          <td align=left><%=accNo%></td>
                          <td align=left><%=phone%></td>
		          <td valign=top><img height="60" width="60" src="/pgmis/images/tailors/<%=image%>" alt=""/>
                          </td>
                        
                      <%
                      
                      if(trClass.equalsIgnoreCase("info"))trClass="";
                       
                      }
                      %>   
                  
		       
		      </tbody>
		    </table>
                  
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