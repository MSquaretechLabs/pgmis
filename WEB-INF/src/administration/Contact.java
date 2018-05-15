package administration;


import java.io.*;
import java.sql.*;
import com.pwc.util.ConnectionManagers;
import java.util.Vector;
import javax.servlet.ServletRequest;
import java.util.*;
import java.text.*;
import java.util.Date;
import com.pwc.util.*;
import lib.util.BaseBean;
import lib.util.*;

public class Contact

{
  String name="",dName="",place="",cluster="",program="",conductDate="",offAddress="", resAddress="", buName="",phone="",mobile="",fax="",email="",rb="";
  String locationCode="",pinCode="",imageName="",imagePath="",userUploaded="";
  String startDate="",endDate="",deletePhoto="", state="0";
  String displaySave="";
  String message="";
  String errorDisplay="";
  String zone="",circle="",division="",subDivision="",docType="0";
  String mName="",mailId="",sub="",desc="";
  public String adminUnitIdBean="",adminUnitTypeBean="",userIdBean="";
  
  String subject="",author="",accessLevel="";
  
  Connection conn = null;
  CallableStatement cstmt = null;
  String masterId="",applicationId="",documentId="",uploadDate="",remarks="",masterCategoryId="";
  String insertString="",updateString="",userName = "",compName = "",userId="0",module="0";
  String parameter="",norms="";
  
    public void setRb(String rb)  
       {  
         if(rb != null) this.rb = rb;  else this.rb = "";
       }
    public String getRb(){return rb;}
    
    
    public void setUserUploaded(String userUploaded)  
       {  
         if(userUploaded != null) this.userUploaded = userUploaded;  else this.userUploaded = "";
       }
    public String getUserUploaded(){return userUploaded;}
    public void setState(String state)
       {  
         if(state != null) this.state = state;  else  this.state = "0";
       }
    public String getState(){return state;}
    
    
    public void setSubject(String subject)  
       {  
         if(subject != null) this.subject = subject;  else this.subject = "";
       }
    public String getSubject(){return subject;}
    
    
    
    public void setAuthor(String author)  
       {  
         if(author != null) this.author = author;  else this.author = "";
       }
    public String setAuthor(){return author;}
    
    
    public void setAccessLevel(String accessLevel)  
       {  
         if(accessLevel != null) this.accessLevel = accessLevel;  else this.accessLevel = "";
       }
    public String getAccessLevel(){return accessLevel;}
    
    
  public Contact(){}
   
 public void setName(String name)  
    {  
      if(name != null) this.name = name;  else this.name = "";
    }
 public String getName(){return name;}
 
    public void setMasterId(String masterId)  
       {  
         if(masterId != null) this.masterId = masterId;  else this.masterId = "";
       }
    public String getMasterId(){return masterId;}
    
    public void setApplicationId(String applicationId)  
       {  
         if(applicationId != null) this.applicationId = applicationId;  else this.applicationId = "";
       }
    public String getApplicationId(){return applicationId;}
    
    public void setDocumentId(String documentId)  
       {  
         if(documentId != null) this.documentId = documentId;  else this.documentId = "";
       }
    public String getDocumentId(){return documentId;}
    
    public void setUploadDate(String uploadDate)  
       {  
         if(uploadDate != null) this.uploadDate = uploadDate;  else this.uploadDate = "";
       }
    public String getUploadDate(){return uploadDate;}
    
    public void setMasterCategoryId(String masterCategoryId)  
       {  
         if(masterCategoryId != null) this.masterCategoryId = masterCategoryId;  else this.masterCategoryId = "";
       }
    public String getMasterCategoryId(){return masterCategoryId;}
    
 public void setDeletePhoto(String deletePhoto)  
       {  
         if(deletePhoto != null) this.deletePhoto = deletePhoto;  else this.deletePhoto = "";
       }
    public String getDeletePhoto(){return deletePhoto;} 
 public void setPhone(String phone)  
       {  
         if(phone != null) this.phone = phone;  else this.phone = "";
       }
 public String getPhone(){return phone;} 
  public void setMobile(String mobile)  
          {  
            if(mobile != null) this.mobile = mobile;  else this.mobile = "";
          }
  public String getMobile(){return mobile;}
  
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

public void setImageName(String imageName)  
       {  
         if(imageName != null) this.imageName = imageName;  else this.imageName = "";
       }
 public String setImageName(){return imageName;}

public void setImagePath(String imagePath)
       {  
         if(imagePath != null) this.imagePath = imagePath;  else this.imagePath = "";
       }
 public String getImagePath(){return imagePath;}

    public void setRemarks(String remarks)
           {  
             if(remarks != null) this.remarks = remarks;  else this.remarks = "";
           }
     public String getRemarks(){return remarks;}

  public void setStartDate(String startdate)  
    {  
      if(startdate != null) this.startDate = startdate;  else this.startDate = "";
    }
 public String getStartDate(){return startDate;}
 
