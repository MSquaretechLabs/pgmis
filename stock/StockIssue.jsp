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
<jsp:setProperty name="forNum" property="*" />
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
   var qtyI= Number(document.SOMaster.qtySent.value);
   var qtyA= Number(document.SOMaster.qtyAvail.value);
  
   //alert(qtyA);
   //alert(qtyI);
   
   if(document.SOMaster.customer.value=="0")
   {
   reason+="Please Select Customer .\n";
   }else if(document.SOMaster.style.value=="0")
   {
   reason+="Please Select Style .\n";
   }else if(document.SOMaster.print.value=="0")
   {
   reason+="Please Select Plain/Print .\n";
   }else if(document.SOMaster.qtySent.value=="")
   {
   reason+="Please Enter Qty. .\n";
   }else if(qtyI>qtyA)
   {
   reason+="Qty. to be issued more than Qty. available.";
   }else if(document.SOMaster.sentDate.value=="")
   {
   reason+="Please Enter Issue Date. .\n";
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
// out.println(display);
 if(display.equalsIgnoreCase("save"))
 {
     
     String so=request.getParameter("so"); if(so==null)so="0";
     String style=request.getParameter("style"); if(style==null)style="0";
     String remarks= request.getParameter("remarks"); if(remarks==null)remarks="0";
     String qtySent= request.getParameter("qtySent"); if(qtySent==null)qtySent="0";
     String sentDate= request.getParameter("sentDate");if(sentDate==null)sentDate="";
     String fullIssue= request.getParameter("fullIssue"); if(fullIssue==null)fullIssue="";
     String var= request.getParameter("var"); if(var==null)var="0";
     String qtyAvail= request.getParameter("qtyAvail"); if(qtyAvail==null)qtyAvail="0";
     String issueStatus="N";
     
     if(fullIssue.equalsIgnoreCase("on"))issueStatus="Y";else issueStatus="N";
     
     String print= request.getParameter("print");
     String tempTypeCheck="",tempTypeId="",tempVal="";
     String tempArr[]= print.split("-");
     tempTypeCheck=  tempArr[0];
     tempTypeId= tempArr[1];
     
     
    int maxId=0;
     
     String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_stock_issue";
     //out.println(maxIdSql);
     rs= st.executeQuery(maxIdSql);
     
     if(rs.next())
     {
     maxId= rs.getInt("MAX_ID");
     }else maxId=1;
    
     if(maxId==0)maxId=1;      
           
     String sqlInsert="INSERT INTO t_stock_issue(ID,SO_ID,STYLE_ID,VAR_ID,TYPE_CHECK, TYPE_ID,QTY,ISSUE_DATE,REMARKS)"+
      " VALUES "+
     " ("+maxId+","+so+","+style+","+var+",'"+tempTypeCheck+"',"+tempTypeId+","+qtySent+",'"+sentDate+"','"+remarks+"')"; 
     //out.println(sqlInsert);
    
     int x=st.executeUpdate(sqlInsert);
     
     
      String sqlUpdateStock="UPDATE t_stock_master set QTY= QTY-"+qtySent+"  "+
       " where FABRIC_ID="+mast.getFab()+" AND VAR_ID="+var+" "+
      "  AND TYPE_CHECK='"+tempTypeCheck+"' AND TYPE_ID="+tempTypeId+"";
       //out.println(sqlUpdateStock);
       int p=st.executeUpdate(sqlUpdateStock);
     
     
   
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
      
       String sqlUpdateStock2="UPDATE t_so_style_tracking set FULL_CUTTING_ISSUED= '"+issueStatus+"' ,"+
       " FULL_CUTTING_ISSUED_DATE='"+sentDate+"' "+
       " where SO_ID="+so+" AND STYLE_ID="+style+"";
       //out.println(sqlUpdateStock);
       int y=st.executeUpdate(sqlUpdateStock2);
       }else
       {
       
         String maxIdSql1="SELECT MAX(ID)+1 MAX_ID FROM t_so_style_tracking";
         //out.println(maxIdSql);
         rs= st.executeQuery(maxIdSql1);
         int maxId1=1;
         if(rs.next())
         {
         maxId1= rs.getInt("MAX_ID");
         }
         if(maxId1==0)maxId1=1;      
          
        
         String sqlInsert2="INSERT t_so_style_tracking (ID,SO_ID,STYLE_ID,FULL_CUTTING_ISSUED,FULL_CUTTING_ISSUED_DATE)VALUES"+
        "("+maxId1+", "+so+", "+style+", '"+issueStatus+"','"+sentDate+"')";
     
       //out.println(sqlInsert);
       int z=st.executeUpdate(sqlInsert2);
       
       
       }
       
    
    
   
     message= " Selected Item has been issued to cutting department successfully. Stock Values have been updated.";
     
   
  }
 
 
 
