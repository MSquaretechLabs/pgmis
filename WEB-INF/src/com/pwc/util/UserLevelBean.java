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

public class UserLevelBean
{
    public String userlist,qry;
    

    private int userLevel;
    private String message="";
    private String errorDisplay="";
    private static String GesList;
    
    Connection conn = null;
    CallableStatement cstmt = null;
    
    
    public void setuserLevel(int userLevel)
      {  
        if(userLevel != 0)
        {
        this.userLevel = userLevel;
        }
        else
        {
          userLevel = 0;
        }
      }
    public int getUserLevel()
    {
       return userLevel;
    }
    
    
    public String getUserList() throws SQLException
      {
        qry = "SELECT LEVEL_ID,DESCR FROM CMS_USER_LEVEL WHERE DESCR NOT IN'ADMINISTRATOR' ORDER BY LEVEL_ID";
        userlist = BaseBean.get().getSelectHtmlOnChange("userLevel",qry,"showUserType()",getUserLevel());
        return userlist;
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
       UserLevelBean sd = new UserLevelBean();
      
    } 

      public void setGesList(String gesList)
      {
          this.GesList = gesList;
      }
    
    }
