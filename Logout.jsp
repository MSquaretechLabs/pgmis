<html>
<%
if(session!=null) session.invalidate();
response.setHeader("Cache-control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expire",0);
%>
<head>
   <SCRIPT language=Javascript>
      document.location.href="/pgmis/indexmain.html";
   </SCRIPT>
</head>
</html>

