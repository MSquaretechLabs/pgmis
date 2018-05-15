package com.vrksa.util.html;

import com.vrksa.util.MathUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

// Referenced classes of package com.vrksa.util.html:
//            HTMLComponent, HTMLListItem

public class HTMLBuilder
{

    public static HTMLBuilder get()
    {
        if(instance == null)
            instance = new HTMLBuilder();
        return instance;
    }

    protected HTMLBuilder()
    {
    }

    public String getAnchor(String href, String title)
    {
        StringBuffer buff = new StringBuffer("<a ");
        buff.append("href=\"");
        buff.append(href);
        buff.append("\" >");
        buff.append(title);
        buff.append("</A>");
        return buff.toString();
    }

    public String inputHidden(String name, Object value)
    {
        return "<input type=\"hidden\" name=\"" + name + "\" value=\"" + value + "\">";
    }

    public String inputText(String name, Object value, int maxSize)
    {
        return "<input type=\"text\" name=\"" + name + "\" value=\"" + value + "\" size=\"" + maxSize + "\">";
    }

    //List box population without onChange() function
    public String getSelectTag(String elementName, ResultSet rs, String allElementName, int selectedValue)
        throws SQLException
    {
        String selValue = "" + selectedValue;
       String tag = "<select name=\"" + elementName + " class=form-control1 \">";
        tag = tag + "\r\t<option value=\"0\">" + allElementName;
        while(rs.next()) 
        {
            String id = rs.getString(1);
            String name = rs.getString(2);
            if(id.equals(selValue))
                tag = tag + "\r\t<option value=\"" + id + "\" selected>" + name;
            else
                tag = tag + "\r\t<option value=\"" + id + "\">" + name;
        }
        tag = tag + "\r</select>";
        return tag;
    }
    //List box population without onChange() function with selectedValue as String
    public String getSelectTag(String elementName, ResultSet rs, String allElementName, String selectedValue)
        throws SQLException
    {
        String selValue =selectedValue;
        String tag = "<select name=\"" + elementName  + "\"  class=form-control1>";
        tag = tag + "\r\t<option value=\"0\">" + allElementName;
        while(rs.next()) 
        {
            String id = rs.getString(1);
            String name = rs.getString(2);
            if(id.equals(selValue))
                tag = tag + "\r\t<option value=\"" + id + "\" selected>" + name;
            else
                tag = tag + "\r\t<option value=\"" + id + "\">" + name;
        }
        tag = tag + "\r</select>";
        return tag;
    }
    
   public String getSelectTagWithId(String elementName, ResultSet rs, String allElementName, int selectedValue,int indexId)
       throws SQLException
   {
       String selValue =""+selectedValue;
       String tag = "<select name=\"" + elementName + "\" id=\""+indexId+ "\">";
       tag = tag + "\r\t<option value=\"0\">" + allElementName;
       while(rs.next()) 
       {
           String id = rs.getString(1);
           String name = rs.getString(2);
           if(id.equals(selValue))
               tag = tag + "\r\t<option value=\"" + id + "\" selected>" + name;
           else
               tag = tag + "\r\t<option value=\"" + id + "\">" + name;
       }
       tag = tag + "\r</select>";
       return tag;
   }
//list box with ID and onchange
 public String getSelectTagWithIdOnChange(String elementName, ResultSet rs, String allElementName, int selectedValue,int indexId,String onChangeVal)
     throws SQLException
 {
     String selValue =""+selectedValue;
     String tag = "<select name=\"" + elementName + "\" onChange=\""+onChangeVal +"\"  id=\""+indexId+ "\">";
     tag = tag + "\r\t<option value=\"0\">" + allElementName;
     while(rs.next()) 
     {
         String id = rs.getString(1);
         String name = rs.getString(2);
         if(id.equals(selValue))
             tag = tag + "\r\t<option value=\"" + id + "\" selected>" + name;
         else
             tag = tag + "\r\t<option value=\"" + id + "\">" + name;
     }
     tag = tag + "\r</select>";
     return tag;
 }




