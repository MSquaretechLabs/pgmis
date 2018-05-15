<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Administration:Pushkar Ganesh Cotton Club Export Pvt. Ltd.</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
 <jsp:useBean id="mast" scope="request" class="administration.SOMaster"></jsp:useBean>
 <jsp:setProperty name="mast" property="*"/>
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
    document.customer.submit(); 
    }
  }  

function validateForm(){

 if(validateFormFields())
 {  if(document.customer.display.value != "display"){
   var check = confirm("Do you want to Save?")
   if(check){
   document.customer.display.value="save";
   return true; 
   }
   else return false;
   }
   return true;
 } 
 return false;
}   

function showDataSoDetails()
  {
  //document.customer.so.value = "0";
  document.customer.display.value = "display";
  document.customer.submit();
  }
 function showData()
  {
 
  document.customer.display.value = "display";
  document.customer.submit();
  }
function validateFormFields()
{

 if(document.customer.display.value != "display")
 {
   var reason = "";
  
   if(document.customer.soDate.value=="")
   {
   reason+="Please Enter  SO Date .\n";
   }else if(document.customer.soDelDate.value=="")
   {
   reason+="Please Enter Expected Delivery Date.\n";
   }
   if (reason != "") {
    alert("Some fields need correction:\n" + reason);
    return false;
  }
 
}
return true;
}
function deleteClick(){
    
    if(document.customer.so.value!="0")
    {
   
       var check = confirm("Do you want to Delete?")
       if(check){
       document.customer.display.value="delete";
       document.customer.submit(); 
       }
       
    }else{
    alert("Please select PO");
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
try
{   
     
 st= con.createStatement();
 st2= con.createStatement();
 String chkVale="";
 String display=request.getParameter("display"); if(display==null)display="";
// out.println(display);
if(display.equalsIgnoreCase("save"))
 {
     try{
   
     String soDate=request.getParameter("soDate"); if(soDate==null)soDate="";
     String soDelDate=request.getParameter("soDelDate"); if(soDelDate==null)soDelDate="";
   
     String remarks=request.getParameter("remarks"); if(remarks==null)remarks="";
     String fullIssue= request.getParameter("fullIssue"); if(fullIssue==null)fullIssue="";
     String issueStatus="A";
     if(fullIssue.equalsIgnoreCase("on"))issueStatus="C";else issueStatus="A";
     
     String sqlUpdate="UPDATE t_so_master"+
     " SET SO_DATE='"+soDate+"', EXP_DLV_DATE='"+soDelDate+"',"+
     " REMARKS='"+remarks+"', SO_STATUS='"+issueStatus+"'"+
     " WHERE ID="+mast.getSo()+"";
     //out.println(sqlUpdate);
     int x=st.executeUpdate(sqlUpdate);
     message= "SO has been updated successfully.";
  
  }catch(Exception rt)
  {
   message= "SO is not updated successfully."+rt.getMessage();
  }
  
  }
 
 if(display.equalsIgnoreCase("delete"))
 {
     try{
     String sqlUpdate="DELETE FROM t_so_master WHERE ID= "+mast.getPo()+"";
     int x=st.executeUpdate(sqlUpdate);
     message= "Selected PO  has been deleted successfully.";
     
  
  }catch(Exception rt)
  {
   message=" SO is not deleted successfully."+rt.getMessage();
  }
  
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
                    <h4 class="panel-title">Update SO Details</h4>
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
                 
                   
                    <form class="form-horizontal" name="customer">
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
                            
      <%
      String nameTemp="",addressTemp="",phoneTemp="",countryTemp="",emailTemp="",websiteTemp="",mobileTemp="";
      String bookNo="",soDelDate="",poDelSupDate="",soStatus="";
      //out.println("reached herer"+mast.getFab());
     if(!mast.getSo().equalsIgnoreCase("0"))
      
      {
         
         String supNameDisp ="",id="",soNo="",fab="",cust="",soDate="",remarks="",cratedBy="";
         String  dtlSql = "SELECT A.ID,  A.SO_NO SO_NO , A.CUST_ID ,"+
            " DATE_FORMAT(SO_DATE,'%Y-%m-%d') SO_DATE, "+
            " DATE_FORMAT(EXP_DLV_DATE,'%Y-%m-%d') EXP_DLV_DATE, "+
            " REMARKS "+ 
            ",SO_STATUS FROM t_so_master A, t_customer_master C "+
            " WHERE A.CUST_ID= C.ID "+
            " AND A.ID = "+mast.getSo()+"";
         //out.println(sqlDisplay);
         rs= st.executeQuery(dtlSql);
     
         if(rs.next())
         {
          id = rs.getString("ID");
          soNo =rs.getString("SO_NO"); if (soNo == null) soNo="";
          cust = rs.getString("CUST_ID"); if (cust == null) cust="";
          soDate = rs.getString("SO_DATE");if (soDate == null) soDate="";
          soDelDate= rs.getString("EXP_DLV_DATE");if (soDelDate == null) soDelDate="";
          remarks = rs.getString("REMARKS");if(remarks==null)remarks="";
          soStatus= rs.getString("SO_STATUS");if(soStatus==null)soStatus="";
         }else {
         id="";
         addressTemp="";
         cust="";
         soDate="";
         supNameDisp="";
         bookNo="";
         remarks="";
         cratedBy="";
         soStatus="";
         }
         
                if(soStatus.equalsIgnoreCase("C"))//CLOSED
                chkVale="checked";else chkVale="";
      
     
      %>
       <div class="alert alert-info">
                            Please fill details to update                         </div>
                        <hr>
      
      
                 
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">SO Received Date</label>
                                    <div class="col-sm-6">
                                            <input type="date"  name= "soDate" class="form-control1 ng-invalid ng-invalid-required" value="<%=soDate%>" ng-model="model.date" required="">
                                    </div>
                            </div>
                            
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Exp. Delivery Date</label>
                                     <div class="col-sm-6">
                                            <input type="date"  name= "soDelDate"  value= "<%=soDelDate%>" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">
                                    </div>
                            </div>
                            
                       
                            
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Remarks</label>
                                    <div class="col-sm-6">
                                            <input type="text" class="form-control1" name="remarks" id="remarks"  value= "<%=remarks%>" placeholder="Remarks">
                                    </div>
                            </div>
                            
                          
                            <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Check -if all transaction is closed for this PO</label>
                                    <div class="col-sm-1">
                                            
					<div class="checkbox-inline1"><label><input type="checkbox" name="fullIssue" <%=chkVale%>></label></div>
									
								

                                    </div>
                              </DIV>      
                            <div class="but_list" align=center>
                           
                                <p>        
                                 <button type="button" accesskey="Enter" class="btn btn_5 btn-lg btn-warning warning_11" onclick="javascript:submitClick()" >Update</button> 
                                 <button type="button" class="btn btn_5 btn-lg btn-success success_11" onclick="javascript:deleteClick()" >Delete</button> 
                                 
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
			<script src="/pgmis/common/js/underscore-min.js" type="text/javascript"></script>
			<script src= "/pgmis/common/js/moment-2.2.1.js" type="text/javascript"></script>
			<script src="/pgmis/common/js/clndr.js" type="text/javascript"></script>
			<script src="/pgmis/common/js/site.js" type="text/javascript"></script>
			<!----End Calender -------->
		</div>
		<div class="col-md-6 col_5">
		  
	      <!-- map -->
<link href="/pgmis/common/css/jqvmap.css" rel='stylesheet' type='text/css' />
<script src="/pgmis/common/js/jquery.vmap.js"></script>
<script src="/pgmis/common/js/jquery.vmap.sampledata.js" type="text/javascript"></script>
<script src="/pgmis/common/js/jquery.vmap.world.js" type="text/javascript"></script>
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