   public void setEndDate(String enddate)  
    {  
      if(enddate != null) this.endDate = enddate;  else this.endDate = "";
    }
 public String getEndDate(){return endDate;}
 
 
 public void setOffAddress(String offAddress)  
    {  
      if(offAddress != null) this.offAddress = offAddress;  else this.offAddress = "";
    }
 public String getOffAddress(){return offAddress;}
 public void setResAddress(String resAddress)  
    {  
      if(resAddress != null) this.resAddress = resAddress;  else this.resAddress = "";
    }
 public String getResAddress(){return resAddress;}
 
 public void setBuName(String buName)  
    {  
      if(buName != null) this.buName = buName;  else this.buName = "";
    }
 public String getBuName(){return buName;}

 public void setLocationCode(String locationCode)  
    {  
      if(locationCode != null) this.locationCode = locationCode;  else this.locationCode = "";
    }
 public String getLocationCode(){return locationCode;}
 public void setPinCode(String pinCode)  
    {  
      if(pinCode != null) this.pinCode = pinCode;  else this.pinCode = "";
    }
 public String getPinCode(){return pinCode;}
public void setUserName(String userName)  
    {  
      if(userName != null) this.userName = userName;  else this.userName = "";
    }
 public String getUserName(){return userName;}
 
public void setModule(String module)  
        {  
          if(module != null) this.module = module;  else this.module = "0";
        }
 public String getModule(){return module;}
 
    public void setUserId(String userId)  
        {  
          if(userId != null) this.userId = userId;  else this.userId = "0";
        }
     public String getUserId(){return userId;}
 
   public void setCompName(String compName)  
    {  
      if(compName != null) this.compName = compName;  else this.compName = "";
    }
 public String getCompName(){return compName;}
 
    public String getUserList() throws SQLException
     {
      String sql = "SELECT ID, FULL_NAME NAME FROM g_user ORDER BY NAME";
      DivisionList = BaseBean.get().getSelectHtml("dyer",sql,getUserId());
      return DivisionList;
     }
    
    public String getModuleList() throws SQLException
     {
      String sql = "SELECT ID,  NAME FROM module ORDER BY NAME";
      DivisionList = BaseBean.get().getSelectHtml("module",sql,getModule());
      return DivisionList;
     }
    
  
  
    public void insertMessage()
    {
        
    try{
    //System.out.println("inside save");
    c = new ConnectionManagers().startConnection();
    s = c.createStatement();
     int maxId=0;
          String sqlMax = "SELECT IFNULL(MAX(ID),0)+1 MAX_ID FROM t_contact";
          rs= s.executeQuery(sqlMax);
          if(rs.next()) 
           {
              maxId= rs.getInt("MAX_ID"); 
           }
           
                 sql="INSERT INTO t_contact" +
                     "(ID,NAME,EMAIL,SUBJECT,DESCRIPTION,UPLOAD_DATE) VALUES(";
                     sql = sql + maxId+",'"+name+"','"+mailId+"','"+sub+"','"+desc+"',NOW())";
             
                 s.executeUpdate(sql);      

          message="Thank you. Your Message has been sent Successfully. We will get back to you soon.";
               //System.out.println(message);
        
           
        if (s != null)
            s.close();
        if (rs != null)
            rs.close();
        if (c != null)
            c.close();
     }catch (SQLException e) 
      { 
       message="Message not sent successfully"+e.getMessage();
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
  private static String CircleList;   
  private static String DivisionList;
  private static String SubDivisionList;
  private static Connection c;
  private static Statement s;
  private static String sql;
  private static String sql1;
  private static ResultSet rs;
  private static int DMLVal;
  public static String path = "C:\\Tomcat 6.0\\webapps\\cms\\docs\\";
  public static String  dirPath="";
  private  String returnList;


    public void setPlace(String place) {
        this.place = place;
    }

    public String getPlace() {
        return place;
    }

    public void setCluster(String cluster) {
        this.cluster = cluster;
    }

    public String getCluster() {
        return cluster;
    }

    public void setConductDate(String conductDate) {
        this.conductDate = conductDate;
    }

    public String getConductDate() {
        return conductDate;
    }

    public void setMailId(String mailId) {
        this.mailId = mailId;
    }

    public String getMailId() {
        return mailId;
    }

    public void setSub(String sub) {
        this.sub = sub;
    }

    public String getSub() {
        return sub;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }

    public void setMName(String mName) {
        this.mName = mName;
    }

    public String getMName() {
        return mName;
    }

    public void setParameter(String parameter) {
        this.parameter = parameter;
    }

    public String getParameter() {
        return parameter;
    }

    public void setNorms(String norms) {
        this.norms = norms;
    }

    public String getNorms() {
        return norms;
    }

    public void setProgram(String program) {
        this.program = program;
    }

    public String getProgram() {
        return program;
    }

    public void setDName(String dName) {
        this.dName = dName;
    }

    public String getDName() {
        return dName;
    }
}

