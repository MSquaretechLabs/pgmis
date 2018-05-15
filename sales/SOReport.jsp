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
  
   function PrintThisPage()
{ 
  var disp_setting="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
      disp_setting+="scrollbars=yes,width=900, height=600, left=50, top=25"; 
  var content_vlue = document.getElementById("print_content").innerHTML; 
  
  var docprint=window.open("","",disp_setting); 
   docprint.document.open(); 
   docprint.document.write('<html><head><title>PGMIS</title><link rel="stylesheet" type="text/css" href="/pmms/misc/stylemain.css">'); 
   docprint.document.write('</head><body onLoad="self.print()">');  
   <!--docprint.document.write('</head><body><center>'); -->
   docprint.document.write(content_vlue);          
   docprint.document.write('</body></html>'); 
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
 
 String chkVale="";
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
		   <div class="col-md-12 span_3">
                 <div class="panel-heading">
                    <h4 class="panel-title">Style wise Sales Order Report</h4>
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
                           
                                   <td> <label for="selector1" class="col-sm-4 control-label">Customer</label></td>
                                    <td><div class="col-sm-4">
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
                            
                            
                          
                           
                             
                           <!-- Show all detail at one place)-->
                           
                        
                        
                        
                        
                           <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-4 control-label">Style</label>
                                    <div class="col-sm-4">
                                            <%=mast.getStyleListOnChange3()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new SOMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div> 
                           <center><a href="javascript:PrintThisPage();">Print</a> &nbsp; &nbsp; &nbsp; &nbsp;
                          <div class="style3" id="print_content" align=left>
                          
                            
<%                           
      String dtlSql="";
      //out.println("reached"+mast.getStyleType());
