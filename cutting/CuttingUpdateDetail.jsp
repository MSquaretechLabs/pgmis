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
  
   if(document.SOMaster.readyDate.value=="")
   {
   reason+="Please Enter Issue Date .\n";
   }else if(document.SOMaster.es.value==""||document.SOMaster.s.value==""||document.SOMaster.m.value==""||document.SOMaster.l.value==""||document.SOMaster.xl.value==""||document.SOMaster.xxl.value=="")
   {
   reason+="Please Enter All Value .\n";
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
 
 String so=request.getParameter("so"); if(so==null)so="0";
 String soDtlId=request.getParameter("soDtlId"); if(soDtlId==null)soDtlId="0";
 //out.println(soDtlId);
 String style=request.getParameter("style"); if(style==null)style="0";
 String soNo="",customerName="",styleName="";
 
 String showDtl= "SELECT c.NAME CUSTOMER, concat(SO_NO,'-','-dated.',DATE_FORMAT(SO_DATE,'%d-%b-%Y')) SO_NO"+
 " FROM t_so_master so,t_customer_master c where so.CUST_ID= c.ID "+
 " AND so.ID="+so+"";
 
  rs= st.executeQuery(showDtl);
       if(rs.next()){
       soNo= rs.getString("SO_NO");     if(soNo==null)soNo="";
       customerName= rs.getString("CUSTOMER");     if(customerName==null)customerName="";
       }
 
  showDtl= "SELECT NAME "+
 " FROM t_style_master where ID="+style+"";
 
  rs= st.executeQuery(showDtl);
       if(rs.next()){
       styleName= rs.getString("NAME");     if(styleName==null)styleName="";
      
       }
 
// out.println(display);
 if(display.equalsIgnoreCase("save"))
 {
     
     String remarks= request.getParameter("remarks"); if(remarks==null)remarks="0";
   
     String esTemp= request.getParameter("es"); if(esTemp==null)esTemp="0";
     String sTemp= request.getParameter("s"); if(sTemp==null)sTemp="0";
     String mTemp= request.getParameter("m"); if(mTemp==null)mTemp="0";
     String lTemp= request.getParameter("l"); if(lTemp==null)lTemp="0";
     String xlTemp= request.getParameter("xl"); if(xlTemp==null)xlTemp="0";
     String xxlTemp= request.getParameter("xxl"); if(xxlTemp==null)xxlTemp="0";
     
     String xxxlTemp= request.getParameter("xxxl"); if(xxxlTemp==null)xxxlTemp="0";
     String freeTemp= request.getParameter("free"); if(freeTemp==null)freeTemp="0";
     
       
     String readyDate= request.getParameter("readyDate");if(readyDate==null)readyDate="";
      String fullIssue= request.getParameter("fullIssue"); if(fullIssue==null)fullIssue="";
     
     String issueStatus="N";
      
     if(fullIssue.equalsIgnoreCase("on"))issueStatus="Y";else issueStatus="N";
     
    int maxId=0;
     
     String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_cutting_update";
     //out.println(maxIdSql);
     rs= st.executeQuery(maxIdSql);
     
     if(rs.next())
     {
     maxId= rs.getInt("MAX_ID");
     }else maxId=1;
    
     if(maxId==0)maxId=1;      
      
      String chkSql2="SELECT ID FROM t_cutting_update WHERE SO_DTL_ID="+soDtlId+"";
      rs=st.executeQuery(chkSql2);
      if(rs.next())
      {
      //update 
             
      String updateSql2="UPDATE t_cutting_update"+
      " SET ES_R=IFNULL(ES_R,0)+"+esTemp+" , "+
      " S_R=IFNULL(S_R,0)+"+sTemp+" , "+
      "  M_R=IFNULL(M_R,0)+"+mTemp+" , "+
      "  L_R=IFNULL(L_R,0)+"+lTemp+" , "+
      "  XL_R=IFNULL(XL_R,0)+"+xlTemp+" , "+
      " XXL_R=IFNULL(XXL_R,0)+"+xxlTemp+" , "+
      " XXXL_R=IFNULL(XXXL_R,0)+"+xxxlTemp+" , "+
      " FREE_R=IFNULL(FREE_R,0)+"+freeTemp+" , "+
      " READY_DATE='"+readyDate+"' , "+
      " REMARKS='"+remarks+"' WHERE SO_DTL_ID="+soDtlId+"";
       
      int x=st.executeUpdate(updateSql2);
      
      
      }else {
      
       String sqlInsert="INSERT INTO t_cutting_update"+
       " (ID,SO_DTL_ID,ES_R,S_R,M_R,L_R,XL_R,XXL_R,XXXL_R,FREE_R,READY_DATE,REMARKS)"+
      " VALUES "+
     " ("+maxId+","+soDtlId+","+esTemp+","+sTemp+","+mTemp+","+lTemp+","+xlTemp+","+xxlTemp+","+xxxlTemp+","+freeTemp+",'"+readyDate+"','"+remarks+"')"; 
     //out.println(sqlInsert);
    
     int x=st.executeUpdate(sqlInsert);
     
      
      }
      
           
     
    
     
   
     // check data availability in so_style_availability
    
   
    
      boolean dataPresent=false;
      float qty=0;
      
      String chkSql= "SELECT ID FROM t_so_style_tracking where SO_ID="+so+" AND STYLE_ID="+style+"";
      //out.println(chkSql);
       rs= st.executeQuery(chkSql);
       if(rs.next()){
       dataPresent= true;
      
       }
       
       if(dataPresent)
       {
      
       String sqlUpdateStock2="UPDATE t_so_style_tracking set FULL_CUTTING_DONE= '"+issueStatus+"' "+
       " where SO_ID="+so+" AND STYLE_ID="+style+"";
       //out.println(sqlUpdateStock);
       int y=st.executeUpdate(sqlUpdateStock2);
       }
       
       
    
    
   
     message= " Status Updated Successfully.";
     
   
  }
 
 
 
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
                    <h4 class="panel-title">Update Cutting Progress</h4>
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
                                    <div class="col-sm-6">
                                             <label for="selector1" class="col-sm-6 control-label"><%=customerName%></label>
                                    </div>
                                   
                                    
                                    
                       </div> 
                      
                         <div class="form-group">
                            <input type="HIDDEN" name="so" value="<%=so%>">
                            <input type="HIDDEN" name="soDtlId" value="<%=soDtlId%>">
                            <input type="HIDDEN" name="style" value="<%=style%>">
                            <input type="HIDDEN" name="display" value="">
                            
                            </input>
                                    <label for="selector1" class="col-sm-4 control-label">Sales Order</label>
                                   <div class="col-sm-6">
                                             <label for="selector1" class="col-sm-6 control-label"><%=soNo%></label>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please printPos new SOMaster name!</p>-->
                                    </div>
                           </div>
                            
                            
                          
                           
                             
                           <!-- Show all detail at one place)-->
                           
                        
                        
                        
                        
                           <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-4 control-label">Style</label>
                                    <div class="col-sm-6" align=left>
                                             <label for="selector1" class="col-sm-6 control-label"><%=styleName%></label>
                                    </div>
                                   
                                    
                                    
                            </div>   
