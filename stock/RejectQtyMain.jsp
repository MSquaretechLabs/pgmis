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
  var supVal= document.SendToDyer.manu.value;
  document.location.href="RejectQtyMain.jsp?manu="+supVal;
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
 if(display.equalsIgnoreCase("display"))action="RejectQtyMain.jsp";else action="RejectQtyUpdate.jsp";
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
		   <div class="col-md-12 span_6">
                 <div class="panel-heading">
                  <h3>
                    <span class="">Reject Quantity. Report</span>  
                    </h3>
                </div>
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
                    <form class="form-horizontal" name="SendToDyer" action="RejectQtyUpdate.jsp">
                     <input type="HIDDEN" name="display" value=""></input>
                  
                      <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-4 control-label">Select Supplier</label>
                                    <div class="col-sm-4">
                                            <%=mast.getSupplierListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new SOMaster name!</p>-->
                                    </div>
                                    
                                    
                       </div> 
            

		    
                    <%
                                  
      String dtlSql1="",dpId="",reason="";
      String fabName="",varName="",remarks="",sentDate="",rcvdDate="",dyerRemarks="",plainCode="",varId="0";
          float QtyOrdered=0,qtySent=0,qtyRcvd =0,qtySentBack=0,qtyPuse=0,qtyRj=0,qtyInspected=0,qtySentToInsp=0,qtyToBeSent=0,qtyPending=0;
      boolean dataAvail = false;


%>

