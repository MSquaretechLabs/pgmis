// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DBSourceDriver.java

package com.vrksa.database;


public class DBSourceDriver
{

    public DBSourceDriver(String id, String name, String driver, String url)
    {
        this.id = id;
        this.name = name;
        this.driver = driver;
        this.url = url;
    }

    public String toString()
    {
        return name;
    }

    public String getUrl()
    {
        return url;
    }

    String id;
    String name;
    String driver;
    String url;
}
