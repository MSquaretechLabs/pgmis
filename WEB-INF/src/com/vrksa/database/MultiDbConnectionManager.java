// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MultiDbConnectionManager.java

package com.vrksa.database;

import com.vrksa.database.sql.defn.Table;
import com.vrksa.util.*;
import java.io.*;
import java.sql.*;
import java.util.*;

// Referenced classes of package com.vrksa.database:
//            NoConnection, DBConfig, DBSource, ConnectionManager, 
//            DBSourceDriver, SqlDatabase

public class MultiDbConnectionManager
{

    public MultiDbConnectionManager(String dbSrc, String dbDrvr)
        throws IOException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException
    {
        connectors = new Hashtable();
        minPoolSize = 2;
        maxPoolSize = 6;
        optPoolSize = 3;
        maxIssueTime = 2000;
        poolSize = 0;
        issueRegister = new Hashtable();
        sources = new Hashtable();
        user = dbConfig.getUser(dbSrc);
        pwd = dbConfig.getPassword(dbSrc);
        url = dbConfig.getURL(dbSrc, dbDrvr);
        source = dbConfig.getSource(dbSrc);
        driver = dbConfig.getDriver(dbSrc, dbDrvr);
        Class drvrClass = Class.forName(dbConfig.getDriverName(dbSrc, dbDrvr));
        sqlDriver = (Driver)drvrClass.newInstance();
        DriverManager.registerDriver(sqlDriver);
        try
        {
            logFile = new PrintWriter(new FileOutputStream("ConnPool.log", true), true);
            logFile.println();
            logFile.println();
            logFile.println("Started logging @" + DateUtil.logTimeString());
            logFile.println();
            writeLog("Properties Loaded from ");
            writeLog("Connection Config");
            writeLog("\tSQL Driver Clas:\t" + drvrClass.toString());
            writeLog("\t\t version" + sqlDriver.getMajorVersion() + "." + sqlDriver.getMinorVersion());
            writeLog("\tdatabase URL:\t" + url);
            writeLog("\tdatabase user:\t" + user);
            writeLog("\tdatabase pwd:\t" + pwd);
            writeLog("Initializing pool ");
            writeLog("\tminPool " + minPoolSize);
            writeLog("\tmaxPool " + maxPoolSize);
            writeLog("\toptPool " + optPoolSize);
            writeLog("\tmaxIssue " + maxIssueTime);
        }
        catch(IOException ioe)
        {
            System.err.println("Unable to open JDBC Manager Log file");
            System.err.println(ioe);
            ioe.printStackTrace(System.err);
        }
    }

    public String getUserSchemaName()
    {
        return source.getSchemaName(user);
    }

    public SqlDatabase getBrand()
    {
        return source.dbBrand;
    }

    private void writeLog(Object o)
    {
        if(logFile != null)
            try
            {
                logFile.println(DateUtil.logTimeString() + o.toString());
            }
            catch(Exception e)
            {
                System.err.println("Error writing log file");
                e.printStackTrace(System.err);
                logFile = null;
            }
    }

    private String simpleConName(Connection con)
    {
        return TextUtility.replace(con.toString(), "oracle.jdbc.driver.OracleConnection", "");
    }

    private void writeLog(String event, Connection con, String extra)
    {
        if(logFile != null)
            try
            {
                StringBuffer b = new StringBuffer(512);
                b.append(DateUtil.logTimeString());
                b.append("\t");
                b.append(simpleConName(con));
                b.append("\t");
                b.append(event);
                b.append("\t");
                b.append(poolSize);
                b.append(" : ");
                b.append(availPool.size());
                b.append(" : ");
                b.append(issueRegister.size());
                b.append("\t");
                b.append(extra);
                logFile.println(b.toString());
            }
            catch(Exception e)
            {
                DebugUtil.logErr("Error writing log file", e);
                logFile = null;
            }
    }

    public Connection connect()
        throws SQLException
    {
        DebugUtil.logOut("Connecting to database [" + url + "] as user:" + user);
        Connection con = DriverManager.getConnection(url, user, pwd);
        return con;
    }

    public Connection getConnection()
        throws SQLException, NoConnection
    {
        for(int i = 0; i < 3; i++)
            try
            {
                Connection connection = issueConnection();
                return connection;
            }
            catch(NoConnection e)
            {
                reclaim();
            }

        throw new NoConnection("Unable to issue connection to client");
    }

    private synchronized Connection issueConnection()
        throws SQLException, NoConnection
    {
        if(availPool.empty())
        {
            if(poolSize == maxPoolSize)
                throw new NoConnection("Pool full");
            growPool();
        }
        try
        {
            Connection con = (Connection)availPool.pop();
            Date timeIssued = new Date();
            synchronized(issueRegister)
            {
                issueRegister.put(timeIssued, con);
            }
            writeLog("Issue", con, "");
            Connection connection = con;
            return connection;
        }
        catch(EmptyStackException ese)
        {
            throw new NoConnection("Failed trying to pop from stack");
        }
    }

