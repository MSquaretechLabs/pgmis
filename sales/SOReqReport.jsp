<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="mast" scope="request" class="administration.SOMaster"></jsp:useBean>
<jsp:setProperty name="mast" property="*"/>
<jsp:useBean id="forNum" scope="request" class="lib.util.FormatNum"></jsp:useBean>
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
    document.SOMaster.submit(); 
    }
  }  

function validateForm(){

 if(validateFormFields())
 {  if(document.SOMaster.display.value != "display"){
   var check = confirm("Do you want to Save?")
   if(check){
   document.SOMaster.display.value="save";
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

 if(document.SOMaster.display.value != "display")
 {
   var reason = "";
  
   if(document.SOMaster.customer.value=="0")
   {
   reason+="Please Select Customer .\n";
   }else if(document.SOMaster.so.value=="0")
   {
   reason+="Please Select SO .\n";
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
  document.SOMaster.display.value = "display";
  document.SOMaster.submit();
  }
  
  function showDataSoDetails()
  {
  document.SOMaster.so.value = "0";
   document.SOMaster.display.value = "display";
  document.SOMaster.submit();
  }
  function PrintThisPage()
{ 
  var disp_setting="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
      disp_setting+="scrollbars=yes,width=900, height=600, left=50, top=25"; 
  var content_vlue = document.getElementById("print_content").innerHTML; 
  
  var docprint=window.open("","",disp_setting); 
   docprint.document.open(); 
   docprint.document.write('<html><head><title>PGMIS</title><link rel="stylesheet" type="text/css" href="/pgmis/common/css/style.css">'); 
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
Statement st =null,st2=null,stMain=null;
ResultSet rs=null,rs2=null,rsMain=null;
con = new DBConnLT().getConn(); 
String message="";
try
{   
     
 st= con.createStatement();
 st2= con.createStatement();
 stMain= con.createStatement();
 String display=request.getParameter("display"); if(display==null)display="";
// out.println(display);
 
 if(display.equalsIgnoreCase("save"))
 {
 
     
     String varIdArray[]= request.getParameterValues("varId");
     String typeIdArray[]= request.getParameterValues("typeId");
     String typeCheckArray[]= request.getParameterValues("typeCheck");
     String rsrQtyArray[]= request.getParameterValues("rsrQty");
     
     
    String delSql="DELETE FROM t_so_rsr_qty WHERE SO_ID="+mast.getSo()+"";
    int x=st.executeUpdate(delSql);
    String sqlInsert="";
    String rsQtyTemp="";
     for (int i= 0 ;i<typeIdArray.length;i++)
     {
    rsQtyTemp= rsrQtyArray[i]; if(rsQtyTemp==null)rsQtyTemp="0";
    
    sqlInsert= "INSERT INTO t_so_rsr_qty (SO_ID,VAR_ID,TYPE_ID, TYPE_CHECK,QTY) VALUES "+
    " ("+mast.getSo()+",  "+varIdArray[i]+",  "+typeIdArray[i]+",'"+typeCheckArray[i]+"',"+rsQtyTemp+")";
   // out.println(sqlInsert);
    x=st.executeUpdate(sqlInsert);
    
     }
 
    message="Data Saved Successfully.";
 
 
 }
 
 
 
 
 
 
 
 
%>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            
               <%@ include file="SalesHeader.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
        <div class="graphs">
     	
      <div class="col_1">
		   <div class="col-md-12 span_6">
                 <div class="panel-heading">
                    <h4 class="panel-title">Sales Order Plain/ Print Requirement Report</h4>
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
                    <form class="form-horizontal" name="SOMaster">
                    
                       <div class="form-group">
                            <input type="HIDDEN" name="display" value=""></input>
                                    <label for="selector1" class="col-sm-2 control-label">Select Customer</label>
                                    <div class="col-sm-4">
                                            <%=mast.getCustomerListOnChangeSODetails()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new SOMaster name!</p>-->
                                    </div>
                        </div> 
                        
                        <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-2 control-label">Select SO</label>
                                    <div class="col-sm-4">
                                            <%=mast.getSOWithDateListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new SOMaster name!</p>-->
                                    </div>
                        </div>
                           <center><a href="javascript:PrintThisPage();">Print</a> &nbsp; &nbsp; &nbsp; &nbsp;
                          <div class="style3" id="print_content" align=left>
                          
                          
                          
                          
                          
                          
 <%                           
      String dtlSql="";
 
if(!mast.getSo().equalsIgnoreCase("0")){ 
String cName="",soDateT="",soNo="";
String mainSql="SELECT SO_NO, DATE_FORMAT(SO_DATE,'%d-%b-%Y') SO_DATE, C.NAME CUSTOMER_NAME FROM"+
" t_so_master S, t_customer_master C"+
" WHERE S.CUST_ID= C.ID AND S.ID="+mast.getSo()+"";
rsMain = stMain.executeQuery(mainSql);  
if(rsMain.next()){
 cName= rsMain.getString("CUSTOMER_NAME");
 soDateT= rsMain.getString("SO_DATE");
 soNo=rsMain.getString("SO_NO");if(soNo==null)soNo="";
 }
%>

 <tr><td valign=top nowrap=nowrap><b> Name of Customer</b> <%=cName%> </td><br></tr>
  <tr><td valign=top nowrap=nowrap><b> SO No.</b> <%=soNo%> </td><br></tr>
 <tr><td valign=top nowrap=nowrap><b> SO Date</b> <%=soDateT%> <br>
 <tr><td>      
<div class="form-group">                        
    <div class="col-md-8 span_3">
		  <div class="panel-body no-padding" style="display: block;">
                  
  <table class="table table-striped"  border = "1" align="left" cellspacing = "1" cellpadding="1" style="border-collapse: collapse">
		    
		        <tr>
		          <th rowspan=1>#</td>                 
                          <th rowspan=1>Name of Plain/Print</td>    
                          <th rowspan=1>Total Qty.Requirement (As per Style Average)</th>
                           <th rowspan=1>Current Availability in Stock</th> 
                          <th rowspan=1>Reserved Qty (Manual)</th> 
                           <th rowspan=1>Reserved Qty Total <br>(a)</th> 
                          <th rowspan=1>Total Qty.Issued<br>(b)</th> 
                          <th rowspan=1>Total Qty.to be issued <br>(c)</th> 
                         
                           
                          </th>
                          
<%
int cnt=0;
float qtyReqAllStyle=0,qtyIssuedAllStyle=0,availQty=0,rsrQty =0,rsrQtyTotal=0,qtyToBeIssued=0;
String varName="",tempVar="";
 String  sql3 ="  SELECT DISTINCT PRINT.ID PRINT_ID,'Print' TYPE, PRINT.NAME PRINT_NAME from t_so_combo_details SOC, t_style_details SD , "+ 
                       "  t_style_master S, t_so_master SO, t_so_details SOD, "+ 
                       "  t_print_master PRINT WHERE SOC.SO_DTL_ID= SOD.ID  AND SOD.SO_ID= SO.ID"+ 
                       " AND SOC.ST_DTL_ID=SD.ID AND SD.STYLE_ID= S.ID "+ 
                       " AND SOC.TYPE_ID= PRINT.ID "+ 
                       " AND SOC.TYPE_CHECK='Print' "+ 
                       " AND SO.ID="+mast.getSo()+"";
                    
                      //out.println(sql3); 
                     sql3+="  union SELECT DISTINCT PRINT.ID PRINT_ID,'Plain' TYPE, PRINT.NAME PRINT_NAME from t_so_combo_details SOC, t_style_details SD , "+ 
                       "  t_style_master S, t_so_master SO, t_so_details SOD, "+ 
                       "  t_plain_master PRINT WHERE SOC.SO_DTL_ID= SOD.ID  AND SOD.SO_ID= SO.ID"+ 
                       " AND SOC.ST_DTL_ID=SD.ID AND SD.STYLE_ID= S.ID "+ 
                       " AND SOC.TYPE_ID= PRINT.ID "+ 
                       " AND SOC.TYPE_CHECK='Plain' "+ 
                       " AND SO.ID="+mast.getSo()+"";
              
                     sql3+=" ORDER BY TYPE";
                    // out.println(sql3);
                     
                         rsMain = stMain.executeQuery(sql3);
                         
                          while(rsMain.next())
                           {
                           %>
                          <tr>
                           <td rowspan=1 align=left><%=++cnt%></td>
                          <td rowspan=1 align=left><%=rsMain.getString("PRINT_NAME")%></td>
                          
                          <%
                          // get the total requriement of variety
                            String sql8="SELECT SUM( "+
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
                       "    AND SO.ID="+mast.getSo()+" "+
                       "    AND SOC.TYPE_CHECK= '"+rsMain.getString("TYPE")+"'"+
                       "    AND SOC.TYPE_ID="+rsMain.getString("PRINT_ID")+"";
                       
                       //"   AND S.ID="+mast.getStyle()+" "+
                      //out.println(sql8);
                      qtyReqAllStyle=0;
                      rs2 = st2.executeQuery(sql8);
                        if(rs2.next())
                        {
                        qtyReqAllStyle= rs2.getFloat("REQ");
                        }else qtyReqAllStyle=0;
                      
                      
                      
                      
                      
                      qtyIssuedAllStyle=0;
                      
                      String sql6="SELECT SUM(ifnull(QTY,0)) QTY FROM t_stock_issue WHERE SO_ID="+mast.getSo()+" "+
                      " AND TYPE_CHECK= '"+rsMain.getString("TYPE")+"' AND TYPE_ID="+rsMain.getString("PRINT_ID")+"";
                       // out.println(sql6);
                        rs2 = st2.executeQuery(sql6);
                        if(rs2.next())
                        {
                        qtyIssuedAllStyle= rs2.getFloat("QTY");
                        }else qtyIssuedAllStyle=0;
                        
                       %>  <td rowspan=1 align=center><%=forNum.returnFormat2(qtyReqAllStyle)%></td>
                           
                         <%
                         
       if(rsMain.getString("TYPE").equalsIgnoreCase("Plain")){
       
       sql6= "SELECT F.ID FAB_ID,F.NAME FAB, V.ID VAR_ID,V.NAME VAR, S.TYPE_CHECK, ifnull(S.QTY,0) QTY, P.IMAGE, "+
                         " P.ID PID, P.NAME PNAME, P.CODE PCODE "+
                        " FROM t_stock_master S, t_fabric_master F, t_var_master V, t_plain_master P "+
                        " WHERE S.VAR_ID= V.ID AND V.FABRIC_ID= F.ID AND S.TYPE_ID= P.ID "+
                        " AND S.TYPE_CHECK='Plain' AND P.ID="+rsMain.getString("PRINT_ID")+"";
                        
       }else if(rsMain.getString("TYPE").equalsIgnoreCase("Print")){
       
                           
        sql6= " SELECT F.ID FAB_ID,F.NAME FAB, V.ID VAR_ID, V.NAME VAR, S.TYPE_CHECK, ifnull(S.QTY,0) QTY,  P.IMAGE, "+
                         " P.ID PID, P.NAME PNAME, C.NAME PCODE "+
                        " FROM t_stock_master S, t_fabric_master F, t_var_master V, t_print_master P, t_customer_master C "+
                        " WHERE S.VAR_ID= V.ID AND V.FABRIC_ID= F.ID AND S.TYPE_ID= P.ID "+
                        " AND P.CUST_ID= C.ID "+    
                        " AND S.TYPE_CHECK='Print' AND P.ID="+rsMain.getString("PRINT_ID")+" "+
                        " AND V.ID IN (SELECT VAR_ID FROM t_so_var_print_mapping WHERE SO_ID="+mast.getSo()+" "+
                         " AND PRINT_ID="+rsMain.getString("PRINT_ID")+")";
              // out.println(sql6);         
         }
  
                        rs2 = st2.executeQuery(sql6);
                        availQty=0;
                        varName="";
                        String varId="";
                        tempVar="";
                        boolean dataAvail= false;
                        while(rs2.next())
                        {
                        dataAvail= true;
                        varName= rs2.getString("VAR"); if(varName==null)varName="";
                        varId= rs2.getString("VAR_ID"); if(varId==null)varId="0";
                        availQty= rs2.getFloat("QTY");
                        tempVar+= varName+" :- "+forNum.returnFormat2(availQty)+" m <br>";
                     
                        }   
                         %> <td rowspan=1 align=left nowrap><%=tempVar%></td>
                        <td rowspan=1 align=left nowrap=nowrap>
                         <%
                         
                         rsrQtyTotal=0;
                         
                         rs2 = st2.executeQuery(sql6);
                        
                         while(rs2.next())
                        {
                        
                        
                       // out.println(sql6);
                        dataAvail= true;
                        varId= rs2.getString("VAR_ID"); if(varId==null)varId="0";
                        varName= rs2.getString("VAR"); if(varName==null)varName="";  
                         rsrQty=0;
                         
                        sql6= " SELECT ifnull(QTY,0) QTY "+
                        " FROM t_so_rsr_qty WHERE TYPE_CHECK='"+rsMain.getString("TYPE")+"' "+
                        " AND TYPE_ID="+rsMain.getString("PRINT_ID")+" AND VAR_ID="+varId+" "+
                        " AND SO_ID="+mast.getSo()+"";
                          
                        rs = st.executeQuery(sql6);
                        
                        if(rs.next())
                        {
                        rsrQty= rs.getFloat("QTY");
                        } 
                        rsrQtyTotal+= rsrQty;
                       %>
                       
                       <%=varName%>:<br>
                       <input type=text name="rsrQty" value="<%=rsrQty%>"></input>
                       <input type=hidden name="varId" value="<%=varId%>"></input>
                       <input type=hidden name="typeId" value="<%=rsMain.getString("PRINT_ID")%>"></input>
                       <input type=hidden name="typeCheck" value="<%=rsMain.getString("TYPE")%>"><br></input>
                       
                       
                       <%}
                       
                       %>
                       </td>
                       <%
                      // out.println(dataAvail);
                      %>
                      
                           
                           
                         
                         
                         <%
                         qtyToBeIssued= rsrQtyTotal-qtyIssuedAllStyle;
                         
                         %>
                       
                              <td rowspan=1 align=center><%=forNum.returnFormat2(rsrQtyTotal)%></td>
                             <td rowspan=1 align=center><%=forNum.returnFormat2(qtyIssuedAllStyle)%></td>
                             <td rowspan=1 align=center><%=forNum.returnFormat2(qtyToBeIssued)%></td>
                         
                         
                         
                         
                         
                         
                       <%  }%>
                           
                            </tr>
                       </table>    
      </div>
      </div>
                      
                           
                            
                            
                <%}%>  
                
                   </form>
                   </div>
                   
		   </div>
              <div class="but_list" align=center>
                           
                                 <p>        
                                 <button type="button" class="btn btn_5 btn-lg btn-warning warning_11" onclick="javascript:submitClick()" >Save</button> 
                                 </p>
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
                if(stMain!=null) stMain.close();
		if(rsMain!=null) rsMain.close();
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
                if(stMain!=null) stMain.close();
		if(rsMain!=null) rsMain.close();

		}
                catch(SQLException sqle)
                {
                  
                }

	}
%>
