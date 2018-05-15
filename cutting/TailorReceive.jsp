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
     var soDtlId= document.SOMaster.soDtlId.value;
     var so= document.SOMaster.so.value;
     var style= document.SOMaster.style.value;
     var tailor= document.SOMaster.tailor.value;
     document.location.href="TailorReceiveDetail.jsp?soDtlId="+soDtlId+"&so="+so+"&tailor="+tailor+"";
    
   // document.SOMaster.submit(); 
    }
  }  

function validateForm(){

 return true;
}   


function validateFormFields()
{

 
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
</script>

<body>
<%
Connection con = null;
Statement st =null,st2=null,st3=null;
ResultSet rs=null,rs2=null,rs3=null;
con = new DBConnLT().getConn(); 
String message="";
String chValue ="checked=checked";
try
{   
     
 st= con.createStatement();
 st2= con.createStatement();
 st3= con.createStatement();
 
 String chkVale="";
 String display=request.getParameter("display"); if(display==null)display="";
// out.println(display);
 
 
 
%>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            
               <%@ include file="CuttingHeader.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
        <div class="graphs">
     	
      <div class="col_1">
		   <div class="col-md-12 span_6">
                 <div class="panel-heading">
                    <h4 class="panel-title">Receive Material from Tailoring Department</h4>
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
                           
                                    <label for="selector1" class="col-sm-4 control-label">Select Tailor</label>
                                    <div class="col-sm-4">
                                            <%=mast.getTailorListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new SOMaster name!</p>-->
                                    </div>
                                    
                                    
                       </div> 
                      
                         <div class="form-group">
                            <input type="HIDDEN" name="display" value=""></input>
                                    <label for="selector1" class="col-sm-4 control-label">Select Sales Order</label>
                                    <div class="col-sm-4">
                                            <%=mast.getSOTailorWithDateListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new SOMaster name!</p>-->
                                    </div>
                           </div>
    
    <h4>Details of Material Issued to selected Tailor</h4>
                  <div class="progress">
                    <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                  </div>
     
<div class="form-group">                        
    <div class="col-md-12 span_3">
		  
		    
<%
String printPosArr[]= null;
String styleDtlIdArr[]= null;
                    
String dtlSql="",soDtlId="";
//out.println("reached"+mast.getStyleType());
String styleSql=" select distinct s.id, s.NAME, sod.ID SO_DTL_ID FROM "+
" t_style_master s , t_style_details sd ,  "+
" t_so_combo_details soc , t_so_master so, t_so_details sod, t_tailor_issue t "+
" where sd.STYLE_ID= s.ID   "+ 
" and soc.ST_DTL_ID= sd.ID "+
" and soc.SO_DTL_ID= soc.SO_DTL_ID "+
" and sod.SO_ID= so.ID "+
" and t.SO_DTL_ID= sod.ID  "+
" AND soc.SO_DTL_ID= sod.ID"+
" AND t.TLR_ID= "+mast.getTailor()+""+
" AND so.ID="+mast.getSo()+" "+
" ORDER BY s.ID, sd.ID";

         String style ="0",styleName="", prvsStyleName="";
       rs3 = st3.executeQuery(styleSql);
        
while(rs3.next())
{      

      
      style= rs3.getString("ID");
      styleName= rs3.getString("NAME");
      soDtlId= rs3.getString("SO_DTL_ID");
      
      
if(!style.equalsIgnoreCase("0")){ 
String bImageName ="",id="",stName="",fab="",descr="",fImage="",bImage ="",monthYear="";

      
                
              
          
          
              if(!styleName.equalsIgnoreCase(prvsStyleName))
              {
          
                  String sql= "SELECT ID,PRINT_POSITION FROM t_style_details where STYLE_ID="+style+" order by ID ASC";
                  //out.println(sql);
                 
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
               <div class="panel-heading">
                    <h4 class="panel-title">Style: <%= styleName%></h4>
                </div>
                   
                    
                    
                    <table class="table">
		    
		        <tr>
		          <th rowspan=2>Combo</td>
                           <th rowspan=2>Select Entry</td>
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
                          <th rowspan=2>Issue Date</td>
                          <th rowspan=2>Exp. Dlv. Date</td>
                          <th rowspan=2>Remarks</td>
                         </td>
                          </tr>
		          <tr>
		         
                         </tr>
		        <tbody>
		    
		      
           <%  
          }
                    
               String  sql2 =" SELECT SOD.ID SO_DTL_ID, "+
             " t.ES_I,t.S_I,t.M_I,t.L_I,t.XL_I,t.XXL_I,t.XXXL_I,t.FREE_I, t.ISSUE_REMARKS,DATE_FORMAT(t.ISSUE_DATE,'%d-%b-%Y') ISSUE_DATE,DATE_FORMAT(EXP_REC_DATE,'%d-%b-%Y') EXP_REC_DATE"+
             " from t_so_details SOD, t_so_master SO, t_tailor_issue t "+
             " WHERE SOD.SO_ID= SO.ID "+
             " AND SOD.ID= "+soDtlId+" "+
             " AND t.SO_DTL_ID= SOD.ID "+
             " AND SOD.SO_ID="+mast.getSo();
             //out.println(sql2);
              soDtlId="";
              String trClass="info",remarks="",issueDate="",expRecDate="";
               int es=0,s=0,m=0,l=0,xl=0,xxl=0,xxxl=0,free=0;;
                 rs = st.executeQuery(sql2);
                int cnt=0;
               while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                       
                   
                        soDtlId= rs.getString("SO_DTL_ID");if(soDtlId==null)soDtlId="";
                           es= rs.getInt("ES_I");
                           s= rs.getInt("S_I");
                           m= rs.getInt("M_I");
                           l= rs.getInt("L_I");
                           xl= rs.getInt("XL_I");
                           xxl= rs.getInt("XXL_I");
                            xxxl= rs.getInt("XXXL_I");
                           free= rs.getInt("FREE_I");
                        remarks=  rs.getString("ISSUE_REMARKS");if(remarks==null)remarks="";
                        issueDate=  rs.getString("ISSUE_DATE");if(issueDate==null)issueDate="";
                        expRecDate=  rs.getString("EXP_REC_DATE");if(expRecDate==null)expRecDate="";
                     
                      %>
                      
                       <tr scope="row" class="<%=trClass%>">
		        <th scope="row"><%= cnt%></th>
                         <td scope="row" valign=top><div class="radio-inline"><label><input type="radio" name="soDtlId" value=<%=soDtlId%>></label></div></th>
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
                          <td align=left><%=issueDate%></td>
                          <td align=left><%=expRecDate%></td>
                          <td align=left><%=remarks%></td>
		        </tr>
                        
                      <%
                      
                      if(trClass.equalsIgnoreCase("info"))trClass="";
                       
                      }
                     // out.println(mast.getTypeCheck());
                      
                      %>   
 
		      </tbody>
		    </table>
                  
		   </div>
                   
                   
	   </div>                         
      <%}
      
      }// while loop closed
      
      %>      
    </div> 
    <div class="form-group">                        
  
      <div class="but_list" align=center>
                           
                                 <p>        
                                 <button type="button" class="btn btn_5 btn-lg btn-warning warning_11" onclick="javascript:submitClick()" >Select Entry and Click Here</button> 
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
 <script src="/pgmis/common/js/bootstrap.min.js"></script>
</body>
</html>
<%
                if(con != null) con.close();
		if(st!=null) st.close();
		if(rs!=null) rs.close();
                if(st2!=null) st2.close();
		if(rs2!=null) rs2.close();
                 if(st3!=null) st3.close();
		if(rs3!=null) rs3.close();
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
                if(st3!=null) st3.close();
		if(rs3!=null) rs3.close();

		}
                catch(SQLException sqle)
                {
                  
                }

	}
       
%>
<script language="javaScript1.2">

    
     
    }
   </script