    //List box population with onChange() function
    public String getSelectTagOnChange(String elementName, ResultSet rs, String onChangeVal,String allElementName, int selectedValue)
        throws SQLException
    {
        String selValue = "" + selectedValue;
        String tag = "<select name=\"" + elementName + "\" onChange=\"" + onChangeVal + "\">";
        //String tag = "<select name=\"" + elementName + "\">";
        tag = tag + "\r\t<option value=\"0\">" + allElementName;
        while(rs.next()) 
        {
            String id = rs.getString(1);
            String name = rs.getString(2);
            if(id.equals(selValue))
                tag = tag + "\r\t<option value=\"" + id + "\" selected>" + name;
            else
                tag = tag + "\r\t<option value=\"" + id + "\">" + name;
        }
        tag = tag + "\r</select>";
        return tag;
    }

    //List box population with onChange() function with String selectedValue
    public String getSelectTagOnChange(String elementName, ResultSet rs, String onChangeVal,String allElementName, String selectedValue)
        throws SQLException
    {
        String selValue = selectedValue;
        String tag = "<select name=\"" + elementName + "\" class=form-control1 onChange=\"" + onChangeVal + "\">";
        //String tag = "<select name=\"" + elementName + "\">";
        tag = tag + "\r\t<option value=\"0\">" + allElementName;
        while(rs.next()) 
        {
            String id = rs.getString(1);
            String name = rs.getString(2);
            if(id.equals(selValue))
                tag = tag + "\r\t<option value=\"" + id + "\" selected>" + name;
            else
                tag = tag + "\r\t<option value=\"" + id + "\">" + name;
        }
        tag = tag + "\r</select>";
        return tag;
    }


    public String getMonthTag(String elementName, String[] rs, String allElementName, int selectedValue)
        
    {
        String selValue = "" + selectedValue;
        String tag = "<select name=\"" + elementName + "\">";
        tag = tag + "\r\t<option value=\"0\">" + allElementName;
        for(int i=1; i<rs.length +1; i++) 
        {
            String id = ""+i;
            String name = rs[i - 1];
            if(id.equals(selValue))
                tag = tag + "\r\t<option value=\"" + id + "\" selected>" + name;
            else
                tag = tag + "\r\t<option value=\"" + id + "\">" + name;
        }
        tag = tag + "\r</select>";
        return tag;
    }
   public String getMonthTagOnChange(String elementName, String[] rs, String onChangeVal,String allElementName, int selectedValue)
       
   {
       String selValue = "" + selectedValue;
       String tag = "<select name=\"" + elementName + "\" onChange=\"" + onChangeVal + "\">";
       tag = tag + "\r\t<option value=\"0\">" + allElementName;
       for(int i=1; i<rs.length +1; i++) 
       {
           String id = ""+i;
           String name = rs[i - 1];
           if(id.equals(selValue))
               tag = tag + "\r\t<option value=\"" + id + "\" selected>" + name;
           else
               tag = tag + "\r\t<option value=\"" + id + "\">" + name;
       }
       tag = tag + "\r</select>";
       return tag;
   }

   public String getSameValueTag(String elementName, String[] rs, String allElementName, int selectedValue)
       
   {
       String selValue = "" + selectedValue;
       String tag = "<select name=\"" + elementName + "\">";
       tag = tag + "\r\t<option value=\"0\">" + allElementName;
       for(int i=1; i<rs.length +1; i++) 
       {
           String name = rs[i - 1];
           if(name.equals(selValue))
               tag = tag + "\r\t<option value=\"" + name + "\" selected>" + name;
           else
               tag = tag + "\r\t<option value=\"" + name + "\">" + name;
       }
       tag = tag + "\r</select>";
       return tag;
   }
    public String getMonthTagMMM(String elementName, String[] rs, String allElementName, String selectedValue)
        
    {
        String selValue = selectedValue;
        String tag = "<select name=\"" + elementName + "\">";
        //tag = tag + "\r\t<option value=\"All\">" + allElementName;
        for(int i=1; i<rs.length +1; i++) 
        {
            String id = ""+rs[i - 1];
            String name = rs[i - 1];
            if(id.equals(selValue))
                tag = tag + "\r\t<option value=\"" + id + "\" selected>" + name;
            else
                tag = tag + "\r\t<option value=\"" + id + "\">" + name;
        }
        tag = tag + "\r</select>";
        return tag;
    }
    public String getDayTag(String elementName, String[] rs, String allElementName, int selectedValue)
        
