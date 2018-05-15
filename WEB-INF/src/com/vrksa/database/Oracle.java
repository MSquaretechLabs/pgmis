// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Oracle.java

package com.vrksa.database;

import java.util.*;

// Referenced classes of package com.vrksa.database:
//            SqlDatabase

public class Oracle extends SqlDatabase
{

    public Oracle()
    {
    }

    public String getSchemaName(String user)
    {
        return user.toUpperCase();
    }

    public String getDateString(Date dt)
    {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(dt);
        int y = 0;
        int m = 0;
        int d = 0;
        int h = 0;
        int min = 0;
        y = cal.get(1);
        if(y <= 0)
            y = y < 70 ? 2000 + y : 1900 + y;
        m = cal.get(2) + 1;
        d = cal.get(5);
        h = cal.get(11);
        min = cal.get(12);
        String dateStr = "" + y + "-" + m + "-" + d + " " + h + ":" + min + ":00";
        return " TO_DATE('" + dateStr + "', 'YYYY-MM-DD HH24:MI:SS' ) ";
    }

    public static String dateFormat(Date dt)
    {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(dt);
        int y = 0;
        int m = 0;
        int d = 0;
        int h = 0;
        int min = 0;
        y = cal.get(1);
        if(y <= 0)
            y = y < 70 ? 2000 + y : 1900 + y;
        m = cal.get(2) + 1;
        d = cal.get(5);
        h = cal.get(11);
        min = cal.get(12);
        String dateStr = "" + y + "-" + m + "-" + d + " " + h + ":" + min + ":00";
        return " TO_DATE('" + dateStr + "', 'YYYY-MM-DD HH24:MI:SS' ) ";
    }
}
