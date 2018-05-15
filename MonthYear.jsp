<%@ page import="java.text.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="com.pwc.util.*" %>

<script type="text/javascript" language="JavaScript1.2" src="/eass/misc/Validate.js" ></script>
<%@ page import="com.pwc.util.*" %>
<SELECT name="optMonth">
    <OPTION value="JAN">JAN</OPTION>
    <OPTION value="FEB">FEB</OPTION> 
    <OPTION value="MAR">MAR</OPTION>
    <OPTION value="APR">APR</OPTION>
    <OPTION value="MAY">MAY</OPTION>
    <OPTION value="JUN">JUN</OPTION>
    <OPTION value="JUL">JUL</OPTION>
    <OPTION value="AUG">AUG</OPTION>
    <OPTION value="SEP">SEP</OPTION>
    <OPTION value="OCT">OCT</OPTION>
    <OPTION value="NOV">NOV</OPTION>
    <OPTION value="DEC">DEC</OPTION>
</SELECT>
<SELECT name="optYear">
    <%
    int[] yearList = new YearList().getYearList();
    for(int i=0;i<yearList.length;i++){%>
           <option value="<%=yearList[i]%>"><%=yearList[i]%></option>
    <%}%>
</SELECT>

<script type="text/javascript" language="javascript">
    var today = new Date();
    var month = today.getMonth() + 1;
    var year = today.getYear();
    
    if (month == 1){
        document.all("optMonth").value = "DEC";
        document.all("optYear").value = year - 1;
    }else{
        document.all("optMonth").value = getMonthName(month - 1);
        document.all("optYear").value = year;
    }
</script>