<%                           
      String dtlSql="";
      //out.println("reached"+mast.getStyleType());
if(!style.equalsIgnoreCase("0")){ 
String bImageName ="",id="",stName="",fab="",descr="",fImage="",bImage ="",monthYear="";

    String fullIssueStatus="N";
                String fullIssueSql="SELECT TAILORING_ISSUED FROM t_so_style_tracking where SO_ID="+mast.getSo()+" "+
                " and STYLE_ID="+style+" ";
                
                rs= st.executeQuery(fullIssueSql);
                
                if(rs.next()){
                fullIssueStatus= rs.getString("TAILORING_ISSUED"); 
                }
                
                if(fullIssueStatus==null)fullIssueStatus="";
                
                if(fullIssueStatus.equalsIgnoreCase("Y"))
                chkVale="checked";else chkVale="";
                    
  %>    
   
     
                                    
  
                           <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-4 control-label">Print</label>
                                    <div class="col-sm-6" align=left>
                                                    
                           
   
   
     
<div class="form-group">                        
    <div class="col-md-12 span_3">
		  <div class="bs-example1" data-example-id="contextual-table">
		    
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
                    
                    <table class="table">
		    
		        <tr>
		          
                          
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
                " AND SOD.ID="+soDtlId+" "+
               " AND SOD.SO_ID="+mast.getSo();
             
             //out.println(sql2);
            // String soDtlId="";
              String trClass="info",remarks="";
         
                 rs = st.executeQuery(sql2);
                 cnt=0;
               while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                       
                   
                        soDtlId= rs.getString("SO_DTL_ID");if(soDtlId==null)soDtlId="";
                        
                      %>
                      
                       <tr scope="row" class="<%=trClass%>">
		      
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
                       " AND S.ID= "+style+" "+
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
                        " AND S.ID= "+style+" "+
                       " AND SOD.ID="+soDtlId+" ";

                     
                    // out.println(sql3);
                         String pImage="";
                         rs2 = st2.executeQuery(sql3);
                         
                          if(rs2.next())
                           {
                           
                           pImage= rs2.getString("IMAGE");if(pImage==null)pImage="";
                           %>
                         
                          <td rowspan=1 align=left><%=rs2.getString("PRINT_NAME")%><br>
                            <div class="col-sm-2"><img height="70" width="70" src="/pgmis/images/prints/<%=pImage%>" alt=""/></div>
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
		    </table>
                  
		   </div>
                   
                   
	   </div>   
               
                                    </div>
                                   
                                    
                                    
                            </div>                
    </div> 
    
       <h4>Qty. Details</h4>
                  <div class="progress">
                    <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                  </div>
    <div class="form-group">                        
    <div class="col-md-12 span_3">
		  <div class="bs-example1" data-example-id="contextual-table">
		    
                    <%
             
                 
                    
                
                 
              %>
                    
                    <table class="table">
		    
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
                          <th rowspan=2>Remarks</td>
                          
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
                " AND s.ID="+style+" "+
                " AND SOD.ID="+soDtlId+" "+
               " AND SOD.SO_ID="+mast.getSo();
             
             //out.println(sql2);
             String soDtlId2="";
              String trClass2="info",remarks2="";
                int es=0,s=0,m=0,l=0,xl=0,xxl=0,xxxl=0,free=0;;
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
                        remarks2=  rs.getString("REMARKS");if(remarks2==null)remarks2="";
                        
                      %>
                      
                       <tr scope="row" class="<%=trClass%>">
		        <th scope="row">Qty. Ordered</th>
                           <td align=center><%=es%></td>
                          <td align=center><%=s%></td>
                          <td align=center><%=m%></td>
                          <td align=center><%=l%></td>
                          <td align=center><%=xl%></td>
                          <td align=center><%=xxl%></td>
                          <td align=center><%=xxxl%></td>
                          <td align=center><%=free%></td>
                           <td align=left><%=remarks2%></td>
                       
		 
		    <%
                     if(trClass2.equalsIgnoreCase("info"))trClass2="";
                    }%>
                    
            <%
               sql3 =" SELECT SOD.ID SO_DTL_ID, "+
             " SUM(ifnull(t.ES_R,0))ES, SUM(ifnull(t.S_R,0))S,SUM(ifnull(t.M_R,0))M,SUM(ifnull(t.L_R,0))L,"+
              " SUM(ifnull(t.XL_R,0))XL,SUM(ifnull(t.XXL_R,0))XXL,SUM(ifnull(t.XXXL_R,0))XXXL,SUM(ifnull(t.FREE_R,0))FREE,"+
             " t.REMARKS "+
             " from t_so_details SOD, t_so_master SO, t_cutting_update t "+
             " WHERE SOD.SO_ID= SO.ID "+
             " AND SOD.ID="+soDtlId+" "+
            " AND t.SO_DTL_ID= SOD.ID"+
              " AND SOD.SO_ID="+mast.getSo();
             //out.println(sql2);
            
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
                        remarks2=  rs.getString("REMARKS");if(remarks2==null)remarks2="";
                        
                      %>
                      
                       <tr scope="row" class="<%=trClass%>">
		        <th scope="row">Total Qty. Ready at Cutting Department</th>
                           <td align=center><%=es%></td>
                          <td align=center><%=s%></td>
                          <td align=center><%=m%></td>
                          <td align=center><%=l%></td>
                          <td align=center><%=xl%></td>
                          <td align=center><%=xxl%></td>
                           <td align=center><%=xxxl%></td>
                          <td align=center><%=free%></td>
                           <td align=left><%=remarks2%></td>
                       
		 
		    <%
                     if(trClass2.equalsIgnoreCase("info"))trClass2="";
                    }%>
                      <%
                     
                       sql3 =" SELECT SOD.ID SO_DTL_ID, "+
             " SUM(ifnull(t.ES_I,0))ES, SUM(ifnull(t.S_I,0))S,SUM(ifnull(t.M_I,0))M,SUM(ifnull(t.L_I,0))L,"+
              " SUM(ifnull(t.XL_I,0))XL,SUM(ifnull(t.XXL_I,0))XXL,SUM(ifnull(t.XXXL_R,0))XXXL,SUM(ifnull(t.FREE_R,0))FREE,"+
             " ISSUE_REMARKS REMARKS "+
             " from t_so_details SOD, t_so_master SO, t_tailor_issue t "+
             " WHERE SOD.SO_ID= SO.ID "+
             " AND SOD.ID="+soDtlId+" "+
             " AND t.SO_DTL_ID= SOD.ID"+
              " AND SOD.SO_ID="+mast.getSo();
             //out.println(sql2);
            
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
                        remarks2=  rs.getString("REMARKS");if(remarks2==null)remarks2="";
                        
                      %>
                      
                       <tr scope="row" class="<%=trClass%>">
		        <th scope="row">Qty. sent to All Tailors</th>
                           <td align=center><%=es%></td>
                          <td align=center><%=s%></td>
                          <td align=center><%=m%></td>
                          <td align=center><%=l%></td>
                          <td align=center><%=xl%></td>
                          <td align=center><%=xxl%></td>
                            <td align=center><%=xxxl%></td>
                          <td align=center><%=free%></td>
                           <td align=left><%=remarks2%></td>
                       
		 
		    <%
                     if(trClass2.equalsIgnoreCase("info"))trClass2="";
                    } 
                      
                     // out.println(mast.getTypeCheck());
                      
                      %>   
  <tr>
    <td align="center"><b><font color="Red">Enter Qty.Ready after last update</b></td>
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
  <input type="text" size=2 class="form-control1" name="xxl" id="xxl" placeholder="">
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
    <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Date when the material got ready</label>
                                    <div class="col-sm-4">
                                             <input type="date"  name= "readyDate" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">

                                    </div>
                                 
                                    
                                    
     </div>  
      
      
      <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Check -if full cutting is done for the selected style</label>
                                    <div class="col-sm-1">
                                            
					<div class="checkbox-inline1"><label><input type="checkbox" name="fullIssue" <%=chkVale%>></label></div>
									
								

                                    </div>
                                 
                                    
                                    
                            </div>                        
    <div class="form-group">                        
  
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