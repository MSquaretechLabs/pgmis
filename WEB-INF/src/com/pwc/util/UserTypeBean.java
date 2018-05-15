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


public class UserTypeBean 
{

     
    public String userlist,qry;
    

    private int userType;
    private String message="";
    private String errorDisplay="";
    private static String GesList;
    
    Connection conn = null;
    CallableStatement cstmt = null;
  
    
    public void setUserType(int userType)
      {  
        if(userType != 0)
        {
        this.userType = userType;
        }
        else
        {
          userType = 0;
        }
      }
    public int getUserType()
    {
       return userType;
    }
    
    
    public String getUserList() throws SQLException
      {
        qry = "SELECT ID,USER_NAME FROM USER_TYPE ORDER BY USER_NAME";
        userlist = BaseBean.get().getSelectHtmlOnChange("userType",qry,"showUserType()",getUserType());
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
       UserTypeBean sd = new UserTypeBean();
      
    } 

      public void setGesList(String gesList)
      {
          this.GesList = gesList;
      }
    
}

