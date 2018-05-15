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
    document.SendToPrinter.submit(); 
    }
  }  

function validateForm(){

 if(validateFormFields())
 {  if(document.SendToPrinter.display.value != "display"){
   var check = confirm("Do you want to Save?")
   if(check){
   document.SendToPrinter.display.value="save";
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

 if(document.SendToPrinter.display.value != "display")
 {
   var reason = "";
  
   if(document.SendToPrinter.poDtl.value=="0")
   {
   reason+="Please Select PO Detail .\n";
   }else if(document.SendToPrinter.qtySent.value=="")
   {
   reason+="Please Enter Quantity.\n";
   }else if(document.SendToPrinter.sentDate.value=="")
   {
   reason+="Please Enter Sent Date.\n";
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
  document.SendToPrinter.display.value = "display";
  document.SendToPrinter.submit();
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
 String printerName="";
// out.println(display);
 if(display.equalsIgnoreCase("save"))
 {
     
    
     String poDtl= request.getParameter("poDtl"); if(poDtl==null)poDtl="0";
   
     String qtySent=request.getParameter("qtySent"); if(qtySent==null)qtySent="";
     String remarks=request.getParameter("remarks"); if(remarks==null)remarks="";
     String sentDate=request.getParameter("sentDate"); if(sentDate==null)sentDate="";
    
     int maxId=0;
     String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_po_gm_details";
     //out.println(maxIdSql);
     rs= st.executeQuery(maxIdSql);
     
     if(rs.next())
     {
     maxId= rs.getInt("MAX_ID");
     }else maxId=1;
    
     if(maxId==0)maxId=1;      
           
     String sqlInsert="INSERT INTO t_po_gm_details"+
     " (ID,PO_DTL_ID,QTY_SENT,M_SENT_DATE,STATUS,TRANS_DATE,SUPP_REMARKS) VALUES "+
     " ("+maxId+","+poDtl+",'"+qtySent+"','"+sentDate+"','S',SYSDATE(),'"+remarks+"')"; 
    //out.println(sqlInsert);
    
     int x=st.executeUpdate(sqlInsert);
     message= "Material has been sent to the PGCCPL successfully.";
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
                    <h4 class="panel-title">Send Material to PGCCPL</h4>
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
                    <form class="form-horizontal" name="SendToPrinter">
                    
                       <div class="form-group">
                            <input type="HIDDEN" name="display" value=""></input>
                                    <label for="selector1" class="col-sm-2 control-label">Select PO</label>
                                    <div class="col-sm-4">
                                            <%=mast.getPOSupllierMasterList()%>
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
       String fabName="",varName="",remarks="",sentDate="",printCode="",varId="0";
        float QtyOrdered=0,qtySent=0;
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
  dtlSql1 = "SELECT fab.NAME FABRIC_NAME,var.ID VAR_ID,var.NAME VAR_NAME,p.QTY, pd.QTY_SENT,"+
  " DATE_FORMAT(M_SENT_DATE,'%d-%b-%Y') M_SENT_DATE,SUPP_REMARKS "+
  " FROM t_po_details p, t_po_gm_details pd, t_fabric_master fab, t_var_master var "+
  " where pd.PO_DTL_ID= p.ID and p.VAR_ID= var.ID and var.FABRIC_ID= fab.ID "+
  " and pd.PO_DTL_ID="+mast.getPoDtl()+"";
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
                          <th>Qty. ordered (in Meters)</th>
                          <th>Qty. (in Meters)</th>
                          <th>Material Sent Date</th>
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
                        //printerName = rs.getString("PRINTER_NAME"); if (printerName == null) printerName="";
                        //printCode= rs.getString("PRINT"); if (printCode == null) printCode="";
                        sentDate= rs.getString("M_SENT_DATE"); if (sentDate == null) sentDate="";
                        QtyOrdered= rs.getFloat("QTY");
                        qtySent= rs.getFloat("QTY_SENT");
                        remarks= rs.getString("SUPP_REMARKS"); if (remarks == null) remarks="";
                        dataAvail= true;
                    
                         //qtyTotal+=qty;
                       %> 
                        <tr scope="row" class="<%=trClass%>">
		          <th scope="row"><%= cnt%></th>
		          <td align=left><%=fabName%></td>
		          <td align=left><%=varName%></td>
                           <td align=center><%=QtyOrdered%></td>
                          <td align=center><%=qtySent%></td>
                          <td align=left><%=sentDate%></td>  
                          <td align=left><%=remarks%></td>
                   
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
 
       <h4>Enter Details to Send Material to PGCCPL</h4>
                  <div class="progress">
                    <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                  </div>
     
                  
   
 
                          
    <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Qty (in mtrs) to be sent to PGCCPL</label>
                                    <div class="col-sm-4">
                                            <input type="text" size=2 class="form-control1" name="qtySent" id="qtySent" placeholder="Qty">
                                    </div>
                                 
                                    
                                    
                            </div>      
    
  
  
  <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Date of Material Sent to PGCCPL</label>
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
    
  
		    
                  
	               
                           
                            <div class="but_list" align=right>
                           
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