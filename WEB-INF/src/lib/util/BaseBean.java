package lib.util;

import com.vrksa.util.DebugUtil;
import com.vrksa.util.html.HTMLBuilder;
import java.io.File;
import java.sql.*;
import com.pwc.util.ConnectionManagers;
import com.pwc.util.*;
import com.pwc.util.YearList;
import java.util.Date;
import java.util.Calendar;

public class BaseBean
{
    public static BaseBean get()
    {
        if(instance == null)
          instance = new BaseBean();
        return instance;
    }

    public BaseBean()
    {
    }

    //Empty select list box
    public String emptyListBox(String elemName)
    {
        String tag = "<select name=\"" + elemName + "\">";
        tag = tag + "\r\t<option value=\"0\">" + "";
        tag = tag + "\r</select>";
       
        return tag;
    }
    
   
    public String emptyListBoxWithId(String elemName,int indexId)
    {
        String tag = "<select name=\"" + elemName + "\" id=\"" +indexId +"\"   >";
        tag = tag + "\r\t<option value=\"0\">" + "Select";
        tag = tag + "\r</select>";
        return tag;
    }
    public String emptyListBoxWithIdHidden(String elemName,int indexId)
    {
        String tag = "<select name=\"" + elemName + "\" id=\"" +indexId +"\"      >";
        tag = tag + "\r\t<option value=\"0\">" + "";
        tag = tag + "\r</select>";
       
        return tag;
    }
    public String getPeriodSelect(String elmName, String periodId) throws SQLException
    {
        String sql = "Select ID, NAME From Time_Period order by year desc, month desc";
        int pId = 0;
        try
        {
            pId = Integer.parseInt(periodId);
        }
        catch(Exception exception) { }
        return getSelectHtml(elmName, sql, pId);
    }

    public String getPeriodSelect(String elmName, int pId) throws SQLException
    {
        String sql = "Select ID, NAME From Time_Period order by year desc, month desc";
        return getSelectHtml(elmName, sql, pId);
    }

    //List box population without onChange()
    
     public String returnName(String inputId,String tableName) throws SQLException
     {
      try
       {
           Connection c;
           Statement s;
           ResultSet rs; 
           c = new ConnectionManagers().startConnection();
         s = c.createStatement();
         String sql = "SELECT NAME FROM "+tableName+" WHERE ID = "+inputId;
         //System.out.println(sql);
         String name="";
         rs = s.executeQuery(sql);
         if(rs.next())
         name =  rs.getString("NAME");if(name==null)name="";
           if(rs != null)
               rs.close();
           if(s != null)
               s.close();
           if(c != null)
               c.close();
         return name;
       }
       catch(SQLException e)
       {
          e.printStackTrace();
       }
         return "";
       
     }
    
    
    public String getSelectHtml(String elemName, String sql, int selectedId) throws SQLException
    {
        Connection c;
        Statement s;
        ResultSet rs;
        String html;
        //c = null;
        s = null;
        rs = null;
        html = "";
        c = new ConnectionManagers().startConnection();
        s = c.createStatement();
        rs = s.executeQuery(sql);
        html = HTMLBuilder.get().getSelectTag(elemName, rs, "Select", selectedId);
        try
        {
            if(rs != null)
                rs.close();
            if(s != null)
                s.close();
            if(c != null)
                c.close();
        }
        catch(Exception ex)
        {
            DebugUtil.logErr("Error closing db connection", ex);
            html = ">>Error<<";
        }
        return html;
    }
 
     //List box population without onChange() and selectedId is String value
    public String getSelectHtml(String elemName, String sql, String selectedId) throws SQLException
    {
        Connection c;
        Statement s;
        ResultSet rs;
        String html;
        //c = null;
        s = null;
        rs = null;
        html = "";
        c = new ConnectionManagers().startConnection();
        s = c.createStatement();
        rs = s.executeQuery(sql);
        html = HTMLBuilder.get().getSelectTag(elemName, rs, "Select", selectedId);
        try
        {
            if(rs != null)
                rs.close();
            if(s != null)
                s.close();
            if(c != null)
                c.close();
        }
        catch(Exception ex)
        {
            DebugUtil.logErr("Error closing db connection", ex);
            html = ">>Error<<";
        }
        return html;
    }
    
        
//listbox with id
   public String getSelectHtmlWithId(String elemName, String sql, int selectedId,int indexId) throws SQLException
   {
       Connection c;
       Statement s;
       ResultSet rs;
       String html;
       //c = null;
       s = null;
       rs = null;
       html = "";
       c = new ConnectionManagers().startConnection();
       s = c.createStatement();
       rs = s.executeQuery(sql);
       html = HTMLBuilder.get().getSelectTagWithId(elemName, rs, "Select", selectedId,indexId);
       try
       {
           if(rs != null)
               rs.close();
           if(s != null)
               s.close();
           if(c != null)
               c.close();
       }
       catch(Exception ex)
       {
           DebugUtil.logErr("Error closing db connection", ex);
           html = ">>Error<<";
       }
       return html;
   }

