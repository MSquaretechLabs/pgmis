package lib.util;

import java.text.SimpleDateFormat;
import lib.util.BaseBean;
import java.sql.*;
import com.pwc.util.*;
import lib.util.DateConv;
import java.util.*;
import java.util.Calendar;


public class PeriodSelect 
{
  public PeriodSelect()
  {
  }
    public static PeriodSelect get()
    {
        if(instance == null)
          instance = new PeriodSelect();
        return instance;
    }
  

public int getPeriodId(String monthId, String yearId)
  throws SQLException
  {
    Connection con=null;
    try
    {
      int periodId = 0;
      int vMonthId = Integer.parseInt(monthId);
      int vYearId = Integer.parseInt(yearId);
      
      con = new ConnectionManagers().startConnection();
      s = con.createStatement();
      sql = "SELECT ID FROM TIME_PERIOD WHERE MONTH ="+vMonthId+" AND YEAR ="+vYearId;
      rs = s.executeQuery(sql);
      //System.out.println(sql);
      if(rs.next()) periodId = rs.getInt("ID");
      //System.out.println("period id:"+periodId);
      rs.close();
      s.close();
      con.close();
      return periodId;
      
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }
    finally
	 {
		try
		{
		 if(rs != null) rs.close();
       if(s != null) s.close();
       if(con != null) con.close();
		}catch(SQLException sqle){}
	  }
   return 0;
  }
  
   public static int getPeriodIdDynamic(int monthId, int yearId)
      throws SQLException
      {
        Connection con=null;
        try
        {
          int periodId = 0;
          int vMonthId = monthId;
          int vYearId = yearId;
          
          con = new ConnectionManagers().startConnection();
          s = con.createStatement();
          sql = "SELECT ID FROM TIME_PERIOD WHERE MONTH ="+vMonthId+" AND YEAR ="+vYearId;
          rs = s.executeQuery(sql);
          
          if(rs.next()) periodId = rs.getInt("ID");
          //System.out.println("period id:"+periodId);
          rs.close();
          s.close();
          con.close();
          return periodId;
          
        }
        catch (SQLException e)
        {
          e.printStackTrace();
        }
        finally
             {
                    try
                    {
                     if(rs != null) rs.close();
           if(s != null) s.close();
           if(con != null) con.close();
                    }catch(SQLException sqle){}
              }
       return 0;
      }
    public int getPeriodId(String monYear)
      throws SQLException
      {
        Connection con=null;
        try
        {
          int periodId = 0;
              
          con = new ConnectionManagers().startConnection();
          s = con.createStatement();
          sql = "SELECT ID FROM TIME_PERIOD WHERE MON_YEAR ='"+monYear+"' ";
          rs = s.executeQuery(sql);
         // System.out.println(sql);
          if(rs.next()) periodId = rs.getInt("ID");
          //System.out.println("period id:"+periodId);
          rs.close();
          s.close();
          con.close();
          return periodId;
          
        }
        catch (SQLException e)
        {
          e.printStackTrace();
        }
        finally
             {
                    try
                    {
                     if(rs != null) rs.close();
           if(s != null) s.close();
           if(con != null) con.close();
                    }catch(SQLException sqle){}
              }
       return 0;
      }
   public int getPeriodIdDate(String endDate)
     throws SQLException
     {
       Connection con=null;
       try
       {
         int periodId = 0;
             
         con = new ConnectionManagers().startConnection();
         s = con.createStatement();
         sql = "SELECT ID FROM TIME_PERIOD WHERE FROM_DATE<='"+endDate+"' AND TO_DATE>='"+endDate+"'";
          //System.out.println(sql);
         rs = s.executeQuery(sql);
        // 
         if(rs.next()) periodId = rs.getInt("ID");
         //System.out.println("period id:"+periodId);
         rs.close();
         s.close();
         con.close();
         return periodId;
         
       }
       catch (SQLException e)
       {
         e.printStackTrace();
       }
       finally
            {
                   try
                   {
                    if(rs != null) rs.close();
          if(s != null) s.close();
          if(con != null) con.close();
                   }catch(SQLException sqle){}
             }
      return 0;
     }
   public String getFyArray(String periodId)
   throws SQLException
   {
     Connection conn=null;
     String returnArray="";
     ResultSet rs1=null;
     String temp="(";
     try
     {
       String monthId="",yearId="";
       
       conn = new ConnectionManagers().startConnection();
       s = conn.createStatement();
       sql = "SELECT MONTH, YEAR FROM TIME_PERIOD WHERE ID ="+periodId;
       rs1 = s.executeQuery(sql);
       
       if(rs1.next()){
         monthId = rs1.getString("MONTH");
         yearId = rs1.getString("YEAR");
       }
        rs1.close();

       if(Integer.parseInt(monthId)<4){
         fy=yearId.substring(2);
         int startPeriodId = getPeriodId(4,Integer.parseInt(yearId)-1)-1;//prev year april id
         
         for(int i=0; i<12; i++)
         {
            temp+= ++startPeriodId;
            if(i < 11) temp += ",";
         }
          temp+= ")";
       }else
       {
          fy= (""+(Integer.parseInt(yearId)+1)).substring(2);
          //System.out.println(fy);
          int startPeriodId = getPeriodId(4,Integer.parseInt(yearId))-1;//prev year april id
          temp="(";
          for(int i=0; i<12; i++)
          {
             temp+= ++startPeriodId;
             if(i < 11) temp += ",";
          }
           temp+= ")";
       }
       //System.out.println("period id:"+periodId);
       s.close();
       conn.close();
       //System.out.println(temp);
       return temp;
       
     }
     catch (SQLException e)
     {
       e.printStackTrace();
     }
     finally
     {
       try
       {
        if(rs1 != null) rs1.close();
        if(s != null) s.close();
        if(conn != null) conn.close();
       }catch(SQLException sqle){}
      }
    return "";
   }


