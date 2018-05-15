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
     String xxxlTemp= request.getParameter("xxxl"); if(xxxlTemp==null)xxxlTemp="0";
     String freeTemp= request.getParameter("free"); if(freeTemp==null)freeTemp="0";
     String remarks= request.getParameter("remarks"); if(remarks==null)remarks="0";
     
 
     int stName=0;
     int maxId=0;
     
     String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_so_details";
     //out.println(maxIdSql);
     rs= st.executeQuery(maxIdSql);
     
     if(rs.next())
     {
     maxId= rs.getInt("MAX_ID");
     }else maxId=1;
     
     
     if(maxId==0)maxId=1;      
     //out.println(display);      
     String sqlInsert="INSERT INTO t_so_details(ID,SO_ID,ES,S,M,L,XL,XXL,REMARKS,XXXL, FREE)"+
      " VALUES "+
     " ("+maxId+","+so+","+esTemp+","+sTemp+","+mTemp+","+lTemp+","+xlTemp+","+xxlTemp+",'"+remarks+"',"+xxxlTemp+","+freeTemp+")"; 
    
    
     int x=st.executeUpdate(sqlInsert);
     
     int maxIdCombo=0;
     maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_so_combo_details";
     //out.println(maxIdSql);
     rs= st.executeQuery(maxIdSql);
     
     if(rs.next())
     {
     maxIdCombo= rs.getInt("MAX_ID");
     }else maxIdCombo=1;
    
     if(maxIdCombo==0)maxIdCombo=1;    
     
     
     
    

     String typeIdArray[]= request.getParameterValues("print");
     String stDetailIdArray[]= request.getParameterValues("stDetailId");
     String tempStyleDtlId="0",tempTypeCheck="",tempTypeId="",tempVal="";
    
     for (int i= 0 ;i<typeIdArray.length;i++)
     {
     
     tempVal= typeIdArray[i];
     
     String tempArr[]= tempVal.split("-");
     
   
     tempTypeCheck=  tempArr[0];
     tempTypeId= tempArr[1];
     
        sqlInsert="INSERT INTO t_so_combo_details(ID,SO_DTL_ID,ST_DTL_ID,TYPE_CHECK,TYPE_ID)"+
      " VALUES "+
     " ("+maxIdCombo+","+maxId+","+stDetailIdArray[i]+",'"+tempTypeCheck+"','"+tempTypeId+"')"; 
     //out.println(sqlInsert);
    
     int y=st.executeUpdate(sqlInsert);
     maxIdCombo++;
     }

     message= "New entry has been added successfully with in  selected SO";
     
   
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
                    <h4 class="panel-title">Add Items in Sales Order</h4>
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
                           
                                    <label for="selector1" class="col-sm-4 control-label">Select Customer</label>
                                    <div class="col-sm-4">
                                            <%=mast.getCustomerListOnChangeSODetails()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new SOMaster name!</p>-->
                                    </div>
                                    
                                    
                       </div> 
                      
                         <div class="form-group">
                            <input type="HIDDEN" name="display" value=""></input>
                                    <label for="selector1" class="col-sm-4 control-label">Select Sales Order</label>
                                    <div class="col-sm-4">
                                            <%=mast.getSOWithDateListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new SOMaster name!</p>-->
                                    </div>
                           </div>
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-4 control-label" align=left>Style Type</label>
                               <div class="col-sm-2">
                               <div class="radio-inline"><label><input type="radio"  onclick="javascript:resetOtherCustomer()" checked="checked" name="styleType"  <%= mast.getStyleType().equalsIgnoreCase("self") ?  chValue  :  ""%> value="self">Self</label></div>
                               </div>
                               
                               <div class="col-sm-2">
                               <div class="radio-inline"><label><input type="radio"  onclick="javascript:showOtherCustomer()" name="styleType" <%= mast.getStyleType().equalsIgnoreCase("customer") ?  chValue  :  ""%> value="customer">Other Customer</label></div>
                               </div>
                               
                               
                                <div class="radio-inline">
                                            <%=mast.getOtherCustomerListOnChange()%>
                                    </div>
                            </label>
                            
                            
                          
                          
                          </div> 
                           <div class="form-group">
                            <label for="focusedinput" class="col-sm-4 control-label" align=left>Select Month and Year in which Style/Sample was created</label>
                                    <label class="col-sm-4">
                                         <%@ include file="YearOnChange.jsp" %>
                                    </label>
                            </div>    
                             
                           <!-- Show all detail at one place)-->
                           
                        
                        
                        
                        
                           <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-4 control-label">Select Style</label>
                                    <div class="col-sm-4">
                                            <%=mast.getStyleListOnChange2()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new SOMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div>   
