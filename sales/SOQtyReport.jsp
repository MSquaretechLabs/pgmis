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
            
               <%@ include file="SalesHeader.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
        <div class="graphs">
     	
      <div class="col_1">
		   <div class="col-md-12 span_6">
                 <div class="panel-heading">
                    <h4 class="panel-title">Sales Ouantity Report</h4>
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
                          <div class="style3" id="print_content">
 <%                           
      String dtlSql="";
 
if(!mast.getSo().equalsIgnoreCase("0")){ 
String cName="",soDateT="";
int hTotal=0,esT=0,sT=0,mT=0,lT=0,xlT=0,xxlT=0,xxxlT=0,freeT=0;
int hTotalTT=0,esTT=0,sTT=0,mTT=0,lTT=0,xlTT=0,xxlTT=0,xxxlTT=0,freeTT=0;
String custSql="SELECT NAME FROM t_customer_master WHERE ID="+mast.getCustomer()+"";
rsMain = stMain.executeQuery(custSql);    
if(rsMain.next()){

cName= rsMain.getString("NAME");
}else cName="";

String mainSql=" SELECT DISTINCT s.ID ID, s.NAME STYLE_NAME,s.DESCR,C.NAME CUSTOMER_NAME, F_IMAGE_NAME,B_IMAGE_NAME, IMAGE_PATH,"+
  " concat(s.MONTH,' - ',s.YEAR)  MONTH_YEAR, SO_NO,DATE_FORMAT(SO_DATE,'%d-%b-%Y') SO_DATE"+
  " FROM t_product_master P, t_product_sub_master PS,t_customer_master C, "+
  " t_style_master s,  t_style_details sd, t_so_master so,t_so_details SOD,t_so_combo_details soc  "+
            " WHERE s.CUST_ID= C.ID AND s.PROD_SUB_CATG_ID=PS.ID AND PS.PRODUCT_ID= P.ID "+
            " and sd.style_id= s.id and soc.ST_DTL_ID= sd.ID "+
            " and soc.SO_DTL_ID= soc.SO_DTL_ID AND SOD.SO_ID= so.ID AND soc.ST_DTL_ID=sd.id  "+
            " and soc.SO_DTL_ID= SOD.ID"+
            " AND SOD.SO_ID="+mast.getSo();
 
 rsMain = stMain.executeQuery(mainSql);    
 String style="0",soNo="";
 int c=0;
 %>
 <div class="form-group">                        
    <div class="col-md-12 span_4">
		  
		
      <table width=90%>
   <tr><td valign=top nowrap=nowrap align=center colspan=2><b> Sales Order Quantity Report <br><br> </b></th>
   </tr>
 <%
 while(rsMain.next()){
 style="0";
 style= rsMain.getString("ID");
 soDateT= rsMain.getString("SO_DATE");
 soNo=rsMain.getString("SO_NO");if(soNo==null)soNo="";
 %>

 <% 
 if(c==0)
 {%>
  <tr><td valign=top nowrap=nowrap><b> Name of Customer</b> <%=cName%> </td><br></tr>
 <tr><td valign=top nowrap=nowrap><b> SO No.</b> <%=soNo%> </td><br></tr>
 <tr><td valign=top nowrap=nowrap><b> SO Date</b> <%=soDateT%> <br>
 
 </td></tr>
 
 <%
 }
 ++c;
 
 //out.println(mainSql);      
String bImageName ="",id="",stName="",fab="",descr="",fImage="",bImage ="",monthYear="";

  dtlSql = "SELECT S.ID, S.NAME STYLE_NAME,S.DESCR,C.NAME CUSTOMER_NAME, F_IMAGE_NAME,B_IMAGE_NAME, IMAGE_PATH,"+
  " concat(S.MONTH,' - ',S.YEAR)  MONTH_YEAR"+
  " FROM t_product_master P, t_product_sub_master PS,t_customer_master C, t_style_master S  "+
            " WHERE S.CUST_ID= C.ID AND S.PROD_SUB_CATG_ID=PS.ID AND PS.PRODUCT_ID= P.ID "+
            " AND S.ID = "+style+"";
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
    //out.println(bImage);
    }
    if(!id.equalsIgnoreCase(""))
    {
    %>
    <tr><td valign=top nowrap=nowrap><b> Style:</b> <%=stName%><br> </td></tr>
    <tr><td valign=top nowrap=nowrap><b> Prints</b>
    <div>
                                     <img height="100" width="100" src="/pgmis/docs/styles/<%=fImage%>" alt=""/>
                                     <img height="100" width="100" src="/pgmis/docs/styles/<%=bImage%>" alt=""/>
     </div>
    <br> </td></tr>  
  
                                    
     
       
             
       
              
      
     
  <%}
  
      
  %>    
   
  
        
                            
   <tr><td valign=top nowrap=nowrap><b>
  
  
   
                  
      </td></tr>  
<tr><td>      
<div class="form-group">                        
    <div class="col-md-12 span_3">
		  <div class="panel-body no-padding" style="display: block;">
		    
                    <%
             
                 String sql= "SELECT ID,PRINT_POSITION FROM t_style_details where STYLE_ID="+style+" order by ID ASC";
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
                    
                   <table class="table table-striped"  border = "1" align="left" cellspacing = "1" cellpadding="1" style="border-collapse: collapse">
		    
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
                          <th rowspan=1>Total</td>
                         </td>
                          </tr>
		          <tr>
		         
                         </tr>
		        <tbody>
		    
		      
           <%  
         
                    
               String  sql2 =" SELECT DISTINCT SOD.ID SO_DTL_ID, "+
             " SOD.ES,SOD.S,SOD.M,SOD.L,SOD.XL,SOD.XXL, SOD.XXXL,SOD.FREE,SOD.REMARKS "+
             " from t_so_details SOD, t_so_master so, t_so_combo_details soc,t_style_master s , t_style_details sd "+
               "  where sd.style_id= s.id  "+
               "   and soc.ST_DTL_ID= sd.ID "+
               "  and soc.SO_DTL_ID= soc.SO_DTL_ID AND SOD.SO_ID= so.ID AND soc.ST_DTL_ID=sd.id  "+
                " AND soc.SO_DTL_ID= SOD.ID   "+
                " AND s.ID="+style+" "+
               " AND SOD.SO_ID="+mast.getSo();
            /// out.println(sql2);
             String soDtlId="";
              String trClass="info",remarks=".";
                int es=0,s=0,m=0,l=0,xl=0,xxl=0,xxxl=0,free=0;
                esT=0;
                sT=0;
                mT=0;
                lT=0;
                xlT=0;
                xxlT=0;
                xxxlT=0;
                freeT=0;
                hTotal=0;
                 rs = st.executeQuery(sql2);
                 cnt=0;
               while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                       
                        hTotal=0;
                        soDtlId= rs.getString("SO_DTL_ID");if(soDtlId==null)soDtlId="";
                           es= rs.getInt("ES");
                           s= rs.getInt("S");
                           m= rs.getInt("M");
                           l= rs.getInt("L");
                           xl= rs.getInt("XL");
                           xxl= rs.getInt("XXL");
                            xxxl= rs.getInt("XXXL");
                           free= rs.getInt("FREE");
                           hTotal= es+s+m+l+xl+xxl+xxxl+free;
                           
                           esT+=es;
                           sT+=s;
                           mT+=m;
                           lT+=l;
                           xlT+=xl;
                           xxlT+=xxl;
                           xxxlT+=xxxl;
                           freeT+=free;
                           
                        remarks=  rs.getString("REMARKS");if(remarks==null)remarks=".";
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
                       " AND S.ID= "+style+" "+
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
                        " AND S.ID= "+style+" "+
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
                        
                          <td align=center><%=hTotal%></td>
                         <!-- <td align=left><%=remarks%></td>-->
		        </tr>
                        
                      <%
                      
                      if(trClass.equalsIgnoreCase("info"))trClass="";
                       
                      }
                     // out.println(mast.getTypeCheck());
                      
                      %>   
                       <tr scope="row" class="<%=trClass%>">
                       <th scope="row">Total</th>
                        <%// get print details
                        hTotal= esT+sT+mT+lT+xlT+xxlT+xxxlT+freeT;
                        
                        esTT+=esT;
                        sTT+=sT;
                        mTT+=mT;
                        lTT+=lT;
                        xlTT+=xlT;
                        xxlTT+=xxlT;
                        xxxlTT+=xxxlT;
                       freeTT+=freeT;
                        for (int i=0;i<printPosArr.length;i++){    
                        %>
                       <td></td>
                        <%}%>
                         <td align=center><%=esT%></td>
                          <td align=center><%=sT%></td>
                          <td align=center><%=mT%></td>
                          <td align=center><%=lT%></td>
                          <td align=center><%=xlT%></td>
                          <td align=center><%=xxlT%></td>
                            <td align=center><%=xxxlT%></td>
                              <td align=center><%=freeT%></td>
                           <td align=center><%=hTotal%></td>
		      </tbody>
		    </table>
                  
		   </div>
                   
                   
	   </div>                         
     
    </div>
    </td></tr>
      
                            
                <%}
                
                
                hTotalTT= esTT+sTT+mTT+lTT+xlTT+xxlTT+xxxlTT+freeTT;
                
                %>  
              </table>  
              <div>
              <div class="col-md-10 span_4">
