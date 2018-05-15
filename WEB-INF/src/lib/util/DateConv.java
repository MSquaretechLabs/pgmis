package lib.util;

import java.text.*;
import java.util.*;

public class DateConv 
{
  public DateConv()
  {
  }
  
  public  static DateConv get()
  {
      if(instance == null)
        instance = new DateConv();
      return instance;
  }
  
 //Converts a string to a date format dd/MM/yyyy
  public  Date getDate(String dateStr)
  {
    try
    {
      SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
      Date dd = format.parse(dateStr);
      return dd;
    }
    catch (Exception e)
    {
     e.printStackTrace();
    }
     return dd; 
  }
  //Converts a string to a date dd-mm-yy
  public  Date getDate2(String dateStr)
  {
    try
    {
      SimpleDateFormat format = new SimpleDateFormat("dd-MM-yy");
      Date dd = format.parse(dateStr);
      return dd;
    }
    catch (Exception e)
    {
     e.printStackTrace();
    }
     return dd; 
  }
  //Converts a string to a date format dd/MM/yyyy
  public  Date getDate3(String dateStr)
  {
    try
    {
      SimpleDateFormat format = new SimpleDateFormat("dd/MM/yy");
      Date dd = format.parse(dateStr);
      return dd;
    }
    catch (Exception e)
    {
     e.printStackTrace();
    }
     return dd; 
  }
  //Converts a string to a date format dd-mon-yyyy
  public  Date getDate4(String dateStr)
  {
    try
    {
      SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy");
      Date dd = format.parse(dateStr);
      return dd;
    }
    catch (Exception e)
    {
     e.printStackTrace();
    }
     return dd; 
  }
  public  Date getDate5(String dtrString)
  {
    try
    {
      SimpleDateFormat format = new SimpleDateFormat("MMM yyyy");
      java.util.Date dd = format.parse(dtrString);

      //SimpleDateFormat format = new SimpleDateFormat("MMM-yyyy");
      //Date dd1 = format.parse(dd);
      return dd;
    }
    catch (Exception e)
    {
     e.printStackTrace();
    }
     return dd; 
  }
 
 //Converts date to string
  public String dateFormat(Date dt)
    {
        Format formatter= new SimpleDateFormat ("dd-MMM-yyyy");
        String ss = formatter.format(dt);
        return "'"+ss+"'";
    }