if(!mast.getStyle().equalsIgnoreCase("0")){ 
int hTotal=0,esT=0,sT=0,mT=0,lT=0,xlT=0,xxlT=0,xxxlT=0,freeT=0;
int hTotalTT=0,esTT=0,sTT=0,mTT=0,lTT=0,xlTT=0,xxlTT=0,xxxlTT=0,freeTT=0;
String cName="",soDateT="",soNo="";
String mainSql="SELECT SO_NO, DATE_FORMAT(SO_DATE,'%d-%b-%Y') SO_DATE, C.NAME CUSTOMER_NAME FROM"+
" t_so_master S, t_customer_master C"+
" WHERE S.CUST_ID= C.ID";
rs = st.executeQuery(mainSql);  
if(rs.next()){
 cName= rs.getString("CUSTOMER_NAME");
 soDateT= rs.getString("SO_DATE");
 soNo=rs.getString("SO_NO");if(soNo==null)soNo="";
 }
 %>
 <div class="form-group">                        
    <div class="col-md-12 span_4">
		  <div class="bs-example" id="contextual-table">
	 <table width=90%>	
        <tr><td valign=top nowrap=nowrap align=center colspan=1><b> Style Wise Report of SO Items</b><br></th>
   </tr>
   

<tr><td valign=top nowrap=nowrap><b> Name of Customer</b> <%=cName%> </td><br></tr>
  <tr><td valign=top nowrap=nowrap><b> SO No.</b> <%=soNo%> </td><br></tr>
 <tr><td valign=top nowrap=nowrap><b> SO Date</b> <%=soDateT%> <br>
   
<%
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
    //out.println(bImage);
    }
    if(!id.equalsIgnoreCase(""))
    {
    %>
     
   <tr><td valign=top nowrap=nowrap><b> Month</b> <%=monthYear%> <br>
   <tr><td valign=top nowrap=nowrap><b> Image</b> <img height="100" width="100" src="/pgmis/docs/styles/<%=fImage%>" alt=""/> 
    <img height="100" width="100" src="/pgmis/docs/styles/<%=bImage%>" alt=""/>
    <br>   </tr> 
       
     
       
             
       
              
      
     
  <%}
  
      
  %>    
   
  
        
                            
     

    
  
     <tr><td valign=top nowrap=nowrap><b> <br>Combo Details in Style (SO)</td><br></tr>
  <tr><td>
    
    <div class="col-md-10 span_3">
    
		 <div class="panel-body no-padding" style="display: block;">
		    
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
                    
                    <table class="table" id="dataTables-example" border = "1" align="left" cellspacing = "1" cellpadding="1" style="border-collapse: collapse">
		    <thead>
		        <tr>
		          <th rowspan=2>#</td>
                          
                          <% for (int i=0;i<printPosArr.length;i++){
                         %>
                         
                          <th rowspan=2><%=printPosArr[i]%></th>
                          
                          <input type=hidden name="stDetailId" value="<%=styleDtlIdArr[i]%>"></input>
                          </td>
                         
                         <%}%>
                         
                         </td>
                          </tr>
		          <tr>
		         
                         </tr>
                         </thead>
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
             //out.println(sql2);
             String soDtlId="";
              String trClass="info",remarks="";
         
                 rs = st.executeQuery(sql2);
                 cnt=0;
               while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                       
                   
                        soDtlId= rs.getString("SO_DTL_ID");if(soDtlId==null)soDtlId="";
                        
                      %>
                      
                       <tr scope="row" >
		        <th scope="row">Combo: <%= cnt%></th>
                      <%// get print details
                    
                    for (int i=0;i<printPosArr.length;i++){    
                      
               
                     
                    String  sql3 ="  SELECT PRINT.NAME PRINT_NAME, PRINT.IMAGE from t_so_combo_details SOC, t_style_details SD , "+ 
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
                     sql3+="  union SELECT PRINT.NAME PRINT_NAME,PRINT.IMAGE  from t_so_combo_details SOC, t_style_details SD , "+ 
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
                         String pImage="";
                         rs2 = st2.executeQuery(sql3);
                         
                          if(rs2.next())
                           {
                           
                           pImage= rs2.getString("IMAGE");if(pImage==null)pImage="";
                           %>
                         
                          <td rowspan=1 align=left><%=rs2.getString("PRINT_NAME")%><br>
                            <div class="col-sm-2"><img height="100" width="100" src="/pgmis/images/prints/<%=pImage%>" alt=""/></div>
                          </td>
                          </td>
                           <%}
                           
                         
                         }
                    %>
                   
		    
		     
                      <%
                        
                       
                   
                       %> 
                       
		 
		         
		        </tr>
                        
                      <%
                      
                      if(trClass.equalsIgnoreCase("info"))trClass="";
                       
                      }
                     // out.println(mast.getTypeCheck());
                      
                      %>   
 
		      </tbody>
		    </table><br>
           
                   
	                        
     </div>
     </div>
     
     </td></tr>

       <tr><td valign=top nowrap=nowrap><b> <br>Qty. Details</td><br></tr>                    
    
  <tr><td><br><br>
   
    <div class="col-md-10 span_3">
	 <div class="panel-body no-padding" style="display: block;">	  
		    
                    <%
             
                 
                    
                
                 
              %>
                    
                   <table class="table" id="dataTables-example"  border = "1" align="left" cellspacing = "1" cellpadding="1" style="border-collapse: collapse">
		    
		        <tr>
		          <th rowspan=2>#</td>
                            <th rowspan=1>Extra Small (XS)<br>(6)</th>
		          <th rowspan=1>Small (S)<br>(8)</th>
		          <th rowspan=1>Medium (M)<br>(10)</th>
                          <th rowspan=1>Large (L)<br>(12)</th>
                         <th rowspan=1>Extra Large (XL)<br>(14)</th>
                         <th rowspan=1>XXL<br>(16)</th>
                          <th rowspan=1>XXXL</th>
                         <th rowspan=1>Free</th>
                          <!--<th rowspan=2>Remarks</td>-->
                             <th rowspan=1>Total</td>
                          
                          <tr>
		         
                         </tr>
		        <tbody>
		    
		      
           <%  
         
                  String  sql3 =" SELECT DISTINCT SOD.ID SO_DTL_ID, "+
             " SOD.ES,SOD.S,SOD.M,SOD.L,SOD.XL,SOD.XXL, SOD.XXXL,SOD.FREE,SOD.REMARKS "+
             " from t_so_details SOD, t_so_master so, t_so_combo_details soc,t_style_master s , t_style_details sd "+
               "  where sd.style_id= s.id  "+
               "   and soc.ST_DTL_ID= sd.ID "+
               "  and soc.SO_DTL_ID= soc.SO_DTL_ID AND SOD.SO_ID= so.ID AND soc.ST_DTL_ID=sd.id  "+
                " AND soc.SO_DTL_ID= SOD.ID   "+
                " AND s.ID="+mast.getStyle()+" "+
               " AND SOD.SO_ID="+mast.getSo();
             //out.println(sql2);
             String soDtlId2="";
              String trClass2="info",remarks2="";
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
                 rs = st.executeQuery(sql3);
                 cnt=0;
               while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass2="info";else trClass2="";
                       
                       ++cnt;
                       
                   
                        soDtlId2= rs.getString("SO_DTL_ID");if(soDtlId2==null)soDtlId2="";
                          es= rs.getInt("ES");
                           s= rs.getInt("S");
                           m= rs.getInt("M");
                           l= rs.getInt("L");
                           xl= rs.getInt("XL");
                           xxl= rs.getInt("XXL");
                           xxxl= rs.getInt("XXXL");
                           free= rs.getInt("FREE");
                        remarks2=  rs.getString("REMARKS");if(remarks==null)remarks="";
                         hTotal= es+s+m+l+xl+xxl+xxxl+free;
                           
                           esT+=es;
                           sT+=s;
                           mT+=m;
                           lT+=l;
                           xlT+=xl;
                           xxlT+=xxl;
                           xxxlT+=xxxl;
                           freeT+=free;
                        
                      %>
                      
                       <tr scope="row" class="<%=trClass%>">
		        <th scope="row">Combo: <%= cnt%></th>
                           <td align=center><%=es%></td>
                          <td align=center><%=s%></td>
                          <td align=center><%=m%></td>
                          <td align=center><%=l%></td>
                          <td align=center><%=xl%></td>
                          <td align=center><%=xxl%></td>
                          <td align=center><%=xxxl%></td>
                          <td align=center><%=free%></td>
                          <!-- <td align=left><%=remarks%></td>-->
                             <td align=center><%=hTotal%></td>
                       
		 
		         
		        </tr>
                        
                      <%
                      
                      if(trClass2.equalsIgnoreCase("info"))trClass2="";
                       
                      }
                     // out.println(mast.getTypeCheck());
                       hTotal= esT+sT+mT+lT+xlT+xxlT+xxxlT+freeT;
                        
                        esTT+=esT;
                        sTT+=sT;
                        mTT+=mT;
                        lTT+=lT;
                        xlTT+=xlT;
                        xxlTT+=xxlT;
                        xxxlTT+=xxxlT;
                       freeTT+=freeT;
                        
                          hTotalTT= esTT+sTT+mTT+lTT+xlTT+xxlTT+xxxlTT+freeTT;
                      %>   
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
                  
		   </div>
                   
                   
	   </div>   
           
      </td></tr>

    
                            
                <%}%>          
                   </form>
                   </div>
                   
		
                   
       
	   </div>
            <div class="clearfix"> </div>
	  </div>
         
		
			
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