    public String getSelectHtmlWithIdOnChange(String elemName, String sql, int selectedId,int indexId,String onChange) throws SQLException
    {
        Connection c;
        Statement s;
        ResultSet rs;
        String html;
        //c = null;
        s = null;
        rs = null;
        html = "";
        c = new ConnectionManagers().startConnection();
        s = c.createStatement();
        rs = s.executeQuery(sql);
        html = HTMLBuilder.get().getSelectTagWithIdOnChange(elemName, rs, "Select", selectedId,indexId,onChange);
        try
        {
            if(rs != null)
                rs.close();
            if(s != null)
                s.close();
            if(c != null)
                c.close();
        }
        catch(Exception ex)
        {
            DebugUtil.logErr("Error closing db connection", ex);
            html = ">>Error<<";
        }
        return html;
    }

    //List box population with onChange()
    public String getSelectHtmlOnChange(String elemName, String sql, String onChange, int selectedId) throws SQLException
    {
        Connection c;
        Statement s;
        ResultSet rs;
        String html;
        //c = null;
        s = null;
        rs = null;
        html = "";
        c = new ConnectionManagers().startConnection();
        s = c.createStatement();
        rs = s.executeQuery(sql);
        //System.out.println(sql);
        html = HTMLBuilder.get().getSelectTagOnChange(elemName, rs, onChange, "Select", selectedId);
        try
        {
            if(rs != null)
                rs.close();
            if(s != null)
                s.close();
            if(c != null)
                c.close();
        }
        catch(Exception ex)
        {
            DebugUtil.logErr("Error closing db connection", ex);
            html = ">>Error<<";
        }
        return html;
    }

    //List box population with onChange() with string selectedId
    public String getSelectHtmlOnChange(String elemName, String sql, String onChange, String selectedId) throws SQLException
    {
        Connection c;
        Statement s;
        ResultSet rs;
        String html;
        //c = null;
        s = null;
        rs = null;
        html = "";
        c = new ConnectionManagers().startConnection();
        s = c.createStatement();
        rs = s.executeQuery(sql);
        html = HTMLBuilder.get().getSelectTagOnChange(elemName, rs, onChange, "Select", selectedId);
        try
        {
            if(rs != null)
                rs.close();
            if(s != null)
                s.close();
            if(c != null)
                c.close();
        }
        catch(Exception ex)
        {
            DebugUtil.logErr("Error closing db connection", ex);
            html = ">>Error<<";
        }
        return html;
    }


    public String getCheckBox(String name, boolean isOn)
    {
        return HTMLBuilder.get().getCheckBox(name, isOn);
    }

    public String getCheckBoxOnChange(String name, boolean isOn, String onChange)
    {
        return HTMLBuilder.get().getCheckBoxOnChange(name, isOn, onChange);
    }

