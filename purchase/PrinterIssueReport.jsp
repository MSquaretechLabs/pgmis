<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="mast" scope="request" class="administration.POMaster"></jsp:useBean>
<jsp:setProperty name="mast" property="*"/>
<jsp:useBean id="forNum" scope="request" class="lib.util.FormatNum"></jsp:useBean>
<script language="javascript" type="text/javascript" src="/pgmis/misc/calendar_us.js"></script>
<script type="text/javascript" language="JavaScript1.2" src="/pgmis/misc/date_format.js"></script>
<script language="javascript" typef="text/javascript" src="/pgmis/misc/datetimepicker.js"></script>
<title>Purchase:Pushkar Ganesh Cotton Club Export Pvt. Ltdf.</title>
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
<script language="JavaScript1.2">

function submitClick(){

if(validateForm()){ 
    document.POMaster.submit(); 
    }
  }  

function validateForm(){

 if(validateFormFields())
 {  if(document.POMaster.display.value != "display"){
   var check = confirm("Do you want to Save?")
   if(check){
   document.POMaster.display.value="save";
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
  document.POMaster.display.value = "display";
  document.POMaster.submit();
  }
  
  function PrintThisPage()
{ 
  var disp_setting="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
      disp_setting+="scrollbars=yes,width=900, height=600, left=50, top=25"; 
  var content_vlue = document.getElementById("print_content").innerHTML; 
  
  var docprint=window.open("","",disp_setting); 
   docprint.document.open(); 
   docprint.document.write('<html><head><title>PGMIS</title><link rel="stylesheet" type="text/css" href="css/style.css">'); 
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
 
 String display=request.getParameter("display"); if(display==null)display="";
// out.println(display);
 
 
 
%>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            
               <%@ include file="PurchaseHeader.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
        <div class="graphs">
     	
      <div class="col_1">
		   <div class="col-md-12 span_6">
                 <div class="panel-heading">
                    <h4 class="panel-title">Printer Issue Report</h4>
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
                    <form class="form-horizontal" name="POMaster">
                    
                       <div class="form-group">
                            <input type="HIDDEN" name="display" value=""></input>
                                    <label for="selector1" class="col-sm-2 control-label">Select PO</label>
                                    <div class="col-sm-4">
                                            <%=mast.getVPOSupllierMasterList()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new POMaster name!</p>-->
                                    </div>
                        </div>
                        
                        <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-2 control-label">Select Printer</label>
                                    <div class="col-sm-4">
                                            <%=mast.getPOPrinterListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new POMaster name!</p>-->
                                    </div>
                        </div> 
                          <div class="style3" id="print_content">
 <%                           
      String dtlSql="";
 String supNameDisp ="",id="",poNo="",fab="",sup="",poDate="",dDate="",createdBy="",bookNo="";     
if(!mast.getPrinter().equalsIgnoreCase("0")){ 

  dtlSql = "SELECT A.ID,  A.PO_NO PO_NO , A.SUP_ID ,DATE_FORMAT(PO_DATE,'%d-%b-%Y') PO_DATE ,CREATED_BY,BOOK_NO"+ 
            ",PO_STATUS, M.NAME SUP_NAME ,  DATE_FORMAT( A. EXP_DLV_DATE,'%d-%b-%Y') EXP_DLV_DATE FROM t_po_master A, t_supplier_master M "+
            " WHERE A.SUP_ID= M.ID "+
            " AND A.ID = "+mast.getPo()+"";
    //out.println(dtlSql);
    rs = st.executeQuery(dtlSql);
   
    id="";
    
    if(rs.next()){
    id = rs.getString("ID");
    poNo =rs.getString("PO_NO"); if (poNo == null) poNo="";
    sup = rs.getString("SUP_ID"); if (sup == null) sup="";
    poDate = rs.getString("PO_DATE");if (poDate == null) poDate="";
    dDate= rs.getString("EXP_DLV_DATE");if (dDate == null) dDate="";
    supNameDisp= rs.getString("SUP_NAME");if(supNameDisp==null)supNameDisp="";
    createdBy= rs.getString("CREATED_BY"); if(createdBy==null)createdBy="";
    bookNo= rs.getString("BOOK_NO"); if(bookNo==null)bookNo="";
    }
   String printerNameD="";
    String dSql="SELECT NAME FROM t_printer_master where ID="+mast.getPrinter()+"";
           rs = st.executeQuery(dSql);
           if(rs.next())
           {
           printerNameD=rs.getString("NAME");if(printerNameD==null)printerNameD="";
           
           }else printerNameD="";
  
  
  %>        
<div class="form-group">                        
    <div class="col-md-12 span_4">
		  <div class="bs-example1" data-example-id="contextual-table">
		
      <table width=90%>
      
      
       <tr><td valign=top nowrap=nowrap align=center colspan=2><b> Printer Issue Report<br><br> </b></th>
      
       </tr>
      
      
       <tr><td valign=top nowrap=nowrap>
       <b>Pushkar Ganesh Cotton Club Exportr Pvt. Ltd  <br> Near Krishna Guest House, Pushkar- 305 022 (India)
       <br>
       Phone: 0145-2772661,2772661 Mob: 9414667265
           <td align=right valign=top>
             <table class="table" border=0>
             <tr><td valign=top> PO No. </th> <td><%= bookNo%><td nowrap=nowrap>Date:<%= poDate%></td> 
             <tr><td valign=top> Supplier </th> <td nowrap=nowrap><%= supNameDisp%></td> 
             <tr><td valign=top nowrap=nowrap> Delivery Date </td> <td><%= dDate%></td> 
             </table> 
       </td>
       </tr>
           
     <tr><td valign=top nowrap=nowrap>
      <b> Quantity Sent to Printer:-<%=printerNameD%></b>
      </td> 
       </tr>
     <tr> 
     <td colspan=2>
     <%
          
           
           String fabName="",dyerName="",varName="",remarks="",sentDate="",inspSentDate="",plainCode="",varId="0",expDlvDate ="";
           float QtyOrdered=0,qtySent=0,qtyShrink=0,qtySentToInsp=0,qtySentToInspTotal=0,qtyInsp=0,qtyInspTotal=0,qtyToBeSentTotal=0;
           float QtyOrderedTotal=0,qtySentTotal=0,qtySentTotalTemp=0,qtyShrinkMtrs=0,qtyToBeSent=0;
           String poDpDtlId="0",poDtlId="0",sql2="",mtrCharge="";
           float qtyShrinkTotal=0;
           boolean dataAvail= false;
           int cnt=0;
          String sql = "SELECT p.ID PO_DTL_ID,pd.ID PO_DP_DTL_ID,fab.NAME FABRIC_NAME,var.ID VAR_ID,var.NAME VAR_NAME,d.NAME DYER_NAME,p.QTY, pd.QTY_SENT,pd.QTY_SHRINK_PRSNT,"+
          " ifnull(pd.QTY_SENT_TO_INSP,0) QTY_SENT_TO_INSP, ifnull(pd.QTY_SHRINK,0) QTY_SHRINK,MTR_CHARGE,"+
          " DATE_FORMAT(M_INSP_SENT_DATE,'%d-%b-%Y') M_INSP_SENT_DATE,"+
          " DATE_FORMAT(M_SENT_DATE,'%d-%b-%Y') M_SENT_DATE,DATE_FORMAT(EXP_DLV_DATE,'%d-%b-%Y') EXP_DLV_DATE,SUPP_REMARKS, plain.NAME plain_code "+
          " FROM t_po_details p, t_po_dp_details pd, t_fabric_master fab, t_var_master var, t_print_master plain,t_printer_master d "+
          " where pd.PO_DTL_ID= p.ID and p.VAR_ID= var.ID and var.FABRIC_ID= fab.ID  and pd.TYPE_ID= plain.ID and pd.DP_ID= d.ID "+
          " and pd.TYPE_CHECK='Print' and p.PO_ID="+mast.getPo()+" AND pd.DP_ID="+mast.getPrinter()+"";
          /* 
           sql+= " union SELECT p.ID PO_DTL_ID,pd.ID PO_DP_DTL_ID,fab.NAME FABRIC_NAME,var.ID VAR_ID,var.NAME VAR_NAME,d.NAME DYER_NAME,p.QTY, pd.QTY_SENT,pd.QTY_SHRINK_PRSNT,"+
          " ifnull(pd.QTY_SENT_TO_INSP,0) QTY_SENT_TO_INSP,"+
          " DATE_FORMAT(M_INSP_SENT_DATE,'%d-%b-%Y') M_INSP_SENT_DATE,"+
          " DATE_FORMAT(M_SENT_DATE,'%d-%b-%Y') M_SENT_DATE,DATE_FORMAT(EXP_DLV_DATE,'%d-%b-%Y') EXP_DLV_DATE,SUPP_REMARKS, plain.NAME plain_code "+
          " FROM t_po_details p, t_po_dp_details pd, t_fabric_master fab, t_var_master var, t_print_master plain,t_printer_master d "+
          " where pd.PO_DTL_ID= p.ID and p.VAR_ID= var.ID and var.FABRIC_ID= fab.ID  and pd.TYPE_ID= plain.ID and pd.DP_ID= d.ID "+
          " and pd.TYPE_CHECK='Print' and p.PO_ID="+mast.getPo()+"";
          */
          sql+= " ORDER BY M_SENT_DATE DESC";
            //out.println(sql);
            rs = st.executeQuery(sql);
              
             
                    rs= st.executeQuery(sql);
                    String trClass="info";
                    %>
                    <div class="panel-body no-padding" style="display: block;">
                    <table class="table table-striped"  border = "1" align="left" cellspacing = "1" cellpadding="1" style="border-collapse: collapse">
		      <thead>
		        <tr>
		          <th>#</th>
		          <th>Fabric &<br> Variety</th>
		          <th>Plain/Print</th>
                          <th>Qty. Sent     (in Meters)</th>
                      <th>Estimated Shrink<br> Qty.(%)</th>
                          <th>Actual Shrink<br> Qty.</th>
                              <th>Meter Charge</th>
                          <th>Expected <br>Delivery Date<br> by Dyer</th>
                          <th>Qty Sent for Inspection</th>
                          <th>Qty Inspected and Updated in Stock</th>
                          <th>Qty Pending</th>
		        </tr>
		      </thead>
		      <tbody>
                      <%
                       while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                        poDtlId=rs.getString("PO_DTL_ID"); if (poDtlId == null) poDtlId="0";
                        poDpDtlId= rs.getString("PO_DP_DTL_ID"); if (poDpDtlId == null) poDpDtlId="0";
                        fabName =rs.getString("FABRIC_NAME"); if (fabName == null) fabName="";
                        varName =rs.getString("VAR_NAME"); if (varName == null) varName="";
                        varId= rs.getString("VAR_ID"); if (varId == null) varId="0";
                        dyerName = rs.getString("DYER_NAME"); if (dyerName == null) dyerName="";
                        plainCode= rs.getString("PLAIN_CODE"); if (plainCode == null) plainCode="";
                        sentDate= rs.getString("M_SENT_DATE"); if (sentDate == null) sentDate="";
                        inspSentDate= rs.getString("M_INSP_SENT_DATE"); if (inspSentDate == null) inspSentDate="";
                        expDlvDate= rs.getString("EXP_DLV_DATE"); if (expDlvDate == null) expDlvDate="";
                        QtyOrdered= rs.getFloat("QTY");
                        qtySentToInsp= rs.getFloat("QTY_SENT_TO_INSP");
                        qtySent= rs.getFloat("QTY_SENT");
                        remarks= rs.getString("SUPP_REMARKS"); if (remarks == null) remarks="";
                        qtyShrink= rs.getFloat("QTY_SHRINK_PRSNT");
                         qtyShrinkMtrs= rs.getFloat("QTY_SHRINK");
                       
                        dataAvail= true;
                        mtrCharge=rs.getString("MTR_CHARGE"); if (mtrCharge == null) mtrCharge="";
                        
                       qtySentTotalTemp+=qtySent;
                       qtySentToInspTotal+=qtySentToInsp;
                       
                          // get inspection details
                      
                      
                       sql2 = "SELECT SUM(ifnull(QTY_INSPECTED,0)) QTY_INSPECTED"+
                      " FROM t_inspection_details where  PO_DTL_ID="+poDtlId+" "+
                      " AND PO_DP_DTL_ID="+poDpDtlId+" AND STOCK_RCVD='Y'";
                     
                      rs2= st2.executeQuery(sql2);
                      if(rs2.next()){
                      qtyInsp= rs2.getFloat("QTY_INSPECTED");
                      }else qtyInsp=0;
                      qtyInspTotal+=qtyInsp; 
                      /*
                       try{
                        qtyShrinkMtrs= ((qtySent*qtyShrink)/100);
                        }catch(Exception rt){
                        qtyShrinkMtrs=0;
                        }
                        */
                        qtyShrinkTotal+=qtyShrinkMtrs;
                        
                      try{
                        qtyToBeSent= qtySent-qtyInsp-qtyShrinkMtrs;
                        }catch(Exception rt){
                        qtyToBeSent=0;
                        }
                        qtyToBeSentTotal+=qtyToBeSent;
                       //qtyTotal+=qty;
                       %> 
                        <tr scope="row" class="<%=trClass%>">
		          <th scope="row"><%= cnt%></th>
		          <td align=left><%=fabName%><br>-<%=varName%></td>
		        
                         <!-- <td align=left><%=dyerName%></td>-->
                          
                          <td align=left><%=plainCode%></td>
		        <!--  <td align=right><%=QtyOrdered%></td>-->
                         
                          <td align=center><%=qtySent%><br>on&nbsp;<%=sentDate%></td>
                         <td align=center><%=qtyShrink%>&nbsp;%</td>
                           <td align=center><%=qtyShrinkMtrs%>&nbsp;m</td>
                             <td align=center><%=mtrCharge%></td>
                          <td align=left><%=expDlvDate%></td> 
                          <td align=center><%=qtySentToInsp%><br>&nbsp;<%=inspSentDate%></td>
                          <td align=CENTER><%=qtyInsp%></td>
                           <td align=CENTER><%=qtyToBeSent%></td>
		        </tr>
                        
                      <%
                      
                   
                      
                      if(trClass.equalsIgnoreCase("info"))trClass="";
                       
                      }
                      %>
                      <tr scope="row" class="warning">
		          <th scope="row" colspan=3><b>Total</th>
		          <td align=CENTER><b><%=forNum.returnFormat2(qtySentTotalTemp)%></td>
		    
                           <td></td>       <td align=CENTER><b><%=forNum.returnFormat2(qtyShrinkTotal)%></td><td></td><td></td>
                           <td align=CENTER><b><%=forNum.returnFormat2(qtySentToInspTotal)%></td>
                          <td align=CENTER><b><%=forNum.returnFormat2(qtyInspTotal)%></td>
                           <td align=CENTER><b><%=forNum.returnFormat2(qtyToBeSentTotal)%></td>
		        </tr>
		      </tbody>
		    </table>
                    </div>
      </td>
      </tr>
       
     </table>
             
		   </div>
                   
                   
	   </div>                         
     
    </div>     
    </div>
                           
                            <div class="but_list" align=center>
                           
                                 <p>        
                                 <button type="button" class="btn btn_5 btn-lg btn-warning warning_11" onclick="javascript:PrintThisPage()" >Print</button> 
                                      
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

