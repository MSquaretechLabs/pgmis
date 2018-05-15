<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="mast" scope="request" class="administration.POMaster"></jsp:useBean>
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
  
   if(document.POMaster.po.value=="0")
   {
   reason+="Please Select Supplier Name .\n";
   }else if(document.POMaster.fab.value=="0")
   {
   reason+="Please Select Fabric.\n";
   }else if(document.POMaster.var.value=="0")
   {
   reason+="Please Select Variety.\n";
   }else if(document.POMaster.qty.value=="")
   {
   reason+="Please Enter Quantity.\n";
   }else if(document.POMaster.price.value=="")
   {
   reason+="Please Enter Price.\n";
   }
   if (reason != "") {
    alert("Some fields need correction:\n" + reason);
    return false;
  }
 
}
return true;
}


  function showData()
  {
  document.POMaster.display.value = "display";
  document.POMaster.submit();
  }
  
  
  function deleteRedirect(idT,tableNameT,typeT)
{
  var id= idT;
  var mod= "purchase";
  var poT= document.POMaster.po.value;
  
  var check = confirm("Do you want to Delete?")
   if(check){
    window.location.href="/pgmis/purchase/DeleteItemPurchase.jsp?id="+id+"&tableName="+tableNameT+"&type="+typeT+"&module="+mod+"&po="+poT+"";
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
 
 String display=request.getParameter("display"); if(display==null)display="";
// out.println(display);
 if(display.equalsIgnoreCase("save"))
 {
     
     String po=request.getParameter("po"); if(po==null)po="";
     String fabric=request.getParameter("fab"); if(fabric==null)fabric="";
     String var=request.getParameter("var"); if(var==null)var="";
     String qty=request.getParameter("qty"); if(qty==null)qty="";
     String len=request.getParameter("len"); if(len==null)len="0";
     String wid=request.getParameter("wid"); if(wid==null)wid="0";
     String fold=request.getParameter("fold"); if(fold==null)fold="";
     String price=request.getParameter("price"); if(price==null)price="0";
     int poNo=0;
     int maxId=0;
     String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_po_details";
     //out.println(maxIdSql);
     rs= st.executeQuery(maxIdSql);
     
     if(rs.next())
     {
     maxId= rs.getInt("MAX_ID");
     }else maxId=1;
    
     if(maxId==0)maxId=1;      
           
     String sqlInsert="INSERT INTO t_po_details(ID,PO_ID,VAR_ID,QTY, FOLD,LENGTH,WIDTH, PRICE) VALUES "+
     " ("+maxId+","+po+",'"+var+"','"+qty+"','"+fold+"',"+len+","+wid+","+price+")"; 
     //out.println(sqlInsert);
    
     int x=st.executeUpdate(sqlInsert);
     message= "New PO entry has been added successfully.";
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
                    <h4 class="panel-title">Enter PO Details</h4>
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
                                    <label for="selector1" class="col-sm-2 control-label">Select PO</label>
                                    <div class="col-sm-4">
                                            <%=mast.getPOSupllierMasterList()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new POMaster name!</p>-->
                                    </div>
                        </div>            
 <%                           
      String dtlSql="";
      
if(!mast.getPo().equalsIgnoreCase("0")){ 
String supNameDisp ="",id="",poNo="",fab="",sup="",poDate="";
  dtlSql = "SELECT A.ID,  A.PO_NO PO_NO , A.SUP_ID ,DATE_FORMAT(PO_DATE,'%d-%b-%Y') PO_DATE "+ 
            ",PO_STATUS, M.NAME SUP_NAME FROM t_po_master A, t_supplier_master M "+
            " WHERE A.SUP_ID= M.ID "+
            " AND A.ID = "+mast.getPo()+"";
    //out.println(dtlSql);
    rs = st.executeQuery(dtlSql);
   
    id="";
    
    if(rs.next()){
    id = rs.getString("ID");
    poNo =rs.getString("PO_NO"); if (poNo == null) poNo="";
    sup = rs.getString("SUP_ID"); if (sup == null) sup="";
    poDate = rs.getString("PO_DATE");if (poDate == null) poDate="";
    supNameDisp= rs.getString("SUP_NAME");if(supNameDisp==null)supNameDisp="";
    }
    if(!id.equalsIgnoreCase(""))
    {
    %>
     
     
        <div class="form-group">
                          
                                    <label for="selector1" class="col-sm-2 control-label">PO No.</label>
                                    <div class="col-sm-6">
                                            <%=poNo%>
                                    </div>
      </div>
       
     
        <div class="form-group">
                          
                               
                                    <label for="selector1" class="col-sm-2 control-label">Name of Supplier</label>
                                    <div class="col-sm-6">
                                            <%=supNameDisp%>
                                    </div>
                                   
       </div>
       
       
        <div class="form-group">
                          
                                 
                                    <label for="selector1" class="col-sm-2 control-label">PO Date</label>
                                    <div class="col-sm-6">
                                            <%=poDate%>
                                    </div>
        </div>
       
      
     
  <%}
  
  
  %>        
<div class="form-group">                        
    <div class="col-md-12 span_3">
		  <div class="bs-example1" data-example-id="contextual-table">
		    
                    <%
                    
           String  sql =" SELECT A.ID DTL_ID,FAB.ID FABRIC_ID, FAB.NAME FAB_NAME ,"+
             " VAR.ID VAR_ID, VAR.NAME VAR_NAME,"+
             " QTY, FOLD,LENGTH,WIDTH, PRICE FROM "+
             "  t_po_details A, t_po_master B , t_var_master VAR, t_fabric_master FAB"+
             " WHERE A.PO_ID= B.ID AND A.VAR_ID= VAR.ID AND VAR.FABRIC_ID= FAB.ID"+
             " AND A.PO_ID="+mast.getPo();
            // out.println(sql);
             
                    int count=1;
                    rs= st.executeQuery(sql);
                    String fabicName="",var="",type="",fold="",len="",wid="";
                    float qty=0,qtyTotal=0,price=0,priceTotal=0;
                    int cnt=0;
                    String detailId="";
                    String trClass="info";
                    %>
                    
                    <table class="table">
		      <thead>
		        <tr>
		          <th>#</th>
		          <th>Fabric</th>
		          <th>Variety</th>
		          <th>Qty. (in Meters)</th>
                          <th>Fold</th>
                          <th>Length</th>
                          <th>Width</th>
                          <th>Price Rs. per pc/mtr</th>
                          <th>Delete</th>
		        </tr>
		      </thead>
		      <tbody>
                      <%
                       while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                       detailId= rs.getString("DTL_ID");
                       fabicName= rs.getString("FAB_NAME");
                       var= rs.getString("VAR_NAME");
                       qty= rs.getFloat("QTY");
                       fold= rs.getString("FOLD"); if(fold==null)fold="";
                       len= rs.getString("LENGTH"); if(len==null)len="";
                       wid= rs.getString("WIDTH"); if(wid==null)wid="";
                       price= rs.getFloat("PRICE");
                       //qtyTotal+=qty;
                       %> 
                        <tr scope="row" class="<%=trClass%>">
		          <th scope="row"><%= cnt%></th>
		          <td align=left><%=fabicName%></td>
		          <td align=left><%=var%></td>
		          <td align=right><%=qty%></td>
                          <td align=LEFT><%=fold%></td>
                          <td align=CENTER><%=len%></td>
                          <td align=CENTER><%=wid%></td>
                          <td align=CENTER><%=price%></td>
                           <td> <a href='javascript:deleteRedirect("<%=detailId%>","t_po_details","poDetails")'>Delete</a></td>
		        </tr>
                        
                      <%
                      
                      if(trClass.equalsIgnoreCase("info"))trClass="";
                       
                      }
                      %>   
  <tr>
    <td align="center"><b><font color="Red">New</b></td>
   <td><%= mast.getFabricListOnChange() %></td>
   <td><%= mast.getVarietyList() %></td>
    <td>
  <input type="text" size=2 class="form-control1" name="qty" id="qty" placeholder="Qty">
   </td>
     <td>
  <input type="text" size=2 class="form-control1" name="fold" id="fold" placeholder="Fold">
   </td>
    <td>
  <input type="text" size=2 class="form-control1" name="len" id="len" placeholder="Length">
   </td>
    <td>
  <input type="text" size=2 class="form-control1" name="wid" id="wid" placeholder="Width">
   </td>
     <td>
  <input type="text" size=2 class="form-control1" name="price" id="price" placeholder="Price">
   </td>
   
  <td>&nbsp;</td>
    </tr> 
		      </tbody>
		    </table>
                  
		   </div>
                   
                   
	   </div>                         
     
    </div>                 
                           
                            <div class="but_list" align=left>
                           
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