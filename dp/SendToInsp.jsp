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
                    <span class="label btn_6 label-success">Send Ready Material for Inspection</span>  
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
                    <form class="form-horizontal" name="SendToDyer" action="ReceiveAtDyerDetail.jsp">
                     <input type="HIDDEN" name="display" value=""></input>
                  
             
            

		    
                    <%
                                  
      String dtlSql1="",dpId="";
      String fabName="",varName="",remarks="",sentDate="",rcvdDate="",dyerRemarks="",plainCode="",varId="0";
      float QtyOrdered=0,qtySent=0,qtyRcvd =0;
      boolean dataAvail = false;


%>

<%
    int count=1;
    int cnt=0;
    String trClass="info", poNo="";;
    
    // get var id
    
   
  dtlSql1 = "SELECT pd.id DP_ID, concat(pm.PO_NO,'-',s.NAME,'-dated.',DATE_FORMAT(PO_DATE,'%d-%b-%Y')) PO_NO, "+
  " FAB.NAME FABRIC_NAME,VAR.ID VAR_ID,VAR.NAME VAR_NAME,D.NAME DYER_NAME,P.QTY, PD.QTY_SENT,PD.QTY_RCVD,"+
  " DATE_FORMAT(M_SENT_DATE,'%d-%b-%Y') M_SENT_DATE,DATE_FORMAT(M_RCVD_DATE,'%d-%b-%Y') M_RCVD_DATE,"+
  " SUPP_REMARKS,M_RCVR_REMARKS DYER_REMARKS, plain.name plain_code "+
  " FROM t_po_master pm, t_supplier_master s,t_po_details p, t_po_dp_details pd, t_fabric_master fab, t_var_master var, t_plain_master plain,t_dyer_master d "+
  " where pd.po_dtl_id= p.id and p.po_id= pm.id and pm.sup_id= s.id and p.var_id= var.id and var.fabric_id= fab.id  and pd.type_id= plain.id and pd.dp_id= d.id "+
  " and pd.status='R' order by pd.M_SENT_DATE ASC";
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
                           <th>Select</th>
                           <th>PO</th>
		          <th>Fabric & Variety</th>
		        
                          <th>Dyer</th>
                          <th>Plain Code</th>
                          <th>Qty. <br>ordered (in Meters)<br>( As per PO)</th>
                          <th>Qty. <br> received at Dyer (in Meters)</th>
                          <th>Material Received Date</th>
                          <th>Supplier Remarks</th>
                          <th>Dyer Remarks</th>
		        </tr>
		      </thead>
		      <tbody>
                      <%
                       
                       
                       }
                       
                       
                       
                        if(cnt%2==0)trClass="info";else trClass="";
                         
                           ++cnt;
                        dpId=    rs.getString("DP_ID"); if (dpId == null) dpId="";
                        poNo= rs.getString("PO_NO"); if (poNo == null) poNo="";
                        fabName =rs.getString("FABRIC_NAME"); if (fabName == null) fabName="";
                        varName =rs.getString("VAR_NAME"); if (varName == null) varName="";
                        varId= rs.getString("VAR_ID"); if (varId == null) varId="0";
                        dyerName = rs.getString("DYER_NAME"); if (dyerName == null) dyerName="";
                        plainCode= rs.getString("PLAIN_CODE"); if (plainCode == null) plainCode="";
                        rcvdDate= rs.getString("M_RCVD_DATE"); if (rcvdDate == null) rcvdDate="";
                        QtyOrdered= rs.getFloat("QTY");
                        qtySent= rs.getFloat("QTY_SENT");
                        qtyRcvd= rs.getFloat("QTY_RCVD");
                        remarks= rs.getString("SUPP_REMARKS"); if (remarks == null) remarks="";
                        dyerRemarks= rs.getString("DYER_REMARKS"); if (dyerRemarks == null) dyerRemarks="";
                        dataAvail= true;
                    
                         //qtyTotal+=qty;
                       %> 
                        <tr scope="row" class="<%=trClass%>">
		          <td scope="row"><%= cnt%></td>
                          <td scope="row" valign=top><div class="radio-inline"><label><input type="radio" name="dpId" value=<%=dpId%>></label></div></th>
                           <td align=left><%=poNo%></td>
		          <td align=left><%=fabName%>-<%=varName%></td>
		      
                          <td align=left><%=dyerName%></td>
                          
                          <td align=right><%=plainCode%></td>
		          <td align=right><%=QtyOrdered%></td>
                          <td align=right><%=qtyRcvd%></td>
                          <td align=left><%=rcvdDate%></td>  
                          <td align=left><%=remarks%></td>
                          <td align=left><%=dyerRemarks%></td>
                   
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
                           
                                 <p> </p>
                                 <p>
                                 <button type="button" class="btn btn_8 btn-lg btn-warning warning_11" onclick="javascript:submitClick()" >Select Entry and Click</button> 
                                 </p>
                            </div>
                            
                      
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