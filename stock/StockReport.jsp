<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="mast" scope="request" class="administration.POMaster"></jsp:useBean>
<jsp:setProperty name="mast" property="*"/>
<script language="javascript" type="text/javascript" src="/pgmis/misc/calendar_us.js"></script>
<script type="text/javascript" language="JavaScript1.2" src="/pgmis/misc/date_format.js"></script>
<script language="javascript" type="text/javascript" src="/pgmis/misc/datetimepicker.js"></script>
<title>Purchase:Pushkar Ganesh Cotton Club Export Pvt. Ltd.</title>
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

<!---//webfonts--->  
<!-- Nav CSS -->
<link href="/pgmis/common/css/custom.css" rel="stylesheet">
<link href="/pgmis/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
<link href="/pgmis/bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">
<script src="/pgmis/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="/pgmis/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/pgmis/common/js/metisMenu.min.js"></script>
<script src="/pgmis/common/js/custom.js"></script>
<!-- Graph JavaScript -->
<script src="/pgmis/common/js/d3.v3.js"></script>
<script src="/pgmis/common/js/rickshaw.js"></script>


</head>
<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>
<script language="JavaScript1.2">

function submitClick(){

if(validateForm()){ 

    document.SendToDyer.submit(); 
    }
  }  

function validateForm(){

 if(validateFormFields())
 {  if(document.SendToDyer.display.value != "display"){
   var check = confirm("Do you want to proceed?")
   if(check){
   document.SendToDyer.display.value="";
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

 
return true;
}

  function showData()
  {
  document.SendToDyer.display.value = "display";
  var fabVal= document.SendToDyer.fab.value;
  document.location.href="StockReport.jsp?fab="+fabVal;
  }

function PrintThisPage()
{ 
 
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
 String action="";
 String display=request.getParameter("display"); if(display==null)display="";
 String dyerName="";
 if(display.equalsIgnoreCase("display"))action="StockReport.jsp";else action="StockReport.jsp";
// out.println(display);


 
%>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            
               <%@ include file="StockHeader.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
        <div class="graphs">
     	
      <div class="col_1">
		   <div class="col-md-10 span_6">
                 
                <%
                if(!message.equalsIgnoreCase(""))
                {%>
                      <div class="alert alert-success" role="alert">
                <strong>Well done!</strong> <%=message%>
               </div>
                <%}
                %>
               <h1>
        
                </h1>
           		  <div class="bs-example1" data-example-id="contextual-table">
		 <div class="tab-pane active" id="horizontal-form">
                    <form class="form-horizontal" name="SendToDyer" action="StockReport.jsp">
                     <input type="HIDDEN" name="display" value=""></input>
                  
                    <center><a href="javascript:PrintThisPage();">Print</a></center>  
                    <div  id="print_content">
                   <h4 class="panel-title">Stock Summary  Report</h4><br>
                  

		    
                    <%
                                  
      String dtlSql1="",dpId="",reason="";
      String fabName="",varName="",remarks="",sentDate="",rcvdDate="",dyerRemarks="",plainCode="",varId="0";
          float QtyOrdered=0,qtySent=0,qtyRcvd =0,qtySentBack=0,qtyPuse=0,qtyRj=0,qtyInspected=0,qtySentToInsp=0,qtyToBeSent=0,qtyPending=0;
      boolean dataAvail = false;


%>

<%
   
    // get var id
  

    String sql= "SELECT F.ID FAB_ID,F.NAME FAB, V.NAME VAR, S.TYPE_CHECK, SUM(S.QTY) QTY"+
                    " FROM t_stock_master S, t_fabric_master F, t_var_master V "+
                    " WHERE S.VAR_ID= V.ID AND V.FABRIC_ID= F.ID"+
                    " GROUP BY F.NAME, V.NAME,S.TYPE_CHECK ";
    
    rs= st.executeQuery(sql);
                    String fabId="",fab="",var="",type="";
                    float qty=0,qtyTotal=0,subTotal=0;;
                    int cnt=0;
                    String trClass="info";
                    %>
                    
                    <table class="table" border=1 style="border-collapse: collapse">
		      <thead>
		        <tr>
		          <th>#</th>
		          <th>Fabric</th>
		          <th>Variety</th>
		          <th>Type</th>
                          <th>Qty. (in Kg./Meters)</th>
		        </tr>
		      </thead>
		      <tbody>
                      <%
                      String fabPrvs="";
                       while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                       fab= rs.getString("FAB");
                       fabId= rs.getString("FAB_ID");
                       var= rs.getString("VAR");
                       type= rs.getString("TYPE_CHECK");
                       qty= rs.getFloat("QTY");
                     
                       
                       if(!fab.equalsIgnoreCase(fabPrvs) && cnt!=1)
                          {
                         %>
                        
                        <tr scope="row" class="<%=trClass%>">
		        <td scope="row">Sub Total</td>
                         <td></td><td></td><td></td>
                         <td align=center><%=subTotal%></td>
                         <%
                           subTotal=0;
                          }%>
                          <tr scope="row" class="<%=trClass%>">
		          <th scope="row"><%= cnt%></th>
                          
                          <%
                          if(!fab.equalsIgnoreCase(fabPrvs))
                          {
                          
                          %>
		          <td align=left><a href="StockReportDetail.jsp?fabId=<%=fabId%>"><%=fab%><a></td>
		          <%}else {%><td></td><%}%>
                          <td align=left><%=var%></td>
		          <td align=left><%=type%></td>
                          <td align=center><%=qty%></td>
		        </tr>
                        
                      <%
                      
                      fabPrvs= fab;
                      
                      if(trClass.equalsIgnoreCase("info"))trClass="";
                        qtyTotal+=qty;
                        subTotal+=qty; 
                      }
                      %>
                      
                       <tr scope="row" class="<%=trClass%>">
		       <td scope="row">Sub Total</td>
                       <td></td><td></td><td></td>
                       <td align=center><%=subTotal%></td>
                        </tr>
                    <tr scope="row" class="warning">
		          <th scope="row" colspan=4 ><a href="StockReportDetail.jsp?fabId=0">Total<a></th>
		         
                          <td align=center><%=qtyTotal%></td>
		        </tr>    
		       
		      </tbody>
		    </table>
                  </div>
		   </div>
                 
                   
 
        
		    
                  
	               
                           
                           
                            
                      
                   </form>
                   </div>
                   
		   </div>
                   
                   
	   </div>
            <div class="clearfix"> </div>
	  </div>
         
	  <div class="span_11">
		<div class="col-md-6 col_4">
		
			<link rel="stylesheet" href="/pgmis/common/css/clndr.css" type="text/css" />
			<script src="/pgmis/common/js/underscore-min.js" 
type="text/javascript"></script>
			<script src= "/pgmis/common/js/moment-2.2.1.js" 
type="text/javascript"></script>
			<script src="/pgmis/common/js/clndr.js" 
type="text/javascript"></script>
			<script src="/pgmis/common/js/site.js" 
type="text/javascript"></script>
			<!----End Calender -------->
		</div>
		<div class="col-md-6 col_5">
		  
	      <!-- map -->
<link href="/pgmis/common/css/jqvmap.css" rel='stylesheet' type='text/css' />
<script src="/pgmis/common/js/jquery.vmap.js"></script>
<script src="/pgmis/common/js/jquery.vmap.sampledata.js" 
type="text/javascript"></script>
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
<script>
     var dis = "<%= message %>";
     if(!dis ==""){
     alert(dis);
     
    }
   </script