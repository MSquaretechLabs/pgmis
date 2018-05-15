<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%
Connection con = null;
Statement st =null;
ResultSet rs=null;
con = new DBConnLT().getConn(); 
String message="",backURL="",colName="";;
try
{   
     
 st= con.createStatement();

 String dpId=request.getParameter("dpId"); if(dpId==null)dpId="";
 String report=request.getParameter("report"); if(report==null)report="";
 String type=request.getParameter("type"); if(type==null)type=""; //ready or all inspected
 
 
 
 

  if(type.equalsIgnoreCase("ready"))
 {
 colName="ALL_READY";
 
     if(report.equalsIgnoreCase("dyer"))
     {
     backURL="/pgmis/purchase/UpdateStatusDyer.jsp";
     }else if (report.equalsIgnoreCase("printer"))
     {
     backURL="/pgmis/purchase/UpdateStatusPrinter.jsp";
     }
 
 }else if (type.equalsIgnoreCase("inspected"))
 {
 colName="ALL_INSPECTED";
  if(report.equalsIgnoreCase("dyer"))
     {
     backURL="/pgmis/purchase/SendToInsp.jsp";
     }else if (report.equalsIgnoreCase("printer"))
     {
     backURL="/pgmis/purchase/SendToInspPrinter.jsp";
     }
 
 
 }
 
// out.println(display);
String sql="UPDATE t_po_dp_details SET "+colName+" ='Y' where ID="+dpId+"";

int x=st.executeUpdate(sql);
message= "Transction Closed Successfully";
 

                if(con != null) con.close();
		if(st!=null) st.close();
		if(rs!=null) rs.close();
                
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
     window.location.href='<%=backURL%>';
    }
   </script>