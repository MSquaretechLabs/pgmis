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
   var qtyOrderedN= Number(document.SendToDyer.QtyOrderedTotal.value);
   var qtyAlreadySent= Number(document.SendToDyer.qtySentTotal.value);
   var qtySentN= Number(document.SendToDyer.qtySent.value);
   var QtySentT= qtyAlreadySent+qtySentN;
   
   
   
   if(document.SendToDyer.poDtl.value=="0")
   {
   reason+="Please Select PO Detail .\n";
   }else if(document.SendToDyer.dyer.value=="0")
   {
   reason+="Please Select Dyer.\n";
   }else if(document.SendToDyer.plain.value=="0")
   {
   reason+="Please Select Plain Code.\n";
   }else if(document.SendToDyer.qtySent.value=="")
   {
   reason+="Please Enter Quantity.\n";
   }else if(document.SendToDyer.qtyShrink.value=="")
   {
   reason+="Please Enter Shrink Quantity %.\n";
   }else if(document.SendToDyer.sentDate.value=="")
   {
   reason+="Please Enter Sent Date.\n";
   }else if(document.SendToDyer.delDate.value=="")
   {
   reason+="Please Enter Expected Delivery Date.\n";
   }else if(QtySentT>qtyOrderedN)
   {
   reason+="Qty Sent can not be more than Qty Ordered. Please enter correct value\n";
   }
   if (reason != "") {
    alert("Some fields need correction:\n" + reason);
    return false;
  }
 
}
return true;
}


  function showData()
  {
  document.SendToDyer.display.value = "display";
  document.SendToDyer.submit();
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
// out.println(display);
 if(display.equalsIgnoreCase("save"))
 {
     
    
     String poDtl= request.getParameter("poDtl"); if(poDtl==null)poDtl="0";
     String dyer= request.getParameter("dyer");if(dyer==null)dyer="0";
     String typeId= request.getParameter("plain"); if(typeId==null)typeId="0";
  
     String qtySent=request.getParameter("qtySent"); if(qtySent==null)qtySent="";
     String qtyShrink=request.getParameter("qtyShrink"); if(qtyShrink==null)qtyShrink="0";
     
     String remarks=request.getParameter("remarks"); if(remarks==null)remarks="";
     String sentDate=request.getParameter("sentDate"); if(sentDate==null)sentDate="";
     String delDate=request.getParameter("delDate"); if(delDate==null)delDate="";
     
     String mtrCharge=request.getParameter("mtrCharge"); if(mtrCharge==null)mtrCharge="";
    
     int maxId=0;
     String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_po_dp_details";
     //out.println(maxIdSql);
     rs= st.executeQuery(maxIdSql);
     
     if(rs.next())
     {
     maxId= rs.getInt("MAX_ID");
     }else maxId=1;
    
     if(maxId==0)maxId=1;      
           
     String sqlInsert="INSERT INTO t_po_dp_details"+
     " (ID,PO_DTL_ID,DP_ID,TYPE_CHECK,TYPE_ID,QTY_SENT,M_SENT_DATE,STATUS,TRANS_DATE,SUPP_REMARKS,QTY_SHRINK_PRSNT, EXP_DLV_DATE,MTR_CHARGE) VALUES "+
     " ("+maxId+","+poDtl+","+dyer+",'Plain','"+typeId+"','"+qtySent+"','"+sentDate+"','S',SYSDATE(),'"+remarks+"',"+qtyShrink+",'"+delDate+"','"+mtrCharge+"')"; 
    // out.println(sqlInsert);
    
     int x=st.executeUpdate(sqlInsert);
     message= "Material has been sent to the selected Dyer successfully.";
  }
 
 
 
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
                    <h4 class="panel-title">Send Material to Dyer</h4>
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
                    <form class="form-horizontal" name="SendToDyer">
                    
                       <div class="form-group">
                            <input type="HIDDEN" name="display" value=""></input>
                                    <label for="selector1" class="col-sm-2 control-label">Select PO</label>
                                    <div class="col-sm-4">
                                            <%=mast.getVPOSupllierMasterList()%>
                                    </div>
                        </div> 
             
             <%                        
             if(!mast.getPo().equalsIgnoreCase("0")){  
             %>
              <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-2 control-label">Select PO Detail</label>
                                    <div class="col-sm-4">
                                            <%=mast.getPoDtlList()%>
                                    </div>
                                   
                        </div>                
           <%}%>             
      

		    
                    <%
                                  
      String dtlSql1="";
       String fabName="",varName="",remarks="",sentDate="",plainCode="",varId="0",expDlvDate ="",mtrCharge="";
        float QtyOrdered=0,qtySent=0,qtyShrink=0;
        float QtyOrderedTotal=0,qtySentTotal=0,qtySentTotalTemp=0;
if(!mast.getPoDtl().equalsIgnoreCase("0")){ 

%>

<%
    int count=1;
    int cnt=0;
    String trClass="info";
    
    // get var id
    
    dtlSql1="select ID from t_var_master where ID in (select VAR_ID from t_po_details where ID="+mast.getPoDtl()+")";
   // out.println(dtlSql1);
    rs = st.executeQuery(dtlSql1);
    if(rs.next())
    {
    varId=rs.getString("id"); 
    }else varId="0";
  boolean dataAvail= false;
  
  dtlSql1="SELECT ifnull(QTY,0) QTY FROM t_po_details WHERE ID="+mast.getPoDtl()+"";
  rs = st.executeQuery(dtlSql1);
  if(rs.next())
  {
  QtyOrderedTotal=rs.getFloat("QTY");;
  }else QtyOrderedTotal=0;
  
   dtlSql1="SELECT SUM(ifnull(QTY_SENT,0)) QTY_SENT FROM t_po_dp_details WHERE PO_DTL_ID="+mast.getPoDtl()+"";
  rs = st.executeQuery(dtlSql1);
  if(rs.next())
  {
  qtySentTotal=rs.getFloat("QTY_SENT");;
  }else qtySentTotal=0;
  
  
  
  dtlSql1 = "SELECT fab.NAME FABRIC_NAME,var.ID VAR_ID,var.NAME VAR_NAME,d.NAME DYER_NAME,p.QTY, pd.QTY_SENT,pd.QTY_SHRINK_PRSNT,MTR_CHARGE,"+
  " DATE_FORMAT(M_SENT_DATE,'%d-%b-%Y') M_SENT_DATE,DATE_FORMAT(EXP_DLV_DATE,'%d-%b-%Y') EXP_DLV_DATE,SUPP_REMARKS, plain.NAME plain_code "+
  " FROM t_po_details p, t_po_dp_details pd, t_fabric_master fab, t_var_master var, t_plain_master plain,t_dyer_master d "+
  " where pd.PO_DTL_ID= p.ID and p.VAR_ID= var.ID and var.FABRIC_ID= fab.ID  and pd.TYPE_ID= plain.ID and pd.DP_ID= d.ID "+
  " and pd.TYPE_CHECK='Plain' and pd.PO_DTL_ID="+mast.getPoDtl()+"";
    //out.println(dtlSql1);
    rs = st.executeQuery(dtlSql1);
   
   
   
  
                       while(rs.next())
                       {               
                       
                       if(cnt==0){
                       
                        %>
   <div class="form-group">                        
    <div class="col-md-12 span_3">
		  <div class="bs-example1" data-example-id="contextual-table">
                    <table class="table">
		      <thead>
		        <tr>
		          <th>#</th>
		          <th>Fabric</th>
		          <th>Variety</th>
                          <th>Dyer</th>
                          <th>Plain Code</th>
                         <!-- <th>Qty. ordered (in Meters)</th>-->
                      
                          <th>Qty. sent (in Meters)</th>
                           <th>Shrink Qty. (%)</th>
                          <th>Material Sent Date</th>
                          <th>Charge (per mtr/kg)</th>
                          <th>Expected Delivery Date by Dyer</th>
                          <th>Remarks</th>
		        </tr>
		      </thead>
		      <tbody>
                      <%
                       
                       
                       }
                       
                       
                       
                        if(cnt%2==0)trClass="info";else trClass="";
                         
                           ++cnt;
                        fabName =rs.getString("FABRIC_NAME"); if (fabName == null) fabName="";
                        varName =rs.getString("VAR_NAME"); if (varName == null) varName="";
                        varId= rs.getString("VAR_ID"); if (varId == null) varId="0";
                        dyerName = rs.getString("DYER_NAME"); if (dyerName == null) dyerName="";
                        plainCode= rs.getString("PLAIN_CODE"); if (plainCode == null) plainCode="";
                        sentDate= rs.getString("M_SENT_DATE"); if (sentDate == null) sentDate="";
                         expDlvDate= rs.getString("EXP_DLV_DATE"); if (expDlvDate == null) expDlvDate="";
                        QtyOrdered= rs.getFloat("QTY");
                        qtySent= rs.getFloat("QTY_SENT");
                        remarks= rs.getString("SUPP_REMARKS"); if (remarks == null) remarks="";
                        qtyShrink= rs.getFloat("QTY_SHRINK_PRSNT");
                        dataAvail= true;
                        mtrCharge=rs.getString("MTR_CHARGE"); if (mtrCharge == null) mtrCharge="";
                        
                        
                       qtySentTotalTemp+=qtySent;
                         //qtyTotal+=qty;
                       %> 
                        <tr scope="row" class="<%=trClass%>">
		          <th scope="row"><%= cnt%></th>
		          <td align=left><%=fabName%></td>
		          <td align=left><%=varName%></td>
                          <td align=left><%=dyerName%></td>
                          
                          <td align=left><%=plainCode%></td>
		        <!--  <td align=right><%=QtyOrdered%></td>-->
                         
                          <td align=center><%=qtySent%></td>
                           <td align=center><%=qtyShrink%></td>
                          <td align=left><%=sentDate%></td>
                          <td align=centre><%=mtrCharge%></td>
                          <td align=left><%=expDlvDate%></td> 
                          <td align=left><%=remarks%></td>
                   
		        </tr>
                        
                      <%
                     
                      if(trClass.equalsIgnoreCase("info"))trClass="";
                       
                      }
                      
                  if(dataAvail)
                  {
                      %>   
                     <tr scope="row"><td colspan=5><b>Total</td>
                     
                      <td align=center><b><%=qtySentTotalTemp%>
                      </td>
                     <td colspan=4>&nbsp;</td>
                     </tr>
                       </tbody>
                                        </table>
                     </table>
                     </div>
                     </div>
                 <%}%>    
 
       <h4>Enter Details to Send Material to Dyer</h4>
                  <div class="progress">
                    <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                  </div>
     
                  
   <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Select Dyer</label>
                                      <input type=hidden name="QtyOrderedTotal" value="<%=QtyOrderedTotal%>"></input>
                                    <input type=hidden name="qtySentTotal" value="<%=qtySentTotal%>"></input>
                    
                                    <div class="col-sm-4">
                                            <%=mast.getDyerList()%>
                                    </div>
                                   
                                    
                                    
                            </div>
                            
                            <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Select Plain Code</label>
                                    <div class="col-sm-4">
                                            <%=mast.getPlainCodeList(varId)%>
                                    </div>
                                 
                                    
                                    
                            </div>                         
                            <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Qty. Ordered</label>
                                    
                                    <div class="col-sm-4">
                                            <%=QtyOrderedTotal%>
                                    </div>
                                 
                                    
                                    
                            </div>
                            <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Qty. Already Sent</label>
                                    <div class="col-sm-4">
                                            <%=qtySentTotal%>
                                    </div>
                                 
                                    
                                    
                            </div> 
                              <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Qty. To be Sent</label>
                                    <div class="col-sm-4">
                                            <%=(QtyOrderedTotal-qtySentTotal)%>
                                    </div>
                                 
                                    
                                    
                            </div> 
                          
    <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Qty (in mtrs) to be sent to Dyer</label>
                                    <div class="col-sm-2">
                                            <input type="text" size=2 class="form-control1" name="qtySent" id="qtySent" placeholder="Qty">
                                    </div>
                                 
                                    
                                    
                            </div>      
    
                        
    <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Shrink Qty (in %)</label>
                                    <div class="col-sm-2">
                                            <input type="text" size=2 class="form-control1" name="qtyShrink" id="qtyShrink" placeholder="Shrink Qty.">
                                    </div>
                                 
                                    
                                    
                            </div>      
    
  
                                <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Date of Material Sent to Dyer</label>
                                    <div class="col-sm-4">
                                             <input type="date"  name= "sentDate" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">

                                    </div>
                                 </div>
                                 
                                 <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Charge  (per mtr/kg)</label>
                                    <div class="col-sm-2">
                                            <input type="text" size=2 class="form-control1" name="mtrCharge" id="mtrCharge" placeholder="Charge">
                                    </div>
                                 
                                    
                                    
                            </div>      
                                 
                                <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Expected Delivery Date by Dyer</label>
                                    <div class="col-sm-4">
                                             <input type="date"  name= "delDate" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">

                                    </div>
                                    
                                    
                            </div>      
    
     <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Remarks </label>
                                    <div class="col-sm-6">
                                             <input type="text" class="form-control1" name="remarks" id="remarks" placeholder="Remarks">

                                    </div>
                                 
                                    
                                    
                            </div>     
    
  
		    
                  
	               
                           
                            <div class="but_list" align=center>
                           
                                 <p>        
                                 <button type="button" class="btn btn_5 btn-lg btn-warning warning_11" onclick="javascript:submitClick()" >Save</button> 
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
<script>
     var dis = "<%= message %>";
     if(!dis ==""){
     alert(dis);
     
    }
   </script