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
   
   var qtyReadyN= Number(document.SendToDyer.qtyReady.value);
   var qtyAlreadySent= Number(document.SendToDyer.qtySentToInsp.value);
   var qtySentN= Number(document.SendToDyer.qtySent.value);
   var QtySentT= qtyAlreadySent+qtySentN;
   
   
   if(document.SendToDyer.sentDate.value=="")
   {
   reason+="Please Enter Date of material sent for inspection.\n";
   }else if(document.SendToDyer.qtySent.value=="")
   {
   reason+="Please Qty to be sent for inspection.\n";
   }else if(QtySentT>qtyReadyN)
   {
   //reason+="Qty Sent can not be more than Qty Ready. Please enter correct value\n";
   }
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
 
 String dpId="";
 dpId= request.getParameter("dpId"); if(dpId==null)dpId="";
 
  if(display.equalsIgnoreCase("save"))
 {
     
     String poDtl= request.getParameter("poDtl"); if(poDtl==null)poDtl="0";
     String sentDate=request.getParameter("sentDate"); if(sentDate==null)sentDate="";
     String qtySent=request.getParameter("qtySent"); if(qtySent==null)qtySent="0";
     String remarks=request.getParameter("remarks"); if(remarks==null)remarks="";
     String  qtyOrdered= request.getParameter("qtyOrdered"); if(qtyOrdered==null)qtyOrdered="0";
     String qtyShrink= request.getParameter("qtyShrink"); if(qtyShrink==null)qtyShrink="0";
     float qtyOrderedInt=0;
    // out.println(qtyOrdered);
                         try{
                        qtyOrderedInt= Float.parseFloat(qtyOrdered);
                        }catch(Exception rt){
                        qtyOrderedInt=0;
                        }

     
     
      int maxId=0;
     String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_inspection_details";
     //out.println(maxIdSql);
     rs= st.executeQuery(maxIdSql);
     
     if(rs.next())
     {
     maxId= rs.getInt("MAX_ID");
     }else maxId=1;
    
     if(maxId==0)maxId=1; 
     
    
     
      String sqlUpdate="UPDATE t_po_dp_details set M_INSP_SENT_DATE='"+sentDate+"' ,"+
     " QTY_SENT_TO_INSP=ifnull(QTY_SENT_TO_INSP,0)+"+qtySent+", QTY_SHRINK="+qtyShrink+" where id="+dpId+"";
    // out.println(sqlUpdate);
      int x=st.executeUpdate(sqlUpdate);
     
     String sqlCheck= "select QTY_SENT_TO_INSP from t_po_dp_details  where id="+dpId+"";
     rs= st.executeQuery(sqlCheck);
     float qt=0;
     if(rs.next()){
     qt= rs.getFloat("QTY_SENT_TO_INSP");
     }
    float qtyPending= qtyOrderedInt-qt;
     
       String sqlInsert="INSERT INTO t_inspection_details"+
     " (ID,PO_DTL_ID,PO_DP_DTL_ID,QTY_RCVD,SENT_DATE,STATUS,TRANS_DATE, REMARKS,QTY_PENDING) VALUES "+
     " ("+maxId+","+poDtl+","+dpId+",'"+qtySent+"','"+sentDate+"','S',SYSDATE(),'"+remarks+"',"+qtyPending+")"; 
     //out.println(sqlInsert);
     int y=st.executeUpdate(sqlInsert);
     
     message= "Material has been sent for inspection successfully.";
  }
 
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
                  <h1>
                    <span class="label btn_6 label-success">Receive Material from Dyer</span>  
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
                      <input type="HIDDEN" name="dpId" value="<%=dpId%>"></input>
                     
             
            

		    
                    <%
                                  
      String dtlSql1="";
      String fabName="",varName="",remarks="",sentDate="",rcvdDate="",plainCode="",varId="0";
      float QtyOrdered=0,qtyReady=0,qtySent=0,qtyRcvd=0,qtySentToInsp=0,qtyToBeSent=0,qtyShrink=0,qtyShrinkMtrs=0,qtyRj=0;
      boolean dataAvail = false;


%>

