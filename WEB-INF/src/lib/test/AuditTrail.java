package lib.test;

import java.io.*;
import java.sql.*;
import com.pwc.util.ConnectionManagers;
import java.util.Vector;
import javax.servlet.ServletRequest;
import java.util.*;
import java.text.*;
import java.util.Date;
import com.pwc.util.*;
import lib.util.DateConv;

import com.vrksa.util.html.HTMLBuilder;

import lib.util.BaseBean;
import lib.util.*;

public class AuditTrail

{
  
String dtr1="",ss1="",gesName="",manu="", dtr="",dtr2="",dtr3="",dtrNo="",sstnNo="",ymanu="",cdtr="",pon="",tender="";
int id=0,kva=0;
int ges=0,division=0,subDivision=0,tenderName=0;
String adminId="",fetchPressed="",kvaName="",manuName="",startDate="";
  String ratingCode="";
  String name="",amendmentNo="";
  String displaySave="";
  String message="";
  String errorDisplay="";
  
  Connection conn = null;
  CallableStatement cstmt = null;
  String insertString="",updateString="",userName = "",compName = "";
  
  public AuditTrail(){}

    public static AuditTrail get()
    {
        if(instance == null)
            instance = new AuditTrail();
        return instance;
    }
 public void setName(String name)  
    {  
      if(name != null) this.name = name;  else this.name = "";
    }
 public String getName(){return name;}
   public void setFetchPressed(String fetchPressed)  
      {  
        if(fetchPressed != null) this.fetchPressed = fetchPressed;  else this.fetchPressed = "";
      }
   public String getFetchPressed(){return fetchPressed;}
   
    public void setId(int id)
       {  
         if(id != 0) this.id = id;  else  id = 0;
       }
    public int getId(){return id;}
    
   public void setAdminId(String adminId)
      {  
        if(adminId != null) this.adminId = adminId;  else  adminId = "";
      }
   public String getAdminId(){return adminId;} 
   
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
    