  public String getPeriodName(int period)
  throws SQLException
  {
    Connection con=null;
    try
    {
      String periodId="";
      
      con = new ConnectionManagers().startConnection();
      s = con.createStatement();
      sql = "SELECT NAME FROM TIME_PERIOD WHERE ID ="+period;
      rs = s.executeQuery(sql);
      
      if(rs.next()) periodId = rs.getString("NAME");
      //System.out.println("period id:"+periodId);
      rs.close();
      s.close();
      con.close();
      return periodId;
      
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }
    finally
	 {
		try
		{
		 if(rs != null) rs.close();
       if(s != null) s.close();
       if(con != null) con.close();
		}catch(SQLException sqle){}
	  }
   return "";
  }
  public String getPeriodName(String period)
  throws SQLException
  {
    Connection con=null;
    try
    {
      String periodId="";
      
      con = new ConnectionManagers().startConnection();
      s = con.createStatement();
      sql = "SELECT NAME FROM TIME_PERIOD WHERE ID ="+period;
      rs = s.executeQuery(sql);
      
      if(rs.next()) periodId = rs.getString("NAME");
      //System.out.println("period id:"+periodId);
      rs.close();
      s.close();
      con.close();
      return periodId;
      
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }
    finally
	 {
		try
		{
		 if(rs != null) rs.close();
       if(s != null) s.close();
       if(con != null) con.close();
		}catch(SQLException sqle){}
	  }
   return "";
  }
  
