package lib.util;

import com.pwc.util.ConnectionManagers;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Authenticate
{


    private String  userLevel,moduleID,title,gender,fname,remarks,place,state,country,mobile,altcontact,email,
        occup,identity,desg,username,password,cpassword,userid,whetherVerifyAuthority,userRight,businessUnit="";
    String userId="",userName="",fullName = "",adminId="", adminType="";
    
    private int ID;
    private int ID1;
     
    ResultSet rs=null;
    Statement st=null;
    Connection conn=null;  
    

    
    public void setUserLevel(String userLevel)
    {
        this.userLevel = userLevel;
    }

    public String getUserLevel() {
        return userLevel;
    }
    public void setUserId( String userId)
       {  
         if(userId != null) this.userId = userId;  else  userId = "";
       }
    public String getUserId(){return userId;}
    
    public void setBusinessUnit(String businessUnit)
        {  
          if(businessUnit != null) this.businessUnit = businessUnit;  else  businessUnit = "";
        }
    public String getBusinessUnit(){return businessUnit;}
    
    public void setUserName( String userName)
      {  
        if(userName != null) this.userName = userName;  else  userName = "";
      }
    public String getUserName(){return userName;}

      public void setFullName( String fullName)
         {  
           if(fullName != null) this.fullName = fullName;  else  fullName = "";
         }
      public String getFullName(){return fullName;}
    public void setAdminType( String adminType)
      {  
        if(adminType != null) this.adminType = adminType;  else  adminType = "";
      }
    public String getAdminType(){return adminType;}

    public void setAdminId( String adminId)
      {  
        if(adminId != null) this.adminId = adminId;  else  adminId = "";
      }
    public String getAdminId(){return adminId;}

    public void setUserRight( String userRight)
      {  
        if(userRight != null) this.userRight = userRight;  else  userRight = "";
      }
    public String getUserRight(){return userRight;}
    
    public void setModuleID(String moduleID) {
        this.moduleID = moduleID;
    }

    public String getModuleID() {
        return moduleID;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getGender() {
        return gender;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getFname() {
        return fname;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getPlace() {
        return place;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getState() {
        return state;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCountry() {
        return country;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getMobile() {
        return mobile;
    }

    public void setAltcontact(String altcontact) {
        this.altcontact = altcontact;
    }

    public String getAltcontact() {
        return altcontact;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setOccup(String occup) {
        this.occup = occup;
    }

    public String getOccup() {
        return occup;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getIdentity() {
        return identity;
    }

    public void setDesg(String desg) {
        this.desg = desg;
    }

    public String getDesg() {
        return desg;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setCpassword(String cpassword) {
        this.cpassword = cpassword;
    }

    public String getCpassword() {
        return cpassword;
    }
 

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        Authenticate authenticate = new Authenticate();
    }
    private static Authenticate instance;

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUserid() {
        return userid;
    }

    public void setWhetherVerifyAuthority(String whetherVerifyAuthority) {
        this.whetherVerifyAuthority = whetherVerifyAuthority;
    }

    public String getWhetherVerifyAuthority() {
        return whetherVerifyAuthority;
    }

   

}
