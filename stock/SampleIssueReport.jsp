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
<link href="/pgmis/common/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="/pgmis/common/css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="/pgmis/common/css/lines.css" rel='stylesheet' type='text/css' />
<link href="/pgmis/common/css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="/pgmis/common/js/jquery.min.js"></script>
<!----webfonts--->
<link href="/pgmis/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
<link href="/pgmis/bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">
<script src="/pgmis/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="/pgmis/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

<!---//webfonts--->  
<!-- Nav CSS -->
<link href="/pgmis/common/css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="/pgmis/common/js/metisMenu.min.js"></script>
<script src="/pgmis/common/js/custom.js"></script>
<!-- Graph JavaScript -->
<script src="/pgmis/common/js/d3.v3.js"></script>
<script src="/pgmis/common/js/rickshaw.js"></script>
</head>
<body>
<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
 function PrintThisPage()
{ 
 
  
  document.getElementById('dataTables-example_filter').style.display = "none";
  document.getElementById('dataTables-example_length').style.display = "none";
  document.getElementById('dataTables-example_info').style.display = "none";
  document.getElementById('dataTables-example_paginate').style.display = "none";
 
  var disp_setting="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
  disp_setting+="scrollbars=yes,width=900, height=600, left=50, top=25"; 
  var content_vlue = document.getElementById("print_content").innerHTML; 
 
  content_vlue=content_vlue.replace('dataTables-example', 'dataTables-example2');
  
  var docprint=window.open("","",disp_setting); 
   docprint.document.open(); 
   docprint.document.write('<html><head><title>PGMIS</title><link rel="stylesheet" type="text/css" href="/pgmis/common/css/style.css">'); 
   docprint.document.write('</head><body onLoad="self.print()"><center>');  
   <!--docprint.document.write('</head><body><center>'); -->
   docprint.document.write(content_vlue);          
   docprint.document.write('</center></body></html>'); 
   docprint.document.close(); 
   docprint.focus(); 
   
    document.getElementById('dataTables-example_filter').style.display = "block";
    document.getElementById('dataTables-example_length').style.display = "block";
    document.getElementById('dataTables-example_info').style.display = "block";
    document.getElementById('dataTables-example_paginate').style.display = "block";
}
    </script>
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
            
               <%@ include file="StockHeader.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
       
     	     
      <div class="col_1">
		   <div class="col-md-10 span_3">
                   
		  <div class="bs-example1" data-example-id="contextual-table">
		    <center><a href="javascript:PrintThisPage();">Print</a></center>  
                    <div  id="print_content">
                   <h4 class="panel-title">Sample Issue  Report</h4><br>
                    <%
                    
                    String sql= "SELECT F.NAME FAB, V.NAME VAR, S.TYPE_CHECK, ifnull(S.QTY,0) QTY,"+
                    " DATE_FORMAT(ISSUE_DATE,'%d-%b-%Y') ISSUE_DATE,REMARKS,P.NAME PRINT "+
                    " FROM  t_fabric_master F, t_var_master V , t_sample_issue S, t_plain_master P"+
                    " WHERE S.VAR_ID= V.ID AND V.FABRIC_ID= F.ID"+
                    " AND S.TYPE_ID= P.ID AND S.TYPE_CHECK='Plain'";
                    //out.println(sql);
                   
                   sql+= "union SELECT F.NAME FAB, V.NAME VAR, S.TYPE_CHECK, ifnull(S.QTY,0) QTY,"+
                    " DATE_FORMAT(ISSUE_DATE,'%d-%b-%Y') ISSUE_DATE,REMARKS,P.NAME PRINT "+
                    " FROM  t_fabric_master F, t_var_master V , t_sample_issue S, t_print_master P"+
                    " WHERE S.VAR_ID= V.ID AND V.FABRIC_ID= F.ID"+
                    " AND S.TYPE_ID= P.ID AND S.TYPE_CHECK='Print' "+
                    " ORDER BY  ISSUE_DATE DESC";
                   // out.println(sql);
                   
                    int count=1;
                    rs= st.executeQuery(sql);
                    String fab="",var="",type="",issueDate="",remarks="";
                    float qty=0,qtyTotal=0;
                    int cnt=0;
                    String trClass="info";
                    %>
                    
                    <table class="table" id="dataTables-example" border = "1" align="left" cellspacing = "1" cellpadding="1" style="border-collapse: collapse">
		      <thead>
		        <tr>
		          <th>#</th>
		          <th>Fabric</th>
		          <th>Variety</th>
		          <th>Plain/Print</th>
                          <th>Qty. (in Meters)</th>
                          <th>Issue Date</th>
                           <th>Remarks</th>
		        </tr>
		      </thead>
		      <tbody>
                      <%
                       while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                       fab= rs.getString("FAB");
                       var= rs.getString("VAR");
                       type= rs.getString("PRINT");
                       qty= rs.getFloat("QTY");
                       issueDate= rs.getString("ISSUE_DATE"); if(issueDate==null)issueDate="";
                       remarks= rs.getString("REMARKS"); if(remarks==null)remarks="";
                       qtyTotal+=qty;
                       %> 
                        <tr scope="row" class="<%=trClass%>">
		          <th scope="row"><%= cnt%></th>
		          <td align=left><%=fab%></td>
		          <td align=left><%=var%></td>
		          <td align=left><%=type%></td>
                          <td align=right><%=qty%></td>
                          <td align=centre><%=issueDate%></td>
                           <td align=left><%=remarks%></td>
		        </tr>
                        
                      <%
                      
                      if(trClass.equalsIgnoreCase("info"))trClass="";
                       
                      }
                      %>   
                    <tr scope="row" class="warning">
		          <th scope="row" colspan=1>Total</th>
		         <td></td><td></td><td></td>
                          <td align=right><%=qtyTotal%></td>
                          <td></td>
                          <td></td>
		        </tr>    
		       
		      </tbody>
		    </table>
                  
		   </div>
                   </div>
                   
	   </div>
	 
      	</div>
            <div class="clearfix"> </div>
	
         
	  <div class="span_11">
		<div class="col-md-6 col_4">
		
			<link rel="stylesheet" href="/pgmis/common/css/clndr.css" type="text/css" />
			<script src="/pgmis/common/js/underscore-min.js" type="text/javascript"></script>
			<script src= "/pgmis/common/js/moment-2.2.1.js" type="text/javascript"></script>
			<script src="/pgmis/common/js/clndr.js" type="text/javascript"></script>
			<script src="/pgmis/common/js/site.js" type="text/javascript"></script>
			<!----End Calender -------->
		</div>
		<div class="col-md-6 col_5">
		  
	      <!-- map -->
<link href="/pgmis/common/css/jqvmap.css" rel='stylesheet' type='text/css' />
<script src="/pgmis/common/js/jquery.vmap.js"></script>
<script src="/pgmis/common/js/jquery.vmap.sampledata.js" type="text/javascript"></script>
<script src="/pgmis/common/js/jquery.vmap.world.js" type="text/javascript"></script>
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
    <script src="/pgmis/common/js/bootstrap.min.js"></script>
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