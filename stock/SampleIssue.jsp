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
<meta name="viewport" contentf="width=device-width, initial-scale=1">
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
   
   if(document.SOMaster.print.value=="0")
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
     
     String remarks= request.getParameter("remarks"); if(remarks==null)remarks="0";
     String qtySent= request.getParameter("qtySent"); if(qtySent==null)qtySent="0";
     String sentDate= request.getParameter("sentDate");if(sentDate==null)sentDate="";
     String var= request.getParameter("var"); if(var==null)var="0";
     String qtyAvail= request.getParameter("qtyAvail"); if(qtyAvail==null)qtyAvail="0";
     String issueStatus="N";
     

     
     String print= request.getParameter("print");
     String tempTypeCheck="",tempTypeId="",tempVal="";
     String tempArr[]= print.split("-");
     tempTypeCheck=  tempArr[0];
     tempTypeId= tempArr[1];
     
     
    int maxId=0;
     
     String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_sample_issue";
    // out.println(maxIdSql);
     rs= st.executeQuery(maxIdSql);
     
     if(rs.next())
     {
     maxId= rs.getInt("MAX_ID");
     }else maxId=1;
    
     if(maxId==0)maxId=1;      
           
     String sqlInsert="INSERT INTO t_sample_issue(ID,VAR_ID,TYPE_CHECK, TYPE_ID,QTY,ISSUE_DATE,REMARKS)"+
      " VALUES "+
     " ("+maxId+","+var+",'"+tempTypeCheck+"',"+tempTypeId+","+qtySent+",'"+sentDate+"','"+remarks+"')"; 
     //out.println(sqlInsert);
    
     int x=st.executeUpdate(sqlInsert);
     
     
      String sqlUpdateStock="UPDATE t_stock_master set QTY= QTY-"+qtySent+"  "+
       " where FABRIC_ID="+mast.getFab()+" AND VAR_ID="+var+" "+
      "  AND TYPE_CHECK='"+tempTypeCheck+"' AND TYPE_ID="+tempTypeId+"";
      // out.println(sqlUpdateStock);
       int p=st.executeUpdate(sqlUpdateStock);
     
  
   
     message= " Selected Item has been issued to sampling department successfully. Stock Values have been updated.";
     
   
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
                    <h4 class="panel-title">Issue Material to Sampling Department</h4>
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
                      
                      
                                                  
                            
                          
                           
                             
                           <!-- Show all detail at one place)-->
                           
                        
                        
                   
<%                           
      String dtlSql="";
      //out.println("reached"+mast.getStyleType());

String bImageName ="",id="",stName="",fab="",descr="",fImage="",bImage ="",monthYear="";

      
  %>    
   
    
            <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Select Fabric</label>
                                      <input type="HIDDEN" name="display" value=""></input>
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
                                            <%=mast.getPrintListOnChange()%>
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
                            
                                    <label for="selector1" class="col-sm-2 control-label">Qty (in mtrs) to be issued to sampling section</label>
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
                                  
                                    
                                    
                          
                            <div class="but_list" align=center>
                           
                                 <p>        
                                 <button type="button" class="btn btn_5 btn-lg btn-warning warning_11" onclick="javascript:submitClick()" >Save</button> 
                                 </p>
                            </div>
   
   
                   
                   
	   </div>                         
     
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