    {
        String selValue = "" + selectedValue;
        String tag = "<select name=\"" + elementName + "\">";
        //tag = tag + "\r\t<option value=\"All\">" + allElementName;
        int tell = rs.length;
        for(int i=0; i<rs.length; i++) 
        {
            String id = ""+(i+1);
            String name = rs[i];
            if(id.equals(selValue))
                tag = tag + "\r\t<option value=\"" + id + "\" selected>" + name;
            else
                tag = tag + "\r\t<option value=\"" + id + "\">" + name;
        }
        tag = tag + "\r</select>";
        return tag;
    }
   public String getLastMonthsTag(String elementName, String[] rs, String allElementName, int selectedValue)
       
   {
       String selValue = "" + selectedValue;
       String tag = "<select name=\"" + elementName + "\">";
       //tag = tag + "\r\t<option value=\"All\">" + allElementName;
        tag = tag + "\r\t<option value=\"" + "0" + "\" selected>0";
       int tell = rs.length;
       for(int i=0; i<rs.length; i++) 
       {
           String id = ""+(i+1);
           String name = rs[i];
           if(id.equals(selValue))
               tag = tag + "\r\t<option value=\"" + id + "\" selected>" + name;
           else
               tag = tag + "\r\t<option value=\"" + id + "\">" + name;
       }
       tag = tag + "\r</select>";
       return tag;
   }
   public String getFYTag(String elementName, String[] rs, String allElementName, int selectedValue)
       
   {
       String selValue = "" + selectedValue;
       String tag = "<select name=\"" + elementName + "\">";
       //tag = tag + "\r\t<option value=\"All\">" + allElementName;
        tag = tag + "\r\t<option value=\"" + "0" + "\" selected>Select";
       int tell = rs.length;
       for(int i=0; i<rs.length; i++) 
       {
           String id = ""+(i+1);
           String name = rs[i];
           if(id.equals(selValue))
               tag = tag + "\r\t<option value=\"" + id + "\" selected>" + name;
           else
               tag = tag + "\r\t<option value=\"" + id + "\">" + name;
       }
       tag = tag + "\r</select>";
       return tag;
   }    
   public String getYearTag(String elementName, int[] rs, String allElementName, int selectedValue)
        
    {
        String selValue = "" + selectedValue;
        String tag = "<select name=\"" + elementName + "\">";
        tag = tag + "\r\t<option value=\"0\">" + allElementName;
        for(int i=1; i<=rs.length - 1; i++) 
        {
            String id = ""+rs[i];
            String name = ""+rs[i];
            if(id.equals(selValue))
                tag = tag + "\r\t<option value=\"" + id + "\" selected>" + name;
            else
                tag = tag + "\r\t<option value=\"" + id + "\">" + name;
        }
        tag = tag + "\r</select>";
        return tag;
    }
   public String getYearTagOnChange(String elementName, int[] rs, String onChangeVal,String allElementName, int selectedValue)
        
    {
        String selValue = "" + selectedValue;
       String tag = "<select name=\"" + elementName + "\" onChange=\"" + onChangeVal + "\">";
        tag = tag + "\r\t<option value=\"0\">" + allElementName;
        for(int i=1; i<=rs.length - 1; i++) 
        {
            String id = ""+rs[i];
            String name = ""+rs[i];
            if(id.equals(selValue))
                tag = tag + "\r\t<option value=\"" + id + "\" selected>" + name;
            else
                tag = tag + "\r\t<option value=\"" + id + "\">" + name;
        }
        tag = tag + "\r</select>";
        return tag;
    }

    public String getSelectTag(String elementName, Enumeration items, HTMLListItem listItem, String allElementName)
    {
        String tag = "<select name=\"" + elementName + "\">";
        Object item;
        for(tag = tag + "\r\t<option value=\"All\">" + allElementName; items.hasMoreElements(); tag = tag + "\r\t<option value=\"" + listItem.getItemId(item) + "\">" + listItem.getItemName(item))
            item = items.nextElement();

        tag = tag + "\r</select>";
        return tag;
    }

    public String getSelectTag(String elementName, Enumeration items, HTMLListItem listItem)
    {
        String tag;
        Object item;
        for(tag = "<select name=\"" + elementName + "\">"; items.hasMoreElements(); tag = tag + "\r\t<option value=\"" + listItem.getItemId(item) + "\">" + listItem.getItemName(item))
            item = items.nextElement();

        tag = tag + "\r</select>";
        return tag;
    }

