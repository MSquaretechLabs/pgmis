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
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />

<!-- Graph CSS -->
<link href="css/lines.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!----webfonts--->
<jsp:useBean id="mast" scope="request" class="administration.POMaster"></jsp:useBean>
<jsp:setProperty name="mast" property="*"/>
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
  
   if(document.customer.poDate.value=="")
   {
   reason+="Please Enter  PO Date .\n";
   }else if(document.customer.poDelDate.value=="")
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
    
    if(document.customer.po.value!="0")
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
   
     String poDate=request.getParameter("poDate"); if(poDate==null)poDate="";
     String poDelDate=request.getParameter("poDelDate"); if(poDelDate==null)poDelDate="";
     String bookNo=request.getParameter("bookNo"); if(bookNo==null)bookNo="";
     String createdBy=request.getParameter("createdBy"); if(createdBy==null)createdBy="";
     String poDelSupDate=request.getParameter("poDelSupDate"); if(poDelSupDate==null)poDelSupDate="";
     String remarks=request.getParameter("remarks"); if(remarks==null)remarks="";
     String fullIssue= request.getParameter("fullIssue"); if(fullIssue==null)fullIssue="";
     String issueStatus="A";
     if(fullIssue.equalsIgnoreCase("on"))issueStatus="C";else issueStatus="A";
     
     String sqlUpdate="UPDATE t_po_master"+
     " SET PO_DATE='"+poDate+"', EXP_DLV_DATE='"+poDelDate+"',EXP_DLV_DATE_SUPP='"+poDelSupDate+"',"+
     " BOOK_NO='"+bookNo+"', CREATED_BY='"+createdBy+"', REMARKS='"+remarks+"', PO_STATUS='"+issueStatus+"'"+
     " WHERE ID="+mast.getPo()+"";
     //out.println(sqlUpdate);
     int x=st.executeUpdate(sqlUpdate);
     message= "PO has been updated successfully.";
  
  }catch(Exception rt)
  {
   message= "PO is not updated successfully."+rt.getMessage();
  }
  
  }
 
 if(display.equalsIgnoreCase("delete"))
 {
     try{
     String sqlUpdate="DELETE FROM t_po_master WHERE ID= "+mast.getPo()+"";
     int x=st.executeUpdate(sqlUpdate);
     message= "Selected PO  has been deleted successfully.";
     
  
  }catch(Exception rt)
  {
   message=" PO is not deleted successfully."+rt.getMessage();
  }
  
} 
 
 
%>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            
               <%@ include file="PurchaseHeader.jsp" %>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
        <div class="graphs">
     	
      <div class="col_1">
		   <div class="col-md-12 span_6">
                 <div class="panel-heading">
                    <h4 class="panel-title">Update PO Details</h4>
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
                            <input type="HIDDEN" name="display" value=""></input>
                                    <label for="selector1" class="col-sm-2 control-label">Select PO</label>
                                    <div class="col-sm-4">
                                            <%=mast.getPOSupllierMasterList()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new POMaster name!</p>-->
                                    </div>
                        </div>  
                            
      <%
      String nameTemp="",addressTemp="",phoneTemp="",countryTemp="",emailTemp="",websiteTemp="",mobileTemp="";
      String bookNo="",poDelDate="",poDelSupDate="",poStatus="";
      //out.println("reached herer"+mast.getFab());
     if(!mast.getPo().equalsIgnoreCase("0"))
      
      {
         
         String supNameDisp ="",id="",poNo="",fab="",sup="",poDate="",remarks="",cratedBy="";
         String  dtlSql = "SELECT A.ID,  A.PO_NO PO_NO , A.SUP_ID ,CREATED_BY,"+
            " DATE_FORMAT(PO_DATE,'%Y-%m-%d') PO_DATE, "+
            " DATE_FORMAT(EXP_DLV_DATE,'%Y-%m-%d') EXP_DLV_DATE, "+
            " DATE_FORMAT(EXP_DLV_DATE_SUPP,'%Y-%m-%d') EXP_DLV_DATE_SUPP, "+
            "  BOOK_NO ,REMARKS "+ 
            ",PO_STATUS, M.NAME SUP_NAME FROM t_po_master A, t_supplier_master M "+
            " WHERE A.SUP_ID= M.ID "+
            " AND A.ID = "+mast.getPo()+"";
         //out.println(sqlDisplay);
         rs= st.executeQuery(dtlSql);
     
         if(rs.next())
         {
          id = rs.getString("ID");
          poNo =rs.getString("PO_NO"); if (poNo == null) poNo="";
          sup = rs.getString("SUP_ID"); if (sup == null) sup="";
          poDate = rs.getString("PO_DATE");if (poDate == null) poDate="";
          poDelDate= rs.getString("EXP_DLV_DATE");if (poDelDate == null) poDelDate="";
          poDelSupDate= rs.getString("EXP_DLV_DATE_SUPP");if (poDelSupDate == null) poDelSupDate="";
          supNameDisp= rs.getString("SUP_NAME");if(supNameDisp==null)supNameDisp="";
          bookNo= rs.getString("BOOK_NO");if(bookNo==null)bookNo="";
          remarks = rs.getString("REMARKS");if(remarks==null)remarks="";
          cratedBy= rs.getString("CREATED_BY");if(cratedBy==null)cratedBy="";
          poStatus= rs.getString("PO_STATUS");if(poStatus==null)poStatus="";
         }else {
         id="";
         addressTemp="";
         sup="";
         poDate="";
         supNameDisp="";
         bookNo="";
         remarks="";
         cratedBy="";
         poStatus="";
         }
         
                if(poStatus.equalsIgnoreCase("C"))//CLOSED
                chkVale="checked";else chkVale="";
      
     
      %>
       <div class="alert alert-info">
                            Please fill details to update                         </div>
                        <hr>
      
      
                 
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">PO Date</label>
                                    <div class="col-sm-6">
                                            <input type="date"  name= "poDate" class="form-control1 ng-invalid ng-invalid-required" value="<%=poDate%>" ng-model="model.date" required="">
                                    </div>
                            </div>
                            
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Exp. Delivery Date</label>
                                     <div class="col-sm-6">
                                            <input type="date"  name= "poDelDate"  value= "<%=poDelDate%>" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">
                                    </div>
                            </div>
                            
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Exp. Delivery Date (By Supplier)</label>
                                     <div class="col-sm-6">
                                            <input type="date"  name= "poDelSupDate" value= "<%=poDelSupDate%>" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">
                                    </div>
                            </div>
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Book Reference No.</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="bookNo"  value= "<%=bookNo%>" id="bookNo" placeholder="Book No.">
                                    </div>
                            </div>
                            
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Remarks</label>
                                    <div class="col-sm-6">
                                            <input type="text" class="form-control1" name="remarks" id="remarks"  value= "<%=remarks%>" placeholder="Remarks">
                                    </div>
                            </div>
                            
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Created By</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="cratedBy" id="cratedBy"  value= "<%=cratedBy%>" placeholder="">
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
     var dis = "<%= message %>";
     if(!dis ==""){
     alert(dis);
     
    }
   </script