<SELECT name="optMonth" onChange="javascript:showData()">
    <OPTION value="0">Select</OPTION>
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
<SELECT name="optYear" onChange="javascript:showData()">
    <%
    int[] yearList = new YearList().getYearList();
    int len= yearList.length;
     %>
        <OPTION value="0">Select</OPTION>
    <%
    for(int i=35;i>20;i--){%>
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
 <%
  String optMonth1="",optYear1="";
    try{
    optMonth1= mast.getOptMonth();
    }catch(Exception rt){
    optMonth1="";
    }
    
    try{
    optYear1= mast.getOptYear();
    }catch(Exception rt){
    optYear1="";
    }
    //out.println(optMonth1);
    // out.println(optYear1);
 
                        if(!optMonth1.equalsIgnoreCase(""))
                        {
                            %>
                            <script type = "text/javascript">
                          
                            document.SOMaster.optMonth.value ="<%=optMonth1%>";
                            </script>
                            <%
                        }
                         if(!optYear1.equalsIgnoreCase(""))
                        {
                            %>
                            <script type = "text/javascript">document.SOMaster.optYear.value = "<%=optYear1%>";
                            </script>
                            <%
                        }
                        %>