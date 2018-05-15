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

 String id=request.getParameter("id"); if(id==null)id="";
 String so=request.getParameter("so"); if(so==null)so="0";
 String customer=request.getParameter("customer"); if(customer==null)customer="0";

 backURL="/pgmis/packing/BoxItemDetail.jsp?customer="+customer+"&so="+so+"&display=display";
 
 
 
 
// out.println(display);
String sql="DELETE FROM  t_so_box_item where ID="+id+" AND SO_ID="+so+"";

int x=st.executeUpdate(sql);
message= "Item Deleted Successfully";
 

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