    public String getMonthName(int period)
    throws SQLException
    {
      Connection con=null;
      try
      {
        String monYearName ="",periodId="";
        
        con = new ConnectionManagers().startConnection();
        s = con.createStatement();
        sql = "SELECT SUBSTR(MON_YEAR,1,3) MON,YEAR FROM TIME_PERIOD WHERE ID ="+period;
        rs = s.executeQuery(sql);
        
        if(rs.next()) periodId = rs.getString("MON")+rs.getString("YEAR");
        //System.out.println("period id:"+periodId);
        rs.close();
        s.close();
        con.close();
        return periodId;
        
      }
      catch (SQLException e)
      {
        e.printStackTrace();
      }
      finally
           {
                  try
                  {
                   if(rs != null) rs.close();
         if(s != null) s.close();
         if(con != null) con.close();
                  }catch(SQLException sqle){}
            }
     return "";
    }
 public String getMonthId(int period)
    throws SQLException
    {
      Connection con=null;
      try
      {
        String monYearName ="",periodId="";
        
        con = new ConnectionManagers().startConnection();
        s = con.createStatement();
        sql = "SELECT MONTH MONTH_ID FROM TIME_PERIOD WHERE ID ="+period;
        rs = s.executeQuery(sql);
        
        if(rs.next()) periodId = rs.getString("MONTH_ID");
        //System.out.println("period id:"+periodId);
        rs.close();
        s.close();
        con.close();
        return periodId;
        
      }
      catch (SQLException e)
      {
        e.printStackTrace();
      }
      finally
           {
                  try
                  {
                   if(rs != null) rs.close();
         if(s != null) s.close();
         if(con != null) con.close();
                  }catch(SQLException sqle){}
            }
     return "";
    }
public String getYearId(int period)
       throws SQLException
       {
         Connection con=null;
         try
         {
           String monYearName ="",periodId="";
           con = new ConnectionManagers().startConnection();
           s = con.createStatement();
           sql = "SELECT YEAR YEAR_ID FROM TIME_PERIOD WHERE ID ="+period;
           rs = s.executeQuery(sql);
           
           if(rs.next()) periodId = rs.getString("YEAR_ID");
           //System.out.println("period id:"+periodId);
           rs.close();
           s.close();
           con.close();
           return periodId;
           
         }
         catch (SQLException e)
         {
           e.printStackTrace();
         }
         finally
              {
                     try
                     {
                      if(rs != null) rs.close();
            if(s != null) s.close();
            if(con != null) con.close();
                     }catch(SQLException sqle){}
               }
        return "";
  } 
  public int returnPrevPeriod()throws SQLException
  {
     int convMonth=0;
     int convYear=0;
     try
     {
         java.util.Date cDate=new java.util.Date();
         SimpleDateFormat yearf = new SimpleDateFormat("yyyy");
         SimpleDateFormat monthf = new SimpleDateFormat("MM");
         int month = Integer.parseInt(monthf.format(cDate));
         int year = Integer.parseInt(yearf.format(cDate));
         
         if(month == 1)
         {
            convMonth = 12;
            convYear = year -1;
         }else
         {
            convMonth = month-1;
            convYear = year;
         }
   
         return getPeriodId(convMonth,convYear);
   
     }catch(Exception e){}  
     return 0;
  }
  public int getPeriodId(int monthId, int yearId)
  throws SQLException
  {
    Connection con=null;
    try
    {
      int periodId = 0;
      int vMonthId = monthId;
      int vYearId = yearId;
      
      con = new ConnectionManagers().startConnection();
      s = con.createStatement();
      sql = "SELECT ID FROM TIME_PERIOD WHERE MONTH ="+vMonthId+" AND YEAR ="+vYearId;
      rs = s.executeQuery(sql);
      
      if(rs.next()) periodId = rs.getInt("ID");
      //System.out.println("period id:"+periodId);
      rs.close();
      s.close();
      con.close();
      return periodId;
      
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }
    finally
	 {
		try
		{
		 if(rs != null) rs.close();
       if(s != null) s.close();
       if(con != null) con.close();
		}catch(SQLException sqle){}
	  }
   return 0;
  }

  public String getMonthSelect(String elmName, int monthId)
  {
  try
  {
      return BaseBean.get().getMonthHtml(elmName, monthId);
  }
  catch (Exception e) 
    { 
      e.printStackTrace();
    }
    return null;
  }
    public String getMonthSelectOnChange(String elmName, String onChangeVal,int monthId)
    {
    try
    {
        return BaseBean.get().getMonthHtmlOnChange(elmName,onChangeVal, monthId);
    }
    catch (Exception e) 
      { 
        e.printStackTrace();
      }
      return null;
    }
  public String getMonthSelectMMM(String elmName, String monthId)
  {
  try
  {
      return BaseBean.get().getMonthHtmlMMM(elmName, monthId);
  }
  catch (Exception e) 
    { 
      e.printStackTrace();
    }
    return null;
  }
  public String getDaySelect(String elmName, int dayId)
  {
  try
  {
      return BaseBean.get().getDayHtml(elmName,dayId);
  }
  catch (Exception e) 
    { 
      e.printStackTrace();
    }
    return null;
  }
  public String getYearSelect(String elmName, int yearId)
  {
  try
  {
      return BaseBean.get().getYearHtml(elmName, yearId);
  }
  catch (Exception e) 
    { 
      e.printStackTrace();
    }
    return null;
  }
  