    /**
    This class has been modified on 15th May 2007 to pre-select the (current -1) month
    **/
    public String getMonthHtml(String elemName, int selectedId)
    {
        String [] months = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
        String html;
        html = "";
        if(selectedId == 0)  selectedId = Calendar.getInstance().get(Calendar.MONTH) ;// displaying in Haryana previous month
        html = HTMLBuilder.get().getMonthTag(elemName, months, "Sel", selectedId);
        return html;
    }
    public String getMonthHtmlCurrent(String elemName, int selectedId)
    {
        String [] months = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
        String html;
        html = "";
        if(selectedId == 0)  selectedId = Calendar.getInstance().get(Calendar.MONTH)+1 ;// displaying in Haryana previous month
        html = HTMLBuilder.get().getMonthTag(elemName, months, "Sel", selectedId);
        return html;
    }
   public String getMonthHtmlOnChange(String elemName, String onChangeVal,int selectedId)
   {
       String [] months = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
       String html;
       html = "";
       if(selectedId == 0)  selectedId = Calendar.getInstance().get(Calendar.MONTH) ;// display previous month for MIS Rpeorts
       html = HTMLBuilder.get().getMonthTagOnChange(elemName, months, onChangeVal,"Sel", selectedId);
       return html;
   }
    public String getMonthHtmlNoSelection(String elemName, int selectedId)
    {
        String [] months = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
        String html;
        html = "";
         html = HTMLBuilder.get().getMonthTag(elemName, months, "Sel", selectedId);
        return html;
    }
    public String getYearHtmlNoSelection(String elemName, int selectedId)
    {
        int[] years = new YearList().getYearList();
        String html;
        html = "";
        html = HTMLBuilder.get().getYearTag(elemName, years, "Sel", selectedId);
        return html;
    } 
    public String getPercentHtml(String elemName, int selectedId)
    {
       String [] months = {"10","20","30","40","50","60","70","80","90","100"};
       String html;
       html = "";
       html = HTMLBuilder.get().getSameValueTag(elemName, months, "Sel", selectedId);
       return html;
    }
    public String getMonthHtmlMMM(String elemName, String selectedId)
    {
        String [] months = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
        String html;
        html = "";
        html = HTMLBuilder.get().getMonthTagMMM(elemName, months, "Select", selectedId);
        return html;
    }
   public String getFY(String elemName, String selectedId)
   {
       String [] fy = {"FY-1","FY-2","FY-3","FY-4","FY-5"};
       String html;
       html = "";
       html = HTMLBuilder.get().getFYTag(elemName, fy, "Select", Integer.parseInt(selectedId));
       return html;
   }    
   public String getDayHtml(String elemName, int selectedId)
    {
        String [] days = new String[31];
        	for (int i=0; i<31; i++)
	      {
		      days[i]= ""+(i+1);
	      }
        String html;
        html = "";
        html = HTMLBuilder.get().getDayTag(elemName, days, "", selectedId);
        return html;
    }
   public String getNumberOfMonthsHtml(String elemName, int selectedId)
   {
       String [] days = new String[24];
        for (int i=0; i<24; i++)
        {
           days[i]= ""+(i+1);
        }
       String html;
       html = "";
       html = HTMLBuilder.get().getLastMonthsTag(elemName, days, "", selectedId);
       return html;
   }
    public String getYearHtml(String elemName, int selectedId)
    {
        int[] years = new YearList().getYearList();
        String html;
        html = "";
        if(selectedId == 0) selectedId = YearList.get().getCurrentYear();
        html = HTMLBuilder.get().getYearTag(elemName, years, "Sel", selectedId);
        return html;
    }
   public String getYearHtmlOnChange(String elemName, String onChangeVal,int selectedId)
   {
       int[] years = new YearList().getYearList();
       String html;
       html = "";
       if(selectedId == 0) selectedId = YearList.get().getCurrentYear();
       html = HTMLBuilder.get().getYearTagOnChange(elemName, years, onChangeVal,"Sel", selectedId);
       return html;
   }

    public String getPeriodName(String periodId) throws SQLException
    {
        Connection c;
        Statement s;
        ResultSet rs;
        String sql;
        String name;
        c = null;
        s = null;
        rs = null;
        sql = "Select NAME From Time_Period where ID=".concat(String.valueOf(String.valueOf(periodId)));
        name = "";
        //c = ConnectionManager.getConnection();
        s = c.createStatement();
        rs = s.executeQuery(sql);
        if(rs.next())
            name = rs.getString("NAME");
        else
            name = String.valueOf(String.valueOf((new StringBuffer("Period Id ")).append(periodId).append(" not found")));
        try
        {
            if(rs != null)
                rs.close();
            if(s != null)
                s.close();
            //ConnectionManager.releaseConnection(c);
        }
        catch(Exception ex)
        {
            DebugUtil.logErr("Error closing db connection", ex);
        }
        return name;
    }

    public String interrogateResources()
    {
        StringBuffer b = new StringBuffer(2048);
        File relfl = new File("temp.txt");
        File absfl = new File("/temp.txt");
        b.append("Using new File\n");
        b.append(String.valueOf(String.valueOf((new StringBuffer("\trel path is=")).append(relfl.getAbsolutePath()).append("\n"))));
        b.append(String.valueOf(String.valueOf((new StringBuffer("\tabs path is=")).append(absfl.getAbsolutePath()).append("\n"))));
        return b.toString();
    }
    private static BaseBean instance;
}
