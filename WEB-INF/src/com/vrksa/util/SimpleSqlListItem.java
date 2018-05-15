// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SimpleSqlListItem.java

package com.vrksa.util;

import com.vrksa.util.html.HTMLListItem;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SimpleSqlListItem
    implements HTMLListItem
{

    public SimpleSqlListItem(ResultSet rs)
    {
        this.rs = rs;
    }

    public String getItemName(Object obj)
    {
        try
        {
            String s = rs.getString(2);
            return s;
        }
        catch(SQLException e)
        {
            e.printStackTrace(System.err);
        }
        String s1 = ">>Error<<";
        return s1;
    }

    public String getItemId(Object obj)
    {
        try
        {
            String s = rs.getString(1);
            return s;
        }
        catch(SQLException e)
        {
            e.printStackTrace(System.err);
        }
        String s1 = "-1";
        return s1;
    }

    ResultSet rs;
}