    public String getYearSelectOnChange(String elmName,String onChangeVal, int yearId)
    {
    try
    {
        return BaseBean.get().getYearHtmlOnChange(elmName,onChangeVal, yearId);
    }
    catch (Exception e) 
      { 
        e.printStackTrace();
      }
      return null;
    }
  public void startEndPeriod(String timeType, String startDate, String endDate, String optMonth, String optYear)
  {
		if(timeType.equals("fromTo")){
			this.startDate = startDate;
			this.endDate = endDate;
		}else if(timeType.equals("monthYear")){
			this.optMonth = optMonth;
			this.optYear = optYear;
		}

		if(timeType.equals("monthYear")){
			this.startDate = "01-"+optMonth+"-"+optYear;
			if(optMonth.equals("JAN")) this.endDD = "31";
			else if(optMonth.equals("MAR")) this.endDD = "31";
			else if(optMonth.equals("APR")) this.endDD = "30";
			else if(optMonth.equals("MAY")) this.endDD = "31";
			else if(optMonth.equals("JUN")) this.endDD = "30";
			else if(optMonth.equals("JUL")) this.endDD = "31";
			else if(optMonth.equals("AUG")) this.endDD = "31";
			else if(optMonth.equals("SEP")) this.endDD = "30";
			else if(optMonth.equals("OCT")) this.endDD = "31";
			else if(optMonth.equals("NOV")) this.endDD = "30";
			else if(optMonth.equals("DEC")) this.endDD = "31";
			else if(optMonth.equals("Dec")) this.endDD = "31";
			else if(optMonth.equals("Jan")) this.endDD = "31";
		   else if(optMonth.equals("Mar")) this.endDD = "31";
			else if(optMonth.equals("Apr")) this.endDD = "30";
			else if(optMonth.equals("May")) this.endDD = "31";
			else if(optMonth.equals("Jun")) this.endDD = "30";
			else if(optMonth.equals("Jul")) this.endDD = "31";
			else if(optMonth.equals("Aug")) this.endDD = "31";
			else if(optMonth.equals("Sep")) this.endDD = "30";
			else if(optMonth.equals("Oct")) this.endDD = "31";
			else if(optMonth.equals("Nov")) this.endDD = "30";
			else if(optMonth.equals("Dec")) this.endDD = "31";

			if( optMonth.equals("FEB") && (Integer.parseInt(optYear)%4)==0 ) this.endDD = "29";
			else if( optMonth.equals("FEB") && (Integer.parseInt(optYear)%4)!=0 ) this.endDD = "28";

			if( optMonth.equals("Feb") && (Integer.parseInt(optYear)%4)==0 ) this.endDD = "29";
			else if( optMonth.equals("Feb") && (Integer.parseInt(optYear)%4)!=0 ) this.endDD = "28";

			this.endDate = this.endDD+"-"+optMonth+"-"+optYear;
		}

     
  }
    public void startEndPeriod(String timeType, String startDate, String endDate, String monYear)
    {
                  if(timeType.equals("fromTo")){
                          this.startDate = startDate;
                          this.endDate = endDate;
                  }else if(timeType.equals("monthYear")){
                          this.optMonth = monYear.substring(0,3);
                          this.optYear = monYear.substring(3,7);
                  }

                  if(timeType.equals("monthYear")){
                          this.startDate = "01-"+optMonth+"-"+optYear;
                          if(optMonth.equals("JAN")) this.endDD = "31";
                          else if(optMonth.equals("MAR")) this.endDD = "31";
                          else if(optMonth.equals("APR")) this.endDD = "30";
                          else if(optMonth.equals("MAY")) this.endDD = "31";
                          else if(optMonth.equals("JUN")) this.endDD = "30";
                          else if(optMonth.equals("JUL")) this.endDD = "31";
                          else if(optMonth.equals("AUG")) this.endDD = "31";
                          else if(optMonth.equals("SEP")) this.endDD = "30";
                          else if(optMonth.equals("OCT")) this.endDD = "31";
                          else if(optMonth.equals("NOV")) this.endDD = "30";
                          else if(optMonth.equals("DEC")) this.endDD = "31";
                          else if(optMonth.equals("Dec")) this.endDD = "31";
                          else if(optMonth.equals("Jan")) this.endDD = "31";
                     else if(optMonth.equals("Mar")) this.endDD = "31";
                          else if(optMonth.equals("Apr")) this.endDD = "30";
                          else if(optMonth.equals("May")) this.endDD = "31";
                          else if(optMonth.equals("Jun")) this.endDD = "30";
                          else if(optMonth.equals("Jul")) this.endDD = "31";
                          else if(optMonth.equals("Aug")) this.endDD = "31";
                          else if(optMonth.equals("Sep")) this.endDD = "30";
                          else if(optMonth.equals("Oct")) this.endDD = "31";
                          else if(optMonth.equals("Nov")) this.endDD = "30";
                          else if(optMonth.equals("Dec")) this.endDD = "31";

                          if( optMonth.equals("FEB") && (Integer.parseInt(optYear)%4)==0 ) this.endDD = "29";
                          else if( optMonth.equals("FEB") && (Integer.parseInt(optYear)%4)!=0 ) this.endDD = "28";

                          if( optMonth.equals("Feb") && (Integer.parseInt(optYear)%4)==0 ) this.endDD = "29";
                          else if( optMonth.equals("Feb") && (Integer.parseInt(optYear)%4)!=0 ) this.endDD = "28";

                          this.endDate = this.endDD+"-"+optMonth+"-"+optYear;
                  }

       
    }
  public String returnMonthYear(String month, String year)
  {
     String monthName="",yearName="";
     if(month.equalsIgnoreCase("1"))
     {
        monthName ="JAN";
     }else if(month.equalsIgnoreCase("2"))
     {
        monthName ="FEB";
     }else if(month.equalsIgnoreCase("3"))
     {
        monthName ="MAR";
     }else if(month.equalsIgnoreCase("4"))
     {
        monthName ="APR";
     }else if(month.equalsIgnoreCase("5"))
     {
        monthName ="MAY";
     }else if(month.equalsIgnoreCase("6"))
     {
        monthName ="JUN";
     }else if(month.equalsIgnoreCase("7"))
     {
        monthName ="JUL";
     }else if(month.equalsIgnoreCase("8"))
     {
        monthName ="AUG";
     }else if(month.equalsIgnoreCase("9"))
     {
        monthName ="SEP";
     }else if(month.equalsIgnoreCase("10"))
     {
        monthName ="OCT";
     }else if(month.equalsIgnoreCase("11"))
     {
        monthName ="NOV";
     }else if(month.equalsIgnoreCase("12"))
     {
        monthName ="DEC";
     }
     //System.out.println(monthName+year.substring(2,4));
     return monthName+year.substring(2,4);
  }
  public String getStartDate(){return startDate;}
  public String getEndDate(){return endDate;}
  public String getOptMonth(){return optMonth;}
  public String getOptYear(){return optYear;}
  