 //Converts date to string
  public String dateFormatNow(Date dt)
    {
        Format formatter= new SimpleDateFormat ("dd-MMM-yyyy HH:mm:ss");
        String ss = formatter.format(dt);
        return "'"+ss+"'";
    }

//Converts string date to string
  public String dateFormat(String dt)
    {
      try
      {
       SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy");
        Date dd = format.parse(dt);
  
        Format formatter= new SimpleDateFormat ("dd-MMM-yyyy");
        String ss = formatter.format(dd);
        return ss;
      }
    catch (Exception e)
      {
       e.printStackTrace();
      }
       return ss; 
      }
 //Converts string date to string
  public String dateFormat2(String dt)
    {
      try
      {
        SimpleDateFormat format = new SimpleDateFormat("dd/mm/yyyy");
        Date dd = format.parse(dt);
  
        Format formatter= new SimpleDateFormat ("dd-MMM-yyyy");
        String ss = formatter.format(dd);
        return ss;
      }
    catch (Exception e)
      {
       e.printStackTrace();
      }
       return ss; 
    }
  //Increase date
  public Date increaseDate(Date dd, int inc)
  {
   long longDate = dd.getTime();
   longDate = longDate + (1000 * 60 * 60 * 24 * inc);
   java.util.Date dds = new java.util.Date(longDate);
   return dds;
  }
  //Decrease date
  public Date decreaseDate(Date dd, int inc)
  {
   long longDate = dd.getTime();
   longDate = longDate - (1000 * 60 * 60 * 24 * inc);
   java.util.Date dds = new java.util.Date(longDate);
   return dds;
  }
  public String changeDate(Date dd, int chg)
  {
    DateFormat myDate = new SimpleDateFormat("dd-MMM-yyyy");
    Calendar cal = GregorianCalendar.getInstance();
    
    cal.setTime(dd);
    
    cal.add(Calendar.DAY_OF_MONTH, chg);
    
    String strDate = myDate.format(cal.getTime());
    
    return strDate;

  }
  public String changeDate(String dd, int chg)
  {
    
    Date ds = getDate4(dd);
    DateFormat myDate = new SimpleDateFormat("dd-MMM-yyyy");
    Calendar cal = GregorianCalendar.getInstance();
    
    cal.setTime(ds);
    
    cal.add(Calendar.DAY_OF_MONTH, chg);
    
    String strDate = myDate.format(cal.getTime());
    
    return strDate;

  }
  public String dayOfWeek(Date dd)
  {
     String[] days = {"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
     //Calendar xmas = new GregorianCalendar(2006, Calendar.AUGUST,31);
     Calendar cal = GregorianCalendar.getInstance();
     cal.setTime(dd);
     int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
     //int dayOfWeek = xmas.get(Calendar.DAY_OF_WEEK);
     //System.out.println(days[dayOfWeek-1]);
     return days[dayOfWeek-1];
  }
  public long dateDiff(Date dateFirst, Date dateSecond)
  {
    long fDate = dateFirst.getTime();
    long sDate = dateSecond.getTime();
    long noDiff = (sDate - fDate) / (1000 * 60 * 60 * 24);
    return (noDiff + 1);
  }
  public String returnString(String dtrString)
  {
  try
   {
   SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
   java.util.Date dd = format.parse(dtrString);

   Format formatter= new SimpleDateFormat ("dd-MMM-yyyy");
   String ss = formatter.format(dd);
   return "'"+ss+"'";
   }
   catch(ParseException pe) 
   {
    pe.printStackTrace();
   } 
   return "'"+ss+"'";
  }
   public String returnString2(String dtrString)
   {
   try
    {
    SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
    java.util.Date dd = format.parse(dtrString);

    Format formatter= new SimpleDateFormat ("dd-MMM-yyyy");
    String ss = formatter.format(dd);
    return "'"+ss+"'";
    }
    catch(ParseException pe) 
    {
     pe.printStackTrace();
    } 
    return "'"+ss+"'";
   }
  public String returnFormat(String dtrString, String inputFormat)
  {
  try
   {
     if(dtrString != null && !dtrString.equals(""))
     {
       SimpleDateFormat format = new SimpleDateFormat(inputFormat);
       java.util.Date dd = format.parse(dtrString);
    
       Format formatter= new SimpleDateFormat ("dd-MMM-yyyy");
       String ss = formatter.format(dd);
       return "'"+ss+"'";
     }else
     {
       return "''";
     }
   }
   catch(ParseException pe) 
   {
    pe.printStackTrace();
   } 
   return "'"+ss+"'";
  }
  public String returnFormatWA(String dtrString, String inputFormat)
  {
  try
   {
     if(dtrString != null && !dtrString.equals(""))
     {
       SimpleDateFormat format = new SimpleDateFormat(inputFormat);
       java.util.Date dd = format.parse(dtrString);
    
       Format formatter= new SimpleDateFormat ("dd-MMM-yyyy");
       String ss = formatter.format(dd);
       return ss;
     }else
     {
       return "''";
     }
   }
   catch(ParseException pe) 
   {
    pe.printStackTrace();
   } 
   return ss;
  }

  public String returnFormatDateTime(String dtrString, String inputFormat)
  {
  try
   {
     if(dtrString != null && !dtrString.equals(""))
     {
       SimpleDateFormat format = new SimpleDateFormat(inputFormat);
       java.util.Date dd = format.parse(dtrString);
    
       Format formatter= new SimpleDateFormat ("dd-MMM-yyyy HH:mm:ss");
       String ss = formatter.format(dd);
       return "'"+ss+"'";
     }else
     {
       return "''";
     }
   }
   catch(ParseException pe) 
   {
    pe.printStackTrace();
   } 
   return "'"+ss+"'";
  }

  public long dateDiffHrs(Date dateFirst, Date dateSecond)
  {
    long fDate = dateFirst.getTime();
    long sDate = dateSecond.getTime();
    long timeDiff = sDate - fDate;// difference in milliseconds
    
    long seconds = timeDiff/1000;
    long minutes = seconds/60;
    long hours = minutes/60;
    long days = hours/24;
    
    
    long noDiff = (sDate - fDate) / (1000 * 60 * 60);
    return (noDiff);
  }

  public static void main(String[] args)
  {
    DateConv dateConv = new DateConv();
    Date dd1 = new Date( "01-Sep-2006");
    Date dd2 = new Date( "20-Jun-2006 12:00");
    //Date rdate = dateConv.getDate4("31-09-2006");
    //String bdate = dateConv.returnFormatDateTime("19-10-2006 22:40:30","dd-MM-yyyy hh:mm");
    //String bdate = dateConv.returnFormat("19-10-2006","E");
    //long ddiff = dateConv.dateDiff(dateConv.getDate4(sDate),dateConv.getDate4(eDate));
    //String chgDate = dateConv.changeDate(dd,-35);
    //long ddh = dateConv.dateDiffHrs(dd1,dd2);
    //System.out.println(bdate);
     //dateConv.dayOfWeek(dd1);
     //String dd3 = dateConv.returnFormatDateTime("20-04-2000 12:03:34","dd-MM-yyyy HH:mm:ss");
     //System.out.println(dd3);
     String dd4 = "Jan 2006";
     Date bb = dateConv.getDate5(dd4);
  }

   Date dd;
   String ss;
   static String sDate = "01-Jan-2006";
   static String eDate = "21-Jan-2006";
   private static DateConv instance;
}