<%
    int count=1;
    int cnt=0;
    String trClass="info", poNo="", inspDtlId="0";
    
    // get var id
    
 if(!mast.getManu().equalsIgnoreCase("0")&& !mast.getManu().equalsIgnoreCase("")){  
  dtlSql1 = "SELECT i.ID INSP_DTL_ID,pd.ID DP_ID, concat(pm.PO_NO,'-',s.NAME,'-dated.',DATE_FORMAT(PO_DATE,'%d-%b-%Y')) PO_NO, "+
  " fab.NAME FABRIC_NAME,var.ID VAR_ID,var.NAME VAR_NAME,d.NAME DYER_NAME,p.QTY, pd.QTY_SENT,i.QTY_RCVD,"+
  " DATE_FORMAT(i.SENT_DATE,'%d-%b-%Y') M_SENT_DATE,DATE_FORMAT(M_RCVD_DATE,'%d-%b-%Y') M_RCVD_DATE,i.QTY_INSPECTED,i.QTY_RJ,i.QTY_SENT_BACK,i.QTY_PUSE, "+
  " DATE_FORMAT(i.INSP_DATE,'%d-%b-%Y') INSP_DATE,REASON,SUPP_REMARKS, plain.NAME plain_code , QTY_SENT_TO_INSP, i.QTY_PENDING, i.REMARKS DYER_REMARKS"+
  " FROM t_po_master pm, t_supplier_master s,t_po_details p, t_po_dp_details pd, "+
  " t_fabric_master fab, t_var_master var, t_plain_master plain,t_dyer_master d, t_inspection_details i "+
  " where pd.PO_DTL_ID= p.ID and p.PO_ID= pm.ID and pm.SUP_ID= s.ID and p.VAR_ID= var.ID and var.FABRIC_ID= fab.ID  "+
  " and pd.TYPE_ID= plain.ID and pd.DP_ID= d.ID and i.PO_DTL_ID= p.ID and i.PO_DP_DTL_ID= pd.ID "+
  " and i.STATUS='R' and pd.TYPE_CHECK='Plain' AND ifnull(i.QTY_RJ,0)>0 AND   s.ID="+mast.getManu()+"";
  
  dtlSql1+= " union SELECT i.ID INSP_DTL_ID,pd.ID DP_ID, concat(pm.PO_NO,'-',s.NAME,'-dated.',DATE_FORMAT(PO_DATE,'%d-%b-%Y')) PO_NO, "+
  " fab.NAME FABRIC_NAME,var.ID VAR_ID,var.NAME VAR_NAME,d.NAME DYER_NAME,p.QTY, pd.QTY_SENT,i.QTY_RCVD,"+
  " DATE_FORMAT(i.SENT_DATE,'%d-%b-%Y') M_SENT_DATE,DATE_FORMAT(M_RCVD_DATE,'%d-%b-%Y') M_RCVD_DATE,i.QTY_INSPECTED,i.QTY_RJ,i.QTY_SENT_BACK,i.QTY_PUSE, "+
  " DATE_FORMAT(i.INSP_DATE,'%d-%b-%Y') INSP_DATE,REASON,SUPP_REMARKS, plain.NAME plain_code , QTY_SENT_TO_INSP, i.QTY_PENDING, i.REMARKS DYER_REMARKS"+
  " FROM t_po_master pm, t_supplier_master s,t_po_details p, t_po_dp_details pd, "+
  " t_fabric_master fab, t_var_master var, t_print_master plain,t_printer_master d, t_inspection_details i "+
  " where pd.PO_DTL_ID= p.ID and p.PO_ID= pm.ID and pm.SUP_ID= s.ID and p.VAR_ID= var.ID and var.FABRIC_ID= fab.ID  "+
  " and pd.TYPE_ID= plain.ID and pd.DP_ID= d.ID and i.PO_DTL_ID= p.ID and i.PO_DP_DTL_ID= pd.ID "+
  " and i.STATUS='R' and pd.TYPE_CHECK='Print' AND ifnull(i.QTY_RJ,0)>0 AND s.ID="+mast.getManu()+" order by INSP_DATE ASC";

    //out.println(dtlSql1);
    rs = st.executeQuery(dtlSql1);
   
   
   
  
                       while(rs.next())
                       {               
                       
                       if(cnt==0){
                       
                        %>
   <div class="form-group">                        
    <div class="col-md-12 span_3">
		  <div class="bs-example1" data-example-id="contextual-table" style='overflow-x:scroll;overflow-y:hidden;width:1150x;'>
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
		      <thead>
		        <tr>
		          <th>#</th>
                           <th>Select</th>
                           <th>PO</th>
		          <th>Fabric & Variety</th>
		        
                          <th>Dyer/Printer</th>
                          <th>Plain/Print Code</th>
                          <th>Qty. <br>ordered (in Meters)<br>( As per PO)</th>
                          <th>Qty. <br> sent from Dyer (in Meters)</th>
                          <th>Material Sent Date</th>
                          <th>Qty. <br> sent for inspection</th>
                          <th>Qty. <br> inspected & verified</th>
                          <th>Qty. <br> Rejected</th>
                          <th>Qty. <br> Sent Back to Dyer/Printer</th>
                          <th>Rejected Qty. <br> used </th>
                          <th>Use of Rejected Qty. </th>
                   
		        </tr>
		      </thead>
		      <tbody>
                      <%
                       
                       
                       }
                       
                       
                       
                        if(cnt%2==0)trClass="info";else trClass="";
                         
                           ++cnt;
                        inspDtlId= rs.getString("INSP_DTL_ID"); if (inspDtlId == null) inspDtlId="";
                        dpId=    rs.getString("DP_ID"); if (dpId == null) dpId="";
                        poNo= rs.getString("PO_NO"); if (poNo == null) poNo="";
                        fabName =rs.getString("FABRIC_NAME"); if (fabName == null) fabName="";
                        varName =rs.getString("VAR_NAME"); if (varName == null) varName="";
                        varId= rs.getString("VAR_ID"); if (varId == null) varId="0";
                        dyerName = rs.getString("DYER_NAME"); if (dyerName == null) dyerName="";
                        plainCode= rs.getString("PLAIN_CODE"); if (plainCode == null) plainCode="";
                        rcvdDate= rs.getString("M_RCVD_DATE"); if (rcvdDate == null) rcvdDate="";
                        sentDate= rs.getString("M_SENT_DATE"); if (sentDate == null) sentDate="";
                        QtyOrdered= rs.getFloat("QTY");
                        qtySent= rs.getFloat("QTY_SENT");
                        qtyRcvd= rs.getFloat("QTY_RCVD");
                        qtyPending= rs.getFloat("QTY_PENDING");
                        qtyInspected= rs.getFloat("QTY_INSPECTED");
                        qtyRj= rs.getFloat("QTY_RJ");
                        qtySentBack =rs.getFloat("QTY_SENT_BACK");
                        qtyPuse =rs.getFloat("QTY_PUSE");
                        qtySentToInsp= rs.getFloat("QTY_SENT_TO_INSP");
                        remarks= rs.getString("SUPP_REMARKS"); if (remarks == null) remarks="";
                        reason= rs.getString("REASON"); if (reason == null) reason="";
                        dyerRemarks= rs.getString("DYER_REMARKS"); if (dyerRemarks == null) dyerRemarks="";
                        dataAvail= true;
                        
                    
                         //qtyTotal+=qty;
                       %> 
                        <tr scope="row" class="<%=trClass%>">
		          <td scope="row"><%= cnt%></td>
                          <td scope="row" valign=top><div class="radio-inline"><label><input type="radio" name="inspDtlId" value=<%=inspDtlId%>></label></div></th>
                           <td align=left><%=poNo%></td>
		          <td align=left><%=fabName%>-<%=varName%></td>
		      
                          <td align=left><%=dyerName%></td>
                          
                          <td align=right><%=plainCode%></td>
		          <td align=right><%=QtyOrdered%></td>
                          <td align=right><%=qtyRcvd%></td>
                          <td align=left><%=sentDate%></td>  
                        
                          <td align=left><%=qtySentToInsp%></td>  
                          <td align=left><%=qtyInspected%></td>  
                           <td align=left><%=qtyRj%></td>
                            <td align=left><%=qtySentBack%></td>  
                             <td align=left><%=qtyPuse%></td>  
                        <!--  <td align=left><%=qtyPending%></td>  -->
                          <td align=left><%=reason%></td>
                        
                       
                   
		        </tr>
                        
                      <%
                     
                      if(trClass.equalsIgnoreCase("info"))trClass="";
                       
                      }
                      
                  if(dataAvail)
                  {
                      %>   
                     
                       </tbody>
                                        </table>
                     </table>
                     </div>
                     </div>
                 <%}%>
                 
                  <div class="but_list" align=center>
                           
                                
                                 <p>
                                 <button type="button" class="btn btn_8 btn-lg btn-warning warning_11" onclick="javascript:submitClick()"> Select and Click for Edit</button> 
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