%>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            
               <%@ include file="StockHeader.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
        <div class="graphs">
     	
      <div class="col_1">
		   <div class="col-md-12 span_6">
                 <div class="panel-heading">
                    <h4 class="panel-title">Issue Material to Cutting Department</h4>
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
                            
                            
                          
                           
                             
                           <!-- Show all detail at one place)-->
                           
                        
                        
                        
                        
                           <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-4 control-label">Select Style</label>
                                    <div class="col-sm-4">
                                            <%=mast.getStyleListOnChange4()%>
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

      
  %>    
   
    <h4>Enter Details to Send Material to Cutting Department</h4>
                  <div class="progress">
                    <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                  </div>
     
            <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Select Fabric</label>
                                    <div class="col-sm-4">
                                            <%=mast.getFabricListOnChange()%>
                                    </div>
                                   
                                    
                                    
           </div>  
           
            <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Select Variety</label>
                                    <div class="col-sm-4">
                                            <%=mast.getVarietyListOnChange()%>
                                    </div>
                                   
                                    
                                    
           </div>   
   <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Select Plain/ Print</label>
                                    <div class="col-sm-4">
                                            <%=mast.getRestrictedPrintList()%>
                                    </div>
                                   
                                    
                                    
                            </div>
    <%
    
    //check quantity available in stock
     String printT= request.getParameter("print"); if(printT==null)printT="0";
     
     
     if(!printT.equalsIgnoreCase("0"))  
     {
     
     
         String typeCheckT="",typeIdT="";
         String tempArrT[]= printT.split("-");
         typeCheckT=  tempArrT[0];
         typeIdT= tempArrT[1];
         
        String chkQtySql="SELECT ifnull(QTY,0) QTY FROM t_stock_master where VAR_ID="+mast.getVar()+" "+
        " AND TYPE_ID="+typeIdT+" and TYPE_CHECK='"+typeCheckT+"'";
        // out.println(chkQtySql);
         float qtyAvailable=0;
         rs= st.executeQuery(chkQtySql);
       
         if(rs.next()){
         qtyAvailable= rs.getFloat("QTY");
         }
     
     %>
       <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Qty (in mtrs) Available in Stock</label>
                                    <div class="col-sm-4">
                                            <input type="text" size=2 class="form-control1" name="qtyAvail" value="<%=qtyAvailable%>" id="qtyAvail" readonly placeholder="Qty">
                                    </div>
                                 
                                    
                                    
                            </div>   
 
     <%
     }
    %>
    
  
                          
    <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Qty (in mtrs) to be issued to cutting section</label>
                                    <div class="col-sm-4">
                                            <input type="text" size=2 class="form-control1" name="qtySent" id="qtySent" placeholder="Qty">
                                    </div>
                                 
                                    
                                    
                            </div>      
    
                        
    
  <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Date of Material Issued</label>
                                    <div class="col-sm-4">
                                             <input type="date"  name= "sentDate" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">

                                    </div>
                                 
                                    
                                    
                            </div>      
    
     <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Remarks </label>
                                    <div class="col-sm-6">
                                             <input type="text" class="form-control1" name="remarks" id="remarks" placeholder="Remarks">
 </div>
                                       </div>
       <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Check -if full cutting is issued for the selected style</label>
                                    <div class="col-sm-1">
                                            
					<div class="checkbox-inline1"><label><input type="checkbox" name="fullIssue" <%=chkVale%>></label></div>
									
								

                                    </div>
                                 
                                    
                                    
                            </div>                               
                                    
                                    
                          
                            <div class="but_list" align=center>
                           
                                 <p>        
                                 <button type="button" class="btn btn_5 btn-lg btn-warning warning_11" onclick="javascript:submitClick()" >Save</button> 
                                 </p>
                            </div>
   
   <h4>Combo Details in Style</h4>
                  <div class="progress">
                    <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                  </div>
     
