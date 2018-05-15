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
<!-- Nav CSS -->

</head>
<script language="JavaScript1.2">

 function showData()
  {
  
  document.SOMaster.display.value = "display";
  document.SOMaster.submit();
  }
  function showDataCustomer()
  {
  
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
 String soDtlId= request.getParameter("soDtlId");// t_style_details id
 String customer= request.getParameter("customer");
 String style= request.getParameter("style");
 String so= request.getParameter("so");
 String otherCustomer= request.getParameter("otherCustomer");
 //String optYear= request.getParameter("optYear");
 String styleType= request.getParameter("styleType");
// out.println(display);
 if(display.equalsIgnoreCase("save"))
 {
     
   
    
    
     
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
   
           
     String sqlInsert="UPDATE t_so_details "+
     " SET ES="+esTemp+", "+
     " S="+sTemp+", "+
     " M="+mTemp+", "+
     " L="+lTemp+", "+
     " XL="+xlTemp+", "+
     " XXL="+xxlTemp+", "+
     " XXXL="+xxxlTemp+", "+
     " FREE="+freeTemp+", "+
     " REMARKS='"+remarks+"' "+
     " WHERE ID="+soDtlId+" AND SO_ID="+so+"";
     //out.println(sqlInsert);
     int x=st.executeUpdate(sqlInsert);
     message= "Record updated Successfully";
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
                    <h4 class="panel-title">Update SO Qty Details</h4>
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
                      <input type="HIDDEN" name="display" value=""></input>
                      <input type="HIDDEN" name="style" value="<%=style%>"></input>
                      <input type="HIDDEN" name="soDtlId" value="<%=soDtlId%>"></input> 
                      <input type="HIDDEN" name="customer" value="<%=customer%>"></input>  
                      <input type="HIDDEN" name="styleType" value="<%=styleType%>"></input> 
                      <input type="HIDDEN" name="so" value="<%=so%>"></input> 
                      <input type="HIDDEN" name="otherCustomer" value="<%=otherCustomer%>"></input>  
 <%                  
 
      String dtlSql="";
      

String bImageName ="",id="",stName="",fab="",descr="",fImage="",bImage ="",monthYear="";

 
  
  
  %>        
<div class="form-group">                        
    <div class="col-md-12 span_3">
		  <div class="bs-example1" data-example-id="contextual-table">
		    
                    <%
                    
           String  sql =" SELECT  ES,S,M,L,XL,XXL,XXXL,FREE,SD.REMARKS "+
             " from t_so_master S, t_so_details SD  "+
             " WHERE SD.SO_ID= S.ID "+
             " AND SD.ID="+soDtlId+" AND S.ID="+so+"";
             
         //out.println(sql);
             
                    int count=1;
                    rs= st.executeQuery(sql);
                    String typeCheck="",printName="",printPos="",fold="",remarks="";
                    float es=0,s=0,m=0,l=0,xl=0,xxl=0,xxxl=0,free=0;
                    
                    int cnt=0;
                    String trClass="info";
                    %>
                    
                    <table class="table">
		    
		        <tr>
		         
		          <th rowspan=2 nowrap=nowrap>Status </td>
                         
		          <th rowspan=1>Extra Small (XS)<br>(6)</th>
		          <th rowspan=1>Small (S)<br>(8)</th>
		          <th rowspan=1>Medium (M)<br>(10)</th>
                          <th rowspan=1>Large (L)<br>(12)</th>
                         <th rowspan=1>Extra Large (XL)<br>(14)</th>
                         <th rowspan=1>XXL<br>(16)</th>
                           <th rowspan=1>XXXL</th>
                         <th rowspan=1>Free</th>
                       
                          <th rowspan=2>Remarks</td>
                          
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
                       //sdId=  rs.getString("ID"); if(sdId==null)sdId="";
                      // printPos=  rs.getString("PRINT_POSITION"); if(printPos==null)printPos="";
                       remarks=  rs.getString("REMARKS");if(remarks==null)remarks="";
                      
                      
                       es= rs.getInt("ES");
                       s= rs.getInt("S");
                       m= rs.getInt("M");
                       l= rs.getInt("L");
                       xl= rs.getInt("XL");
                       xxl= rs.getInt("XXL");
                        xxxl= rs.getInt("XXXL");
                             free= rs.getInt("FREE");
                       
                       
                       //qtyTotal+=qty;
                       %> 
                        <tr scope="row" class="<%=trClass%>">
                          <td align=left>Current</td>
		         
		          <td align=center><%=es%></td>
                          <td align=center><%=s%></td>
                          <td align=center><%=m%></td>
                          <td align=center><%=l%></td>
                          <td align=center><%=xl%></td>
                          <td align=center><%=xxl%></td>
                          <td align=center><%=xxxl%></td>
                          <td align=center><%=free%></td>
                          <td align=left><%=remarks%></td>
                         
		        </tr>
                        
                      <%
                      
                      if(trClass.equalsIgnoreCase("info"))trClass="";
                       
                      }
                     // out.println(mast.getTypeCheck());
                      %>   
  <tr>
<td align=left><font color=red>New</font></td>
  
    <td>
  <input type="text" size=2 class="form-control1" name="es" id="es" value="<%=es%>" placeholder="">
   </td>
     <td>
  <input type="text" size=2 class="form-control1" name="s" id="s"  value="<%=s%>" placeholder="">
   </td>
     <td>
  <input type="text" size=2 class="form-control1" name="m" id="m" value="<%=m%>" placeholder="">
   </td>
   <td>
  <input type="text" size=2 class="form-control1" name="l" id="l" value="<%=l%>" placeholder="">
   </td>
   <td>
  <input type="text" size=2 class="form-control1" name="xl" id="xl" value="<%=xl%>" placeholder="">
   </td>
   <td>
  <input type="text" size=2 class="form-control1" name="xxl" id="xxl" value="<%=xxl%>" placeholder="">
   </td>
    <td>
  <input type="text" size=2 class="form-control1" name="xxxl" id="xxxl" value="<%=xxxl%>" placeholder="">
   </td>
    <td>
  <input type="text" size=2 class="form-control1" name="free" id="free" value="<%=free%>" placeholder="">
   </td>
   
  <td>
                             
 <input type="text" class="form-control1" name="remarks" id="remarks" value="<%=remarks%>"  placeholder="Remarks">

                                    
   </TD>                                 
    </tr> 
		      </tbody>
		    </table>
                  
		   </div>
                   
                   
	   </div>                         
     
    </div>                 
                           
                            <div class="but_list" align=center>
                           
                                 <p>        
                                 <button type="button" class="btn btn_5 btn-lg btn-warning warning_11" onclick="javascript:submitClick()" >Update</button> 
                                        
                                 <button type="button" class="btn btn_5 btn-lg btn-warning success_11" onclick="javascript:window.location.href='SODetails.jsp?otherCustomer=<%=otherCustomer%>&styleType=<%=styleType%>&customer=<%=customer%>&style=<%=style%>&so=<%=so%>'" >Back</button> 
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