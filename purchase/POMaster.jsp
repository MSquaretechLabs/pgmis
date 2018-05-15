<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="mast" scope="request" class="administration.POMaster"></jsp:useBean>
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

function submitClick(){

if(validateForm()){ 
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
  
   if(document.POMaster.manu.value=="0")
   {
   reason+="Please Select Supplier Name .\n";
   }else if(document.POMaster.poDate.value=="")
   {
   reason+="Please Enter  PO Date.\n";
   }else if(document.POMaster.poDelDate.value=="")
   {
   reason+="Please Enter  Expected Date of Delivery.\n";
   }
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
try
{   
     
 st= con.createStatement();
 st2= con.createStatement();
 
 String display=request.getParameter("display"); if(display==null)display="";
// out.println(display);
 if(display.equalsIgnoreCase("save"))
 {
     
     String manu=request.getParameter("manu"); if(manu==null)manu="";
     String poDate=request.getParameter("poDate"); if(poDate==null)poDate="";
     String poDelDate=request.getParameter("poDelDate"); if(poDelDate==null)poDelDate="";
     String poDelSupDate=request.getParameter("poDelSupDate"); if(poDelSupDate==null)poDelSupDate="";
     String remarks=request.getParameter("remarks"); if(remarks==null)remarks="";
     String createdBy=request.getParameter("createdBy"); if(createdBy==null)createdBy="";
     String bookNo=request.getParameter("bookNo"); if(bookNo==null)bookNo="";
     int poNo=0;
     int maxId=0;
     String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_po_master";
     //out.println(maxIdSql);
     rs= st.executeQuery(maxIdSql);
     
     if(rs.next())
     {
     maxId= rs.getInt("MAX_ID");
     }else maxId=1;
         
     if(maxId==0)maxId=1; 
     
     String sqlInsert="INSERT INTO t_po_master(ID,PO_NO,PO_DATE,PO_CREATED_USER,SUP_ID,PO_STATUS,EXP_DLV_DATE,EXP_DLV_DATE_SUPP,REMARKS, BOOK_NO,CREATED_BY) VALUES "+
     " ("+maxId+","+(maxId+1000)+",'"+poDate+"','purchase user','"+manu+"','N','"+poDelDate+"','"+poDelSupDate+"',  '"+remarks+"','"+bookNo+"','"+createdBy+"')"; 
     //out.println(sqlInsert);
     poNo= maxId+1000;
     int x=st.executeUpdate(sqlInsert);
     message= "New PO has been created successfully. PO No."+poNo;
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
                    <h4 class="panel-title">Create PO</h4>
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
                                    <label for="selector1" class="col-sm-2 control-label">Select Supplier</label>
                                    <div class="col-sm-6">
                                            <%=mast.getSupplierList()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new POMaster name!</p>-->
                                    </div>
                                    
                                    
                            </div>
                            
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">PO Date</label>
                                    <div class="col-sm-6">
                                            <input type="date"  name= "poDate" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">
                                    </div>
                            </div>
                            
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Exp. Delivery Date</label>
                                     <div class="col-sm-6">
                                            <input type="date"  name= "poDelDate" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">
                                    </div>
                            </div>
                            
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Exp. Delivery Date (By Supplier)</label>
                                     <div class="col-sm-6">
                                            <input type="date"  name= "poDelSupDate" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">
                                    </div>
                            </div>
                           
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Book Reference No.</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="bookNo"  value= "" id="bookNo" placeholder="Book No.">
                                    </div>
                            </div>
                            
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Remarks.</label>
                                    <div class="col-sm-8">
                                            <input type="text" class="form-control1" name="remarks" id="remarks" placeholder="Remarks">
                                    </div>
                            </div>
                            
                            <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label">Created By</label>
                                    <div class="col-sm-4">
                                            <input type="text" class="form-control1" name="createdBy" id="createdBy"  value= "" placeholder="">
                                    </div>
                            </div>
                         
                            <div class="but_list" align=center>
                           
                                 <p>        
                                 <button type="button" class="btn btn_5 btn-lg btn-warning warning_11" onclick="javascript:submitClick()" >Save</button> 
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