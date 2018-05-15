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

 function showData()
  {
  
  document.POMaster.display.value = "display";
  document.POMaster.submit();
  }
  function showDataCustomer()
  {
  
  document.POMaster.style.value = "0";
  document.POMaster.display.value = "display";
  document.POMaster.submit();
  }
function submitClick(){

if(validateForm())
    { 
    document.POMaster.display.value = "save";
    document.POMaster.submit(); 
    }
  }  

function validateForm(){

 if(validateFormFields())
 {  if(document.POMaster.display.value != "display"){
   var check = confirm("Do you want to Save?")
   if(check){
   document.POMaster.display.value="save";
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

 if(document.POMaster.display.value != "display")
 {
   var reason = "";
  
  if(document.POMaster.printPos.value=="")
   {
   reason+="Please Enter Print Position.\n";
   }
   if (reason != "") {
    alert("Some fields need correction:\n" + reason);
    return false;
  }
 
}
return true;
}

function deleteRedirect(idT,tableNameT,typeT)
{
  var id= idT;
  var mod= "admin";
  var productT= document.POMaster.product.value;
  var subProductT= document.POMaster.product.value;
  var customerT= document.POMaster.customer.value;
  var styleT= document.POMaster.style.value;
  
  var check = confirm("Do you want to Delete?")
   if(check){
    window.location.href="/pgmis/admin/DeleteItem.jsp?id="+id+"&tableName="+tableNameT+"&type="+typeT+"&module="+mod+"&product="+productT+"&subProduct="+subProductT+"&customer="+customerT+"&style="+styleT+"";
   }
   


}

function updateRedirect(idT,tableNameT,typeT)
{
  var id= idT;
  var mod= "admin";
  var productT= document.POMaster.product.value;
  var subProductT= document.POMaster.product.value;
  var customerT= document.POMaster.customer.value;
  var styleT= document.POMaster.style.value;
  
  var check = confirm("Do you want to Update?")
   if(check){
    window.location.href="/pgmis/admin/UpdateStylePosition.jsp?sdId="+id+"&tableName="+tableNameT+"&type="+typeT+"&module="+mod+"&product="+productT+"&subProduct="+subProductT+"&customer="+customerT+"&style="+styleT+"";
   }
   


}

 function changeImg(who,flag) {

  if (flag) {

    who.style.height='125px';  who.style.width='100px';

  } else {

    who.style.height='60px';  who.style.width='60px';

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
     
     String subProduct=request.getParameter("subProduct"); if(subProduct==null)subProduct="0";
     String style=request.getParameter("style"); if(style==null)style="0";
     //String typeCheck=request.getParameter("typeCheck"); if(typeCheck==null)typeCheck="Print";
     //String print=request.getParameter("print"); if(print==null)print="0";
     String printPos=request.getParameter("printPos"); if(printPos==null)printPos="";
     
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
     
     String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_style_details";
     //out.println(maxIdSql);
     rs= st.executeQuery(maxIdSql);
     
     if(rs.next())
     {
     maxId= rs.getInt("MAX_ID");
     }else maxId=1;
    
     if(maxId==0)maxId=1;      
           
     String sqlInsert="INSERT INTO t_style_details(ID,STYLE_ID,PRINT_POSITION, ES,S,M,L,XL,XXL,REMARKS,XXXL, FREE )"+
      " VALUES "+
     " ("+maxId+","+style+",'"+printPos+"', "+esTemp+","+sTemp+","+mTemp+","+lTemp+","+xlTemp+","+xxlTemp+",'"+remarks+"',"+xxxlTemp+","+freeTemp+"  )"; 
     //out.println(sqlInsert);
    
     int x=st.executeUpdate(sqlInsert);
     message= "New Detail has been added with selected style successfully.";
  }
 
 
 
%>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            
               <%@ include file="AdminHeader.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
        <div class="graphs">
     	
      <div class="col_1">
		   <div class="col-md-12 span_6">
                 <div class="panel-heading">
                    <h4 class="panel-title">Add Style Position Details</h4>
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
                    <form class="form-horizontal" name="POMaster">
                    
                         <div class="form-group">
                            <input type="HIDDEN" name="display" value=""></input>
                                    <label for="selector1" class="col-sm-4 control-label">Select Product Category</label>
                                    <div class="col-sm-4">
                                            <%=mast.getProductCategoryListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new POMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div>
                             <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-4 control-label">Select Product Sub-category</label>
                                    <div class="col-sm-4">
                                            <%=mast.getProductSubCategoryListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new POMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div> 
                              <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-4 control-label">Select Customer</label>
                                    <div class="col-sm-4">
                                            <%=mast.getCustomerListStyleOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new POMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div>  
                             <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-4 control-label">Select Style</label>
                                    <div class="col-sm-4">
                                            <%=mast.getStyleListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new POMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div>    
 <%                           
      String dtlSql="";
      
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
                                    <div class="col-sm-6"><img src="/pgmis/docs/styles/<%=fImage%>"   height="60" width="60" onmouseover="changeImg(this,true)" onmouseout="changeImg(this,false)" alt=""/>
                                            
                                    </div>
                                   
       </div>
       <div class="form-group">
                          
                               
                                    <label for="selector1" class="col-sm-2 control-label">Rear Photo</label>
                                    <div class="col-sm-6"><img src="/pgmis/docs/styles/<%=bImage%>" height="60" width="60" onmouseover="changeImg(this,true)" onmouseout="changeImg(this,false)" alt=""/>
                                            
                                    </div>
                                   
       </div>
       
       
              
      
     
  <%}
  
  
  %>        
<div class="form-group">                        
    <div class="col-md-12 span_3">
		  <div class="bs-example1" data-example-id="contextual-table">
		    
                    <%
                    
           String  sql =" SELECT SD.ID, SD.PRINT_POSITION, "+
             " ES,S,M,L,XL,XXL,XXXL,FREE, REMARKS "+
             " from t_style_master S, t_style_details SD  "+
             " WHERE SD.STYLE_ID= S.ID "+
             " AND SD.STYLE_ID="+mast.getStyle();
             
         //out.println(sql);
             
                    int count=1;
                    rs= st.executeQuery(sql);
                    String typeCheck="",printName="",printPos="",fold="",remarks="";
                    float es=0,s=0,m=0,l=0,xl=0,xxl=0,xxxl=0,free=0;
                    String sdId="";
                    int cnt=0;
                    String trClass="info";
                    %>
                    
                    <table class="table">
		    
		        <tr>
		          <th rowspan=2>#</td>
		          <th rowspan=2 nowrap=nowrap>Print Position </td>
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
                       while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                       //typeCheck= rs.getString("TYPE_CHECK");
                      // printName= rs.getString("PRINT_NAME");
                       sdId=  rs.getString("ID"); if(sdId==null)sdId="";
                       printPos=  rs.getString("PRINT_POSITION"); if(printPos==null)printPos="";
                       remarks=  rs.getString("REMARKS");if(remarks==null)remarks="";
                      
                      
                       es= rs.getFloat("ES");
                       s= rs.getFloat("S");
                       m= rs.getFloat("M");
                       l= rs.getFloat("L");
                       xl= rs.getFloat("XL");
                       xxl= rs.getFloat("XXL");
                       xxxl= rs.getFloat("XXXL");
                       free= rs.getFloat("FREE");
                       
                       //qtyTotal+=qty;
                       %> 
                        <tr scope="row" class="<%=trClass%>">
		          <th scope="row"><%= cnt%></th>
		          <td align=left><%=printPos%></td>
		          <td align=center><%=es%></td>
                          <td align=center><%=s%></td>
                          <td align=center><%=m%></td>
                          <td align=center><%=l%></td>
                          <td align=center><%=xl%></td>
                          <td align=center><%=xxl%></td>
                          <td align=center><%=xxxl%></td>
                          <td align=center><%=free%></td>
                          <td align=left><%=remarks%></td>
                          <td> <a href='javascript:deleteRedirect("<%=sdId%>","t_style_details","styleDetails")'>Delete</a></td>
                          <td> <a href='javascript:updateRedirect("<%=sdId%>","t_style_details","styleDetails")'>Update</a></td>
		        </tr>
                        
                      <%
                      
                      if(trClass.equalsIgnoreCase("info"))trClass="";
                       
                      }
                     // out.println(mast.getTypeCheck());
                      %>   
  <tr>
    <td align="center"><b><font color="Red">New</b></td>
   <td>
  <input type="text" size=10 class="form-control1" name="printPos" id="printPos" placeholder=" Print Position">
   </td>
    <td>
  <input type="text" size=2 class="form-control1" name="es" id="es" placeholder="">
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
     printName dis = "<%= message %>";
     if(!dis ==""){
     alert(dis);
     
    }
   </script