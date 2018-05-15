// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MicrosoftAccess.java

package com.vrksa.database;

import java.util.Date;

// Referenced classes of package com.vrksa.database:
//            SqlDatabase

public class MicrosoftAccess extends SqlDatabase
{

    public MicrosoftAccess()
    {
    }

    public String getSchemaName(String user)
    {
        return null;
    }

    public String getDateString(Date dt)
    {
        int y = 0;
        int m = 0;
        int d = 0;
        int h = 0;
        int min = 0;
        y = dt.getYear();
        if(y >= 70)
            y = 1900 + y;
        else
            y = 2000 + y;
        m = dt.getMonth() + 1;
        d = dt.getDate();
        h = dt.getHours();
        min = dt.getMinutes();
        return " #" + y + "-" + m + "-" + d + " " + h + ":" + min + ":00" + "# ";
    }
}
