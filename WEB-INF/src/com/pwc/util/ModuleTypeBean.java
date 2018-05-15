package com.pwc.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import lib.util.BaseBean;

public class ModuleTypeBean
{
    public String modulelist,qry;
    

    private int moduleID;
    private String message="";
    private String errorDisplay="";
    private static String GesList;
    
    Connection conn = null;
    CallableStatement cstmt = null;
    
    
    public void setModuleType(int moduleID)
      {  
        if(moduleID != 0)
        {
        this.moduleID = moduleID;
        }
        else
        {
          moduleID = 0;
        }
      }
    public int getModuleType()
    {
       return moduleID;
    }
    
    
    public String getModuleList() throws SQLException
      {
        qry = "SELECT ID,USER_NAME FROM MODULES WHERE USER_NAME NOT IN('Administrator') ORDER BY ID";
        modulelist = BaseBean.get().getSelectHtmlOnChange("moduleID",qry,"showUserType()",getModuleType());
        return modulelist;
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
       ModuleTypeBean sd = new ModuleTypeBean();
      
    } 

      public void setGesList(String gesList)
      {
          this.GesList = gesList;
      }
    
      
}
