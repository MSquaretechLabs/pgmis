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
   }else if(document.SOMaster.style.value=="0")
   {
   reason+="Please Select Style .\n";
   }
   if (reason != "") {
    alert("Some fields need correction:\n" + reason);
    return false;
  }
 
}
return true;
}

function calAmt()

{

var es= Number(document.SOMaster.es.value);
  var s= Number(document.SOMaster.s.value);
  var m= Number(document.SOMaster.m.value);
  var l= Number(document.SOMaster.l.value);
  var xl= Number(document.SOMaster.xl.value);
  var xxl= Number(document.SOMaster.xxl.value);
  var free= Number(document.SOMaster.free.value);
  
  var rate= Number(document.SOMaster.rate.value);
  varTotalPc= es+s+m+l+xl+xxl+free;
  var amt= varTotalPc*rate;
  
  document.SOMaster.totalPc.value= varTotalPc;
  document.SOMaster.amt.value= amt;
  

}

function resetOtherCustomer()
{
document.SOMaster.style.value = "0";
document.SOMaster.otherCustomer.value = "0";
document.SOMaster.otherCustomer.disabled = true;
showData();
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
  function changeImg(who,flag) {

  if (flag) {

    who.style.height='125px';  who.style.width='100px';

  } else {

    who.style.height='100px';  who.style.width='100px';

  }

}

function deleteRedirect(idT,tableNameT,typeT)
{
  var id= idT;
  var mod= "Sales";
  var customerT= document.SOMaster.customer.value;
  var styleT= document.SOMaster.style.value;
  var soT= document.SOMaster.so.value;
  
  var styleTypeT= document.SOMaster.styleType.value;
  var otherCustomerT= document.SOMaster.otherCustomer.value;
  
  
  var check = confirm("Do you want to Delete?")
   if(check){
    window.location.href="/pgmis/admin/DeleteItem.jsp?id="+id+"&tableName="+tableNameT+"&type="+typeT+"&module="+mod+"&styleType="+styleTypeT+"&so="+soT+"&customer="+customerT+"&style="+styleT+"&otherCustomer="+otherCustomerT+"";
   }


}

function updateRedirect(idT,tableNameT,typeT)
{
  var id= idT;
  var mod= "Sales";
  var customerT= document.SOMaster.customer.value;
  var styleT= document.SOMaster.style.value;
  var soT= document.SOMaster.so.value;
  
  var styleTypeT= document.SOMaster.styleType.value;
  var otherCustomerT= document.SOMaster.otherCustomer.value;
  
  var check = confirm("Do you want to Update?")
   if(check){
    window.location.href="/pgmis/sales/UpdateSODetail.jsp?soDtlId="+id+"&tableName="+tableNameT+"&type="+typeT+"&module="+mod+"&styleType="+styleTypeT+"&so="+soT+"&customer="+customerT+"&style="+styleT+"&otherCustomer="+otherCustomerT+"";
   }
   


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
          
     String esTemp= request.getParameter("es"); if(esTemp==null)esTemp="0";
     String sTemp= request.getParameter("s"); if(sTemp==null)sTemp="0";
     String mTemp= request.getParameter("m"); if(mTemp==null)mTemp="0";
     String lTemp= request.getParameter("l"); if(lTemp==null)lTemp="0";
     String xlTemp= request.getParameter("xl"); if(xlTemp==null)xlTemp="0";
     String xxlTemp= request.getParameter("xxl"); if(xxlTemp==null)xxlTemp="0";
     String freeTemp= request.getParameter("free"); if(freeTemp==null)freeTemp="0";
     
     String wtTemp= request.getParameter("wt"); if(wtTemp==null)wtTemp="0";
     
     String totalPcTemp= request.getParameter("totalPc"); if(totalPcTemp==null)totalPcTemp="0";
     String rateTemp= request.getParameter("rate"); if(rateTemp==null)rateTemp="0";
     String amtTemp= request.getParameter("amt"); if(amtTemp==null)amtTemp="0";
     
     
     String boxNo= request.getParameter("boxNo"); if(boxNo==null)boxNo="";
     String itemName= request.getParameter("itemName"); if(itemName==null)itemName="";
     String color= mast.getPrint();
     //String remarks= request.getParameter("remarks"); if(remarks==null)remarks="0";
     
 
     int stName=0;
     int maxId=0;
     
     String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_so_box_item";
     //out.println(maxIdSql);
     rs= st.executeQuery(maxIdSql);
     
     if(rs.next())
     {
     maxId= rs.getInt("MAX_ID");
     }else maxId=1;
     
     
     if(maxId==0)maxId=1;      
     //out.println(display);      
     String sqlInsert="INSERT INTO t_so_box_item(ID,SO_ID, STYLE,CUST_ID,BOX_NO,ITEM_NAME,ES,S,M,L,XL,XXL,FREE, TOTAL_PC,RATE,AMOUNT,WT)"+
      " VALUES "+
     " ("+maxId+", "+mast.getSo()+","+mast.getStyle()+","+mast.getCustomer()+", "+boxNo+", '"+itemName+"', "+esTemp+","+sTemp+","+mTemp+","+lTemp+","+xlTemp+","+xxlTemp+","+freeTemp+","+totalPcTemp+","+rateTemp+","+amtTemp+","+wtTemp+")"; 
    //out.println(sqlInsert);
    
     int x=st.executeUpdate(sqlInsert);
     
     
     message= "New entry has been added successfully.";
     
   
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
     	 <div class="style3" id="print_content">
      <div class="col_1">
		   <div class="col-md-12 span_6">
                 <div class="panel-heading">
                    <h4 class="panel-title">Box Wise Item Details</h4>
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
                           
                                    <label for="selector1" class="col-sm-4 control-label">Customer</label>
                                    <div class="col-sm-4">
                                            <%=mast.getCustomerListOnChangeSODetails()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new SOMaster name!</p>-->
                                    </div>
                                    
                                    
                       </div> 
                      
                         <div class="form-group">
                            <input type="HIDDEN" name="display" value=""></input>
                                    <label for="selector1" class="col-sm-4 control-label">Sales Order</label>
                                    <div class="col-sm-4">
                                            <%=mast.getSOWithDateListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new SOMaster name!</p>-->
                                    </div>
                           </div>
                            
<%                           
      String dtlSql="";
      //out.println("reached"+mast.getStyleType());
if(!mast.getSo().equalsIgnoreCase("0")){ 
String bImageName ="",id="",stName="",fab="",descr="",fImage="",bImage ="",monthYear="";
%>
       
<div class="form-group">                        
    <div class="col-md-12 span_3">
		  <div class="panel-body no-padding" style="display: block;">
                    <table class="table table"  border = "1" align="left" cellspacing = "1" cellpadding="1" style="border-collapse: collapse">  
		        <tr>
		          <th rowspan=2>#</td>
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
                         <th rowspan=2>Delete</td>
                                                  </td>
                          </tr>
		          <tr>
		         
                         </tr>
		        <tbody>
		    
		      
           <%  
         
               String  sql2 =" SELECT t_so_box_item.ID ID,BOX_NO,t_so_box_item.CUST_ID, ITEM_NAME,COLOR, "+
               " s.name STYLE, WT,"+
             " ES,S,M,L,XL,XXL,FREE, REMARKS, TOTAL_PC, RATE, AMOUNT "+
             " from t_so_box_item,  t_style_master s"+
             " WHERE t_so_box_item.STYLE= s.ID "+
             " AND  SO_ID="+mast.getSo()+" "+
             "  and t_so_box_item.cust_id="+mast.getCustomer()+" ";
             // out.println(sql2);
             String soDtlId="";
              String trClass="info",remarks="",style="",printName="",itemName ="";
                int es=0,s=0,m=0,l=0,xl=0,xxl=0,free=0,boxNo=0,total=0;
                float rate=0, amount=0,wt=0;
                 rs = st.executeQuery(sql2);
                 int cnt=0;
               while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                       
                   
                           id= rs.getString("ID");
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
                           wt= rs.getFloat("WT");
                        
                        //total= es+s+m+l+xl+xxl+free;
                        
                        //printName=  rs.getString("PRINT_NAME");if(printName==null)printName="";
                        itemName=  rs.getString("ITEM_NAME");if(itemName==null)itemName="";
                        remarks=  rs.getString("REMARKS");if(remarks==null)remarks="";
                        style=  rs.getString("STYLE");if(style==null)style="";
                      %>
                      
                       <tr scope="row" class="<%=trClass%>">
		        <th scope="row"><%= cnt%></th>
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
                           <td align=center><%=wt%></td>
                           <td align=center><a href='DeleteBoxItem.jsp?id=<%=id%>&so=<%=mast.getSo()%>&customer=<%=mast.getCustomer()%>'>Delete</td>
                          
    <%}%>                   
                       
                         
  <tr>
    <td align="center"><b><font color="Red">New</b></td>
    <td>
  <input type="text" size=2 class="form-control1" name="boxNo" id="boxNo" placeholder="">
   </td>
    <td>
  <input type="text"  class="form-control1" name="itemName" id="itemName" placeholder="">
   </td>
 
   <td><%= mast.getStyleInvoiceList(mast.getSo()) %></td>
  <td>
  <input type="text" size=1 onChange="javascript:calAmt()"  class="form-control1" value ="0" name="es" id="es" placeholder="">
   </td>
     <td>
  <input type="text" size=2 onChange="javascript:calAmt()" class="form-control1" value ="0"name="s" id="s" placeholder="">
   </td>
     <td>
  <input type="text" size=2 onChange="javascript:calAmt()" class="form-control1"  value ="0"name="m" id="m" placeholder="">
   </td>
   <td>
  <input type="text" size=2 onChange="javascript:calAmt()" class="form-control1" value ="0" name="l" id="l" placeholder="">
   </td>
   <td>
  <input type="text" size=2 onChange="javascript:calAmt()" class="form-control1" value ="0" name="xl" id="xl" placeholder="">
   </td>
   <td>
  <input type="text" size=2 onChange="javascript:calAmt()" class="form-control1" value ="0" name="xxl" id="xxl" placeholder="">
   </td>
   <td>
  <input type="text" size=2 onChange="javascript:calAmt()" class="form-control1"  value ="0" name="free" id="free" placeholder="">
   </td>
   <td>
  <input type="text" size=4 class="form-control1" readonly name="totalPc" id="totalPc" value ="0" placeholder="">
   </td>
    <td>
  <input type="text" size=4 onChange="javascript:calAmt()" class="form-control1" value ="0" name="rate" id="rate" placeholder="">
   </td>
    <td>
  <input type="text" size=4 class="form-control1" readonly name="amt" id="amt" placeholder="">
   </td>
     <td>
  <input type="text" size=4 class="form-control1" name="wt" id="wt" placeholder="">
   </td>
   <td></td>
   
    </tr> 
		      </tbody>
		    </table>
                  
		   </div>
                   
                   
	   </div>                         
     
    </div>                 
                           
                            <div class="but_list" align=center>
                           
                                 <p>        
                                 <button type="button" class="btn btn_5 btn-lg btn-warning warning_11" onclick="javascript:submitClick()" >Save</button> 
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