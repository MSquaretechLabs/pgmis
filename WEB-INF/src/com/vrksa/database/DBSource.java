// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DBSource.java

package com.vrksa.database;

import com.vrksa.util.DebugUtil;
import java.util.Enumeration;
import java.util.Vector;

// Referenced classes of package com.vrksa.database:
//            SqlDatabase, DBSourceDriver

public class DBSource
{

    protected DBSource(String id, String name, String user, String pwd, String brand)
    {
        drivers = new Vector();
        this.id = id;
        this.name = name;
        this.user = user;
        this.pwd = pwd;
        this.brand = brand;
        try
        {
            dbBrand = (SqlDatabase)Class.forName("com.vrksa.database." + brand).newInstance();
        }
        catch(Exception e)
        {
            DebugUtil.logErr("Error creating brand. Fix to set to default DB", e);
        }
    }

    public String getSchemaName(String user)
    {
        return dbBrand.getSchemaName(user);
    }

    public void addDriver(DBSourceDriver driver)
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

    public void setSelectedDriver(String drvrId)
    {
        selectedDriver = getDriver(drvrId);
    }

    public DBSourceDriver getDriver(String drvrId)
    {
        boolean notfound = true;
        int i = 0;
        DBSourceDriver drv = null;
        while(notfound && i < drivers.size()) 
        {
            drv = (DBSourceDriver)drivers.elementAt(i);
            if(drv.id.equalsIgnoreCase(drvrId))
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

    String id;
    String name;
    String user;
    String pwd;
    String brand;
    Vector drivers;
    DBSourceDriver selectedDriver;
    SqlDatabase dbBrand;
}