 public void insertLog(String qry, String whetherLog, String usrName, String comName) // Insert Statement and Add to Audit Table
 {
      String insertSql="",insertString="";
      int maxId=0;       
       
    try
    {
        //System.out.println("inside audit log-1 ");
        Date now = new Date();
        String formattedDate = DateConv.get().dateFormatNow(now);
        //System.out.println(formattedDate);
        conn = new ConnectionManagers().startConnection();
        st = conn.createStatement();
       
        //Populate Variables from the query String-----------------------------
       
        //insertString = "INSERT INTO TMS_TENDER_PURCHASE (ID,TENDER_NAME,MC_DATE) VALUES ("+maxId+",'"+tender+"','"+startDate+"')";
        insertString = qry;
        
        userName=usrName;
        compName=comName;
        
        String values="",insertMain="";
        int intoPos= insertString.indexOf("INTO");//Get the position of INTO
        int firstB= insertString.indexOf("(");//Get the position of first Bracket
        int secondB= insertString.indexOf(")");//Get the positon of second Bracket
        String tableName=insertString.substring(intoPos+4,firstB);//Get the table name
        tableName= tableName.trim();
        //System.out.println("Table Name:"+tableName);
        
        String columns=insertString.substring(firstB,secondB);//Get the columns name
        columns=columns.replace("(","");
        //columns=values.replace(")","");
        //System.out.println("Column Name:"+columns);
        
        //System.out.println("Length of String:"+insertString.length());
        int valuePos= insertString.indexOf("VALUES");//Get the position of VALUES
        values=insertString.substring(valuePos+6,insertString.length());//Get the column's values
        values=values.replace("(","");
        values=values.replace(")","");
        //System.out.println("Values Name:"+values);       
        
        String columnArray[]= null,valueArray[]=null;
        
        columnArray=columns.split(",");
        int columnArrayLength= columnArray.length;
         
        int colPos=0,valPos=0;
         
        // Populating ColumnsArray here
        try{
         for (int i=0;i<columnArrayLength;i++){
             
             if(i==colPos){
                 columnArray[colPos]= columnArray[i];
                 //colInt= colInt+1;
                 colPos= colPos+1;
             }
             
         }
        }  catch (Exception ex)
            {
              message=ex.getMessage();
                System.out.println("message is:"+message);
              ex.printStackTrace();
            }
        
        //System.out.println("Columns:"+columnArray);
        
        //Populating ValuesArray here
        valueArray=values.split(",");
        int valueArrayLength=valueArray.length;
                
        try{
            for (int i=0;i<valueArrayLength;i++){
            // Populating ColumnsArray here
                if(i==valPos){
                    valueArray[valPos]= valueArray[i];
                //colInt= colInt+1;
                    valPos= valPos+1;
                }
            }
        }catch (Exception exe)
            {
              message=exe.getMessage();
                System.out.println("message is:"+message);
              exe.printStackTrace();
            }
        
        //System.out.println("Values:"+valueArray);
        
        //Modifications values which is to be inserted into Audit Log table
        String modifications="";
        try{
        for (int i=0;i<columnArray.length;i++){
            modifications+= columnArray[i]+ "-"+valueArray[i]+";";
            
        }
        }catch (Exception exe)
            {
              message=exe.getMessage();
                System.out.println("message is:"+message);
              exe.printStackTrace();
            }
        //System.out.println("Modification:"+modifications);
        
        
        insertMain= qry;
        //System.out.println(insertMain);
        int i = st.executeUpdate(insertMain);
       
       //Insert into Audit Log Table
       try{
        if(whetherLog.equalsIgnoreCase("Y")){
       
           sql = "SELECT NVL(MAX(ID),0)+1 AS MAXID FROM MS_USER_AUDIT_LOG";
           rs = st.executeQuery(sql);
           if(rs.next())
           {
             maxId = rs.getInt("MAXID");
           }else
           {
             maxId=0;
           }
       
            insertSql += "INSERT INTO MS_USER_AUDIT_LOG (ID, TABLE_NAME, OPERATION, USERNAME, TIMESTAMP, COMPUTER, MODIFICATIONS) ";
            insertSql += "VALUES("+maxId+",'"+tableName+"','INSERT','"+userName+"',TO_DATE("+formattedDate+",'DD-MON-YYYY HH24:MI:SS'),'"+compName+"','"+modifications.replaceAll("\'","")+"')";
            //System.out.println(insertSql);
            int x = st.executeUpdate(insertSql);
        
        }
       rs.close();
       st.close();
       this.conn.close();
       }catch (Exception ex)
            {
              message=ex.getMessage();
              System.out.println("message is:"+message);
              ex.printStackTrace();
            }
       
       
    }catch (SQLException e){e.printStackTrace();}
      finally
     {
       try
       {
         if(rs != null) rs.close();
         if(st!=null) st.close();
         if(this.conn!=null) this.conn.close();
       }catch(SQLException sqle){}
     }
       
    }
    
