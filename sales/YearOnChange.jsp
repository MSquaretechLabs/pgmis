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
        
        document.all("optYear").value = year - 1;
    }else{
        
        document.all("optYear").value = year;
    }
</script>
 <%
  String optMonth1="",optYear1="";

    try{
    optYear1= mast.getOptYear();
    }catch(Exception rt){
    optYear1="";
    }
    //out.println(optMonth1);
    // out.println(optYear1);
 
                      
                         if(!optYear1.equalsIgnoreCase(""))
                        {
                            %>
                            <script type = "text/javascript">document.SOMaster.optYear.value = "<%=optYear1%>";
                            </script>
                            <%
                        }
                        %>