<div class="form-group">                        
    <div class="col-md-12 span_3">
		  <div class="bs-example1" data-example-id="contextual-table">
		    
                    <%
               String fullIssueStatus="N";
                String fullIssueSql="SELECT FULL_CUTTING_ISSUED FROM t_so_style_tracking where SO_ID="+mast.getSo()+" "+
                " and STYLE_ID="+mast.getStyle()+" ";
                
                rs= st.executeQuery(fullIssueSql);
                
                if(rs.next()){
                fullIssueStatus= rs.getString("FULL_CUTTING_ISSUED"); 
                }
                
                if(fullIssueStatus==null)fullIssueStatus="";
                
                if(fullIssueStatus.equalsIgnoreCase("Y"))
                chkVale="checked";else chkVale="";
                
          
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
                          <th rowspan=1>Extra Small (ES)</th>
		          <th rowspan=1>Small (S)</th>
		          <th rowspan=1>Medium (M)</th>
                          <th rowspan=1>Large (L)</th>
                          <th rowspan=1>Extra Large (XL)</th>
                          <th rowspan=1>XXL</th>
                           <th rowspan=1>XXXL</th>
                         <th rowspan=1>Free</th>
                          <th rowspan=2>Remarks</td>
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
             //out.println(sql2);
             String soDtlId="";
              String trClass="info",remarks="";
                float es=0,s=0,m=0,l=0,xl=0,xxl=0,xxxl=0,free=0;
                 rs = st.executeQuery(sql2);
                 cnt=0;
               while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                       
                   
                        soDtlId= rs.getString("SO_DTL_ID");if(soDtlId==null)soDtlId="";
                           es= rs.getFloat("ES");
                           s= rs.getFloat("S");
                           m= rs.getFloat("M");
                           l= rs.getFloat("L");
                           xl= rs.getFloat("XL");
                           xxl= rs.getFloat("XXL");
                           xxxl= rs.getFloat("XXXL");
                       free= rs.getFloat("FREE");
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
    <div class="form-group">                        
        <div class="col-md-6 span_3">
                    <h4>Total Requirement</h4>
                      <div class="progress">
                        <div class="progress-bar progress-bar-warning" style="width: 100%"></div>
                     
                      </div>
        </div>
          <div class="col-md-6 span_3">
                    <h4>Cutting Already Issued</h4>
                      <div class="progress">
                        <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                        
                      </div>
        </div>
        
        
