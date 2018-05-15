package administration;

import com.pwc.util.ConnectionManagers;
import com.pwc.util.DBConnLT;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//import javax.servlet.ServletRequest;

import javax.servlet.*;
import javax.servlet.jsp.*;

import lib.util.BaseBean;
import lib.util.MaxId;




public class PrintMapping

{
  String name="",address1="", address2="", place="";
  String locationCode="",bu="",pinCode="",signingAuthority="",telephone1="",telephone2="",email="",fax="",circleId="";
  String displaySave="";
  String message="";
  String errorDisplay="";
  int subDivision=0, division=0,repairer=0,circle=0,user=0,subdivision=0;
  
  Connection conn = null;
  CallableStatement cstmt = null;
  String insertString="",updateString="",userName = "",compName = "";
  
  public PrintMapping(){}
   
 public void setName(String name)  
    {  
      if(name != null) this.name = name;  else this.name = "";
    }
 public String getName(){return name;}
 
 public void setAddress1(String address1)  
    {  
      if(address1 != null) this.address1 = address1;  else this.address1 = "";
    }
 public String getAddress1(){return address1;}
 public void setAddress2(String address2)  
    {  
      if(address2 != null) this.address2 = address2;  else this.address2 = "";
    }
 public String getAddress2(){return address2;}
 public void setPlace(String place)  
    {  
      if(place != null) this.place = place;  else this.place = "";
    }
 public String getPlace(){return place;}
 
  public void setTelephone1(String telephone1)  
    {  
      if(telephone1 != null) this.telephone1 = telephone1;  else this.telephone1 = "";
    }
 public String getTelephone1(){return telephone1;}
 
   public void setTelephone2(String telephone2)  
    {  
      if(telephone2 != null) this.telephone2 = telephone2;  else this.telephone2 = "";
    }
 public String getTelephone2(){return telephone2;}
 
   public void setFax(String fax)  
    {  
      if(fax != null) this.fax = fax;  else this.fax = "";
    }
 public String getFax(){return fax;}
 
    public void setEmail(String email)  
    {  
      if(email != null) this.email = email;  else this.email = "";
    }
 public String getEmail(){return email;}
 
    public void setSigningAuthority(String signingAuthority)  
    {  
      if(signingAuthority != null) this.signingAuthority = signingAuthority;  else this.signingAuthority = "";
    }
 public String getSigningAuthority(){return signingAuthority;}

 public void setLocationCode(String locationCode)  
    {  
      if(locationCode != null) this.locationCode = locationCode;  else this.locationCode = "";
    }
 public String getLocationCode(){return locationCode;}
 public void setBu(String bu)  
    {  
      if(bu != null) this.bu = bu;  else this.bu = "";
    }
 public String getBu(){return bu;}
 public void setPinCode(String pinCode)  
    {  
      if(pinCode != null) this.pinCode = pinCode;  else this.pinCode = "";
    }
 public String getPinCode(){return pinCode;}
    public void setCircle(int iCircle)
       {  
         if(iCircle != 0) circle = iCircle;  else  circle = 0;
       }
    public int getCircle(){return circle;}
    public void setSubDivision(int iSubDivision)
       {  
         if(iSubDivision != 0) subdivision = iSubDivision;  else  subdivision = 0;
       }
    public int getSubDivision(){return subdivision;}
 public void setDivision(int iDivision)
    {  
      if(iDivision != 0) division = iDivision;  else  division = 0;
    }
 public int getDivision(){return division;}
    public void setRepairer(int repairerID)
    {
     if(repairerID != 0) repairer = repairerID;  else  repairer = 0;
    }
    public int getRepairer(){return repairer;}
    public void setUser(int userID)
    {
     if(userID != 0) user = userID;  else  user = 0;
    }
    public int getUser(){return user;}
     /*public void setSubDivision(int subDivisionID)
    {  
      if(subDivisionID != 0) subDivision = subDivisionID;  else  subDivision = 0;
    }
 public int getSubDivision(){return subDivision;}*/
 
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

  public String getUserList() throws SQLException
     {
      
          String sql = "SELECT ID, NAME FROM T_USER@UP_ABT ORDER BY NAME";
          RepairerList = BaseBean.get().getSelectHtmlOnChange("user",sql,"showUserDetails()",getUser());
          return RepairerList;
        
     } 
   
 
 
   public void saveData(ServletRequestContext request)
  {
  //System.out.println("savedata");
      String userId = request.getParameter("user");
      String name = request.getParameter("name");
      //String userId="0";
        try{
          
          conn = new DBConnMRI().getConn();
          s=conn.createStatement();
          String []divId=request.getParameterValues("divisionArray");
          String divSelected=request.getParameter("divisionSelected");
           
              userId = request.getParameter("user");           
              String deleteSql="DELETE FROM USR_GEN_MAPPING  WHERE USR_ID="+userId;  
              //System.out.println(deleteSql);
              s.executeQuery(deleteSql);
        
             // System.out.println("Length is"+divId.length);
            if((divId.length>0)&&(divSelected.equalsIgnoreCase("Y"))){
            for(int i=0;i<divId.length;i++) {
              String sql = "INSERT INTO USR_GEN_MAPPING(GEN_ID,USR_ID) VALUES("+divId[i]+","+userId+")"; 
            //System.out.println("insert"+sql);
              s.executeQuery(sql);
               //System.out.println("insert sql");
           }
          }
      }catch(Exception er){   
      System.out.println(er.getMessage());
      }    finally{
            
            try{
                if(s!=null)s.close();
                if(conn!=null)conn.close();
            }catch(Exception er){}
        }
      
      
    
    
    
  }
 
 

 public String test()
 {
    String returnVar="MSEDCL";
    return returnVar;
 }
 
    public void deleteRecord()
    {
      try
      {
      conn = new DBConnMRI().getConn();
      s=conn.createStatement();
      //String deleteString="DELETE FROM T_USER@UP_ABT  WHERE ID = "+user;
      //s.executeQuery(deleteString);
      String deleteSql="DELETE FROM USR_GEN_MAPPING  WHERE USR_ID="+user;  
     // System.out.println(deleteSql);
      s.executeQuery(deleteSql);
      if(conn != null) conn.close();
      if(s != null) s.close(); 
      message="Record Deleted successfully.";
      
        //return sql;
        
      }
      catch (SQLException e) 
      { message="Record not Deleted successfully.";}
       finally{
               try{
                  
                  
                   if(s!=null) s.close();
                   if(conn!=null) conn.close();
               }catch(Exception er){}
           }

    
    
    
    
    
    }  
public String returnMessage()
{
   return message;
}
   public String displaySql()
 {
  return errorDisplay;
 }
  /*public static void main(String[] args)
  {
     TMSRepairer sd = new TMSRepairer();
     sd.subDivision=368;
     sd.division=97;
     sd.name="BALAPUR";
     sd.saveData();
  }*/
  private static String DivisionList;
  private static String GesList;
  private static String CircleList;
  private static String SubDivisionList;
  private static String RepairerList;
  private static Connection c;
  private static Statement s;
  private static String sql;
  private static String sql1;
  private static ResultSet rs;
  private static int DMLVal;

    
}

