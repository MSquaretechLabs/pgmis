package com.vrksa.util;

import java.io.PrintStream;
import java.util.*;

public class DebugUtil
{

    public DebugUtil()
    {
    }

    public static String logMemoryStatus()
    {
        StringBuffer buff = new StringBuffer();
        buff.append(Runtime.getRuntime().freeMemory());
        buff.append("\\");
        buff.append(Runtime.getRuntime().totalMemory());
        return buff.toString();
    }

    public static String logTimeString()
    {
        GregorianCalendar cal = new GregorianCalendar();
        StringBuffer buff = new StringBuffer();
        buff.append(cal.get(2) + 1);
        buff.append("-");
        buff.append(cal.get(5));
        buff.append(" ");
        buff.append(cal.get(11));
        buff.append(":");
        buff.append(cal.get(12));
        buff.append(":");
        buff.append(cal.get(13));
        buff.append(".");
        buff.append(cal.get(14));
        buff.append(" ");
        buff.append(cal.getTimeZone().getDisplayName(false, 0));
        return buff.toString();
    }

    public static void printlnLog(PrintStream ps, Object o)
    {
        ps.println(logTimeString() + "\t" + logMemoryStatus() + "\t" + eventNo + "\t" + o);
    }

    public static void logErr(Object o, Exception e)
    {
        printlnLog(System.err, o);
        e.printStackTrace(System.err);
    }

    public static void logErr(Object o)
    {
        printlnLog(System.err, o);
    }

    private static void incrementEventCount()
    {
        synchronized(lock)
        {
            eventNo++;
        }
    }

    public static void logOut(Object o)
    {
        incrementEventCount();
        printlnLog(System.out, o);
    }

    public static void main(String args[])
    {
        Date start = new Date();
        for(int i = 0; i < 1000; i++)
            logOut("hello");

        Date end = new Date();
        System.out.println("done in " + (end.getTime() - start.getTime()));
    }

    private static int eventNo;
    private static Integer lock = new Integer(0);

    static 
    {
        logOut("Output log started: @" + (new GregorianCalendar()).getTime());
        logErr("Error  log started: @" + (new GregorianCalendar()).getTime());
        logOut("\tuser.home=\t" + System.getProperty("user.home"));
        logOut("\tuser.dir=\t" + System.getProperty("user.dir"));
        logOut("\tjava.home=\t" + System.getProperty("java.home"));
        logOut("\tjava.class.version=\t" + System.getProperty("java.class.version"));
        logOut("\tMemory Total=\t" + Runtime.getRuntime().totalMemory());
        logOut("\t   Available=\t" + Runtime.getRuntime().freeMemory());
    }
}
