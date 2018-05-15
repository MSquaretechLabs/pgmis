package lib.util;
import com.pwc.util.ConnectionManagers;
import java.sql.*;
import lib.util.DateConv;
import java.util.*;

public class MaxId 
{
  public MaxId()
  {
  }
  public static MaxId get()
  {
      if(instance == null)
        instance = new MaxId();
      return instance;
  }

  public int maxId(String tblName)
  {
  try
   {
    c = new ConnectionManagers().startConnection();
    s = c.createStatement();
    sql = "SELECT NVL(MAX(ID),0)+1 AS MAXID FROM "+tblName;
    rs = s.executeQuery(sql);
    if(rs.next())
    {
      int maxId = rs.getInt("MAXID");
      rs.close();
      s.close();
      c.close();
      return maxId;
    }else
    {
      return 0;
    }
   }
   catch (SQLException e)
   {
    e.printStackTrace();
   }
   return 0;
  }
  private static Connection c;
  private static Statement s;
  private static ResultSet rs;
  private static String sql;
  private static MaxId instance;
}