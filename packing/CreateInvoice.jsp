<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="mast" scope="request" class="administration.SOMaster"></jsp:useBean>
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

 function showData()
  {
  
  document.SOMaster.display.value = "display";
  document.SOMaster.submit();
  }
  
function showOtherCustomer()
{
document.SOMaster.style.value = "0";
document.SOMaster.otherCustomer.disabled = false;
showData();
}

 function showDataSoDetails()
  {
  document.SOMaster.so.value = "0";
  document.SOMaster.style.value = "0";
  document.SOMaster.display.value = "display";
  document.SOMaster.submit();
  }
function submitClick(){

if(validateForm())
    { 
    document.SOMaster.display.value = "save";
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
   else if(document.SOMaster.so.value=="0")
   {
   reason+="Please Select SO .\n";
   }
   else if(document.SOMaster.invNo.value=="")
   {
   reason+="Please Enter Invoice No .\n";
   }
   else if(document.SOMaster.invDate.value=="")
   {
   reason+="Please Enter Invoice Date .\n";
   }
   else if(document.SOMaster.iecNo.value=="")
   {
   reason+="Please Enter IEC No .\n";
   }else if(document.SOMaster.oCountry.value=="")
   {
   reason+="Please Enter Country of Origin .\n";
   }else if(document.SOMaster.dCountry.value=="")
   {
   reason+="Please Enter Country of Dispatch .\n";
   }else if(document.SOMaster.pcBy.value=="")
   {
   reason+="Please Enter Pre-carriage By  .\n";
   }else if(document.SOMaster.pcRP.value=="")
   {
   reason+="Please Enter Pre-carriage Receipt Place  .\n";
   }else if(document.SOMaster.fDestination.value=="")
   {
   reason+="Please Enter Final Destination  .\n";
   }else if(document.SOMaster.terms.value=="")
   {
   reason+="Please Enter Terms of DP  .\n";
   }else if(document.SOMaster.tPcs.value=="")
   {
   reason+="Please Enter Total No. of Pcs  .\n";
   }else if(document.SOMaster.tBox.value=="")
   {
   reason+="Please Enter Total No. of Boxes  .\n";
   }else if(document.SOMaster.tAmt.value=="")
   {
   reason+="Please Enter Total Amount  .\n";
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
String chValue ="checked=checked";
try
{   
     
 st= con.createStatement();
 st2= con.createStatement();
 
 String display=request.getParameter("display"); if(display==null)display="";
// out.println(display);
 if(display.equalsIgnoreCase("save"))
 {
     
     String so=request.getParameter("so"); if(so==null)so="0";
          
     String invNo= request.getParameter("invNo"); if(invNo==null)invNo="0";
     String invDate= request.getParameter("invDate"); if(invDate==null)invDate="";
     String iecNo= request.getParameter("iecNo"); if(iecNo==null)iecNo="";
     String notification= request.getParameter("notification"); if(notification==null)notification="";
     String oCountry= request.getParameter("oCountry"); if(oCountry==null)oCountry="";
     String dCountry= request.getParameter("dCountry"); if(dCountry==null)dCountry="";
     String pcBy= request.getParameter("pcBy"); if(pcBy==null)pcBy="";
     String pcRP= request.getParameter("pcRP"); if(pcRP==null)pcRP="";
    
    
     String fNo= request.getParameter("fNo"); if(fNo==null)fNo=""; 
     String port= request.getParameter("port"); if(port==null)port=""; 
     String fDestination= request.getParameter("fDestination"); if(fDestination==null)fDestination=""; 
     String terms= request.getParameter("terms"); if(terms==null)terms=""; 
     String pfCharge= request.getParameter("pfCharge"); if(pfCharge==null)pfCharge=""; 
     String fCharge= request.getParameter("fCharge"); if(fCharge==null)fCharge=""; 
     
     String tPcs= request.getParameter("tPcs"); if(tPcs==null)tPcs=""; 
     String tAmt= request.getParameter("tAmt"); if(tAmt==null)tAmt="0"; 
     String tBox= request.getParameter("tBox"); if(tBox==null)tBox="0"; 
     String gWeight= request.getParameter("gWeight"); if(gWeight==null)gWeight="0";
     String nWeight= request.getParameter("nWeight"); if(nWeight==null)nWeight="0";
     
     String remarks= request.getParameter("remarks"); if(remarks==null)remarks="";
     
 
  
     int maxId=0;
     
     String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_invoice_master";
     //out.println(maxIdSql);
     rs= st.executeQuery(maxIdSql);
     
     if(rs.next())
     {
     maxId= rs.getInt("MAX_ID");
     }else maxId=1;
     
     
     if(maxId==0)maxId=1;      
     //out.println(display);      
     String sqlInsert="INSERT INTO t_invoice_master"+
     " (ID, SO_ID, CUST_ID, INV_NO, IEC_NO, INV_DATE, NOTIFICATION, O_COUNTRY, D_COUNTRY,"+
     " PRE_CARRIAGE_BY, PRE_CARRIAGE_RECEIPT_PLACE, FLIGHT_NO, PORT_OF_LANDING, FINAL_DESTINATION,"+
     " TERMS_OF_DP, PF_CHARGE, FREIGHT_CHARGE, TOTAL_PCS, TOTAL_AMT, TOTAL_BOX, NET_WT, GROSS_WT, REMARKS)"+
      " VALUES "+
     " ("+maxId+", "+mast.getSo()+", "+mast.getCustomer()+", '"+invNo+"', '"+iecNo+"', "+
     " '"+invDate+"','"+notification+"','"+oCountry+"','"+dCountry+"','"+pcBy+"','"+pcRP+"',"+
     " '"+fNo+"','"+port+"','"+fDestination+"','"+terms+"',"+pfCharge+", "+
     " "+fCharge+", "+tPcs+","+tAmt+","+tBox+","+nWeight+","+gWeight+",'"+remarks+"')"; 
    //out.println(sqlInsert);
    
     int x=st.executeUpdate(sqlInsert);
     
     // Getting Array 
     try{
       String boxIdArray[]= request.getParameterValues("boxId");
       String boxIdTemp="";
         for( int i=0;i<boxIdArray.length;i++)
         {
         boxIdTemp= boxIdArray[i];
         sqlInsert="UPDATE t_so_box_item SET INV_ID="+maxId+" WHERE ID="+boxIdTemp+" AND SO_ID ="+mast.getSo()+" AND "+
         " CUST_ID="+mast.getCustomer()+"";
         x=st.executeUpdate(sqlInsert);
         }
       }catch(Exception rt)
     {}
     
     message= "New Invoice has been created successfully.";
     
   
  }
 
 
 
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
                    <h4 class="panel-title">Create New Invoice</h4>
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
                           
                                    <label for="selector1" class="col-sm-2 control-label">Select Customer</label>
                                    <div class="col-sm-4">
                                            <%=mast.getCustomerListOnChangeSODetails()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new SOMaster name!</p>-->
                                    </div>
                                    
                                    
                       </div> 
                      
                         <div class="form-group">
                            <input type="HIDDEN" name="display" value=""></input>
                                    <label for="selector1" class="col-sm-2 control-label">Select Sales Order</label>
                                    <div class="col-sm-4">
                                            <%=mast.getSOWithDateListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new SOMaster name!</p>-->
                                    </div>
                           </div>
                           <hr></hr>
                            
<%                           
      String dtlSql="";
      //out.println("reached"+mast.getStyleType());
if(!mast.getSo().equalsIgnoreCase("0")){ 
String bImageName ="",id="",stName="",fab="",descr="",fImage="",bImage ="",monthYear="";
%>
      <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Invoice No</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="invNo" id="invNo" placeholder="Invoice No.">
                                    </div>
                            </div>  
              <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">IEC No</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="iecNo" id="iecNo" placeholder="IEC No."></input>
                                    </div>
              </div>
               <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Invoice Date</label>
                                    <div class="col-sm-4">
                                            <input type="date"  name= "invDate" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">
                                    </div>
                </div>
                            
               <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Notify (If other than consignee)</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="notification" id="notification" placeholder="Notification"></input>
                                    </div>
              </div>
               <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Country of Origin of Goods</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="oCountry" id="oCountry" placeholder=""></input>
                                    </div>
              </div> 
              <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Country of Finaal Destination</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="dCountry" id="dCountry" placeholder=""></input>
                                    </div>
              </div>
              <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Pre-carriage By</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="pcBy" id="pcBy" placeholder=""></input>
                                    </div>
              </div>
              <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Pre-carriage Receipt Place</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="pcRP" id="pcRP" placeholder=""></input>
                                    </div>
              </div>
              <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Vessel/ Flight No</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="fNo" id="fNo" placeholder=""></input>
                                    </div>
              </div>
              <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Port of Landing</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="port" id="port" placeholder=""></input>
                                    </div>
              </div>
               <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Final Destination</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="fDestination" id="fDestination" placeholder=""></input>
                                    </div>
              </div>
               <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Terms of Delivery & Payment</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="terms" id="terms" placeholder=""></input>
                                    </div>
              </div> 
                <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Packing & Forwarding Charges ($)</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="pfCharge" id="pfCharge" placeholder=""></input>
                                    </div>
              </div>
                <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Freight Charge  ($)</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="fCharge" id="fCharge" placeholder=""></input>
                                    </div>
              </div>
              
      <!-- Get Box Item Details for selection -->
      
      <div class="form-group">                        
    <div class="col-md-12 span_3">
		  <div class="bs-example1" data-example-id="contextual-table">
		      
                    <table class="table">
		    
		        <tr>
		          <th rowspan=2>#</td>
                          <th rowspan=2>Select</td>
                          <th rowspan=2>Box No.</td>
                          
                           <th rowspan=2>Item Name</td>
                           <th rowspan=2>Reference</td>
                         <th rowspan=1>Extra Small (XS)<br>(6)</th>
		          <th rowspan=1>Small (S)<br>(8)</th>
		          <th rowspan=1>Medium (M)<br>(10)</th>
                          <th rowspan=1>Large (L)<br>(12)</th>
                         <th rowspan=1>Extra Large (XL)<br>(14)</th>
                         <th rowspan=1>XXL<br>(16)</th>
                         <th rowspan=2>Free</td>
                         <th rowspan=2>Total Pcs</td>
                         <th rowspan=2>Rate <br> USD</td>
                         <th rowspan=2>Amount <br> USD</td>
                           <th rowspan=2>Box Weight <br> (In Kg.)</td>
                         
                                                  </td>
                          </tr>
		          <tr>
		         
                         </tr>
		        <tbody>
		    
		      
           <%  
         
               String  sql2 =" SELECT t_so_box_item.ID BOX_ID, BOX_NO,t_so_box_item.CUST_ID,"+
               " ITEM_NAME,COLOR,WT,  "+
               " s.name STYLE "+
             " ,ES,S,M,L,XL,XXL,FREE, REMARKS, TOTAL_PC, RATE, AMOUNT "+
             " from t_so_box_item,   t_style_master s "+
             " WHERE t_so_box_item.STYLE= s.ID "+
             " AND  SO_ID="+mast.getSo()+" "+
             "  and t_so_box_item.cust_id="+mast.getCustomer()+" ";
             // out.println(sql2);
             String soDtlId="",boxId="";
              String trClass="info",style="",remarks="",printName="",itemName ="";
              int es=0,s=0,m=0,l=0,xl=0,xxl=0,free=0,boxNo=0,total=0;
              float rate=0, amount=0,wt=0;
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
                           wt= rs.getFloat("WT");
                        
                        //total= es+s+m+l+xl+xxl+free;
                        
                       // printName=  rs.getString("PRINT_NAME");if(printName==null)printName="";
                        itemName=  rs.getString("ITEM_NAME");if(itemName==null)itemName="";
                        remarks=  rs.getString("REMARKS");if(remarks==null)remarks="";
                      %>
                      
                       <tr scope="row" class="<%=trClass%>">
		        <th scope="row"><%= cnt%></th>
                        <th scope="row"><input type= checkbox name=boxId value="<%=boxId%>"></th>
                        <th scope="row"><%= boxNo%></th>
                        <td rowspan=1 align=left><%=itemName%></td>
                          <td rowspan=1 align=left><%=style%></td>
                       
                       <td align=center><%=es%></td>
                          <td align=center><%=s%></td>
                          <td align=center><%=m%></td>
                          <td align=center><%=l%></td>
                          <td align=center><%=xl%></td>
                          <td align=center><%=xxl%></td>
                          <td align=center><%=free%></td>
                          <td align=center><%=total%></td>
                          <td align=center><%=rate%></td>
                          <td align=center><%=amount%></td>
                          <td rowspan=1 align=left><%=wt%></td>
                          
    <%}%>                   
                       
                         
 
		      </tbody>
		    </table>
                  
		   </div>
                   
                   
	   </div>                         
     
    </div> 
      
      
      
      
              
              <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Total Pcs</label>
                                    <div class="col-sm-4">
                                            <input type="text" size=10 class="form-control1" name="tPcs" id="tPcs" placeholder=""></input>
                                    </div>
              </div>
               <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Total Amount(In $)</label>
                                    <div class="col-sm-4">
                                            <input type="text" size=10 lass="form-control1" name="tAmt" id="tAmt" placeholder=""></input>
                                    </div>
              </div>
              <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Total Boxes</label>
                                    <div class="col-sm-6">
                                            <input type="text" size=10 lass="form-control1" name="tBox" id="tBox" placeholder=""></input>
                                    </div>
              </div>
               <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Gross Weight</label>
                                    <div class="col-sm-6">
                                            <input type="text" size=10 lass="form-control1" name="gWeight" id="gWeight" placeholder=""></input>
                                    </div>
              </div>
              <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Neight Weight</label>
                                    <div class="col-sm-6">
                                            <input type="text" size=10 lass="form-control1" name="nWeight" id="nWeight" placeholder=""></input>
                                    </div>
              </div>
              
              
               <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Remarks</label>
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
		  
	      <!-- map type
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
<script language="javaScript1.2">
alert("reached herer");
    
     
    }
   </script