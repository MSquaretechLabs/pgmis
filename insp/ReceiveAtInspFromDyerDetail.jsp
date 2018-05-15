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
  
   if(document.SendToDyer.rcvdDate.value=="")
   {
   reason+="Please Enter Date of material received for inspection.\n";
   }else if(document.SendToDyer.inspDate.value=="")
   {
   reason+="Please Enter Date of inspection.\n";
   }else if(document.SendToDyer.qtyInsp.value=="")
   {
   reason+="Please Qty inspected.\n";
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
 
 String inspDtlId="";
 
 inspDtlId= request.getParameter("inspDtlId"); if(inspDtlId==null)inspDtlId="0";
 
  if(display.equalsIgnoreCase("save"))
 {
     
    
     String rcvdDate=request.getParameter("rcvdDate"); if(rcvdDate==null)rcvdDate="";
     String inspDate=request.getParameter("inspDate"); if(inspDate==null)inspDate="";
     String qtyInsp=request.getParameter("qtyInsp"); if(qtyInsp==null)qtyInsp="0";
     String remarks=request.getParameter("remarks"); if(remarks==null)remarks="";
     
     
   
     
     
     
    
     
      String sqlUpdate="UPDATE t_inspection_details set RCVD_DATE='"+rcvdDate+"' , INSP_DATE='"+inspDate+"' ,"+
     " QTY_INSPECTED="+qtyInsp+", INSP_REMARKS='"+remarks+"', STATUS='R' where ID="+inspDtlId+"";
    // out.println(sqlUpdate);
      int x=st.executeUpdate(sqlUpdate);
     
    
     
     message= "Material has been received from Dyer Successfully. Inspection Details have been updated.";
  }
 
// out.println(display);

 
%>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            
               <%@ include file="InspHeader.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
        <div class="graphs">
     	
      <div class="col_1">
		   <div class="col-md-12 span_6">
                 <div class="panel-heading">
                  <h1>
                    <span class="label btn_6 label-success">Receive Material from Dyer for Inspection</span>  
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
      String fabName="",varName="",remarks="",sentDate="",rcvdDate="",plainCode="",varId="0";
      float QtyOrdered=0,qtySent=0,qtyRcvd=0,qtySentToInsp=0,qtyToBeSent=0,qtyPending=0;
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
  " SUPP_REMARKS, plain.NAME plain_code , QTY_SENT_TO_INSP, i.QTY_PENDING, i.REMARKS DYER_REMARKS"+
  " FROM t_po_master pm, t_supplier_master s,t_po_details p, t_po_dp_details pd, "+
  " t_fabric_master fab, t_var_master var, t_plain_master plain,t_dyer_master d, t_inspection_details i "+
  " where pd.PO_DTL_ID= p.ID and p.PO_ID= pm.ID and pm.SUP_ID= s.ID and p.VAR_ID= var.ID and var.FABRIC_ID= fab.ID  "+
  " and pd.TYPE_ID= plain.ID and pd.DP_ID= d.ID and i.PO_DTL_ID= p.ID and i.PO_DP_DTL_ID= pd.ID "+
  " and i.STATUS='S'  and i.ID="+inspDtlId+" order by i.SENT_DATE ASC";
    //out.println(dtlSql1);
    rs = st.executeQuery(dtlSql1);
    String remarks2="",dyerRemarks="";
   
   
  
                       if(rs.next())
                       {
                       
                        inspDtlId= rs.getString("INSP_DTL_ID"); if (inspDtlId == null) inspDtlId="";
                       // dpId=    rs.getString("DP_ID"); if (dpId == null) dpId="";
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
                        qtySentToInsp= rs.getFloat("QTY_SENT_TO_INSP");
                        remarks= rs.getString("SUPP_REMARKS"); if (remarks == null) remarks="";
                        dyerRemarks= rs.getString("DYER_REMARKS"); if (dyerRemarks == null) dyerRemarks="";
                        dataAvail= true;
                       %>
                       
                             <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">PO No.</label>
                                     <input type="HIDDEN" name="inspDtlId" value="<%=inspDtlId%>"></input>
                                    <div class="col-sm-6">
                                            <%=poNo%> 
                                    </div>
                            </div>
       
                              <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Fabric and Variety</label>
                                    <div class="col-sm-6">
                                            <%=fabName%>-<%=varName%>
                                    </div>
                            </div>
                            
                             <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Dyer</label>
                                    <div class="col-sm-6">
                                            <%=dyerName%>
                                    </div>
                            </div>
                       
                        <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Qty. <br>ordered (in Meters) (As per PO)</label>
                                    <div class="col-sm-6">
                                            <%=QtyOrdered%>
                                    </div>
                            </div>
                            
                          <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Qty. <br> sent from Dyer (in Meters)(a)</label>
                                    <div class="col-sm-6">
                                            <%=qtyRcvd%>
                                    </div>
                            </div>
                             <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Date on which material was sent</label>
                                    <div class="col-sm-6">
                                            <%=sentDate%>
                                    </div>
                            </div>
                            <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Qty. <br> already sent for inspection (b)</label>
                                    <div class="col-sm-6">
                                            <%=qtySentToInsp%>
                                    </div>
                            </div>
                            <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Qty. to be sent (c=a-b)</label>
                                    <div class="col-sm-6">
                                            <%=qtyPending%>
                                    </div>
                            </div>
                            
                            <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Supplier Remarks</label>
                                    <div class="col-sm-6">
                                            <%=remarks%>
                                    </div>
                            </div>
                            <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Dyer Remarks</label>
                                    <div class="col-sm-6">
                                            <%=dyerRemarks%>
                                    </div>
                            </div>
                         
                       
                        <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Date of Material Received for Inspection </label>
                                    <div class="col-sm-4">
                                             <input type="date"  name= "rcvdDate" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">

                                    </div>
                                 
                                    
                                    
                            </div>    
                            
                           <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Qty. Inspected & Verified</label>
                                    <div class="col-sm-4">
                                            <input type="text" size=2 class="form-control1" name="qtyInsp" id="qtyInsp" placeholder="Qty Inspected">

                                    </div>
                                 
                                    
                                    
                            </div>      
                       
                       <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Date of Inspection</label>
                                    <div class="col-sm-4">
                                             <input type="date"  name= "inspDate" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">

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
                                 
                                 <button type="button" class="btn btn_8 btn-lg btn-warning warning_11" onclick="ReceiveAtInspFromDyer.jsp" >Back </button> 
                                 </p>
                            </div>
                            
                      <%}else {%>
                       <div class="but_list" align=center>
                           
                                 <p> </p>
                                
                                 <button type="button" class="btn btn_8 btn-lg btn-warning warning_11" onclick="document.location.href='ReceiveAtInspFromDyer.jsp'">Back </button> 
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