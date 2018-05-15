package admin;

import java.io.*;
import java.sql.*;
import com.pwc.util.ConnectionManagers;
import java.util.Vector;
import java.util.*;
import java.text.*;
import java.util.Date;
import com.pwc.util.*;
import lib.util.BaseBean;
import lib.util.*;

public class Customer

{
  String name="",address="", address2="", country="";
  String email="",phone="";
  String startDate="",endDate="";
  String displaySave="";
  String message="";
  String errorDisplay="";
  int customer=0, zone=0;
  
  Connection conn = null;
  CallableStatement cstmt = null;
  String insertString="",updateString="",userName = "",compName = "",website="";
  
  public Customer(){}
   
 public void setName(String name)  
    {  
      if(name != null) this.name = name;  else this.name = "";
    }
 public String getName(){return name;}
 

 public void setAddress(String address)  
    {  
      if(address != null) this.address = address;  else this.address = "";
    }
 public String getAddress(){return address;}
 
 public void setCountry(String country)  
    {  
      if(country != null) this.country = country;  else this.country = "";
    }
 public String getCountry(){return country;}
 
    
  public void setPhone(String phone)  
       {  
         if(phone != null) this.phone = phone;  else this.phone = "";
       }
  public String getPhone(){return phone;}
    
    public void setEmail(String email)  
         {  
           if(email != null) this.email = email;  else this.email = "";
         }
    public String getEmail(){return email;}
      
        
    

 public void setCustomer(int tempMasterId)
    {  
      if(tempMasterId != 0) customer = tempMasterId;  else  customer = 0;
    }
 public int getCustomer(){return customer;}
 
 public void setUserName(String userName)  
  {  
      if(userName != null) this.userName = userName;  else this.userName = "";
  }
 public String getUserName(){return userName;}
 
 public void setCompName(String compName)  
    {  
      if(compName != null) this.compName = compName;  else this.compName = "";
    }
 public String getCompName(){return compName;}
 
 public String getCustomerList() throws SQLException
  {
    String sql = "SELECT ID, NAME FROM t_customer_master ORDER BY NAME";
    CircList = BaseBean.get().getSelectHtmlOnChange("customer",sql,"showCircle()",getCustomer());
    return CircList;
  }  
 
  public void displayData()
  {
  try
    {
    
      sql = "SELECT NAME,ADDRESS,COUNTRY,PHONE,EMAIL,WEBSITE FROM t_customer_master WHERE ID = "+customer;
      c = new ConnectionManagers().startConnection();
      s = c.createStatement();
      rs = s.executeQuery(sql);
      if(rs.next())
      {
        name = rs.getString("NAME"); if (name == null) name="";
        address = rs.getString("ADDRESS"); if (address == null) address="";
        country = rs.getString("COUNTRY"); if (country == null) country="";
        phone = rs.getString("PINCODE"); if (phone == null) phone="";
        email = rs.getString("LOCATION_CODE"); if (email == null) email="";
        website = rs.getString("STARTDATE"); if (website == null) website="";
       
        rs.close();
        s.close();
        c.close();
      }else
      {
        name = "";
        address = "";
        address2="";
        country="";
        email="";
        phone="";
        zone=0;
        startDate="";
        endDate="";
      }
      
    }
  catch (SQLException e)
    {
      //e.printStackTrace();
    }finally {
            try { // if(conn != null) conn.close();
                if (s != null)
                    s.close();
                if (rs != null)
                    rs.close();
                if (c != null)
                    c.close();
            } catch (SQLException e) {
            }
        }
   }
   
    public boolean recordexists (String nameTemp)
 {
 
     boolean x= true;

    try
    {
     sql = "SELECT * FROM t_customer_master WHERE NAME = '"+nameTemp+"'";
      rs = s.executeQuery(sql);
      
      if(rs.next())
      {
      x=false;
      }
      else
      {
      x=true;
      }
    rs.close();
    
    }
   
   catch(SQLException e)
   
   {
      //e.printStackTrace();
   }
    return x;
 }
 
  public boolean recordexists_update (String nameTemp,int masterId)
 {
 
     boolean x= true;

    try
    {
     
      sql = "SELECT * FROM t_customer_master WHERE NAME = '"+nameTemp+"' AND ID="+masterId+"";
      rs = s.executeQuery(sql);
      
      if(rs.next())
      {
      x=true;
      }
      else
      {
      x=false;
      }
    rs.close();
    s.close();
    }
   
   catch(SQLException e)
   
   {
      //e.printStackTrace();
   }
    return x;
 }



public String returnMessage()
{
   return message;
}
   public String displaySql()
 {
  return errorDisplay;
 }
  private static String ZoneList;
  private static String CircList;
  private static Connection c;
  private static Statement s;
  private static String sql;
  private static String sql1;
  private static ResultSet rs;
  private static int DMLVal;
 
  
  
}