<table class="table"  border = "1" align="left" cellspacing = "1" cellpadding="1" style="border-collapse: collapse">
		    
		        <tr>
		          <th rowspan=2>Type</td>
                          
                          <th rowspan=1>Extra Small (XS)<br>(6)</th>
		          <th rowspan=1>Small (S)<br>(8)</th>
		          <th rowspan=1>Medium (M)<br>(10)</th>
                          <th rowspan=1>Large (L)<br>(12)</th>
                         <th rowspan=1>Extra Large (XL)<br>(14)</th>
                         <th rowspan=1>XXL<br>(16)</th>
                          <th rowspan=1>XXXL</th>
                         <th rowspan=1>Free</th>
                          <th rowspan=1>Total</td>
                         </td>
                          </tr>
		          <tr>
		         
                         </tr>
		        <tbody>
		    
	
                        <tr>
		        <th >Total</th>
                           <td align=center><%=esTT%></td>
                          <td align=center><%=sTT%></td>
                          <td align=center><%=mTT%></td>
                          <td align=center><%=lTT%></td>
                          <td align=center><%=xlTT%></td>
                          <td align=center><%=xxlTT%></td>
                          <td align=center><%=xxxlTT%></td>
                          <td align=center><%=freeTT%></td>
                          <td align=center><%=hTotalTT%></td>
                      
		        </tr>
                        
                     
		      </tbody>
		    </table>

     </table>
             
		   
                   
                   
	   </div>                         
     
    </div>     
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