   public void updateLog(String qry, String whetherLog,String usrName, String comName) //Update Statement and Add to Audit Table
    {
         String updateSql="",updateString="";
         int maxId=0;       
          
       try
       {
          
          Date now = new Date();
          String formattedDate = DateConv.get().dateFormatNow(now);
          //System.out.println(formattedDate);
          conn = new ConnectionManagers().startConnection();
          st = conn.createStatement();
          
          //Populate Variables from the query String-----------------------------
          
          //updateString = "UPDATE TMS_TENDER_PURCHASE SET TENDER_NAME='"+tender+"', MC_DATE='"+startDate+"' WHERE ID ="+tenderName+" "; 
          
          updateString = qry;
          
          userName=usrName;
          compName=comName;
          //System.out.println(updateString); 
          String tableName="",category="";
          String mainArray[]= updateString.split(",");
          int len= mainArray.length;
          
          String condition="",columnValueString="",newValueString="";
          String jointArray[]= null,columnArray[]=null,oldArray[]=null,newArray[]=null;
          String colValueString= "",colValQry="";
        //System.out.println(updateString+" inside audit log-2:"+len);
          
          
          int upDatePos= updateString.indexOf("UPDATE");// Update's position
          int setPos= updateString.indexOf("SET");// Set's position
          int wherePos= updateString.indexOf("WHERE");// Where's position
          
          //System.out.println(upDatePos+" "+setPos+" "+wherePos);
          
          tableName= updateString.substring(upDatePos+6, setPos);// Get the table name
          tableName= tableName.trim();
          //System.out.println(tableName);
          
          colValueString= updateString.substring(setPos+3,wherePos);// Get the column and value in one block
          colValueString= colValueString.trim();
          //System.out.println(colValueString);
          
          condition= updateString.substring(wherePos+5,updateString.length());// Get the condition for updation
          condition= condition.trim();
         // System.out.println(condition);
          
          //System.out.println("TableName:"+tableName+"And Column:"+colValueString+"And Condition:"+condition);
          
          // Separating the column name and updated value
          jointArray= colValueString.split(",");// 4
          int jointArrayLength= jointArray.length;
          columnArray= new String[jointArrayLength]; //2
          newArray= new String[jointArrayLength]; //2
          int equalPos=0;
          String colValueTemp="";
          for (int i =0 ; i< jointArrayLength; i++){
              
               colValueTemp= jointArray[i];
               equalPos= colValueTemp.indexOf("=");
               columnArray[i]= (colValueTemp.substring(0,equalPos)).trim();
               newArray[i]= (colValueTemp.substring((equalPos+1),colValueTemp.length())).trim();
               
               /*
               if(i!= (jointArrayLength-1)){
                    columnArray[i]+= ",";
                    newArray[i]+=",";
                }
                */
                //System.out.println("colValueTemp[i]: "+colValueTemp);
                //System.out.println("newArray[i]: "+newArray[i]);
                //System.out.println("columnArray[i]: "+columnArray[i]);
               
            }
          
          for(int i=0;i<columnArray.length;i++){
              columnValueString+=columnArray[i];
              if(i!= (columnArray.length-1)){
                   columnValueString+= ",";
                   
               }
              
          }
          
         // System.out.println("columnArray.length"+columnArray.length);
         
         // Get the Old Value through query
          try{
          
          //colValQry=columnValueString.split(",");
          //int columnQryLength= colValQry.length;
          sql = "SELECT "+columnValueString+" FROM "+tableName+" WHERE "+condition+" " ;
          rs=st.executeQuery(sql);
          //System.out.println(sql); 
          oldArray= new String[columnArray.length];
          int colCount=0;
          ResultSetMetaData rsmd= rs.getMetaData();// To get the Column count
          colCount= rsmd.getColumnCount();
          String dataType= "";
          Date tempDate= null;
          if(rs.next())
              {
                for(int i=0;i<colCount;i++){

                  dataType= rsmd.getColumnTypeName((i+1)); //To get the column type(char,date,varchar2 etc.)
                  
                  if((dataType.equalsIgnoreCase("DATE"))||(dataType.equalsIgnoreCase("DATETIME"))){
                      tempDate=  rs.getDate((i+1));  
                      oldArray[i]= DateConv.get().dateFormat(tempDate);
                      
                  }else {
                      
                      oldArray[i]=rs.getString((i+1));  
                  }
                  //System.out.println("Old Value:"+oldArray[i]);      
                }
              } 
                       
           }
           catch (Exception ex)
           {
               message=ex.getMessage();
               System.out.println("message is:"+message);
               ex.printStackTrace();
           }
          
          // for loop closed
                    
          //Initialising the column,new value and old value into their respective fields
         
          
          String updateCoulumns="",modifications="",tempOld="",tempNew="";
          
          for (int i=0;i<columnArray.length;i++){
           
              //updateCoulumns+= columnArray[i]+ "="+newArray[i];
               tempOld= oldArray[i].replaceAll("\'","").trim();
               tempNew= newArray[i].replaceAll("\'","").trim();
               //System.out.println("tempOld-"+tempOld);
               //System.out.println("tempNew-"+tempNew);
               
              if(!tempOld.equalsIgnoreCase(tempNew)){
                modifications+= columnArray[i]+ " O: "+tempOld+ " N: "+tempNew+";";
              }
          }
          //System.out.println("updateCoulumns :"+updateCoulumns);
          //System.out.println("modifications :"+modifications);
          updateString= qry;
          int i = st.executeUpdate(updateString);
          System.out.println("updateString :"+updateString);
          
          
          //Insert into Audit Log Table
          if(whetherLog.equalsIgnoreCase("Y")){
          
              sql = "SELECT NVL(MAX(ID),0)+1 AS MAXID FROM MS_USER_AUDIT_LOG";
              rs = st.executeQuery(sql);
              if(rs.next())
              {
                maxId = rs.getInt("MAXID");
              }else
              {
                maxId=0;
              }
              
              updateSql += "INSERT INTO MS_USER_AUDIT_LOG (ID, TABLE_NAME, OPERATION, USERNAME, TIMESTAMP, COMPUTER, MODIFICATIONS) ";
              updateSql += "VALUES("+maxId+",'"+tableName+"','UPDATE','"+userName+"',TO_DATE("+formattedDate+",'DD-MON-YYYY HH24:MI:SS'),'"+compName+"','"+modifications.replaceAll("\'","")+"')";
             // System.out.println(updateSql);
              int x = st.executeUpdate(updateSql);
           
          }
          rs.close();
          st.close();
          this.conn.close();
          
       }catch (SQLException e){e.printStackTrace();}
         finally
        {
          try
          {
            if(rs != null) rs.close();
            if(st!=null) st.close();
            if(this.conn!=null) this.conn.close();
          }catch(SQLException sqle){}
        }
          
       }   
    
