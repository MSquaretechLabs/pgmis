// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SqlDatabase.java

package com.vrksa.database;

import java.io.PrintStream;
import java.util.Date;

public abstract class SqlDatabase
{

    public SqlDatabase()
    {
    }

    public static void printTypes()
    {
        System.out.println(2003);
        System.out.println(-5);
        System.out.println(-2);
        System.out.println(-7);
        System.out.println(2004);
        System.out.println(1);
        System.out.println(2005);
        System.out.println(91);
        System.out.println(3);
        System.out.println(2001);
        System.out.println(8);
        System.out.println(6);
        System.out.println(4);
        System.out.println(2000);
        System.out.println(-4);
        System.out.println(-1);
        System.out.println(0);
        System.out.println(2);
        System.out.println(1111);
        System.out.println(7);
        System.out.println(2006);
        System.out.println(5);
        System.out.println(2002);
        System.out.println(92);
        System.out.println(93);
        System.out.println(-6);
        System.out.println(-3);
        System.out.println(12);
    }

    public String toString()
    {
        return getClass().toString();
    }

    public abstract String getDateString(Date date);

    public abstract String getSchemaName(String s);

    public String getDataTypeName(short typeName, int length, int decimals)
    {
        switch(typeName)
        {
        case 1: // '\001'
        case 12: // '\f'
            return "VARCHAR2(" + length + ")";

        case 11: // '\013'
        case 91: // '['
        case 92: // '\\'
        case 93: // ']'
            return "DATE";

        case 3: // '\003'
            return "FLOAT";

        case 4: // '\004'
            return "INTEGER";

        case -1: 
            return "LONG";

        case 7: // '\007'
        case 8: // '\b'
            return "NUMBER";
        }
        System.err.println("type name " + typeName + " unknown");
        return "";
    }

    public String sqlMakeCondition(String condName, Object value)
    {
        if(value instanceof Integer)
            return condName + " " + value.toString() + " ";
        if(value == null)
            return condName;
        if(value instanceof Date)
        {
            int y = 0;
            int m = 0;
            int d = 0;
            int h = 0;
            int min = 0;
            Date dt = (Date)value;
            y = dt.getYear();
            if(y >= 70)
                y = 1900 + y;
            else
                y = 2000 + y;
            m = dt.getMonth() + 1;
            d = dt.getDate();
            h = dt.getHours();
            min = dt.getMinutes();
            return condName + " '" + y + "-" + m + "-" + d + " " + h + ":" + min + ":00" + "' ";
        } else
        {
            return condName + " '" + value.toString() + "' ";
        }
    }
}