<div class="form-group"> 
                 
    <div class="col-md-6 span_3">
		  <div class="bs-example1" data-example-id="contextual-table">
		    
                    <%
          
               
                
                 
              %>
                    
                    <table class="table">
		    
		        <tr>
		          <th rowspan=2>#</td>
                         <th rowspan=1>Type</th>
		          <th rowspan=1>Plain/ Print</th>
                          <th rowspan=1>Req. <br>All Styles</th>
		          <th rowspan=1>Req. <br>Selected Style</th>
                          <th rowspan=1>Allready Issued<br> (all styles in selected SO)</th>
                        </td>
                          </tr>
		          <tr>
		         
                         </tr>
		        <tbody>
		    
		      
           <%  
         
                       float qtyReq=0,qtyIssuedAllStyle=0,qtyReqAllStyle=0;
                        String  sql5 ="   SELECT SOC.TYPE_CHECK,SOC.TYPE_ID,PRINT.NAME PRINT_NAME, "+
                       " SUM( "+
                      "   (ifnull(SD.ES,0)* ifnull(SOD.ES,0)) + "+
                       "   (ifnull(SD.S,0)* ifnull(SOD.S,0))+ "+
                       "   (ifnull(SD.M,0)* ifnull(SOD.M,0))+ "+
                        "   (ifnull(SD.L,0)* ifnull(SOD.L,0))+ "+
                       "  (ifnull(SD.XL,0)* ifnull(SOD.XL,0))+  "+
                       "  (ifnull(SD.XXL,0)* ifnull(SOD.XXL,0))+ "+
                       "  (ifnull(SD.XXXL,0)* ifnull(SOD.XXXL,0))+ "+
                       "  (ifnull(SD.FREE,0)* ifnull(SOD.FREE,0)) "+
                       "  ) REQ "+
                       "   from t_so_combo_details SOC, t_style_details SD , t_style_master S, t_so_master SO,  "+
                       "  t_so_details SOD,t_print_master PRINT WHERE SOC.SO_DTL_ID= SOD.ID  AND SOD.SO_ID= SO.ID   "+
                       "    AND SOC.ST_DTL_ID=SD.ID AND SD.STYLE_ID= S.ID    "+
                       "    AND SOC.TYPE_ID= PRINT.ID  "+
                       "    AND SOC.TYPE_CHECK='Print' "+
                       "    AND SO.ID="+mast.getSo()+" "+ 
                       "   AND S.ID="+mast.getStyle()+" "+
                     "    GROUP BY SOC.TYPE_CHECK,PRINT.NAME";
            
                        sql5 +=" union SELECT SOC.TYPE_CHECK,SOC.TYPE_ID,PRINT.NAME PRINT_NAME, "+
                       " SUM( "+
                      "   (ifnull(SD.ES,0)* ifnull(SOD.ES,0)) + "+
                       "   (ifnull(SD.S,0)* ifnull(SOD.S,0))+ "+
                       "   (ifnull(SD.M,0)* ifnull(SOD.M,0))+ "+
                        "   (ifnull(SD.L,0)* ifnull(SOD.L,0))+ "+
                      "  (ifnull(SD.XL,0)* ifnull(SOD.XL,0))+ "+
                       "  (ifnull(SD.XXL,0)* ifnull(SOD.XXL,0))+ "+
                       "  (ifnull(SD.XXXL,0)* ifnull(SOD.XXXL,0))+ "+
                       "  (ifnull(SD.FREE,0)* ifnull(SOD.FREE,0)) "+
                       "  )REQ "+
                       "   from t_so_combo_details SOC, t_style_details SD , t_style_master S, t_so_master SO, "+
                       "  t_so_details SOD,t_plain_master PRINT WHERE SOC.SO_DTL_ID= SOD.ID  AND SOD.SO_ID= SO.ID  "+
                       "    AND SOC.ST_DTL_ID=SD.ID AND SD.STYLE_ID= S.ID   "+
                       "    AND SOC.TYPE_ID= PRINT.ID "+
                       "    AND SOC.TYPE_CHECK='Plain'"+
                       "    AND SO.ID="+mast.getSo()+" "+ 
                       "   AND S.ID="+mast.getStyle()+" "+
                     "    GROUP BY SOC.TYPE_CHECK,SOC.TYPE_ID,PRINT.NAME";
                 
                          
                         // out.println(sql5);

             String trClass2="info";
               
              
               
                 rs = st.executeQuery(sql5);
                 cnt=0;
               while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass2="info";else trClass2="";
                       
                       ++cnt;
                       qtyReq= rs.getFloat("REQ");
                      %>
                      
                       <tr scope="row" class="<%=trClass2%>">
		        <th scope="row"><%= cnt%></th>
                        <td rowspan=1 align=left><%=rs.getString("TYPE_CHECK")%></td>
                        <td rowspan=1 align=left><%=rs.getString("PRINT_NAME")%></td>
                       
                   
		        
                        
                      <%
                      
                      
                      // getting requirement in all style
                      
                    String sql8="SELECT SUM( "+
                      "   (ifnull(SD.ES,0)* ifnull(SOD.ES,0)) + "+
                       "   (ifnull(SD.S,0)* ifnull(SOD.S,0))+ "+
                       "   (ifnull(SD.M,0)* ifnull(SOD.M,0))+ "+
                      "   (ifnull(SD.L,0)* ifnull(SOD.L,0))+ "+
                       "  (ifnull(SD.XL,0)* ifnull(SOD.XL,0))+ "+
                        "  (ifnull(SD.XXL,0)* ifnull(SOD.XXL,0))+ "+
                        "  (ifnull(SD.XXXL,0)* ifnull(SOD.XXXL,0))+ "+
                       "  (ifnull(SD.FREE,0)* ifnull(SOD.FREE,0)) "+
                       "  )REQ "+
                       "   from t_so_combo_details SOC, t_style_details SD , t_style_master S, t_so_master SO, "+
                       "  t_so_details SOD WHERE SOC.SO_DTL_ID= SOD.ID  AND SOD.SO_ID= SO.ID  "+
                       "    AND SOC.ST_DTL_ID=SD.ID AND SD.STYLE_ID= S.ID   "+
                       "    AND SO.ID="+mast.getSo()+" "+
                       "    AND SOC.TYPE_CHECK= '"+rs.getString("TYPE_CHECK")+"'"+
                       "    AND SOC.TYPE_ID="+rs.getString("TYPE_ID")+"";
                       
                       //"   AND S.ID="+mast.getStyle()+" "+
                      //out.println(sql8);
                      rs2 = st2.executeQuery(sql8);
                        if(rs2.next())
                        {
                        qtyReqAllStyle= rs2.getFloat("REQ");
                        }else qtyReqAllStyle=0;
                      
                      
                      
                      
                      
                      qtyIssuedAllStyle=0;
                      
                      String sql6="SELECT SUM(ifnull(QTY,0)) QTY FROM t_stock_issue WHERE SO_ID="+mast.getSo()+" "+
                      " AND TYPE_CHECK= '"+rs.getString("TYPE_CHECK")+"' AND TYPE_ID="+rs.getString("TYPE_ID")+"";
                       // out.println(sql6);
                        rs2 = st2.executeQuery(sql6);
                        if(rs2.next())
                        {
                        qtyIssuedAllStyle= rs2.getFloat("QTY");
                        }else qtyIssuedAllStyle=0;
                        
                        
                        
                        
                        
                        
                      
                      %>
                      <td rowspan=1 align=center><%=qtyReqAllStyle%></td>
                       <td rowspan=1 align=center><%=qtyReq%></td>
                        <td rowspan=1 align=center><%=qtyIssuedAllStyle%></td>
                   
		        </tr>
                      <%  
                      
                      if(trClass2.equalsIgnoreCase("info"))trClass2="";
                       
                      }
                     // out.println(mast.getTypeCheck());
                      
                      %>   
 
		      </tbody>
		    </table>
                  
		   </div>
                   
                   
	   </div>                         
    
    <div class="col-md-6 span_3">
		  <div class="bs-example1" data-example-id="contextual-table">
		    
                    <%
          
               
                
                 
              %>
                    
                    <table class="table">
		    
		        <tr>
		          <th rowspan=2>#</td>
                          <th rowspan=1>Variety</th>
                         <th rowspan=1>Type</th>
		          <th rowspan=1>Plain/ Print</th>
		          <th rowspan=1>Qty. issued</th>
                          <th rowspan=1>Issue Date</th>
                          <th rowspan=2>Remarks</td>
                         </td>
                          </tr>
		          <tr>
		         
                         </tr>
		        <tbody>
		    
		      
           <%  
         
                         String  sql4 ="  SELECT concat(fab.NAME,' - ',var.name) VAR_NAME, print.NAME PRINT_NAME, stock.QTY,stock.TYPE_CHECK,"+
                         " DATE_FORMAT(stock.ISSUE_DATE,'%d-%b-%Y') ISSUE_DATE, stock.REMARKS from "+
                         " t_stock_issue stock, t_so_master so , t_print_master print, t_fabric_master fab, t_var_master var   "+
                         " WHERE stock.SO_ID= so.ID "+
                         " and stock.TYPE_ID= print.ID "+ 
                         " AND stock.TYPE_CHECK='Print' "+ 
                         " and stock.VAR_ID= var.ID AND var.FABRIC_ID= fab.ID"+
                         " AND so.ID="+mast.getSo()+" "+ 
                          " AND stock.STYLE_ID= "+mast.getStyle()+"";
                 
                         sql4 +=" union SELECT concat(fab.NAME,' - ',var.name) VAR_NAME, print.NAME PRINT_NAME, stock.QTY,stock.TYPE_CHECK,"+
                         " DATE_FORMAT(stock.ISSUE_DATE,'%d-%b-%Y') ISSUE_DATE, stock.REMARKS from "+
                         " t_stock_issue stock, t_so_master so , t_plain_master print  , t_fabric_master fab, t_var_master var   "+
                         " WHERE stock.SO_ID= so.ID "+
                         " and stock.TYPE_ID= print.ID "+ 
                         " AND stock.TYPE_CHECK='Plain' "+ 
                         " and stock.VAR_ID= var.ID AND var.FABRIC_ID= fab.ID"+
                         " AND so.ID="+mast.getSo()+" "+ 
                          " AND stock.STYLE_ID= "+mast.getStyle()+"";
                          
                          sql4+=" ORDER BY issue_date DESC";
                          //out.println(sql4);

             String trClass1="info",remarks1="";
               
                float qtyIssued=0;
                String issueDate="",varName="";;
                 rs = st.executeQuery(sql4);
                 cnt=0;
               while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass1="info";else trClass1="";
                       
                       ++cnt;
                       remarks1=  rs.getString("REMARKS");if(remarks1==null)remarks1="";
                       issueDate=  rs.getString("ISSUE_DATE");if(issueDate==null)issueDate="";
                       qtyIssued= rs.getFloat("QTY");
                       varName=  rs.getString("VAR_NAME");if(varName==null)varName="";
                      %>
                      
                       <tr scope="row" class="<%=trClass1%>">
		        <th scope="row"><%= cnt%></th>
                          <td rowspan=1 align=left><%=rs.getString("VAR_NAME")%></td>
                        <td rowspan=1 align=left><%=rs.getString("TYPE_CHECK")%></td>
                        <td rowspan=1 align=left><%=rs.getString("PRINT_NAME")%></td>
                        <td rowspan=1 align=right><%=qtyIssued%></td>
                        <td rowspan=1 align=left><%=issueDate%></td>
                        <td align=left><%=remarks1%></td>
		        </tr>
                        
                      <%
                      
                      if(trClass1.equalsIgnoreCase("info"))trClass1="";
                       
                      }
                     // out.println(mast.getTypeCheck());
                      
                      %>   
 
		      </tbody>
		    </table>
                  
		   </div>
                   
                   
	   </div>                         
     
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