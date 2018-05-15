<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="mast" scope="request" class="administration.POMaster"></jsp:useBean>
<jsp:setProperty name="mast" property="*"/>
<jsp:useBean id="forNum" scope="request" class="lib.util.FormatNum"></jsp:useBean>
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




  function showData()
  {
  document.POMaster.display.value = "display";
  document.POMaster.submit();
  }
  
  function PrintThisPage()
{ 
  var disp_setting="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
      disp_setting+="scrollbars=yes,width=900, height=600, left=50, top=25"; 
  var content_vlue = document.getElementById("print_content").innerHTML; 
  
  var docprint=window.open("","",disp_setting); 
   docprint.document.open(); 
   docprint.document.write('<html><head><title>PGMIS</title><link rel="stylesheet" type="text/css" href="css/style.css">'); 
   docprint.document.write('</head><body onLoad="self.print()"><center>');  
   <!--docprint.document.write('</head><body><center>'); -->
   docprint.document.write(content_vlue);          
   docprint.document.write('</center></body></html>'); 
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
     int poNo=0;
     int maxId=0;
     String maxIdSql="SELECT MAX(ID)+1 MAX_ID FROM t_po_details";
     //out.println(maxIdSql);
     rs= st.executeQuery(maxIdSql);
     
     if(rs.next())
     {
     maxId= rs.getInt("MAX_ID");
     }else maxId=1;
    
     if(maxId==1)maxId=1;      
           
     String sqlInsert="INSERT INTO t_po_details(ID,PO_ID,VAR_ID,QTY) VALUES "+
     " ("+maxId+","+po+",'"+var+"','"+qty+"')"; 
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
                    <h4 class="panel-title">Print/Email PO</h4>
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
                                            <%=mast.getVPOSupllierMasterList()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new POMaster name!</p>-->
                                    </div>
                        </div> 
                          <div class="style3" id="print_content">
 <%                           
      String dtlSql="";
 String supNameDisp ="",id="",poNo="",fab="",sup="",poDate="",dDate="",createdBy="",bookNo="";     
if(!mast.getPo().equalsIgnoreCase("0")){ 

  dtlSql = "SELECT A.ID,  A.PO_NO PO_NO , A.SUP_ID ,DATE_FORMAT(PO_DATE,'%d-%b-%Y') PO_DATE ,CREATED_BY,BOOK_NO"+ 
            ",PO_STATUS, M.NAME SUP_NAME ,  DATE_FORMAT( A. EXP_DLV_DATE,'%d-%b-%Y') EXP_DLV_DATE FROM t_po_master A, t_supplier_master M "+
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
    dDate= rs.getString("EXP_DLV_DATE");if (dDate == null) dDate="";
    supNameDisp= rs.getString("SUP_NAME");if(supNameDisp==null)supNameDisp="";
    createdBy= rs.getString("CREATED_BY"); if(createdBy==null)createdBy="";
    bookNo= rs.getString("BOOK_NO"); if(bookNo==null)bookNo="";
    }
   
  
  
  %>        
<div class="form-group">                        
    <div class="col-md-12 span_4">
		  <div class="bs-example1" data-example-id="contextual-table">
		
      <table width=90%>
      
      
       <tr><td valign=top nowrap=nowrap align=center colspan=2><b> Purchase Order <br><br> </b></th>
      
       </tr>
      
      
       <tr><td valign=top nowrap=nowrap>
       <b>Pushkar Ganesh Cotton Club Exportr Pvt. Ltd  <br> Near Krishna Guest House, Pushkar- 305 022 (India)
       <br>
       Phone: 0145-2772661,2772661 Mob: 9414667265
           <td align=right valign=top>
             <table class="table" border=0>
             <tr><td valign=top> PO No. </th> <td><%= bookNo%><td nowrap=nowrap>Date:<%= poDate%></td> 
             <tr><td valign=top> Supplier </th> <td nowrap=nowrap><%= supNameDisp%></td> 
             <tr><td valign=top nowrap=nowrap> Delivery Date </td> <td><%= dDate%></td> 
             </table> 
       </td>
       </tr>
      <tr><td valign=top nowrap=nowrap>
      <b> Please arrange to supply us the following goods.</b>
      </td> 
       </tr>
     <tr> 
     <td colspan=2>
     <%
                    
           String  sql =" SELECT FAB.ID FABRIC_ID, FAB.NAME FAB_NAME ,"+
             " VAR.ID VAR_ID, VAR.NAME VAR_NAME,"+
             " QTY, FOLD, PRICE, LENGTH,WIDTH FROM "+
             "  t_po_details A, t_po_master B , t_var_master VAR, t_fabric_master FAB"+
             " WHERE A.PO_ID= B.ID AND A.VAR_ID= VAR.ID AND VAR.FABRIC_ID= FAB.ID"+
             " AND A.PO_ID="+mast.getPo();
             
             
                    int count=1;
                    rs= st.executeQuery(sql);
                    String fabicName="",var="",type="",fold="",len="",wid="";
                    float qty=0,price=0;
                    double priceTotal=0,qtyTotal=0;
                    double priceX=0;
                    int cnt=0;
                    String trClass="info";
                    %>
                    <div class="panel-body no-padding" style="display: block;">
                    <table class="table table-striped"  border = "1" align="left" cellspacing = "1" cellpadding="1" style="border-collapse: collapse">
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
                          <th>Total Price </th>
		        </tr>
		      </thead>
		      <tbody>
                      <%
                       while(rs.next())
                       {
                       
                       if(cnt%2==0)trClass="info";else trClass="";
                       
                       ++cnt;
                       fabicName= rs.getString("FAB_NAME");
                       var= rs.getString("VAR_NAME");
                       qty= rs.getFloat("QTY");
                       fold= rs.getString("FOLD"); if(fold==null)fold="";
                       len= rs.getString("LENGTH"); if(len==null)len="";
                       wid= rs.getString("WIDTH"); if(wid==null)wid="";
                       price= rs.getFloat("PRICE");
                       priceX= price*qty;
                       qtyTotal+= qty;
                       priceTotal+=priceX;
                       //qtyTotal+=qty;
                       %> 
                        <tr scope="row" class="<%=trClass%>">
		          <th scope="row"><%= cnt%></th>
		          <td align=left><%=fabicName%></td>
		          <td align=left><%=var%></td>
		          <td align=CENTER><%=qty%></td>
                          <td align=LEFT><%=fold%></td>
                          <td align=CENTER><%=len%></td>
                          <td align=CENTER><%=wid%></td>
                          <td align=CENTER><%=price%></td>
                          <td align=CENTER><%=forNum.returnFormat2(priceX)%></td>
		        </tr>
                        
                      <%
                      
                      if(trClass.equalsIgnoreCase("info"))trClass="";
                       
                      }
                      %>
                      <tr scope="row" class="warning">
		          <th scope="row" colspan=3><b>Total</th>
		          <td align=CENTER><b><%=forNum.returnFormat2(qtyTotal)%></td>
		          <td align=left>&nbsp;</td>
                          <td align=left>&nbsp;</td>
                          <td align=left>&nbsp;</td>
                          <td align=left>&nbsp;</td>
		          <td align=CENTER><b><%=forNum.returnFormat2(priceTotal)%></td>
                        
		        </tr>
		      </tbody>
		    </table>
                    </div>
      </td>
      </tr>
       <tr><td colspan=1><br><br>
       <font size=2> Prepared By.</font> <%= createdBy%> </td>
       <td align=right valign=top nowrap=nowrap>For Pushkar Ganesh Cotton Club Export Pvt Ltd.</td></tr>
     
      
       <tr><td colspan=1 valign=top>
       <font size=2><br>Accepted By
       <br>
       1. Rate quoted above are F.O.R (upto our godown) unless otherwise specified. <br>
       2. Goods ordered are first quality unless otherwise specified. Second quality goods shall be returned. Shortage, if any, will be intimated.<br>
       3. Deliveries beyond detailed indicated above will be not be acepted, unless written extension has been given.<br>
       4. Deliveries against 2 seperated order should not be made on one invoice. Make sperate invoice for seperate order.<br>
       5. Our PO No. and Ref. is to be mentioned on all our invoices, PK list & of Challan.
       </font>
       <td align=right valign=top>
             <table class="table" border=0>
             <tr><td colspan=2> For Office Use - Details of material supplied</td></tr> 
             <tr><td> Bill No ..........</td> <td>Date .........</td> </tr> 
             <tr><td> GR No..........</td> <td>Date.........</td> </tr> 
             <tr><td colspan=2> Qty. Received......................</td> </tr> 
             <tr><td colspan=1> Rate.........</td> <td>Value.........</td> </tr>
             </table> 
       </td>
       </tr>
     </table>
             
		   </div>
                   
                   
	   </div>                         
     
    </div>     
    </div>
                           
                            <div class="but_list" align=center>
                           
                                 <p>        
                                 <button type="button" class="btn btn_5 btn-lg btn-warning warning_11" onclick="javascript:PrintThisPage()" >Print</button> 
                                      
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