  public String increaseDate(String iDate, int incDay)
  {
    java.util.Date incDate =  DateConv.get().increaseDate(DateConv.get().getDate4(iDate),incDay);
    return DateConv.get().dateFormat(incDate);
  }

  public String decreaseDate(String iDate, int incDay)
  {
    java.util.Date incDate =  DateConv.get().decreaseDate(DateConv.get().getDate4(iDate),incDay);
    return DateConv.get().dateFormat(incDate);
  }


  public int returnDayDiff()
  {
     try{
     long daydiff = DateConv.get().dateDiff(DateConv.get().getDate4(startDate),DateConv.get().getDate4(endDate));
     return (int)daydiff;
     }
     catch (Exception e)
     {
        return 3;
     }
  }
  public int returnDayDiff(int diff)
  {  
  try{
     java.util.Date dd1 = DateConv.get().getDate4(DateConv.get().changeDate(DateConv.get().getDate4(startDate),-diff));
     java.util.Date dd2 = DateConv.get().getDate4(DateConv.get().changeDate(DateConv.get().getDate4(endDate),diff));
     long daydiff = DateConv.get().dateDiff(dd1,dd2);
     return (int)daydiff;
  }
  catch (Exception e)
  {
     return 3;
  }
  }

  public static void main (String [] args) throws SQLException
  {
  
    PeriodSelect periodSelect = new PeriodSelect();
    //periodSelect.getYearSelect("yy",2006);
    //periodSelect.getDaySelect("day1",4);
    //String checkDate = periodSelect.increaseDate("03-May-2006",1);
    //System.out.println(checkDate);
    //java.util.Date dd = new java.util.Date();
    //String ss = ""+(dd.getMonth()-1);
    //System.out.println(ss);
    //periodSelect.returnPrevPeriod();
    //periodSelect.returnMonthYear("9","2007");
    periodSelect.getFyArray("110");
  }
  
  public static Connection c;
  public static Statement s;
  public static ResultSet rs;
  public static String sql;
  private static PeriodSelect instance;
  public static String timeType="",startDate="",endDate="",endDD = "",optMonth="",optYear="";
  public static String dayDiff;
  public static String fy;

}