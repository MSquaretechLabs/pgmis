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
<!-- Metis Menu Plugin JavaScript -->
<script src="/pgmis/common/js/metisMenu.min.js"></script>
<script src="/pgmis/common/js/custom.js"></script>
<!-- Graph JavaScript -->
<script src="/pgmis/common/js/d3.v3.js"></script>
<script src="/pgmis/common/js/rickshaw.js"></script>

</head>
<script language="JavaScript1.2">

function submitClick(){

if(validateForm()){ 

    document.SendToDyer.submit(); 
    }
  }  

function validateForm(){

 if(validateFormFields())
 {  if(document.SendToDyer.display.value != "display"){
   var check = confirm("Do you want to Save?")
   if(check){
   document.SendToDyer.display.value="save";
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

 if(document.SendToDyer.display.value != "display")
 {
   var reason = "";
  
  
   if (reason != "") {
    alert("Some fields need correction:\n" + reason);
    return false;
  }
 
}
return true;
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
 String dyerName="";
 
 String inspDtlId="";
 
 inspDtlId= request.getParameter("inspDtlId"); if(inspDtlId==null)inspDtlId="0";
 
  if(display.equalsIgnoreCase("save"))
 {
     
    
      String remarks=request.getParameter("remarks"); if(remarks==null)remarks="";
     
       
      String fabricId= request.getParameter("fabricId"); if(fabricId==null)fabricId="0";
      String varId= request.getParameter("varId"); if(varId==null)varId="0";
      String typeCheck= request.getParameter("typeCheck"); if(typeCheck==null)typeCheck="";
      String typeId= request.getParameter("typeId"); if(typeId==null)typeId="";
      String rackNo= request.getParameter("rackNo"); if(rackNo==null)rackNo="";
      String qtyRcvd= request.getParameter("qtyRcvd"); if(qtyRcvd==null)qtyRcvd="";
      boolean dataPresent=false;
      float qty=0;
      
      String chkSql= "SELECT QTY FROM t_stock_master where FABRIC_ID="+fabricId+" AND VAR_ID="+varId+" AND"+
      "  TYPE_CHECK='"+typeCheck+"' AND TYPE_ID="+typeId+"";
      //out.println(chkSql);
       rs= st.executeQuery(chkSql);
       if(rs.next()){
       dataPresent= true;
       qty= rs.getFloat("QTY");
       }
       
       if(dataPresent)
       {
      
        
       
       
       String sqlUpdateStock="UPDATE t_stock_master set QTY= QTY+"+qtyRcvd+" ,RACK_NO='"+rackNo+"' "+
       " where FABRIC_ID="+fabricId+" AND VAR_ID="+varId+" "+
      "  AND TYPE_CHECK='"+typeCheck+"' AND TYPE_ID="+typeId+"";
       //out.println(sqlUpdateStock);
       int x=st.executeUpdate(sqlUpdateStock);
       }else
       {
       
         String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_stock_master";
         //out.println(maxIdSql);
         rs= st.executeQuery(maxIdSql);
         int maxId=1;
         if(rs.next())
         {
         maxId= rs.getInt("MAX_ID");
         }else maxId=1;
          
        if(maxId==0)maxId=1;          
       
        String sqlInsert="INSERT t_stock_master (ID,FABRIC_ID,VAR_ID,TYPE_CHECK,TYPE_ID,QTY,RACK_NO)VALUES"+
        "("+maxId+", "+fabricId+", "+varId+", '"+typeCheck+"',"+typeId+","+qtyRcvd+",'"+rackNo+"')";
     
       //out.println(sqlInsert);
       int x=st.executeUpdate(sqlInsert);
       
       
       }
       
  
  
      String sqlUpdate="UPDATE t_inspection_details set STOCK_REMARKS='"+remarks+"', STOCK_RCVD='Y' where ID="+inspDtlId+"";
    // out.println(sqlUpdate);
      int x=st.executeUpdate(sqlUpdate);
     
      // now check the stock position
      
     
    
     
     message= "Material has been received from Inspection Department Successfully. Stock has been updated.";
  }
 
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
                  <h1>
                    <span class="label btn_6 label-success">Receive Material in Stock from Inspection Department</span>  
                    </h1>
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
                    <form class="form-horizontal" name="SendToDyer">
                      <input type="HIDDEN" name="display" value=""></input>
                      
                      <input type="HIDDEN" name="inspDtlId" value="<%=inspDtlId%>"></input>
                     
             
            

		    
                    <%
                                  
      String dtlSql1="";
      String fabName="",varName="",remarks="",sentDate="",rcvdDate="",plainCode="",inspDate="",inspRemarks="";
      float QtyOrdered=0,qtySent=0,qtyRcvd=0,qtySentToInsp=0,qtyToBeSent=0,qtyPending=0,qtyInspected=0;
      boolean dataAvail = false;


%>

<%
    int count=1;
    int cnt=0;
    String trClass="info", poNo="",poDtlId="0";
    
    // get var id
    
   
  dtlSql1 = "SELECT i.ID INSP_DTL_ID,pd.ID DP_ID, concat(pm.PO_NO,'-',s.NAME,'-dated.',DATE_FORMAT(PO_DATE,'%d-%b-%Y')) PO_NO, "+
  " fab.NAME FABRIC_NAME,var.ID VAR_ID,var.NAME VAR_NAME,d.NAME DYER_NAME,p.QTY, pd.QTY_SENT,i.QTY_RCVD,"+
  " DATE_FORMAT(i.SENT_DATE,'%d-%b-%Y') M_SENT_DATE,DATE_FORMAT(M_RCVD_DATE,'%d-%b-%Y') M_RCVD_DATE,"+
  " SUPP_REMARKS, plain.NAME plain_code , QTY_SENT_TO_INSP, i.QTY_PENDING, i.REMARKS DYER_REMARKS,INSP_REMARKS,"+
  " i.QTY_INSPECTED,DATE_FORMAT(i.INSP_DATE,'%d-%b-%Y') INSP_DATE, "+
  " fab.ID FABRIC_ID,pd.TYPE_CHECK,pd.TYPE_ID,plain.NAME TYPE_NAME, plain.IMAGE "+
  " FROM t_po_master pm, t_supplier_master s,t_po_details p, t_po_dp_details pd, "+
  " t_fabric_master fab, t_var_master var, t_plain_master plain,t_dyer_master d, t_inspection_details i "+
  " where pd.PO_DTL_ID= p.ID and p.PO_ID= pm.ID and pm.SUP_ID= s.ID and p.VAR_ID= var.ID and var.FABRIC_ID= fab.ID  "+
  " and pd.TYPE_ID= plain.ID and pd.DP_ID= d.ID and i.PO_DTL_ID= p.ID and i.PO_DP_DTL_ID= pd.ID "+
  " and i.STATUS='R' and pd.TYPE_CHECK='Plain' and i.INSP_DATE IS NOT NULL AND STOCK_RCVD is null and i.ID="+inspDtlId+"";
    //out.println(dtlSql1);
 
 dtlSql1+=" union SELECT i.ID INSP_DTL_ID,pd.ID DP_ID, concat(pm.PO_NO,'-',s.NAME,'-dated.',DATE_FORMAT(PO_DATE,'%d-%b-%Y')) PO_NO, "+
  " fab.NAME FABRIC_NAME,var.ID VAR_ID,var.NAME VAR_NAME,printer.NAME DYER_NAME,p.QTY, pd.QTY_SENT,i.QTY_RCVD,"+
  " DATE_FORMAT(i.SENT_DATE,'%d-%b-%Y') M_SENT_DATE,DATE_FORMAT(M_RCVD_DATE,'%d-%b-%Y') M_RCVD_DATE,"+
  " SUPP_REMARKS, print.NAME plain_code , QTY_SENT_TO_INSP, i.QTY_PENDING, i.REMARKS DYER_REMARKS,INSP_REMARKS,"+
  " i.QTY_INSPECTED,DATE_FORMAT(i.INSP_DATE,'%d-%b-%Y') INSP_DATE, "+
  " fab.ID FABRIC_ID,pd.TYPE_CHECK,pd.TYPE_ID,print.NAME TYPE_NAME, print.IMAGE "+
  " FROM t_po_master pm, t_supplier_master s,t_po_details p, t_po_dp_details pd, "+
  " t_fabric_master fab, t_var_master var, t_print_master print,t_printer_master printer, t_inspection_details i "+
  " where pd.PO_DTL_ID= p.ID and p.PO_ID= pm.ID and pm.SUP_ID= s.ID and p.VAR_ID= var.ID and var.FABRIC_ID= fab.ID  "+
  " and pd.TYPE_ID= print.ID and pd.DP_ID= printer.ID and i.PO_DTL_ID= p.ID and i.PO_DP_DTL_ID= pd.ID "+
  " and i.STATUS='R' and pd.TYPE_CHECK='Print' and i.INSP_DATE IS NOT NULL AND STOCK_RCVD is null and i.ID="+inspDtlId+"";
 

 
    rs = st.executeQuery(dtlSql1);
    String remarks2="",dyerRemarks="",varId="",typeName="",image="";
   
   
  
                       if(rs.next())
                       {
                       
                        inspDtlId= rs.getString("INSP_DTL_ID"); if (inspDtlId == null) inspDtlId="";
                       // dpId=    rs.getString("DP_ID"); if (dpId == null) dpId="";
                        poNo= rs.getString("PO_NO"); if (poNo == null) poNo="";
                        fabName =rs.getString("FABRIC_NAME"); if (fabName == null) fabName="";
                        varName =rs.getString("VAR_NAME"); if (varName == null) varName="";
                       
                        dyerName = rs.getString("DYER_NAME"); if (dyerName == null) dyerName="";
                        plainCode= rs.getString("PLAIN_CODE"); if (plainCode == null) plainCode="";
                        rcvdDate= rs.getString("M_RCVD_DATE"); if (rcvdDate == null) rcvdDate="";
                        sentDate= rs.getString("M_SENT_DATE"); if (sentDate == null) sentDate="";
                        QtyOrdered= rs.getFloat("QTY");
                        qtySent= rs.getFloat("QTY_SENT");
                        qtyRcvd= rs.getFloat("QTY_RCVD");
                        qtyPending= rs.getFloat("QTY_PENDING");
                        qtySentToInsp= rs.getFloat("QTY_SENT_TO_INSP");
                        remarks= rs.getString("SUPP_REMARKS"); if (remarks == null) remarks="";
                        dyerRemarks= rs.getString("DYER_REMARKS"); if (dyerRemarks == null) dyerRemarks="";
                        inspRemarks= rs.getString("INSP_REMARKS"); if (inspRemarks == null) inspRemarks="";
                        inspDate= rs.getString("INSP_DATE"); if (inspDate == null) inspDate="";
                         qtyInspected= rs.getFloat("QTY_INSPECTED");
                        dataAvail= true;
                        
                        typeName=rs.getString("TYPE_NAME"); if (typeName == null) typeName="";
                        image=rs.getString("IMAGE"); if (image == null) image="";
                        
                          String fabricId= rs.getString("FABRIC_ID"); if(fabricId==null)fabricId="0";
                          varId= rs.getString("VAR_ID"); if (varId == null) varId="0";
                          String typeCheck= rs.getString("TYPE_CHECK"); if(typeCheck==null)typeCheck="";
                          String typeId= rs.getString("TYPE_ID"); if(typeId==null)typeId="";
                        
                        // also get the rack no.
                         String tempRackNo="";
                         float qtyAvailable=0;
                          String chkSql2= "SELECT QTY,RACK_NO FROM t_stock_master where FABRIC_ID="+fabricId+" AND VAR_ID="+varId+""+
                          "  AND TYPE_CHECK='"+typeCheck+"' AND TYPE_ID="+typeId+"";
                          //out.println(chkSql2);
                           rs2= st2.executeQuery(chkSql2);
                           if(rs2.next()){
                            tempRackNo= rs2.getString("RACK_NO");if(tempRackNo==null)tempRackNo="";
                            qtyAvailable= rs2.getFloat("QTY");
                           }else {
                           qtyAvailable=0;
                           }
                         //  out.println(qtyAvailable);
                        float totalQty= qtyAvailable+qtyInspected;
                        
                        
                       %>
                       
                          
       
                                <div class="form-group"> 
                             
                                     <input type="HIDDEN" name="inspDtlId" value="<%=inspDtlId%>">
                                     <input type="HIDDEN" name="fabricId" value="<%=fabricId%>">
                                     <input type="HIDDEN" name="varId" value="<%=varId%>">
                                     <input type="HIDDEN" name="typeCheck" value="<%=typeCheck%>">
                                     <input type="HIDDEN" name="typeId" value="<%=typeId%>">
                                      <input type="HIDDEN" name="qtyRcvd" value="<%=qtyInspected%>">
                                    
                                    <label for="selector1" class="col-sm-4 control-label"><b>PO No: </b><%= poNo%></label>
                                    <label for="selector1" class="col-sm-4 control-label"><b>Fabric and Variety: </b><%=fabName%>-<%=varName%></label>
                                   
                                    
                            </div>
       
                              <div class="form-group"> 
                          
                                    <label for="selector1" class="col-sm-4 control-label"><b>Type of Material: </b><%= typeCheck%>(<%= typeName%>)
                                    <img height="42" width="42" src="/pgmis/images/prints/<%=image%>" alt=""/>
                                    </label>
                                    <label for="selector1" class="col-sm-4 control-label"><b>Dyer/Printer: </b><%=dyerName%></label>
                                   
                                    
                            </div>
                          
                            
                              <div class="form-group"> 
                          
                                    <label for="selector1" class="col-sm-4 control-label"><b>Qty.ordered (in Meters) (As per PO): </b><%= QtyOrdered%></label>
                                    <label for="selector1" class="col-sm-4 control-label"><b>Qty. sent for inspection: </b><%=qtySentToInsp%></label>
                                   
                                    
                            </div>
                          <div class="form-group"> 
                          
                                    <label for="selector1" class="col-sm-4 control-label"><b>Qty. Inspected: </b><%= qtyInspected%></label>
                                    <label for="selector1" class="col-sm-4 control-label"><b>Qty. Available in Stock: </b><%=qtyAvailable%></label>
                                   
                                    
                            </div>
                          
                           
                       <div class="form-group"> 
                          
                                    <label for="selector1" class="col-sm-4 control-label"><b>Total Qty. in Stock After receving material: </b><%= totalQty%></label>
                                    <label for="selector1" class="col-sm-4 control-label"><b>Date of Inspection: </b><%=inspDate%></label>
                                   
                                    
                            </div>
                            
                         
                            
                           
                            
                         
                            
                            <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Supplier Remarks</label>
                                    <label for="selector1" class="col-sm-2 control-label"> <%=remarks%></label>
                                
                            </div>
                            <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Dyer/ Printer Remarks</label>
                                    <label for="selector1" class="col-sm-2 control-label"> <%=dyerRemarks%></label>
                                 
                            </div>
                             <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Inspector Remarks</label>
                                    <label for="selector1" class="col-sm-2 control-label"> <%=inspRemarks%></label>
                                   
                            </div>
                           
                         
                         
                       
                      
                           
                            
                           <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Rack No.</label>
                                    <div class="col-sm-2">
                                            <input type="text" size=2 class="form-control1" name="rackNo" id="rackNo"  value="<%= tempRackNo%>" placeholder="">

                                    </div>
                                 
                                    
                                    
                            </div>      
                       
                      
                       
                       <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Remarks </label>
                                    <div class="col-sm-6">
                                             <input type="text" class="form-control1" name="remarks" id="remarks" placeholder="Remarks">

                                    </div>
                                 
                                    
                                    
                            </div>    
	               
                         <div class="but_list" align=center>
                           
                                 <p> </p>
                                 <p>
                                 <button type="button" class="btn btn_8 btn-lg btn-warning warning_11" onclick="javascript:submitClick()" >Save</button> 
                                 
                                 <button type="button" class="btn btn_8 btn-lg btn-warning warning_11" onclick="ReceiveAtStock.jsp" >Back </button> 
                                 </p>
                            </div>
                            
                      <%}else {%>
                      <div class="but_list" align=center>
                           
                                 <p> </p>
                             <button type="button" class="btn btn_8 btn-lg btn-warning warning_11" onclick="ReceiveAtStock.jsp" >Back </button> 
                                 </p>
                            </div>
                            
                     <%}%> 
                   </form>
                  
                   
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