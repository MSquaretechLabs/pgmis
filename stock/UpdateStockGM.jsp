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
     
   if(document.SOMaster.fab.value=="0")
   {
   reason+="Please Select Fabric .\n";
   }else if(document.SOMaster.var.value=="0")
   {
   reason+="Please Select Variety .\n";
   }else if(document.SOMaster.qty.value=="")
   {
   reason+="Please Enter Qty. .\n";
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
     
     String qty= request.getParameter("qty"); if(qty==null)qty="0";
     String fab= request.getParameter("fab"); if(fab==null)fab="0";
     String var= request.getParameter("var"); if(var==null)var="0";
     String rackNo= request.getParameter("rackNo"); if(rackNo==null)rackNo="";
        
     
     boolean dataPresent=false;
     float qtyAvail=0;
      
      String chkSql= "SELECT QTY FROM t_gm_stock_master where FABRIC_ID="+fab+" AND VAR_ID="+var+"";
     
      //out.println(chkSql);
       rs= st.executeQuery(chkSql);
       if(rs.next()){
       dataPresent= true;
       qtyAvail= rs.getFloat("QTY");
       }
       
       if(dataPresent)
       {
      
        
       
       
       String sqlUpdateStock="UPDATE t_gm_stock_master set QTY= "+qty+" ,RACK_NO='"+rackNo+"' "+
       " where FABRIC_ID="+fab+" AND VAR_ID="+var+"";
       //out.println(sqlUpdateStock);
       int x=st.executeUpdate(sqlUpdateStock);
       }else
       {
       
         String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_gm_stock_master";
         //out.println(maxIdSql);
         rs= st.executeQuery(maxIdSql);
         int maxId=1;
         if(rs.next())
         {
         maxId= rs.getInt("MAX_ID");
         }else maxId=1;
          
           if(maxId==0)maxId=1;    
       
        String sqlInsert="INSERT t_gm_stock_master (ID,FABRIC_ID,VAR_ID,QTY,RACK_NO)VALUES"+
        "("+maxId+", "+fab+", "+var+","+qty+",'"+rackNo+"')";
     
       //out.println(sqlInsert);
       int x=st.executeUpdate(sqlInsert);
       
       
       }
     
     
     
    
   
     message= " Stock has been been updated.";
     
   
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
                    <h4 class="panel-title">Update Grey Material Stock</h4>
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
                            
                                    <label for="selector1" class="col-sm-2 control-label">Select Fabric</label>
                                   <input type=hidden name="display">
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
   
    <%
    
    //check quantity available in stock
     
     
     if(!mast.getVar().equalsIgnoreCase("0"))  
     {
     
     
       
        String tempRackNo=""; 
        String chkQtySql="SELECT ifnull(QTY,0) QTY, RACK_NO FROM t_gm_stock_master where VAR_ID="+mast.getVar()+"";
       
        // out.println(chkQtySql);
         float qtyAvailable=0;
         rs= st.executeQuery(chkQtySql);
       
         if(rs.next()){
         qtyAvailable= rs.getFloat("QTY");
         tempRackNo= rs.getString("RACK_NO");if (tempRackNo==null)tempRackNo="";
         }
     
     %>
       <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Qty. Available</label>
                                    <div class="col-sm-4">
                                            <input type="text" size=2 class="form-control1" name="qty" value="<%=qtyAvailable%>" id="qty" placeholder="Qty">
                                    </div>
                                 
                                    
                                    
                            </div>  
                             <div class="form-group">
                            
                                    <label for="selector1" class="col-sm-2 control-label">Rack No </label>
                                    <div class="col-sm-4">
                                             <input type="text" class="form-control1" name="rackNo" id="rackNo" value="<%=tempRackNo%>" placeholder="Rack No.">
 </div>
                                       </div>
 
     <%
     }
    %>
    
  
                          
                    
    
  
    
    
                             
                                    
                                    
                          
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