    public void deleteLog(String qry, String whetherLog,String usrName, String comName) // Delete Statement and Add to Audit Table
    {
         String deleteSql="",deleteString="";
         int maxId=0;       
          
       try
       {
          System.out.println("inside audit log-1 ");
          Date now = new Date();
          String formattedDate = DateConv.get().dateFormatNow(now);
          //System.out.println(formattedDate);
          conn = new ConnectionManagers().startConnection();
          st = conn.createStatement();
          
           userName=usrName;
           compName=comName;
          
          //Populate Variables from the query String-----------------------------
          
           //DELETE FROM TMS_TENDER_PURCHASE  WHERE ID = "+tenderName;
           deleteString = qry;
           System.out.println(deleteString);
           String deleteMain="",condition="",tableName="";
           String arr[]= deleteString.split("=");
           int len= arr.length;
           System.out.println("inside audit log-2");
           
           int fromPos= deleteString.indexOf("FROM");// From's position
           int wherePos= deleteString.indexOf("WHERE");// Where's position
           
           tableName= deleteString.substring(fromPos+4, wherePos);// Get the table name
           tableName= tableName.trim();
           //System.out.println(tableName);
           //System.out.println(upDatePos+" "+setPos+" "+wherePos);
           
           condition= deleteString.substring(wherePos+5,deleteString.length());// Get the condition for delete query
           condition= condition.trim();
           System.out.println(condition); 
           
           deleteMain= deleteString ;
           System.out.println("Hi:"+deleteMain);
           int i = st.executeUpdate(deleteMain);
          
           if(whetherLog.equalsIgnoreCase("Y")){
          
              sql = "SELECT NVL(MAX(ID),0)+1 AS MAXID FROM MS_USER_AUDIT_LOG";
              rs = st.executeQuery(sql);
              if(rs.next())
              {
                maxId = rs.getInt("MAXID");
              }else
              {
                maxId=0;
              }
          
               deleteSql += "INSERT INTO MS_USER_AUDIT_LOG (ID, TABLE_NAME, OPERATION, USERNAME, TIMESTAMP, COMPUTER, MODIFICATIONS) ";
               deleteSql += "VALUES("+maxId+",'"+tableName+"','DELETE','"+userName+"',TO_DATE("+formattedDate+",'DD-MON-YYYY HH24:MI:SS'),'"+compName+"','"+condition.replaceAll("\'","")+"')";
               System.out.println(deleteSql);
               int x = st.executeUpdate(deleteSql);
           
           }
          rs.close();
          st.close();
          this.conn.close();
          
       }catch (SQLException e){e.printStackTrace();}
         finally
        {
          try
          {
            if(rs != null) rs.close();
            if(st!=null) st.close();
            if(this.conn!=null) this.conn.close();
          }catch(SQLException sqle){}
        }
          
       }
        
    
 
     public void getConnection()
     {
      c = new ConnectionManagers().startConnection();
     }

     public void closeConnection()
        throws SQLException
         {
           c.close();
         }
public String returnMessage()
{
   return message;
}
   public String displaySql()
 {
  return errorDisplay;
 }
    private static String DivisionList;
    public static String Id;
    private static String SubDivisionList;
    private static String ManufacturerList;
    private static String HTBushList;
    private static String LTBushList;
    private static String HTStudList;
    private static String LTStudList;
    private static Connection c;
    private static Connection con;
    private static Statement st;
    private static String sql;
    private static String sql1;
    private static ResultSet rs;
    private static int DMLVal;
    private static AuditTrail instance;
    
}

