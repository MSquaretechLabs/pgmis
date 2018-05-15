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

function submitClick(){

if(validateForm()){ 
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




  function showData()
  {
  document.SOMaster.display.value = "display";
  document.SOMaster.submit();
  }
  
  function showDataSoDetails()
  {
  document.SOMaster.so.value = "0";
   document.SOMaster.display.value = "display";
  document.SOMaster.submit();
  }
  function PrintThisPage()
{ 
  var disp_setting="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
      disp_setting+="scrollbars=yes,width=900, height=600, left=50, top=25"; 
  var content_vlue = document.getElementById("print_content").innerHTML; 
  
  var docprint=window.open("","",disp_setting); 
   docprint.document.open(); 
   docprint.document.write('<html><head><title>PGMIS</title><link rel="stylesheet" type="text/css" href="/pgmis/common/css/style.css">'); 
   docprint.document.write('</head><body onLoad="self.print()"><center>');  
   <!--docprint.document.write('</head><body><center>'); -->
   docprint.document.write(content_vlue);          
   docprint.document.write('</center></body></html>'); 
   docprint.document.close(); 
   docprint.focus(); 
}
function populateCheck(){
var statusHidden = document.SOMaster.varArray;
//alert(statusHidden.length);
for(var i=0; i <statusHidden.length; i++)
   {
  
    if(statusHidden[i].checked) 
      {
      document.SOMaster.varSelected.value="Y";
      break;
       }else{
        document.SOMaster.varSelected.value="N";
         }
      
   }
//alert(document.SOMaster.varSelected.value);
}
var checkflag = "false";
   function check(field) {
   if (checkflag == "false") {
   for (i = 0; i < field.length; i++) {
   field[i].checked = true;}
   checkflag = "true";
   }
   else {
   for (i = 0; i < field.length; i++) {
   field[i].checked = false; }
   checkflag = "false";
   }
}

function validateForm()
{
if(document.SOMaster.display.value == "del")
{
return true;
}if(document.SOMaster.print.value == "")
{
alert("please select print name!");
return false;
}
else 
  {
   if(document.SOMaster.display.value != "display")
   {
   var check = confirm("Do you want to Save?")
   if(check){
   populateCheck();
   document.SOMaster.display.value="save";
   document.SOMaster.submit();
      
   }else return false;
   }
 }
}
</script>

<body>
<%
Connection con = null;
Statement st =null,st2=null,stMain=null;
ResultSet rs=null,rs2=null,rsMain=null;
con = new DBConnLT().getConn(); 
String message="";
String[] varArray = null;  
try
{   
     
 st= con.createStatement();
 st2= con.createStatement();
 stMain= con.createStatement();
 String display=request.getParameter("display"); if(display==null)display="";

 
 if(display.equals("del"))
      {
       String deleteSql="DELETE FROM t_so_var_print_mapping  WHERE PRINT_ID="+mast.getPrint()+" AND SO_ID="+mast.getSo()+"";
         //System.out.println(deleteSql);
          int y= st.executeUpdate(deleteSql);
        
      // mast.displayData();
          
      }else if(display.equals("save"))
      {
       
       // map.saveData(request);
          int x=0;
          String []varId=request.getParameterValues("varArray");
          String varSelected=request.getParameter("varSelected");
           String deleteSql="DELETE FROM t_so_var_print_mapping  WHERE PRINT_ID="+mast.getPrint()+" AND SO_ID="+mast.getSo()+"";
         //System.out.println(deleteSql);
           int y= st.executeUpdate(deleteSql);
          if((varId.length>0)&&(varSelected.equalsIgnoreCase("Y"))){
            for(int i=0;i<varId.length;i++) {
              String sql = "INSERT INTO t_so_var_print_mapping (SO_ID,VAR_ID,PRINT_ID) VALUES("+mast.getSo()+","+varId[i]+","+mast.getPrint()+")"; 
            //System.out.println("insert"+sql);
              x= st.executeUpdate(sql);
               //System.out.println("insert sql");
           }
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
                    <h4 class="panel-title">Add Varieties in Prints of Sales Order </h4>
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
                            <input type="HIDDEN" name="display" value=""></input>
                            <input type="HIDDEN" name="varSelected" value="">
                                    <label for="selector1" class="col-sm-2 control-label">Select Customer</label>
                                    <div class="col-sm-4">
                                            <%=mast.getCustomerListOnChangeSODetails()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new SOMaster name!</p>-->
                                    </div>
                        </div> 
                        
                        <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-2 control-label">Select SO</label>
                                    <div class="col-sm-4">
                                            <%=mast.getSOWithDateListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new SOMaster name!</p>-->
                                    </div>
                        </div>
                         <div class="form-group">
                           
                                    <label for="selector1" class="col-sm-2 control-label">Select Print</label>
                                    <div class="col-sm-4">
                                            <%=mast.getSOPrintListOnChange()%>
                                    </div>
                                    <div class="col-sm-2">
                                            <!--<p class="help-block">Please type new SOMaster name!</p>-->
                                    </div>
                        </div>
                           <center><a href="javascript:PrintThisPage();">Print</a> &nbsp; &nbsp; &nbsp; &nbsp;
                          <div class="style3" id="print_content" align=left>
                          
                          
                          
                          
                          
                          
 <%                           
 String dtlSql="";

 if(!mast.getPrint().equalsIgnoreCase("0")){
  
   String sql="";
        try{
    
        sql = " SELECT VAR_ID FROM t_so_var_print_mapping WHERE PRINT_ID="+mast.getPrint()+" AND SO_ID="+mast.getSo()+"";
        //out.println(sql);
         rs = st.executeQuery(sql);
         int cnt=0;
         while(rs.next()){
        ++cnt;
       }
    
       varArray = new String[cnt];
       rs = st.executeQuery(sql);
       cnt=0;
       while(rs.next()){
       varArray[cnt] = rs.getString("VAR_ID");
       ++cnt;
       }     
  }catch (Exception e)
  {
    //e.printStackTrace();
  }
  
  
  }
  
  
 
  
 
if(!mast.getPrint().equalsIgnoreCase("0")){ 
String cName="",soDateT="",soNo="";
String mainSql="SELECT SO_NO, DATE_FORMAT(SO_DATE,'%d-%b-%Y') SO_DATE, C.NAME CUSTOMER_NAME FROM"+
" t_so_master S, t_customer_master C"+
" WHERE S.CUST_ID= C.ID";
rsMain = stMain.executeQuery(mainSql);  
if(rsMain.next()){
 cName= rsMain.getString("CUSTOMER_NAME");
 soDateT= rsMain.getString("SO_DATE");
 soNo=rsMain.getString("SO_NO");if(soNo==null)soNo="";
 }
%>
 <tr><td valign=top nowrap=nowrap><b> Name of Customer</b> <%=cName%> </td><br></tr>
  <tr><td valign=top nowrap=nowrap><b> SO No.</b> <%=soNo%> </td><br></tr>
 <tr><td valign=top nowrap=nowrap><b> SO Date</b> <%=soDateT%> <br>
 <tr><td>      
<div class="form-group">                        
    <div class="col-md-8 span_3">
		  <div class="panel-body no-padding" style="display: block;">
                  
  <table class="table table-striped"  border = "1" align="left" cellspacing = "1" cellpadding="1" style="border-collapse: collapse">
   <tr>
<td align="center" colspan=3><b>Select Variety</b></td>
</tr>
<tr><td  align="center" colspan=3>Select All <input type="CHECKBOX" name="all" onClick="check(this.form.varArray)"></td></tr>


 <%
  int counter = 0;
  String sql="SELECT ID, NAME FROM t_var_master  ORDER BY ID";
   String chk = "";
  rs = st.executeQuery(sql);
  while (rs.next())
  {
   String id = rs.getString("ID");
   //out.println(rs1.getString("NAME"));
   chk= "";
   try{
   for(int i=0; i<varArray.length; i++){
     if(id.equalsIgnoreCase(varArray[i])) {chk = "checked";  break;}
    }
  }catch(Exception e){}
  
    if(counter%3==0){%></tr><tr><%} %>
    
    <td nowrap="nowrap">
    <input type="CHECKBOX" name="varArray"  <%= chk %>   value="<%=rs.getString("ID")%>"> <%= rs.getString("NAME")%></td>
    
    <%
    counter++;
  }
 %>
                       </table>    
      </div>
      
                            <div class="but_list" align=center>
                           
                                 <p>        
                                 <button type="button" class="btn btn_5 btn-lg btn-warning warning_11" onclick="javascript:submitClick()" >Save</button> 
                                      
                                 </p>
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
                if(stMain!=null) stMain.close();
		if(rsMain!=null) rsMain.close();
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
                if(stMain!=null) stMain.close();
		if(rsMain!=null) rsMain.close();

		}
                catch(SQLException sqle)
                {
                  
                }

	}
%>
