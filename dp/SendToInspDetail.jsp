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
  
   if(document.SendToDyer.rcvdDate.value=="")
   {
   reason+="Please Enter Date of material received from Supplier.\n";
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
     
    
   
     String rcvdDate=request.getParameter("rcvdDate"); if(rcvdDate==null)rcvdDate="";
     String remarks=request.getParameter("remarks"); if(remarks==null)remarks="";
     
           
     String sqlUpdate="UPDATE t_po_dp_details set M_RCVD_DATE='"+rcvdDate+"' ,"+
     " M_RCVR_REMARKS='"+remarks+"' , STATUS='R' where id="+dpId+"";
     out.println(sqlUpdate);
    
     int x=st.executeUpdate(sqlUpdate);
     message= "Material has been received at Dyer successfully.";
  }
 
// out.println(display);

 
%>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            
               <%@ include file="DPHeader.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
        <div class="graphs">
     	
      <div class="col_1">
		   <div class="col-md-12 span_6">
                 <div class="panel-heading">
                  <h1>
                    <span class="label btn_6 label-success">Receive Material From Supplier</span>  
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
      String fabName="",varName="",remarks="",sentDate="",plainCode="",varId="0";
      float QtyOrdered=0,qtySent=0;
      boolean dataAvail = false;


%>

<%
    int count=1;
    int cnt=0;
    String trClass="info", poNo="";;
    
    // get var id
    
   
  dtlSql1 = "SELECT concat(pm.PO_NO,'-',s.NAME,'-dated.',DATE_FORMAT(PO_DATE,'%d-%b-%Y')) PO_NO, "+
  " FAB.NAME FABRIC_NAME,VAR.ID VAR_ID,VAR.NAME VAR_NAME,D.NAME DYER_NAME,P.QTY, PD.QTY_SENT,"+
  " DATE_FORMAT(M_SENT_DATE,'%d-%b-%Y') M_SENT_DATE,SUPP_REMARKS, plain.name plain_code "+
  " FROM t_po_master pm, t_supplier_master s,t_po_details p, t_po_dp_details pd, t_fabric_master fab, t_var_master var, t_plain_master plain,t_dyer_master d "+
  " where pd.po_dtl_id= p.id and p.po_id= pm.id and pm.sup_id= s.id and p.var_id= var.id and var.fabric_id= fab.id  and pd.type_id= plain.id and pd.dp_id= d.id "+
  " and pd.status='S' and pd.id="+dpId+" order by pd.M_SENT_DATE ASC";
    //out.println(dtlSql1);
    rs = st.executeQuery(dtlSql1);
    String remarks2="";
   
   
  
                       if(rs.next())
                       {
                       
                        poNo= rs.getString("PO_NO"); if (poNo == null) poNo="";
                        fabName =rs.getString("FABRIC_NAME"); if (fabName == null) fabName="";
                        varName =rs.getString("VAR_NAME"); if (varName == null) varName="";
                        varId= rs.getString("VAR_ID"); if (varId == null) varId="0";
                        dyerName = rs.getString("DYER_NAME"); if (dyerName == null) dyerName="";
                        plainCode= rs.getString("PLAIN_CODE"); if (plainCode == null) plainCode="";
                        sentDate= rs.getString("M_SENT_DATE"); if (sentDate == null) sentDate="";
                        QtyOrdered= rs.getFloat("QTY");
                        qtySent= rs.getFloat("QTY_SENT");
                        remarks2= rs.getString("SUPP_REMARKS"); if (remarks2 == null) remarks2="";
                       
                       %>
                       
                             <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">PO No.</label>
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
                          
                                    <label for="selector1" class="col-sm-2 control-label">Qty. <br>ordered (in Meters)</label>
                                    <div class="col-sm-6">
                                            <%=QtyOrdered%>
                                    </div>
                            </div>
                            
                          <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Qty. <br>to be received (in Meters)</label>
                                    <div class="col-sm-6">
                                            <%=qtySent%>
                                    </div>
                            </div>
                             <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Date on which material was sent</label>
                                    <div class="col-sm-6">
                                            <%=sentDate%>
                                    </div>
                            </div>
                            <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Supplier Remarks</label>
                                    <div class="col-sm-6">
                                            <%=remarks2%>
                                    </div>
                            </div>
                       
                       
                       
                       <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Date of Material Received </label>
                                    <div class="col-sm-4">
                                             <input type="date"  name= "rcvdDate" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">

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
                                 
                                 <button type="button" class="btn btn_8 btn-lg btn-warning warning_11" onclick="ReeivedAtDyer/jsp" >Back </button> 
                                 </p>
                            </div>
                            
                      <%}else {%>
                       <div class="but_list" align=center>
                           
                                 <p> </p>
                                
                                 <button type="button" class="btn btn_8 btn-lg btn-warning warning_11" onclick="document.location.href='ReceiveAtDyer.jsp'">Back </button> 
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