    public synchronized void releaseConnection(Connection con)
        throws SQLException
    {
        if(removeFromRegister(con))
            if(availPool.size() >= optPoolSize)
            {
                con.close();
                poolSize--;
            } else
            {
                availPool.push(con);
            }
        writeLog("Return", con, "");
    }

    private void growPool()
        throws SQLException
    {
        try
        {
            GregorianCalendar cal = new GregorianCalendar();
            long start = cal.getTime().getTime();
            Connection newConn = connect();
            poolSize++;
            availPool.push(newConn);
            cal = new GregorianCalendar();
            long diff = cal.getTime().getTime() - start;
            writeLog("New", newConn, "opened in " + (float)diff / 1000F + " seconds");
        }
        catch(SQLException sqlE)
        {
            DebugUtil.logErr("Error while growing pool", sqlE);
            throw sqlE;
        }
    }

    protected synchronized void reclaim()
        throws SQLException
    {
        Enumeration keys = issueRegister.keys();
        Connection candidate = null;
        long maxAge = 0L;
        Date crntTime = new Date();
        do
        {
            if(!keys.hasMoreElements())
                break;
            Date dt = (Date)keys.nextElement();
            long thisAge = crntTime.getTime() - dt.getTime();
            if(thisAge > maxAge)
            {
                candidate = (Connection)issueRegister.get(dt);
                maxAge = thisAge;
            }
        } while(true);
        if((candidate != null) & (maxAge > (long)maxIssueTime))
        {
            writeLog("Force", candidate, " age was" + maxAge);
            releaseConnection(candidate);
        } else
        {
            writeLog("No connection reclaimed max age=" + maxAge);
        }
    }

    private synchronized boolean removeFromRegister(Connection checkFor)
    {
        for(Enumeration keys = issueRegister.keys(); keys.hasMoreElements();)
        {
            Date dt = (Date)keys.nextElement();
            Connection con = (Connection)issueRegister.get(dt);
            if(checkFor == con)
            {
                synchronized(issueRegister)
                {
                    issueRegister.remove(dt);
                }
                return true;
            }
        }

        writeLog("Error", checkFor, " Not in register");
        return false;
    }

    public void createTable(Table tbl)
        throws NoConnection, SQLException
    {
        DebugUtil.logOut("Creating table " + tbl.getKey() + " in database " + url);
        Connection con = null;
        Statement st = null;
        try
        {
            con = getConnection();
            st = con.createStatement();
            String s = tbl.sqlCreate(getBrand());
            st.execute(s);
        }
        finally
        {
            if(st != null)
                st.close();
            releaseConnection(con);
        }
    }

    public static void main(String args[])
    {
        Connection connection;
        try
        {
            connection = ConnectionManager.getConnection();
        }
        catch(Exception e)
        {
            System.err.println(e);
        }
    }

    private static final String DBLIST = "dbList";
    private static final String NAME = "Name";
    private static final String USER = "User";
    private static final String PWD = "Pwd";
    private static final String BRAND = "Brand";
    private static final String DRIVERLIST = "driverList";
    private static final String DRIVER = "driver";
    private static final String URL = "url";
    private static final String POOL_INIT = "InitialPoolSize";
    private static final String POOL_MAX = "MaxPoolSize";
    private static final String POOL_OPTIMAL = "OptimalPoolSize";
    private static final String POOL_RECLAIM = "MaxIsseTime";
    private static final String EVENT_Return = "Return";
    private static final String EVENT_Issue = "Issue";
    private static final String EVENT_New = "New";
    private static final String EVENT_Destroy = "Close";
    private static final String EVENT_Reclaim = "Force";
    private static final String EVENT_Error = "Error";
    private static final String PROP_FILENAME = "system.properties";
    private Hashtable connectors;
    private static DBConfig dbConfig;
    private int minPoolSize;
    private int maxPoolSize;
    private int optPoolSize;
    private int maxIssueTime;
    private PrintWriter logFile;
    private final Stack availPool = new Stack();
    private int poolSize;
    private Hashtable issueRegister;
    protected Hashtable sources;
    protected DBSource source;
    protected DBSourceDriver driver;
    protected String user;
    protected String pwd;
    protected String url;
    protected Driver sqlDriver;

    static 
    {
        try
        {
            dbConfig = new DBConfig("system.properties");
        }
        catch(Exception e)
        {
            DebugUtil.logErr("Error creating dbConfig Object", e);
        }
    }
}