    public String getSelectTag(String elementName, Enumeration items, HTMLListItem listItem, Object selected)
    {
        String tag = "<select name=\"" + elementName + "\">";
        while(items.hasMoreElements()) 
        {
            Object item = items.nextElement();
            if(item == selected)
                tag = tag + "\r\t<option value=\"" + listItem.getItemId(item) + "\" selected>" + listItem.getItemName(item);
            else
                tag = tag + "\r\t<option value=\"" + listItem.getItemId(item) + "\">" + listItem.getItemName(item);
        }
        tag = tag + "\r</select>";
        return tag;
    }

    public String getSelectTag(String elementName, String codes[], String values[], int selIndex)
    {
        String tag = "<select name=\"" + elementName + "\">";
        for(int i = 0; i < codes.length; i++)
        {
            String code = codes[i];
            String value = values[i];
            if(i == selIndex)
                tag = tag + "\r\t<option value=\"" + code + "\" selected>" + value;
            else
                tag = tag + "\r\t<option value=\"" + code + "\">" + value;
        }

        tag = tag + "\r</select>";
        return tag;
    }

    public String getCheckBox(String name, boolean isOn)
    {
        String check = "CHECKED";
        //return "<input type=\"checkbox\" name=\"" + name + "\" value=\"" + (isOn ? "on" : "off") + "\"" + " " + (isOn ? check :"") + ">";
        return "<input type=\"checkbox\" name=\"" + name + "\""  + " " + (isOn ? check :"") + ">";
    }

    public String getCheckBoxOnChange(String name, boolean isOn, String onChangeVal)
    {
        String check = "CHECKED";
        //return "<input type=\"checkbox\" name=\"" + name + "\" value=\"" + (isOn ? "on" : "off") + "\"" + " " + (isOn ? check :"") + ">";
        return "<input type=\"checkbox\" name=\"" + name + "\""  + " " + (isOn ? check :"") + " onClick=\"" + onChangeVal + "\">";
    }

    public HTMLComponent getCheckBoxTable(String formName, String groupPrefixAbbrev, Enumeration items, HTMLListItem listItem, int numberOfcols)
    {
        String abr = groupPrefixAbbrev;
        String tag = "<table name=\"" + abr + "_Controls\" border=0>";
        tag = tag + ("<tr>\r\t<td>\r\t\t<input type=\"button\" name=\"" + abr + "btnSel\" value=\"Select All\"" + " onClick=\"" + abr + "SelectAll()\">" + "\r\t</td><td width=10></td>");
        tag = tag + ("\r\t<td>\r\t\t<input type=\"button\" name=\"" + abr + "btnClr\" value=\"Clear All\"" + " onClick=\"" + abr + "ClearAll()\">" + "</td>\r\t</tr>");
        tag = tag + "\r</table>";
        String selectAllScript = "function " + abr + "SelectAll() { \r";
        String clearAllScript = "function " + abr + "ClearAll() { \r";
        int rowNum = 0;
        tag = tag + "\r<table>";
        while(items.hasMoreElements()) 
        {
            if(MathUtil.isMultipleOf(rowNum, numberOfcols))
                tag = tag + "\r<tr>";
            Object item = items.nextElement();
            String elementValue = listItem.getItemId(item);
            String elementId = abr + rowNum;
            String elementLabel = listItem.getItemName(item);
            tag = tag + "\r\t\t<td valign=\"top\">";
            tag = tag + ("\r\t\t\t<input type=\"Checkbox\" name=\"" + elementId + "\" value=\"" + elementValue + "\">" + "<font face=\"Verdana, Arial, Helvetica\" size=\"2\">" + elementLabel + "</font>");
            tag = tag + "\r\t\t</td>";
            selectAllScript = selectAllScript + ("\r\tdocument." + formName + "." + elementId + ".checked=true;");
            clearAllScript = clearAllScript + ("\r\tdocument." + formName + "." + elementId + ".checked=false;");
            if(MathUtil.isMultipleOf(++rowNum, numberOfcols) && rowNum > 1)
                tag = tag + "\r</tr>";
            else
                tag = tag + "\r\t\t<td width=10></td>";
        }
        tag = tag + "\r</table>";
        selectAllScript = selectAllScript + "\r}";
        clearAllScript = clearAllScript + "\r}";
        HTMLComponent comp = new HTMLComponent("JavaScript");
        comp.addElementBlock("checkBox", tag);
        comp.addElementScript("SelectAll", selectAllScript, "select.onClick");
        comp.addElementScript("ClearAll", clearAllScript, "clear.onClick");
        return comp;
    }

    private static HTMLBuilder instance;
}