<%                           
      String dtlSql="";
      //out.println("reached"+mast.getStyleType());
if(!mast.getStyle().equalsIgnoreCase("0")){ 
String bImageName ="",id="",stName="",fab="",descr="",fImage="",bImage ="",monthYear="";

  dtlSql = "SELECT S.ID, S.NAME STYLE_NAME,S.DESCR,C.NAME CUSTOMER_NAME, F_IMAGE_NAME,B_IMAGE_NAME, IMAGE_PATH,"+
  " concat(S.MONTH,' - ',S.YEAR)  MONTH_YEAR"+
  " FROM t_product_master P, t_product_sub_master PS,t_customer_master C, t_style_master S  "+
            " WHERE S.CUST_ID= C.ID AND S.PROD_SUB_CATG_ID=PS.ID AND PS.PRODUCT_ID= P.ID "+
            " AND S.ID = "+mast.getStyle()+"";
    //out.println(dtlSql);
    rs = st.executeQuery(dtlSql);
   
    id="";
    
    if(rs.next()){
    id = rs.getString("ID");
    stName =rs.getString("STYLE_NAME"); if (stName == null) stName="";
    descr = rs.getString("DESCR"); if (descr == null) descr="";
    fImage = rs.getString("F_IMAGE_NAME");if (fImage == null) fImage="";
    bImage = rs.getString("B_IMAGE_NAME");if(bImage ==null)bImage ="";
    monthYear=  rs.getString("MONTH_YEAR");if(monthYear==null)monthYear="";
    }
    if(!id.equalsIgnoreCase(""))
    {
    %>
     
     
        <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">Month</label>
                                    <div class="col-sm-6">
                                            <%=monthYear%>
                                    </div>
      </div>
       
     
        <div class="form-group">
                          
                               
                                    <label for="selector1" class="col-sm-2 control-label">Front Photo</label>
                                    <div class="col-sm-6"><img src="/pgmis/docs/styles/<%=fImage%>" height="100" width="100" onmouseover="changeImg(this,true)" onmouseout="changeImg(this,false)"  alt=""/>
                                            
                                    </div>
                                   
       </div>
       <div class="form-group">
                          
                               
                                    <label for="selector1" class="col-sm-2 control-label">Rear Photo</label>
                                    <div class="col-sm-6"><img src="/pgmis/docs/styles/<%=bImage%>" height="100" width="100" onmouseover="changeImg(this,true)" onmouseout="changeImg(this,false)"    alt=""/>
                                            
                                    </div>
                                   
       </div>
       
       
              
      
     
  <%}
  
  
  %>        
<div class="form-group">                        
    <div class="col-md-12 span_3">
		  <div class="bs-example1" data-example-id="contextual-table">
		    
                    <%
          
                  String sql= "SELECT ID,PRINT_POSITION FROM t_style_details where STYLE_ID="+mast.getStyle()+" order by ID ASC";
                  //out.println(sql);
                  String printPosArr[]= null;
                  String styleDtlIdArr[]= null;
                  rs = st.executeQuery(sql);
                  int totalPrintPos=0;
                  while(rs.next()){
                  ++totalPrintPos;
                    } 
                 
                  printPosArr= new String[totalPrintPos];
                  styleDtlIdArr= new String[totalPrintPos];
                  rs = st.executeQuery(sql);
                  int cnt=0;
                  
                  while(rs.next()){
                  printPosArr[cnt]= rs.getString("PRINT_POSITION");
                  styleDtlIdArr[cnt]= rs.getString("ID");
                    cnt++;
                    }   
                    
                
                 
              %>
                    
                    <table class="table">
		    
		        <tr>
		          <th rowspan=2>#</td>
                          
                          <% for (int i=0;i<printPosArr.length;i++){
                         %>
                         
                          <th rowspan=2><%=printPosArr[i]%>
                          <input type=hidden name="stDetailId" value="<%=styleDtlIdArr[i]%>"></input>
                          </td>
                         
                         <%}%>
                          <th rowspan=1>Extra Small (XS)<br>(6)</th>
		          <th rowspan=1>Small (S)<br>(8)</th>
		          <th rowspan=1>Medium (M)<br>(10)</th>
                          <th rowspan=1>Large (L)<br>(12)</th>
                         <th rowspan=1>Extra Large (XL)<br>(14)</th>
                         <th rowspan=1>XXL<br>(16)</th>
                           <th rowspan=1>XXXL</th>
                         <th rowspan=1>Free</th>
                       
                         <th rowspan=2>Remarks</td>
                         <th rowspan=2>Delete</td>
                         <th rowspan=2>Update</td>
                         </td>
                          </tr>
		          <tr>
		         
                         </tr>
		        <tbody>
		    
		      
           <%  
         
                    
               String  sql2 =" SELECT DISTINCT SOD.ID SO_DTL_ID, "+
             " SOD.ES,SOD.S,SOD.M,SOD.L,SOD.XL,SOD.XXL,SOD.XXXL,SOD.FREE, SOD.REMARKS "+
             " from t_so_details SOD, t_so_master so, t_so_combo_details soc,t_style_master s , t_style_details sd "+
               "  where sd.style_id= s.id  "+
               "   and soc.ST_DTL_ID= sd.ID "+
               "  and soc.SO_DTL_ID= soc.SO_DTL_ID AND SOD.SO_ID= so.ID AND soc.ST_DTL_ID=sd.id  "+
                " AND soc.SO_DTL_ID= SOD.ID   "+
                " AND s.ID="+mast.getStyle()+" "+
               " AND SOD.SO_ID="+mast.getSo();
            /// out.println(sql2);
             String soDtlId="";
              String trClass="info",remarks="";
                int es=0,s=0,m=0,l=0,xl=0,xxl=0,xxxl=0,free=0;
                 rs = st.executeQuery(sql2);
                 cnt=0;
               while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                       
                   
                        soDtlId= rs.getString("SO_DTL_ID");if(soDtlId==null)soDtlId="";
                           es= rs.getInt("ES");
                           s= rs.getInt("S");
                           m= rs.getInt("M");
                           l= rs.getInt("L");
                           xl= rs.getInt("XL");
                           xxl= rs.getInt("XXL");
                             xxxl= rs.getInt("XXXL");
                             free= rs.getInt("FREE");
                      
                        remarks=  rs.getString("REMARKS");if(remarks==null)remarks="";
                      %>
                      
                       <tr scope="row" class="<%=trClass%>">
		        <th scope="row"><%= cnt%></th>
                      <%// get print details
                    
                    for (int i=0;i<printPosArr.length;i++){    
                      
               
                     
                    String  sql3 ="  SELECT PRINT.NAME PRINT_NAME from t_so_combo_details SOC, t_style_details SD , "+ 
                       "  t_style_master S, t_so_master SO, t_so_details SOD, "+ 
                       "  t_print_master PRINT WHERE SOC.SO_DTL_ID= SOD.ID  AND SOD.SO_ID= SO.ID"+ 
                       " AND SOC.ST_DTL_ID=SD.ID AND SD.STYLE_ID= S.ID "+ 
                       " AND SOC.TYPE_ID= PRINT.ID "+ 
                       " AND SOC.TYPE_CHECK='Print' "+ 
                       " AND SO.ID="+mast.getSo()+" "+ 
                        " AND SD.iD="+styleDtlIdArr[i]+" "+ 
                       " AND S.ID= "+mast.getStyle()+" "+
                       " AND SOD.ID="+soDtlId+" ";
                      //out.println(sql3); 
                     sql3+="  union SELECT PRINT.NAME PRINT_NAME from t_so_combo_details SOC, t_style_details SD , "+ 
                       "  t_style_master S, t_so_master SO, t_so_details SOD, "+ 
                       "  t_plain_master PRINT WHERE SOC.SO_DTL_ID= SOD.ID  AND SOD.SO_ID= SO.ID"+ 
                       " AND SOC.ST_DTL_ID=SD.ID AND SD.STYLE_ID= S.ID "+ 
                       " AND SOC.TYPE_ID= PRINT.ID "+ 
                       " AND SOC.TYPE_CHECK='Plain' "+ 
                       " AND SO.ID="+mast.getSo()+" "+ 
                        " AND SD.iD="+styleDtlIdArr[i]+" "+ 
                        " AND S.ID= "+mast.getStyle()+" "+
                       " AND SOD.ID="+soDtlId+" ";

                     
                    // out.println(sql3);
                     
                         rs2 = st2.executeQuery(sql3);
                         
                          if(rs2.next())
                           {
                           %>
                         
                          <td rowspan=1 align=left><%=rs2.getString("PRINT_NAME")%></td>
                           <%}
                           
                         
                         }
                    %>
                   
		    
		     
                      <%
                        
                       
                   
                       %> 
                       
		 
		          <td align=center><%=es%></td>
                          <td align=center><%=s%></td>
                          <td align=center><%=m%></td>
                          <td align=center><%=l%></td>
                          <td align=center><%=xl%></td>
                          <td align=center><%=xxl%></td>
                          <td align=center><%=xxxl%></td>
                          <td align=center><%=free%></td>
                      
                           <td align=left><%=remarks%></td>
                          <td> <a href='javascript:deleteRedirect("<%=soDtlId%>","t_so_details","soDetails")'>Delete</a></td>
                          <td> <a href='javascript:updateRedirect("<%=soDtlId%>","t_so_details","soDetails")'>Update</a></td>
		        
		        </tr>
                        
                      <%
                      
                      if(trClass.equalsIgnoreCase("info"))trClass="";
                       
                      }
                     // out.println(mast.getTypeCheck());
                      
                      %>   
  <tr>
    <td align="center"><b><font color="Red">New</b></td>
      <% for (int i=0;i<printPosArr.length;i++){
                         %>
                         
                         <td><%= mast.getPrintList() %></td>
                         
                         <%}%>


    <td>
  <input type="text" size=1 class="form-control1" name="es" id="es" placeholder="">
   </td>
     <td>
  <input type="text" size=2 class="form-control1" name="s" id="s" placeholder="">
   </td>
     <td>
  <input type="text" size=2 class="form-control1" name="m" id="m" placeholder="">
   </td>
   <td>
  <input type="text" size=2 class="form-control1" name="l" id="l" placeholder="">
   </td>
   <td>
  <input type="text" size=2 class="form-control1" name="xl" id="xl" placeholder="">
   </td>
   <td>
  <input type="text" size=2 class="form-control1" name="xxl" id="xxl" placeholder="">
   </td>
   <td>
  <input type="text" size=2 class="form-control1" name="xxxl" id="xxxl" placeholder="">
   </td>
    <td>
  <input type="text" size=2 class="form-control1" name="free" id="free" placeholder="">
   </td>
   
  <td>
                             
                            
                                
                                  
                                             <input type="text" class="form-control1" name="remarks" id="remarks" placeholder="Remarks">

                                    
   </TD>                                 
    </tr> 
		      </tbody>
		    </table>
                  
		   </div>
                   
                   
	   </div>                         
     
    </div>                 
                           
                            <div class="but_list" align=left>
                           
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