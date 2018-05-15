<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="mast" scope="request" class="administration.SOMaster"></jsp:useBean>
<jsp:setProperty name="mast" property="*"/>
<jsp:useBean id="nToW" scope="request" class="administration.NumberToWord"></jsp:useBean>
<script language="javascript" type="text/javascript" src="/pgmis/misc/calendar_us.js"></script>
<script type="text/javascript" language="JavaScript1.2" src="/pgmis/misc/date_format.js"></script>
<script language="javascript" type="text/javascript" src="/pgmis/misc/datetimepicker.js"></script>
<title>Invoice:Pushkar Ganesh Cotton Club Export Pvt. Ltd.</title>
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
 
 
 
 
%>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            
               <%@ include file="PackingHeader.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
        <div class="graphs">
     	
      <div class="col_1">
		   <div class="col-md-12 span_6">
                 <div class="panel-heading">
                    <h4 class="panel-title">Print Invoice</h4>
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
                         <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-2 control-label">Select Invoice</label>
                                    <div class="col-sm-4">
                                            <%=mast.getInvoiceListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new SOMaster name!</p>-->
                                    </div>
                        </div>
                          <div class="style3" id="print_content">
                          
 <%                           
      String dtlSql="";
 
if(!mast.getInvoice().equalsIgnoreCase("0")){ 
String cName="",soDateT="",soNo="",phone="";


int hTotal=0,esT=0,sT=0,mT=0,lT=0,xlT=0,xxlT=0;
int hTotalTT=0,esTT=0,sTT=0,mTT=0,lTT=0,xlTT=0,xxlTT=0;
String address="";
String custSql="SELECT NAME, ADDRESS,PHONE FROM t_customer_master WHERE ID="+mast.getCustomer()+"";
rsMain = stMain.executeQuery(custSql);    
if(rsMain.next()){

cName= rsMain.getString("NAME");
address= rsMain.getString("ADDRESS");if(address==null)address="";
phone= rsMain.getString("PHONE");if(phone==null)phone="";
}else 
{
cName="";
address="";
phone="";
}


String mainSql=" SELECT  DATE_FORMAT(INV_DATE,'%d-%b-%Y') INV_DATE,S.SO_NO,DATE_FORMAT(SO_DATE,'%d-%b-%Y') SO_DATE , "+
" M.* FROM t_invoice_master M , t_so_master S"+
" WHERE M.SO_ID= S.ID"+
" and SO_ID="+mast.getSo()+" "+
" AND M.CUST_ID="+mast.getCustomer()+" "+
" AND M.ID= "+mast.getInvoice()+"";
 
 rsMain = stMain.executeQuery(mainSql);    
 String style="0";
 int c=0;
 %>

   
 <%
 if(rsMain.next()){
     
     
     soNo= rsMain.getString("SO_NO"); if(soNo==null)soNo="";
     String soDate= rsMain.getString("SO_DATE"); if(soDate==null)soDate="";
     
     String invNo= rsMain.getString("INV_NO"); if(invNo==null)invNo="0";
     String invDate= rsMain.getString("INV_DATE"); if(invDate==null)invDate="";
     String iecNo= rsMain.getString("IEC_NO"); if(iecNo==null)iecNo="";
     String notification= rsMain.getString("NOTIFICATION"); if(notification==null)notification="";
     String oCountry= rsMain.getString("O_COUNTRY"); if(oCountry==null)oCountry="";
     String dCountry= rsMain.getString("D_COUNTRY"); if(dCountry==null)dCountry="";
     String pcBy= rsMain.getString("PRE_CARRIAGE_BY"); if(pcBy==null)pcBy="";
     String pcRP= rsMain.getString("PRE_CARRIAGE_RECEIPT_PLACE"); if(pcRP==null)pcRP="";
    
    
     String fNo= rsMain.getString("FLIGHT_NO"); if(fNo==null)fNo=""; 
     String port= rsMain.getString("PORT_OF_LANDING"); if(port==null)port=""; 
     String fDestination= rsMain.getString("FINAL_DESTINATION"); if(fDestination==null)fDestination=""; 
     String terms= rsMain.getString("TERMS_OF_DP"); if(terms==null)terms=""; 
     String pfCharge= rsMain.getString("PF_CHARGE"); if(pfCharge==null)pfCharge=""; 
     String fCharge= rsMain.getString("FREIGHT_CHARGE"); if(fCharge==null)fCharge=""; 
     
     String tPcs= rsMain.getString("TOTAL_PCS"); if(tPcs==null)tPcs=""; 
     String tAmt= rsMain.getString("TOTAL_AMT"); if(tAmt==null)tAmt="0"; 
     String tBox= rsMain.getString("TOTAL_BOX"); if(tBox==null)tBox="0"; 
     String gWeight= rsMain.getString("GROSS_WT"); if(gWeight==null)gWeight="0";
     String nWeight= rsMain.getString("NET_WT"); if(nWeight==null)nWeight="0";
     
     String remarks= rsMain.getString("REMARKS"); if(remarks==null)remarks="";
     
 %>
<div class="form-group">                        
    <div class="col-md-12 span_4">
	
		
      <table   border = "1" align="left" cellspacing = "1" cellpadding="1" style="border-collapse: collapse" width="90%">
      
      <tr><td valign=top nowrap=nowrap align=center colspan=2><b> Invoice <br><br> </b></td>
   </tr>
    
      
      
       <tr><td valign=top width="50%" nowrap=nowrap>
       <b><u>Exporter<br></u><br>
       Pushkar Ganesh Cotton Club Exportr Pvt. Ltd  <br> Near Krishna Guest House,<br> Pushkar- 305 022 (India)
          <td align=left valign=top>
             <table  border=0>
             <tr><td valign=top> <b>Invoice No:</b> </td> <td><%= invNo%></td><tr>
             <tr><td nowrap=nowrap><b>IEC Code No:</b></td> <td><%= iecNo%></td> </tr>
             <tr><td valign=top> <b>Invoice Date:</b> </td><td colspan=2 nowrap=nowrap><%= invDate%></td> </tr>
             <tr><td valign=top> <b>Buyer's <br>Order & Date: </b></td><td colspan=2><%= soNo%> dated<br> <%= soDate%></td> </tr>
             <tr><td valign=top> <b>Notify: <br>(if other than consignee) </b></td><td colspan=2><%= notification%></td> </tr>
            
             </table> 
       </td>
       </tr>
       
       <tr><td valign=top nowrap=nowrap>
       <b><u>Consignee</u></b><br><br>
       <%=address%><br>
       Phone:<%=phone%>
          <td align=left valign=top>
             <table border=0>
             <tr><td valign=top> <b>Country of Origin of Goods: </b></td> <td><%= oCountry%></td></tr>
             <tr><td valign=top> <b>Country of Final Destination:</b> </td> <td nowrap=nowrap><%= dCountry%></td> </tr>
            
             </table> 
       </td>
       </tr>
       
          
       <tr>
       <td align=left valign=top>
             <table border=0>
             <tr><td valign=top> <b>Pre-Carriage By: </b></td valign=top> <td><%= pcBy%></td></tr>
             <tr><td valign=top> <b>Place of Receipt <br>by Pre-Carriage:</b></td> <td nowrap=nowrap valign=top><%= pcRP%></td> </tr>
             <tr><td valign=top> <b>Vessel/ Flight No:</b></td> <td nowrap=nowrap valign=top><%= fNo%></td> </tr>
             <tr><td valign=top> <b>Port of Discharge:</b></td> <td nowrap=nowrap valign=top><%= port%></td> </tr>
             <tr><td valign=top> <b>Final Destination:</b></td> <td nowrap=nowrap valign=top><%= fDestination%></td> </tr>
             </table> 
       </td>
      
       <td valign=top nowrap=nowrap>
       <b>Terms of Delivery and Payment</b><br>
       <%=terms%>
          
       </tr>
       <tr>
       <td valign=top nowrap=nowrap colspan=2>
       <b><u>Item Details</u></b>
       
          
       </tr>
       
       
       <tr>
       <td colspan=2>
       
       
                    <table   border = "1" align="left" cellspacing = "1" cellpadding="1" style="border-collapse: collapse">
		    
		        <tr>
		          
                            <th rowspan=2>Box No.</td>
                           <th rowspan=2>Item Name</td>
                          <th rowspan=2>Reference</td>
                         <th rowspan=2>Total Pcs</td>
                         <th rowspan=2>Rate <br> USD</td>
                         <th rowspan=2>Amount <br> USD</td>
                         
                                                  
                          </tr>
		          
		        <tbody>
		    
		      
           <%  
         
               String  sql2 =" SELECT t_so_box_item.ID BOX_ID, BOX_NO,t_so_box_item.CUST_ID, "+
               " ITEM_NAME,WT, "+
              " s.name STYLE, "+
             " ES,S,M,L,XL,XXL,FREE, REMARKS, TOTAL_PC, RATE, AMOUNT "+
             " from t_so_box_item,t_style_master s  WHERE  t_so_box_item.STYLE= s.ID AND "+
             "  SO_ID="+mast.getSo()+" "+
             "  and t_so_box_item.cust_id="+mast.getCustomer()+" "+
             " and t_so_box_item.INV_ID="+mast.getInvoice()+" order by BOX_NO ASC";
             // out.println(sql2);
             String soDtlId="",boxId="";
              String trClass="info",printName="",itemName ="";
                int es=0,s=0,m=0,l=0,xl=0,xxl=0,free=0,boxNo=0,total=0;
                float rate=0, amount=0;
                 rs = st.executeQuery(sql2);
                 int cnt=0;
               while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                       
                   
                        
                           boxId= rs.getString("BOX_ID");
                           es= rs.getInt("ES");
                           s= rs.getInt("S");
                           m= rs.getInt("M");
                           l= rs.getInt("L");
                           xl= rs.getInt("XL");
                           xxl= rs.getInt("XXL");
                           free= rs.getInt("FREE");
                           boxNo= rs.getInt("BOX_NO");
                           total= rs.getInt("TOTAL_PC");
                           rate= rs.getFloat("RATE");
                           amount= rs.getFloat("AMOUNT");
                           style=  rs.getString("STYLE");if(style==null)style="";
                        //total= es+s+m+l+xl+xxl+free;
                        
                       // printName=  rs.getString("PRINT_NAME");if(printName==null)printName="";
                        itemName=  rs.getString("ITEM_NAME");if(itemName==null)itemName="";
                        //remarks=  rs.getString("REMARKS");if(remarks==null)remarks="";
                      %>
                      
                       <tr scope="row" class="<%=trClass%>">
		         <th scope="row"><%= boxNo%></th>
                        <td rowspan=1 align=left nowrap=nowrap><%=itemName%></td>
                       <td rowspan=1 align=left nowrap=nowrap><%=style%></td>
                        <td align=center><%=total%></td>
                          <td align=center><%=rate%></td>
                          <td align=center><%=amount%></td>
                        </tr>  
    <%}%>                   
                       
                       <tr scope="row" >
		        <th scope="row" colspan=2></th> <th scope="row"></th>
                        <th colspan=2> Packing and Forwarding Charge </th>  <td rowspan=1 align=center><%=pfCharge%></td>
                       </tr>
                     
                     <tr scope="row" class="<%=trClass%>">
		        <th scope="row" colspan=2></th> <th scope="row"></th>
                        <th colspan=2> Freight Charge </th>  <td rowspan=1 align=center><%=fCharge%></td>
                       </tr>
                       
                       <tr scope="row">
		        <th scope="row"</th> Box (s)<th align=center><%= tBox%></th>
                        <td colspan=4></td>
                       
                       </tr>
                       
                       <tr scope="row" class="<%=trClass%>">
		        <th scope="row"</th> Net Weight (Kg.)<th align=center><%= nWeight%>
                         <td colspan=4></td>
                       </tr>
                       <tr scope="row">
		        <th scope="row"</th> Gross Weight (Kg.)<th align=center><%= gWeight%>
                         <td colspan=4></td>
                       </tr>
                       
                        <tr scope="row" class="<%=trClass%>">
		        <th scope="row" colspan=2></th> <th scope="row"></th>
                        <th colspan=2> Total Amount (In USD)</th><td rowspan=1 align=center><%=tAmt%></td> 
                       </tr>
                        <tr scope="row">
		        <th scope="row" colspan=2></th> <th scope="row"></th>
                        <th colspan=2> Total Amount in Words (In USD)</th><td rowspan=1 align=center><%=nToW.convert(Integer.parseInt(tAmt))%></td> 
                       </tr>
                        </tbody>
		    </table>
                  
		             
     

       
       </td>
       </tr>
      
  
     
      
       <tr><td colspan=2 align=right valign=top>
       <font size=2><br><b>For
       <br>Pushkar Ganesh Cotton Club Exportr Pvt. Ltd </b>
        </font>
       
       </tr>
     </table>
             
		
                   
                   
	   </div>                         
     
    </div> 
 
    
   <%}%>                        
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

<script>
     var dis = "<%= message %>";
     if(!dis ==""){
     alert(dis);
     
    }
   </script