// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DBConfig.java

package com.vrksa.database;

import com.vrksa.base.ApplicationContext;
import com.vrksa.util.DebugUtil;
import java.io.IOException;
import java.net.URL;
import java.util.*;

// Referenced classes of package com.vrksa.database:
//            DBSource, DBSourceDriver

public class DBConfig
{

    public DBConfig(String propFile)
        throws IOException, InstantiationException, IllegalAccessException, ClassNotFoundException
    {
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
    }

    public DBSource getSource(String dbSrc)
    {
        return (DBSource)sources.get(dbSrc);
    }

    public DBSourceDriver getDriver(String dbSrc, String dbDrvr)
    {
        DBSource src = (DBSource)sources.get(dbSrc);
        return src.getDriver(dbDrvr);
    }

    public String getUser(String dbSrc)
    {
        DBSource src = (DBSource)sources.get(dbSrc);
        return src.getUser();
    }

    public String getPassword(String dbSrc)
    {
        DBSource src = (DBSource)sources.get(dbSrc);
        return src.getPwd();
    }

    public String getURL(String dbSrc, String dbDrvr)
    {
        DBSource src = (DBSource)sources.get(dbSrc);
        DBSourceDriver drvr = src.getDriver(dbDrvr);
        return drvr.getUrl();
    }

    public String getDriverName(String dbSrc, String dbDrvr)
    {
        DBSource src = (DBSource)sources.get(dbSrc);
        DBSourceDriver drvr = src.getDriver(dbDrvr);
        return drvr.driver;
    }

    private void loadConfig(Properties p)
    {
        try
        {
            String dbList = p.getProperty("dbList", "");
            DBSource ds;
            for(StringTokenizer tkn = new StringTokenizer(dbList, ";"); tkn.hasMoreTokens(); sources.put(ds.id, ds))
            {
                String dbId = tkn.nextToken();
                ds = loadDataSource(p, dbId);
            }

        }
        catch(Exception e)
        {
            DebugUtil.logErr("Error loading configuration", e);
        }
    }

    private DBSource loadDataSource(Properties p, String dbId)
    {
        String name = p.getProperty(dbId + "_" + "Name", "");
        String user = p.getProperty(dbId + "_" + "User", "");
        String pwd = p.getProperty(dbId + "_" + "Pwd", "");
        String brand = p.getProperty(dbId + "_" + "Brand", "");
        DBSource src = new DBSource(dbId, name, user, pwd, brand);
        String drvrList = p.getProperty(dbId + "_" + "driverList", "");
        DBSourceDriver drvr;
        for(StringTokenizer tkn = new StringTokenizer(drvrList, ";"); tkn.hasMoreTokens(); src.addDriver(drvr))
        {
            String drvrId = tkn.nextToken();
            drvr = loadDataSourceDriver(p, dbId, drvrId);
        }

        return src;
    }

    private DBSourceDriver loadDataSourceDriver(Properties p, String dbId, String drvrId)
    {
        String name = p.getProperty(dbId + "_" + drvrId + "_" + "Name", "");
        String driver = p.getProperty(dbId + "_" + drvrId + "_" + "driver", "");
        String url = p.getProperty(dbId + "_" + drvrId + "_" + "url", "");
        DBSourceDriver drv = new DBSourceDriver(drvrId, name, driver, url);
        return drv;
    }

    private static final String DBLIST = "dbList";
    private static final String NAME = "Name";
    private static final String USER = "User";
    private static final String PWD = "Pwd";
    private static final String BRAND = "Brand";
    private static final String DRIVERLIST = "driverList";
    private static final String DRIVER = "driver";
    private static final String URL = "url";
    protected Hashtable sources;
}
