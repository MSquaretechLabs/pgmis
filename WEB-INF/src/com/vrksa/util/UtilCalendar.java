// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   UtilCalendar.java

package com.vrksa.util;

import java.util.Calendar;
import java.util.GregorianCalendar;

class UtilCalendar extends GregorianCalendar
{

    public UtilCalendar()
    {
    }

    public long getTimeInMillis()
    {
        try
        {
            long l = super.getTimeInMillis();
            return l;
        }
        catch(Exception ex)
        {
            long l1 = -1L;
            return l1;
        }
    }
}
