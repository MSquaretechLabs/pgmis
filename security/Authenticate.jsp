<%@ page import="java.sql.*" %>
<%@ page import="com.pwc.util.*" %>
<jsp:useBean id="auth" scope="session" class="lib.util.Authenticate"></jsp:useBean>
<%

 try{
		

		String moduleID=(String)session.getValue("moduleID");
		String userName=(String)session.getValue("userName");
		
               // out.println("pageName="+pageName);    
		if(moduleID!=null || userName!=null)
		{
			

		}else response.sendRedirect("/pgmis/security/AuthenticationFailure.jsp");

	}
	catch( Exception er )
	{
 		out.println("Exception: "+er.getMessage());
 	}
	
%>