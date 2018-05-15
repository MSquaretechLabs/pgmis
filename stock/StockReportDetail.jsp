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
   document.SendToDyer.submit();
  }

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
String message="";
try
{   
     
 st= con.createStatement();
 st2= con.createStatement();
 String action="";
 String display=request.getParameter("display"); if(display==null)display="";
 String dyerName="";
 //if(display.equalsIgnoreCase("display"))action="StockReport.jsp";else action="StockReport.jsp";
 
 String fabId=request.getParameter("fabId"); if(fabId==null)fabId="0";
 String imageDisplay= request.getParameter("imageDisplay"); if(imageDisplay==null)imageDisplay="";
 String rsDisplay= request.getParameter("rsDisplay"); if(rsDisplay==null)rsDisplay="";
 String reportType=request.getParameter("reportType"); if(reportType==null)reportType="PlainPrint";
 String checked="",rsChecked="";
 if(imageDisplay.equalsIgnoreCase("on"))checked="checked";else checked="";
 if(rsDisplay.equalsIgnoreCase("on"))rsChecked="checked";else rsChecked="";

 String chValue ="checked=checked";
// out.println(display);
String fabName="";
String fabSql="SELECT NAME FROM t_fabric_master where ID="+fabId+"";
rs= st.executeQuery(fabSql);
if(rs.next())
{
fabName= rs.getString("NAME"); if(fabName==null)fabName="";
}else fabName="All";
 
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
                    <form class="form-horizontal" name="SendToDyer" action="StockReportDetail.jsp">
                     <input type="HIDDEN" name="display" value=""></input>
                     <input type="HIDDEN" name="fabId" value="<%=fabId%>"></input>
                    <center><a href="javascript:PrintThisPage();">Print</a> &nbsp; &nbsp; &nbsp; &nbsp;
                   <a href="javascript:showData();">Refresh</a>
                    &nbsp; &nbsp; &nbsp; &nbsp;
                   <a href="javascript:window.location.href='StockReport.jsp';">Back</a></center>  
                     

                     
                     <div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">Report Type</label>
									<div class="col-sm-8">
										<div class="radio-inline"><label><input type="radio" name="reportType" value="Plain" <%= reportType.equalsIgnoreCase("Plain") ?  chValue  :  ""%>> Plain</label></div>
										<div class="radio-inline"><label><input type="radio" name="reportType" value="Print" <%= reportType.equalsIgnoreCase("Print") ?  chValue  :  ""%>> Print</label></div>
										<div class="radio-inline"><label><input type="radio" name="reportType" value="PlainPrint" <%= reportType.equalsIgnoreCase("PlainPrint") ?  chValue  :  ""%>> Plain & Print Both</label></div>
										
									</div>
								</div>
                                                                
                                                               <div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">Show Images</label>
									<div class="col-sm-8">
										<input type="checkbox" name="imageDisplay" <%=checked%>>
									</div>
								</div> 
                                                                 <div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">Reserved Stock</label>
									<div class="col-sm-8">
										<input type="checkbox" name="rsDisplay" <%=rsChecked%>>
									</div>
								</div> 
                    <div  id="print_content">
                   <h4 class="panel-title"><center>Stock Detail  Report<br><br> Fabric :<%=fabName%></h4></center><br>
                   
                  
                  

		    
                    <%
                                  
      String dtlSql1="",dpId="",reason="";
      String varName="",remarks="",sentDate="",rcvdDate="",dyerRemarks="",plainCode="",varId="0",image="";
      float QtyOrdered=0,qtySent=0,qtyRcvd =0,qtySentBack=0,qtyPuse=0,qtyRj=0,qtyInspected=0,qtySentToInsp=0,qtyToBeSent=0,qtyPending=0;
      boolean dataAvail = false;


%>

<%
   
    // get var id
   String sql="";
       if(reportType.equalsIgnoreCase("PlainPrint")){
       
       sql= "SELECT F.ID FAB_ID,F.NAME FAB, V.NAME VAR, V.ID VAR_ID,S.TYPE_CHECK, ifnull(S.QTY,0) QTY, P.IMAGE, "+
                         " P.ID PID, P.NAME PNAME, P.CODE PCODE "+
                        " FROM t_stock_master S, t_fabric_master F, t_var_master V, t_plain_master P "+
                        " WHERE S.VAR_ID= V.ID AND V.FABRIC_ID= F.ID AND S.TYPE_ID= P.ID "+
                        " AND S.TYPE_CHECK='Plain'";
                        if(!fabId.equalsIgnoreCase("0"))
                        {
                        sql+= " AND F.ID="+fabId+"";  
                        }
        sql+= " union SELECT F.ID FAB_ID,F.NAME FAB, V.NAME VAR,V.ID VAR_ID, S.TYPE_CHECK, ifnull(S.QTY,0) QTY, P.IMAGE, "+
                         " P.ID PID, P.NAME PNAME, C.NAME PCODE "+
                        " FROM t_stock_master S, t_fabric_master F, t_var_master V, t_print_master P, t_customer_master C "+
                        " WHERE S.VAR_ID= V.ID AND V.FABRIC_ID= F.ID AND S.TYPE_ID= P.ID "+
                        " AND P.CUST_ID= C.ID "+    
                        " AND S.TYPE_CHECK='Print' ";
                        if(!fabId.equalsIgnoreCase("0"))
                        {
                        sql+= " AND F.ID="+fabId+"";  
                        }
                        sql+=" ORDER BY FAB, VAR";
       
       
       
       }else  if(reportType.equalsIgnoreCase("Plain")){
       
       sql= "SELECT F.ID FAB_ID,F.NAME FAB,V.NAME VAR,V.ID VAR_ID, S.TYPE_CHECK, ifnull(S.QTY,0) QTY, P.IMAGE, "+
                         " P.ID PID, P.NAME PNAME, P.CODE PCODE "+
                        " FROM t_stock_master S, t_fabric_master F, t_var_master V, t_plain_master P "+
                        " WHERE S.VAR_ID= V.ID AND V.FABRIC_ID= F.ID AND S.TYPE_ID= P.ID "+
                        " AND S.TYPE_CHECK='Plain' ";
                         if(!fabId.equalsIgnoreCase("0"))
                        {
                        sql+= " AND F.ID="+fabId+"";  
                        }
       }else if(reportType.equalsIgnoreCase("Print")){
       
                           
        sql= " SELECT F.ID FAB_ID,F.NAME FAB,V.NAME VAR, V.ID VAR_ID,S.TYPE_CHECK, ifnull(S.QTY,0) QTY,  P.IMAGE, "+
                         " P.ID PID, P.NAME PNAME, C.NAME PCODE "+
                        " FROM t_stock_master S, t_fabric_master F, t_var_master V, t_print_master P, t_customer_master C "+
                        " WHERE S.VAR_ID= V.ID AND V.FABRIC_ID= F.ID AND S.TYPE_ID= P.ID "+
                        " AND P.CUST_ID= C.ID "+    
                        " AND S.TYPE_CHECK='Print' ";
                        if(!fabId.equalsIgnoreCase("0"))
                        {
                        sql+= " AND F.ID="+fabId+"";  
                        }
                       sql+= " ORDER BY FAB, VAR";
       
       
       
       }
  

    
    //out.println(sql);
    rs= st.executeQuery(sql);
                    String fab="",var="",type="",pName="",pCode="",sql2="",pId="";
                    float qty=0,qtyTotal=0,qtyReqAllStyle=0,qtyIssuedAllStyle=0,qtyReserved=0,actualQty=0;
                    int cnt=0;
                    String trClass="info";
                    %>
                    
                    <table class="table" border=1 style="border-collapse: collapse" id="dataTables-example">
		      <thead>
		        <tr>
		          <th>#</th>
		          <th>Fabric</th>
		          <th>Variety</th>
		          <th>Type</th>
                          <th>Name</th>
                          <th>Code</th>
                          <th>Qty. (in Kg./Meters)</th>
                          
                          <%
                          if(imageDisplay.equalsIgnoreCase("on"))
                          {
                          %>
                          <th>Image</th>
                          <%
                          }
                          if(rsDisplay.equalsIgnoreCase("on"))
                          {
                          %>
                          <th>Reserved Stock</th>
                          <th>Actual Stock</th>
                          <%
                          }
                          %>
                          
		        </tr>
		      </thead>
		      <tbody>
                      <%
                      String fabPrvs="";
                       while(rs.next())
                       {
                       qtyReqAllStyle=0;
                       qtyReserved=0;
                       qtyIssuedAllStyle=0;
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                       fab= rs.getString("FAB");
                       fabId= rs.getString("FAB_ID");
                       pId= rs.getString("PID");if(pId==null)pId="0";
                       var= rs.getString("VAR"); if(var==null)var="";
                       varId= rs.getString("VAR_ID"); if(varId==null)varId="0";
                       type= rs.getString("TYPE_CHECK");if(type==null)type="";
                       pName= rs.getString("PNAME");if(pName==null)pName="";
                       pCode= rs.getString("PCODE"); if(pCode==null)pCode="";
                       qty= rs.getFloat("QTY");
                       qtyTotal+=qty;
                       
                       
                       
                       
                       
                       
                       
                       %> 
                        <tr scope="row" class="<%=trClass%>">
		          <th scope="row"><%= cnt%></th>
                          
                          <%
                          if(!fab.equalsIgnoreCase(fabPrvs))
                          {
                          %>
		          <td align=left><%=fab%></td>
		          <%}else {%><td></td><%}%>
                          <td align=left><%=var%></td>
		          <td align=left><%=type%></td>
                          <td align=left><%=pName%></td>
                          <td align=left><%=pCode%></td>
                          <td align=center><%=qty%></td>
                          <%
                          if(imageDisplay.equalsIgnoreCase("on"))
                          {
                          %>
                           <td align=center>
                         <img height="60" width="60" src="/pgmis/images/prints/<%=image%>"  onmouseover="changeImg(this,true)" onmouseout="changeImg(this,false)" alt=""/>
                         </td>
                          <%
                          }
                          
                       if(rsDisplay.equalsIgnoreCase("on"))
                       {
                     // getting requirement in all not clsoed SOs     
                     
                     /*
                     Actual Requirement
                     sql2="SELECT SUM( "+
                      "   (ifnull(SD.ES,0)* ifnull(SOD.ES,0)) + "+
                       "   (ifnull(SD.S,0)* ifnull(SOD.S,0))+ "+
                       "   (ifnull(SD.M,0)* ifnull(SOD.M,0))+ "+
                        "   (ifnull(SD.L,0)* ifnull(SOD.L,0))+ "+
                       "  (ifnull(SD.XL,0)* ifnull(SOD.XL,0))+ "+
                       "  (ifnull(SD.XXL,0)* ifnull(SOD.XXL,0)) "+
                       "  )REQ "+
                       "   from t_so_combo_details SOC, t_style_details SD , t_style_master S, t_so_master SO, "+
                       "  t_so_details SOD WHERE SOC.SO_DTL_ID= SOD.ID  AND SOD.SO_ID= SO.ID  "+
                       "    AND SOC.ST_DTL_ID=SD.ID AND SD.STYLE_ID= S.ID   "+
                       "    AND SO.SO_STATUS NOT IN ('C') "+
                       "    AND SOC.TYPE_CHECK= '"+type+"'"+
                       "    AND SOC.TYPE_ID="+pId+"";
                       */
                       //manual requirement from reserved qty table
                       
                       
                   sql2= " SELECT sum(ifnull(QTY,0)) REQ "+
                        " FROM t_so_rsr_qty WHERE TYPE_CHECK='"+type+"' "+
                        " AND TYPE_ID="+pId+" and VAR_ID ="+varId+"";
                        
                          
                   
                       //"   AND S.ID="+mast.getStyle()+" "+
                     // out.println(sql2);
                       rs2 = st2.executeQuery(sql2);
                        if(rs2.next())
                        {
                        qtyReqAllStyle= rs2.getFloat("REQ");
                        }else qtyReqAllStyle=0;
                      
                      
                      
                      
                      
                       
                       sql2="SELECT SUM(ifnull(QTY,0)) QTY FROM t_stock_issue, t_so_master WHERE "+
                      "   t_stock_issue.SO_ID= t_so_master.ID "+
                      " AND t_so_master.SO_STATUS NOT IN ('C') "+
                      " AND TYPE_CHECK= '"+type+"'  AND TYPE_ID="+pId+" AND VAR_ID="+varId+"";
                        //out.println(sql2);
                        rs2 = st2.executeQuery(sql2);
                        if(rs2.next())
                        {
                        qtyIssuedAllStyle= rs2.getFloat("QTY");
                        }else qtyIssuedAllStyle=0;
                        
                        
                       qtyReserved=   qtyReqAllStyle- qtyIssuedAllStyle;
                       
                       
                       
                       actualQty= qty-qtyReserved;
                       %>
                        <td align=center><%=qtyReserved%></td>
                        <td align=center><%=actualQty%></td>
                       <%
                       }
                          
                        %>  
                          
                          
                          
		        </tr>
                        
                      <%
                      
                      fabPrvs= fab;
                      
                      if(trClass.equalsIgnoreCase("info"))trClass="";
                       
                      }
                      %>   
                    <tr scope="row" class="warning">
		          </th><th scope="row" colspan=1>Total</th>
                          <td></td> <td></td> <td></td> <td></td> <td></td>
		         
                          <td align=center><%=qtyTotal%></td>
                          <%
                          if(imageDisplay.equalsIgnoreCase("on"))
                          {
                          %>
                           <td align=center>
                         
                         </td>
                          <%
                          }
                            if(rsDisplay.equalsIgnoreCase("on"))
                          {
                          %>
                           <td>            
                         </td> <td>            
                         </td>
                          <%
                          }%>
                          
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