<%
    int count=1;
    int cnt=0;
    String trClass="info", poNo="",poDtlId="0";
    
    // get var id
    
   
   dtlSql1 = "SELECT p.ID PO_DTL_ID,pd.ID DP_ID, concat(pm.PO_NO,'-',s.NAME,'-dated.',DATE_FORMAT(PO_DATE,'%d-%b-%Y')) PO_NO, "+
  " fab.NAME FABRIC_NAME,var.ID VAR_ID,var.NAME VAR_NAME,d.NAME DYER_NAME,p.QTY, pd.QTY_SENT,pd.QTY_RCVD,ifnull(pd.QTY_SHRINK_PRSNT,0) QTY_SHRINK_PRSNT,ifnull(pd.QTY_READY,0) QTY_READY,ifnull(pd.QTY_RJ,0) QTY_RJ,"+
  " DATE_FORMAT(M_SENT_DATE,'%d-%b-%Y') M_SENT_DATE,DATE_FORMAT(M_RCVD_DATE,'%d-%b-%Y') M_RCVD_DATE,"+
  " SUPP_REMARKS, plain.NAME plain_code , QTY_SENT_TO_INSP, ifnull(QTY_SHRINK,0) QTY_SHRINK, (QTY_RCVD-QTY_SENT_TO_INSP) QTY_TO_BE_SENT"+
  " FROM t_po_master pm, t_supplier_master s,t_po_details p, t_po_dp_details pd, t_fabric_master fab, t_var_master var, t_plain_master plain,t_dyer_master d "+
  " where pd.PO_DTL_ID= p.ID and p.PO_ID= pm.ID and pm.SUP_ID= s.ID AND p.VAR_ID= var.ID and var.FABRIC_ID= fab.ID  and pd.TYPE_ID= plain.ID and pd.DP_ID= d.ID"+
  " and pd.STATUS='R' and pd.TYPE_CHECK='Plain'   and pd.ID="+dpId+" order by pd.M_SENT_DATE ASC";
    //out.println(dtlSql1);
    rs = st.executeQuery(dtlSql1);
    String remarks2="",dyerRemarks="";
   
   
  
                       if(rs.next())
                       {
                       
                        poNo= rs.getString("PO_NO"); if (poNo == null) poNo="";
                        fabName =rs.getString("FABRIC_NAME"); if (fabName == null) fabName="";
                        varName =rs.getString("VAR_NAME"); if (varName == null) varName="";
                        varId= rs.getString("VAR_ID"); if (varId == null) varId="0";
                        dyerName = rs.getString("DYER_NAME"); if (dyerName == null) dyerName="";
                        plainCode= rs.getString("PLAIN_CODE"); if (plainCode == null) plainCode="";
                        sentDate= rs.getString("M_SENT_DATE"); if (sentDate == null) sentDate="";
                        rcvdDate= rs.getString("M_RCVD_DATE"); if (rcvdDate == null) rcvdDate="";
                        QtyOrdered= rs.getFloat("QTY");
                        qtySent= rs.getFloat("QTY_SENT");
                        qtyRcvd= rs.getFloat("QTY_RCVD");
                        qtyRj= rs.getFloat("QTY_RJ");
                        qtySentToInsp= rs.getFloat("QTY_SENT_TO_INSP");
                        remarks2= rs.getString("SUPP_REMARKS"); if (remarks2 == null) remarks2="";
                        qtyShrink= rs.getFloat("QTY_SHRINK_PRSNT");
                        qtyReady= rs.getFloat("QTY_READY");
                        qtyShrinkMtrs= rs.getFloat("QTY_SHRINK");
                         
                        //dyerRemarks= rs.getString("DYER_REMARKS"); if (dyerRemarks == null) dyerRemarks="";
                        /*
                        try{
                        qtyShrinkMtrs= ((qtyRcvd*qtyShrink)/100);
                        }catch(Exception rt){
                        qtyShrinkMtrs=0;
                        }
                       */
                         try{
                        qtyToBeSent= qtyRcvd-qtySentToInsp-qtyShrinkMtrs+qtyRj;
                        }catch(Exception rt){
                        qtyToBeSent=0;
                        }
                        poDtlId= rs.getString("PO_DTL_ID"); if (poDtlId == null) poDtlId="0";
                       %>
                       
                                                            
                           <div class="form-group"> 
                                    <input type="HIDDEN" name="qtyOrdered" value="<%=QtyOrdered%>"></input>
                                    <input type="HIDDEN" name="poDtl" value="<%=poDtlId%>"></input>
                                    <label for="selector1" class="col-sm-4 control-label"><b>PO No: </b><%= poNo%></label>
                                    <label for="selector1" class="col-sm-4 control-label"><b>Fabric and Variety: </b><%=fabName%>-<%=varName%></label>
                                   
                                    
                            </div>
                            
                            
                            
                              <div class="form-group"> 
                          
                                    <label for="selector1" class="col-sm-4 control-label"><b>Dyer: </b><%= dyerName%></label>
                                    <label for="selector1" class="col-sm-4 control-label"><b>Qty. Ordered (As per PO): </b><%=QtyOrdered%></label>
                                   
                                    
                            </div>
                            
                            <div class="form-group"> 
                          
                                    <label for="selector1" class="col-sm-4 control-label"><b>Qty. received (a): </b><%= qtyRcvd%></label>
                                    <label for="selector1" class="col-sm-4 control-label"><b>Date on which material was received at Dyer: </b><%=rcvdDate%></label>
                                   
                                    
                            </div>
                            
                              <div class="form-group"> 
                          
                                    <label for="selector1" class="col-sm-4 control-label"><b>Estimated Shrink Qty. (in %): </b><%= qtyShrink%></label>
                                    
                                   
                                    
                            </div>
                          
                             
                            
                            
                            
                            
                            
                       
                            
                          <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Qty. <br> already sent for inspection (b)</label>
                                    <div class="col-sm-1">
                                            
                                             <input type="text" size=2 class="form-control1" name="qtySentToInsp" readonly value= "<%=qtySentToInsp%>" id="qtySentToInsp">
                                    </div>
                            </div>
                            
                               
                          <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Total Qty. <br> Shrink (Actual) (c)</label>
                                    <div class="col-sm-1">
                                            
                                             <input type="text" size=2 class="form-control1" name="qtyShrink" value= "<%=qtyShrinkMtrs%>" id="qtyShrinkMtrs">
                                    </div>
                            </div>
                            
                            <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Qty. <br> Rejected (r)</label>
                                    <div class="col-sm-1">
                                            
                                             <input type="text" size=2 class="form-control1" name="qtyRj" readonly value= "<%=qtyRj%>" id="qtyRj">
                                    </div>
                            </div>
                            <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Qty. to be sent (d=a-b-c+r)</label>
                                    <div class="col-sm-6">
                                            <%=qtyToBeSent%>
                                    </div>
                            </div>
                            
                            <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Supplier Remarks</label>
                                    <div class="col-sm-6">
                                            <%=remarks2%>
                                    </div>
                            </div>
                        
                        <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Qty.Ready</label>
                                     <div class="col-sm-1">
                                            
                                             <input type="text" size=2 class="form-control1" name="qtyReady" readonly value= "<%=qtyReady%>" id="qtyReady">
                                    </div>
                            </div>
                        <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Qty (in mtrs) to be sent for Inspection</label>
                                    <div class="col-sm-4">
                                            <input type="text" size=2 class="form-control1" name="qtySent" id="qtySent" placeholder="Qty">
                                    </div>
                                 
                                    
                                    
                            </div>     
                       
                       <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Date of Material Sent for Inspection </label>
                                    <div class="col-sm-4">
                                             <input type="date"  name= "sentDate" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">

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
                                 
                                 <button type="button" class="btn btn_8 btn-lg btn-warning warning_11" onclick="document.location.href='SendToInsp.jsp'" >Back </button> 
                                 </p>
                            </div>
                            
                      <%}else {%>
                       <div class="but_list" align=center>
                           
                                 <p> </p>
                                
                                 <button type="button" class="btn btn_8 btn-lg btn-warning warning_11" onclick="document.location.href='SendToInsp.jsp'">Back </button> 
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