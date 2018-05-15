<%@ page import="java.sql.*"%>
<%@ page import="com.pwc.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
   session.removeValue("auth");
%>

<jsp:useBean id="auth" scope="session" class="lib.util.Authenticate">
</jsp:useBean>
 <%
        
        String userLevel="",userName="",fullName="";
        String filterStr = "[^A-Za-z0-9.:-]";
        String userRight="", whetherAdmin="",whetherVerifyAuth="N",locationName="",viewAllAuth="N",acApprove="N";
        
        String userID=request.getParameter("userID");
        String password=request.getParameter("password");
        String moduleID = request.getParameter("moduleID");if(moduleID==null)moduleID="0";
      
            Connection conn = null;  
            PreparedStatement pstmt = null;
            Statement st =null;
            ResultSet rs=null;
            ResultSet rsUser=null;
            conn = new DBConnLT().getConn();
          
try
{
	if(userID!=null && password!=null)
	{
            st = conn.createStatement();  
            try
            {                                    
             
              String qry1 = " SELECT U.ID USER_ID,U.LOGIN_ID,U.FULL_NAME,U.MODULE_ID,ADMIN "+
               " FROM t_user U where U.LOGIN_ID = ? "+
                         " AND U.PASSWORD = ? "+
                         " AND U.MODULE_ID = ? ";
	       
                String qry2= " SELECT U.ID USER_ID,U.LOGIN_ID,U.FULL_NAME,U.MODULE_ID,ADMIN "+
               " FROM t_user U where U.LOGIN_ID = '"+userID+"' "+
                         " AND U.PASSWORD = '"+password+"' "+
                         " AND U.MODULE_ID = "+moduleID+"";

	        //out.println(qry2); 
               
               pstmt = conn.prepareStatement(qry1);
                
                
                //Set parameters
                
                pstmt.setString(1,userID);
		pstmt.setString(2,password);
                pstmt.setString(3,moduleID);
                
                rsUser = pstmt.executeQuery();	
                	
                 
        	if(rsUser.next())
		{
                
                //out.println("reached herer");
               // out.println(qry2);
            
                 userName = rsUser.getString("LOGIN_ID");
                 fullName = rsUser.getString("FULL_NAME");
                 userID = rsUser.getString("USER_ID");
                 whetherAdmin= rsUser.getString("ADMIN");
                 //title = rsUser.getString("DESIG");
                
                 auth.setUserId(userID);
                 auth.setUsername(userName);
                 auth.setFname(fullName);
                 auth.setModuleID(moduleID);
                // auth.setWhetherAdmin(whetherAdmin);
                // auth.setTitle(title);
                 
                 
                 session.putValue("fullName",fullName);
                 session.putValue("userID",userID);
		 session.putValue("userName",userName);
                 session.putValue("whetherAdmin",whetherAdmin);
                // session.putValue("title",title);
                try{ 
                String qry = "INSERT INTO t_login_status (USER_ID,MODULE_ID,LOGIN_TIME) VALUES"+
                 " ('"+userID+"',"+moduleID+",NOW())";
			//out.println("qry= "+qry);
			st.executeUpdate(qry);
                        
                }catch(Exception rt){}        
                        
                  if(moduleID.equalsIgnoreCase("6"))
                  {
          
                              try{
                        
                                      if(conn != null) conn.close();
                                      if(pstmt!=null) pstmt.close();
                                       if(rsUser!=null) rsUser.close();
                                       if(st!=null) st.close();
                                       if(rs!=null) rs.close();
                        
                                }
                             catch(Exception rt)
                                 {
                                 
                                 }
                        
                              response.sendRedirect("/pgmis/admin/AdminIndex.jsp");
                  }
               
                    else  if(moduleID.equalsIgnoreCase("1"))
                  {
          
                              try{
                        
                                      if(conn != null) conn.close();
                                      if(pstmt!=null) pstmt.close();
                                       if(rsUser!=null) rsUser.close();
                                       if(st!=null) st.close();
                                       if(rs!=null) rs.close();
                        
                                }
                             catch(Exception rt)
                                 {
                                 
                                 }
                        
                              response.sendRedirect("/pgmis/purchase/PurchaseIndex.jsp");
                  }else  if(moduleID.equalsIgnoreCase("2"))
                  {
          
                              try{
                        
                                      if(conn != null) conn.close();
                                      if(pstmt!=null) pstmt.close();
                                       if(rsUser!=null) rsUser.close();
                                       if(st!=null) st.close();
                                       if(rs!=null) rs.close();
                        
                                }
                             catch(Exception rt)
                                 {
                                 
                                 }
                        
                              response.sendRedirect("/pgmis/stock/StockIndex.jsp");
                  }else  if(moduleID.equalsIgnoreCase("3"))
                  {
          
                              try{
                        
                                      if(conn != null) conn.close();
                                      if(pstmt!=null) pstmt.close();
                                       if(rsUser!=null) rsUser.close();
                                       if(st!=null) st.close();
                                       if(rs!=null) rs.close();
                        
                                }
                             catch(Exception rt)
                                 {
                                 
                                 }
                        
                              response.sendRedirect("/pgmis/sales/SalesIndex.jsp");
                  }else  if(moduleID.equalsIgnoreCase("4"))
                  {
          
                              try{
                        
                                      if(conn != null) conn.close();
                                      if(pstmt!=null) pstmt.close();
                                       if(rsUser!=null) rsUser.close();
                                       if(st!=null) st.close();
                                       if(rs!=null) rs.close();
                        
                                }
                             catch(Exception rt)
                                 {
                                 
                                 }
                        
                              response.sendRedirect("/pgmis/cutting/CuttingIndex.jsp");
                  }else  if(moduleID.equalsIgnoreCase("5"))
                  {
          
                              try{
                        
                                      if(conn != null) conn.close();
                                      if(pstmt!=null) pstmt.close();
                                       if(rsUser!=null) rsUser.close();
                                       if(st!=null) st.close();
                                       if(rs!=null) rs.close();
                        
                                }
                             catch(Exception rt)
                                 {
                                 
                                 }
                        
                              response.sendRedirect("/pgmis/packing/PackingIndex.jsp");
                  }else 
               
                    {
                    
                      
			try
                        {
                        
                        if(conn != null) conn.close();
                        if(pstmt!=null) pstmt.close();
                        if(rsUser!=null) rsUser.close();
                        if(st!=null) st.close();
                        if(rs!=null) rs.close();
                        
                        }
                        catch(Exception rt)
                        {
                           
                        }%>
                        <script>
                        alert("Wrong Username/ Password or You do not have privilege to access this system! Kindly Contact your System Administrator");
                        window.location.href="/pgmis/security/Login.jsp?moduleID=<%=moduleID%>";
                        </script>
                        <%
                      // response.sendRedirect("/pgmis/Login.jsp");
     
		  }
                 
                 }else
                    {
                    
                      //out.println("reach ehere");
			try
                        {
                        
                        if(conn != null) conn.close();
                        if(pstmt!=null) pstmt.close();
                        if(rsUser!=null) rsUser.close();
                        if(st!=null) st.close();
                        if(rs!=null) rs.close();
                        
                        }
                        catch(Exception rt)
                        {
                           
                        }%>
                        <script>
                        alert("1_Wrong Username/ Password or You do not have privilege to access this system! Kindly Contact your System Administrator");
                        window.location.href="/pgmis/security/Login.jsp?moduleID=<%=moduleID%>";
                        </script>
                        <%
                       
     
		  }
                 
                 
                 
                 
                 
              }
              
            catch(Exception rt)
                 {
                        out.println(rt.getMessage());                 
                       
                  }
                  
                  finally
                  {
                      //out.println("reached herer"); 
                        try     
                        {                                    
                          if(conn != null) conn.close();
                          if(pstmt!=null) pstmt.close();
                          if(rsUser!=null) rsUser.close();
                          if(st!=null) st.close();
                          if(rs!=null) rs.close();                                    
                        }
                        catch(Exception  e)
                        {
                        out.println(e.getMessage());
                        }
                        
                      // response.sendRedirect("/pgmis/Login.jsp");
                  }
                 
	}
      }
        
      // else response.sendRedirect("/jica/");

catch( Exception er )
{
   //out.println("inside error");
   //out.println("Exception: "+er.getMessage());
   //response.sendRedirect("/jica/security/Error.jsp?id="+moduleID);
}


%>