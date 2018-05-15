package com.vrksa.database;

import com.vrksa.base.ApplicationContext;
import com.vrksa.util.*;
import java.io.*;
import java.net.URL;
import java.sql.*;
import java.util.*;


public class ConnectionManager
{
    protected class DataSourceDriver
    {

        public String toString()
        {
            return name;
        }

        public String getUrl()
        {
            return url;
        }

        String name;
        String driver;
        String url;

        protected DataSourceDriver(String name, String driver, String url)
        {
            this.name = name;
            this.driver = driver;
            this.url = url;
        }
    }

    protected class DataSource
    {

        public void addDriver(DataSourceDriver driver)
        {
            drivers.add(driver);
        }

        public String toString()
        {
            return name;
        }

        public String getUser()
        {
            return user;
        }

        public String getPwd()
        {
            return pwd;
        }

        public String idString()
        {
            return name + ":" + selectedDriver.name;
        }

        public Vector getDrivers()
        {
            Vector v = new Vector();
            for(Enumeration e = drivers.elements(); e.hasMoreElements(); v.add(e.nextElement()));
            return v;
        }

        public void setSelectedDriver(String driverName)
        {
            selectedDriver = getDriver(driverName);
        }

        public DataSourceDriver getDriver(String driverName)
        {
            boolean notfound = true;
            int i = 0;
            DataSourceDriver drv = null;
            while(notfound && i < drivers.size()) 
            {
                drv = (DataSourceDriver)drivers.elementAt(i);
                if(drv.name.equalsIgnoreCase(driverName))
                    notfound = false;
                else
                    i++;
            }
            return drv;
        }

        public String getSelectedDriver()
        {
            return selectedDriver.driver;
        }

        public String getSelectedURL()
        {
            return selectedDriver.url;
        }

        String name;
        String user;
        String pwd;
        String brand;
        Vector drivers;
        DataSourceDriver selectedDriver;

        protected DataSource(String name, String user, String pwd, String brand)
        {
            drivers = new Vector();
            this.name = name;
            this.user = user;
            this.pwd = pwd;
            this.brand = brand;
        }
    }


    public static Connection getConnection()
        throws SQLException, NoConnection
    {
        return mgr._getConnection();
    }

    public static void releaseConnection(Connection con)
        throws SQLException
    {
        mgr.returnConnection(con);
    }

