package com.pwc.util;

import java.sql.*;
import com.pwc.util.*;




public class ConnectionManagers
{
 public static Connection connection;
 //ConnectionManagers db1 = new ConnectionManagers();
  public Connection startConnection() 
  {
   boolean myConnection = false;//Connects to my own local database
    try
    {
    if(myConnection)
     {
        
     // DriverManager.registerDriver(new Driver());
      //Connection connection = DriverManager.getConnection(Mysqldriver,Mysqluser,Mysqlpwd);
     // return connection;
     }
    else
    {
        //System.out.println("reached here for connection");
     c = new com.pwc.util.DBConnLT().getConn();
     return c;
    }
    }  
      catch(Exception sqle)
    {
      System.err.println(sqle);
    }
    return connection;
   }
  
  
   public static void main (String args[])
   {
     ConnectionManagers db2 = new ConnectionManagers();
     db2.startConnection();
    
   }
  
  public  String Mysqldriver = "com.mysql.jdbc.Driver";
  public  String Mysqluser = "jica";
  public  String Mysqlpwd = "jica@123";
  public  String MysqluserABT = "htdb_mseb";
  public  String MysqlpwdABT = "htdb";

  public static Connection conn;
  public static Connection c;
}
