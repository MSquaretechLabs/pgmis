package com.pwc.util;

import java.io.*;
import java.sql.*;
import com.pwc.util.ConnectionManagers;
import java.util.Vector;
import javax.servlet.ServletRequest;
import java.util.*;
import java.text.*;
import java.util.Date;

import javax.servlet.Servlet;

import lib.util.BaseBean;
import lib.util.*;


public class ReportBean

{
    
   private int reportType;
   private int reportType1;
   private int reportType2;
  private String tariffName;
  private String maxValue;
  private String minValue;
  private String displaySave="";
  private String message="";
  private String errorDisplay="";
  
  Connection conn = null;
  CallableStatement cstmt = null;
  String insertString="",updateString="",userName = "",compName = "",updateString1="";
  
  public ReportBean(){}
  

       
       public void setTariffName(String tariffName) 
       {
           this.tariffName=tariffName;
       }
       public String getTariffName()
       {
           return tariffName;
       }
       
       public void setMaxValue(String maxValue) 
       {
           this.maxValue=maxValue;
       }
       
       public String getMaxValue()
       {
           return maxValue;
       }
       
       public void setMinValue(String minValue)
       {
           this.minValue=minValue;
       }
       
       public String getMinValue() 
       {
           return minValue;
       }
   
 
 public void setReportType(int reportType)
    {  
      if(reportType != 0)
      {
      this.reportType = reportType;
      }
      else
      {
        reportType = 0;
      }
    }
 public int getReportType()
 {
     return reportType;
 }
 
    public void setReportType1(int reportType1)
       {  
         if(reportType1 != 0)
         {
         this.reportType1 = reportType1;
         }
         else
         {
           reportType1 = 0;
         }
       }
    public int getReportType1()
    {
        return reportType1;
    }
    
    public void setReportType2(int reportType2)
       {  
         if(reportType2 != 0)
         {
         this.reportType2 = reportType2;
         }
         else
         {
           reportType2 = 0;
         }
       }
    public int getReportType2()
    {
        return reportType2;
    }
 
 
 
   
   public String getReportTypeList() throws SQLException
     {

       String sql = "SELECT ID,NAME FROM CMS_CATEGORY ORDER BY NAME";
       System.out.println("reached ehre brepot bean");
       reportTypeList = BaseBean.get().getSelectHtmlOnChange("reportType",sql,"showReportType()",getReportType());
       return reportTypeList;
      }  
    public String getReportTypeListDocumentType() throws SQLException
      {

        String sql = "SELECT ID, DOC_NAME FROM CMS_DOC_TYPE ORDER BY DOC_NAME";
        reportTypeList = BaseBean.get().getSelectHtmlOnChange("reportType1",sql,"showReportType()",getReportType());
        return reportTypeList;
       }  
    
    public String getarticleTypeList() throws SQLException
      {

        String sql = "SELECT ARTICLE_ID, TITLE FROM ARTICLE_DETAILS ORDER BY ARTICLE_ID";
        reportTypeList = BaseBean.get().getSelectHtmlOnChange("reportType2",sql,"showReportType()",getReportType());
        return reportTypeList;
       }  
    
    public String test()
     {
        String returnVar="MSEDCL";
        return returnVar;
      }
 
    public void getConnection()
    {
     conn = new ConnectionManagers().startConnection();
    }

    public void closeConnection()
       throws SQLException
        {
          conn.close();
        }

public String returnMessage()
{
   return message;
}
   public String displaySql()
 {
  return errorDisplay;
 }
  public static void main(String[] args)
  {
     ReportBean sd = new ReportBean();
    
  }
  private static String DivisionList;
  private static String reportTypeList;
  private static String maxValueList;
  private static String Division1List;
  private static String GesList;
  private static String SubDivisionList;
  private static Connection c;
  private static Statement s;
  private static String sql;
  private static String sql1;
  private static ResultSet rs;
  private static ResultSet rs1;
  private static int DMLVal;

    public void setGesList(String gesList)
    {
        this.GesList = gesList;
    }
}

