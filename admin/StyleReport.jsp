<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="mast" scope="request" class="administration.POMaster"></jsp:useBean>
<jsp:setProperty name="mast" property="*"/>
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

 <!-- DataTables CSS -->
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

function showData()
  {
 
  document.Master.display.value = "display";
  document.Master.submit();
  }
  
  
  function changeImg(who,flag) {

  if (flag) {

    who.style.height='125px';  who.style.width='100px';

  } else {

    who.style.height='60px';  who.style.width='60px';

  }

}

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
        
     	<form class="form-horizontal" name="Master">
      
      <div class="col-md-10 span_3" >
		   <div class="bs-example1">
                    
		  <div class="panel-body no-padding"  id="contextual-table">
                  
                   <div class="form-group">
                            <input type="HIDDEN" name="display" value=""></input>
                                    <label for="selector1" class="col-sm-2 control-label">Select Customer</label>
                                    <div class="col-sm-4">
                                            <%=mast.getCustomerListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new POMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div>
                  
		 
                    <%
                    
                    if(!mast.getCustomer().equalsIgnoreCase(""))
                    {
                    %>
                       <center><a href="javascript:PrintThisPage();">Print</a></center>  
                       <%
                    
                    String sql = "SELECT C.NAME CUST_NAME,S.ID, S.NAME STYLE_NAME,S.DESCR,C.NAME CUSTOMER_NAME, F_IMAGE_NAME,B_IMAGE_NAME, IMAGE_PATH,"+
                      " concat(S.MONTH,' - ',S.YEAR)  MONTH_YEAR, S.MONTH, S.YEAR, C.ID CUST_ID "+
                      " FROM t_product_master P, t_product_sub_master PS,t_customer_master C, t_style_master S  "+
                                " WHERE S.CUST_ID= C.ID AND S.PROD_SUB_CATG_ID=PS.ID AND PS.PRODUCT_ID= P.ID "+
                                " AND S.CUST_ID = "+mast.getCustomer()+"";
            
                      //out.println(sql);
                    int count=1;
                    rs= st.executeQuery(sql);
                     String nameTemp="",fabTemp="0",codeTemp="",varTemp="",image="",custName="";
                      String bImageName ="",id="",stName="",fab="",descr="",fImage="",bImage ="",monthYear="",custTemp="0";
                      String month="",year="";
                    float qty=0,qtyTotal=0;
                    int cnt=0;
                    String trClass="info";
                    %>
                     <div  id="print_content">
                      <div class="panel-heading">
                    <h4 class="panel-title">Style Report</h4><br>
                  
                </div>
                     <table class="table" id="dataTables-example" border = "1" align="left" cellspacing = "1" cellpadding="1" style="border-collapse: collapse">
		      <thead>
		        <tr class="warning">
		          <th>#</th>
		          <th>Cusomer</th>
                          <th>Style Name</th>
                          <th>Month Created</th>
                          <th>Front Image </th>
                          <th>Rear Image </th
		         
		        </tr>
		      </thead>
		      <tbody>
                      <%
                       while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                       id = rs.getString("ID");
                            custName =rs.getString("CUST_NAME"); if (custName == null) custName="";
                            stName =rs.getString("STYLE_NAME"); if (stName == null) stName="";
                            descr = rs.getString("DESCR"); if (descr == null) descr="";
                            fImage = rs.getString("F_IMAGE_NAME");if (fImage == null) fImage="";
                            bImage = rs.getString("B_IMAGE_NAME");if(bImage ==null)bImage ="";
                            monthYear=  rs.getString("MONTH_YEAR");if(monthYear==null)monthYear="";
                            month=  rs.getString("MONTH");if(month==null)month="";
                            year=  rs.getString("YEAR");if(year==null)year="";
                       
                  
                       %> 
                        <tr scope="row" class="<%=trClass%>">
		          <th scope="row"><%= cnt%></th>
		          <td align=left><%=custName%></td>
                          <td align=left><a href="StyleReportDetail.jsp?style=<%=id%>" target="_blank"><%=stName%></a></td>
                          <td align=left><%=monthYear%></td>
                          <td valign=top>
                           <img height="60" width="60" src="/pgmis/docs/styles/<%=fImage%>"  onmouseover="changeImg(this,true)" onmouseout="changeImg(this,false)" alt=""/>
                          </div>
                          <td valign=top>
                           <img height="60" width="60" src="/pgmis/docs/styles/<%=bImage%>"  onmouseover="changeImg(this,true)" onmouseout="changeImg(this,false)" alt=""/>
                          </div>
                          </td>
                        
                      <%
                      
                      if(trClass.equalsIgnoreCase("info"))trClass="";
                       
                      }
                      %>   
                  
		       
		      </tbody>
		    </table>
                  </div>
                  <%}%>
                  
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