    public ConnectionManager(String propFile, String useSource, String useDriver)
        throws IOException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException
    {
        poolSize = 0;
        issueRegister = new Hashtable();
        sources = new Hashtable();
        URL configURL = null;
        try
        {
            DebugUtil.logOut("Starting to locate properties file");
            configURL = ApplicationContext.getResource(propFile);
            if(configURL == null)
                DebugUtil.logErr("Database property file " + propFile + " not found " + " expected at location " + ApplicationContext.getRealPath(propFile));
            else
                DebugUtil.logOut("Database property file URL is " + configURL);
        }
        catch(Exception e)
        {
            DebugUtil.logErr("Error getting URL for resource", e);
        }
        Properties p = new Properties();
        p.load(configURL.openStream());
        loadConfig(p);
        this.useSource = (DataSource)sources.get(useSource);
        this.useSource.setSelectedDriver(useDriver);
        Class drvrClass = Class.forName(this.useSource.getSelectedDriver());
        sqlDriver = (Driver)drvrClass.newInstance();
        DriverManager.registerDriver(sqlDriver);
        try
        {
            logFile = new PrintWriter(new FileOutputStream("ConnPool.log", true), true);
            logFile.println();
            logFile.println();
            logFile.println("Started logging @" + DateUtil.logTimeString());
            logFile.println();
            writeLog("Properties Loaded from " + p.toString());
            writeLog("Connection Config");
            writeLog("\tSQL Driver Clas:\t" + drvrClass.toString());
            writeLog("\t\t version" + sqlDriver.getMajorVersion() + "." + sqlDriver.getMinorVersion());
            writeLog("\tdatabase URL:\t" + this.useSource.getSelectedURL());
            writeLog("\tdatabase user:\t" + this.useSource.getUser());
            writeLog("\tdatabase pwd:\t" + this.useSource.getPwd());
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
        String url = useSource.getSelectedURL();
        String user = useSource.getUser();
        String pwd = useSource.getPwd();
        DebugUtil.logOut("Connecting to database [" + url + "] as user:" + user);
        Connection con = DriverManager.getConnection(url, user, pwd);
        return con;
    }

    private void loadConfig(Properties p)
    {
        try
        {
            String dbList = p.getProperty("dbList", "");
            DataSource ds;
            for(StringTokenizer tkn = new StringTokenizer(dbList, ";"); tkn.hasMoreTokens(); sources.put(ds.name, ds))
                ds = loadDataSource(p, tkn.nextToken());

            String s = p.getProperty("InitialPoolSize");
            minPoolSize = (new Integer(s)).intValue();
            s = p.getProperty("MaxPoolSize");
            maxPoolSize = (new Integer(s)).intValue();
            s = p.getProperty("OptimalPoolSize");
            optPoolSize = (new Integer(s)).intValue();
            s = p.getProperty("MaxIsseTime");
            maxIssueTime = (new Integer(s)).intValue();
            if(minPoolSize == 0)
                minPoolSize = 2;
            if(maxPoolSize == 0)
                maxPoolSize = 4;
            if(optPoolSize == 0)
                optPoolSize = 4;
            if(maxIssueTime == 0)
                maxIssueTime = 1000;
        }
        catch(Exception e)
        {
            DebugUtil.logErr("Error loading configuration", e);
        }
    }

    private Connection _getConnection()
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

    public synchronized void returnConnection(Connection con)
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
            Connection newConn = mgr.connect();
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
            returnConnection(candidate);
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

    private DataSource loadDataSource(Properties p, String id)
    {
        String name = p.getProperty(id + "_" + "Name", "");
        String user = p.getProperty(id + "_" + "User", "");
        String pwd = p.getProperty(id + "_" + "Pwd", "");
        String brand = p.getProperty(id + "_" + "Brand", "");
        DataSource src = null. new DataSource(name, user, pwd, brand);
        String drvrList = p.getProperty(id + "_" + "driverList", "");
        DataSourceDriver drvr;
        for(StringTokenizer tkn = new StringTokenizer(drvrList, ";"); tkn.hasMoreTokens(); src.addDriver(drvr))
            drvr = loadDataSourceDriver(p, id, tkn.nextToken());

        return src;
    }

    private DataSourceDriver loadDataSourceDriver(Properties p, String srcId, String id)
    {
        String name = p.getProperty(srcId + "_" + id + "_" + "Name", "");
        String driver = p.getProperty(srcId + "_" + id + "_" + "driver", "");
        String url = p.getProperty(srcId + "_" + id + "_" + "url", "");
        DataSourceDriver drv = null. new DataSourceDriver(name, driver, url);
        return drv;
    }

    public static void main(String args[])
    {
        Connection connection;
        try
        {
            connection = getConnection();
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
    private static final String PROP_FILENAME = "database.properties";
    private static ConnectionManager mgr;
    private int minPoolSize;
    private int maxPoolSize;
    private int optPoolSize;
    private int maxIssueTime;
    private PrintWriter logFile;
    private final Stack availPool = new Stack();
    private int poolSize;
    private Hashtable issueRegister;
    protected Hashtable sources;
    protected DataSource useSource;
    protected Driver sqlDriver;

    static 
    {
        try
        {
            DebugUtil.logOut("Attempting to start connection manager");
            mgr = new ConnectionManager("database.properties", "APTransco", "Oracle(Thin)");
            DebugUtil.logOut("Connection Manager Configured");
        }
        catch(Exception e)
        {
            DebugUtil.logErr("Unable to Setup Connection Manager", e);
        }
    }
}
