// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DutySchedule.java

package com.vrksa.util;

import com.vrksa.database.*;
import java.io.PrintStream;
import java.sql.*;
import java.util.*;

public class DutySchedule
    implements Comparator
{
    public class Duty
    {

        protected void setElement(Object o)
        {
            element = o;
            elemStr = o.toString();
        }

        public Date getDate()
        {
            return from;
        }

        public Object getElement()
        {
            return element;
        }

        protected String sqlInsert()
        {
            return "Insert Into " + table + " (" + ownerColumn + ", " + "From_Date" + ", " + refKEY + ")" + " values ('" + ownerValue + "'," + Oracle.dateFormat(from) + ", '" + element + "')";
        }

        protected String sqlDelete()
        {
            return "Delete from " + table + " where " + ownerColumn + "='" + ownerValue + "' and " + "From_Date" + "=" + Oracle.dateFormat(from);
        }

        protected String sqlUpdate()
        {
            return "Update " + table + " set " + refKEY + "='" + element + "'" + " where " + ownerColumn + "='" + ownerValue + "' and " + "From_Date" + "=" + Oracle.dateFormat(from);
        }

        Date from;
        Object element;
        String elemStr;

        protected Duty(Object o, Date from)
        {
            this.from = from;
            setElement(o);
        }
    }


    public DutySchedule(String table, String refKEY, String ownerColumn, String ownerValue)
        throws SQLException, NoConnection
    {
        duties = new Vector();
        removed = new Vector();
        added = new Vector();
        updated = new Vector();
        this.table = table;
        this.refKEY = refKEY;
        this.ownerColumn = ownerColumn;
        this.ownerValue = ownerValue;
        init();
    }

    protected void init()
        throws SQLException, NoConnection
    {
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;
        String sql = sqlSelect();
        try
        {
            c = ConnectionManager.getConnection();
            s = c.createStatement();
            Duty d;
            for(rs = s.executeQuery(sql); rs.next(); duties.add(d))
            {
                Date from = new Date(rs.getDate("From_Date").getTime());
                Object element = rs.getString(refKEY);
                d = new Duty(element, from);
            }

            Collections.sort(duties, this);
        }
        finally
        {
            if(rs != null)
                rs.close();
            if(s != null)
                s.close();
            if(c != null)
                ConnectionManager.releaseConnection(c);
        }
    }

    public void save()
        throws SQLException, NoConnection
    {
        String sql = null;
        Connection c = null;
        Statement s = null;
        try
        {
            c = ConnectionManager.getConnection();
            s = c.createStatement();
            for(int index = 0; index < removed.size(); index++)
            {
                Duty d = (Duty)removed.elementAt(index);
                sql = d.sqlDelete();
                s.execute(sql);
            }

            removed.removeAllElements();
            for(int index = 0; index < updated.size(); index++)
            {
                Duty d = (Duty)updated.elementAt(index);
                sql = d.sqlUpdate();
                s.execute(sql);
            }

            updated.removeAllElements();
            for(int index = 0; index < added.size(); index++)
            {
                Duty d = (Duty)added.elementAt(index);
                sql = d.sqlInsert();
                s.execute(sql);
            }

            added.removeAllElements();
        }
        finally
        {
            if(s != null)
                s.close();
            if(c != null)
                ConnectionManager.releaseConnection(c);
        }
    }

    public void testPrintSql()
    {
        Duty d = (Duty)duties.elementAt(0);
        System.out.println(sqlSelect());
        System.out.println(d.sqlInsert());
        System.out.println(d.sqlUpdate());
        System.out.println(d.sqlDelete());
    }

    public void add(String o, Date from)
    {
        Duty d = new Duty(o, from);
        duties.add(d);
        added.add(d);
        Collections.sort(duties, this);
    }

    public void update(Object o, Date from)
    {
        Duty d = getDuty(from);
        d.setElement(o);
        updated.add(d);
    }

    public void remove(Date from)
    {
        for(int i = duties.size() - 1; i >= 0; i--)
        {
            Duty d = (Duty)duties.elementAt(i);
            long diff = from.getTime() - d.from.getTime();
            if(diff != (long)0)
                continue;
            duties.remove(i);
            if(added.contains(d))
                added.remove(d);
            else
                removed.add(d);
            Collections.sort(duties, this);
        }

    }

    public Object[][] getDuties()
    {
        Object details[][] = new Object[duties.size()][2];
        for(int i = 0; i < duties.size(); i++)
        {
            Duty d = (Duty)duties.elementAt(i);
            details[i][0] = d.from;
            details[i][1] = d.element;
        }

        return details;
    }

    public Object elementOnDuty(Date onDate)
    {
        Duty d = getDuty(onDate);
        return d == null ? null : d.element;
    }

    public Vector getElementsOnDuty(Date fromDate, Date toDate)
    {
        int fromIndex = getDutyIndex(fromDate);
        int toIndex = getDutyIndex(toDate);
        Vector v = new Vector();
        if(fromIndex == -1)
            fromIndex = 0;
        for(int i = fromIndex; i <= toIndex; i++)
        {
            Object detail[] = new Object[2];
            Duty d = (Duty)duties.elementAt(i);
            detail[0] = d.from;
            detail[1] = d.element;
            v.add(((Object) (detail)));
        }

        return v;
    }

    public Duty getDuty(Date onDate)
    {
        for(int i = duties.size() - 1; i >= 0; i--)
        {
            Duty d = (Duty)duties.elementAt(i);
            long diff = onDate.getTime() - d.from.getTime();
            if(diff >= (long)0)
                return d;
        }

        return null;
    }

    protected int getDutyIndex(Date onDate)
    {
        for(int i = duties.size() - 1; i >= 0; i--)
        {
            Duty d = (Duty)duties.elementAt(i);
            long diff = onDate.getTime() - d.from.getTime();
            if(diff >= (long)0)
                return i;
        }

        return -1;
    }

    public int compare(Object o1, Object o2)
        throws ClassCastException
    {
        Duty d1 = (Duty)o1;
        Duty d2 = (Duty)o2;
        long diff = d1.from.getTime() - d2.from.getTime();
        if(diff > (long)0)
            return 1;
        if(diff == (long)0)
            return 0;
        return diff >= (long)0 ? 1 : -1;
    }

    public boolean equals(Object obj)
    {
        if(obj instanceof DutySchedule)
            return false;
        else
            return obj == this;
    }

    protected String sqlSelect()
    {
        return "Select " + refKEY + ", " + "From_Date" + " from " + table + " Where " + ownerColumn + "='" + ownerValue + "'";
    }

    public static void main(String args[])
    {
        GregorianCalendar gc = new GregorianCalendar();
        DutySchedule ds = null;
        try
        {
            ds = new DutySchedule("MP_METERING", "METER", "METERING_POINT", "526");
            ds.add("4", (new GregorianCalendar(2001, 11, 1)).getTime());
            ds.add("2", (new GregorianCalendar(2001, 9, 1)).getTime());
            ds.add("1", (new GregorianCalendar(2001, 8, 1)).getTime());
            ds.add("3", (new GregorianCalendar(2001, 10, 1)).getTime());
            ds.save();
            System.out.println(ds.elementOnDuty((new GregorianCalendar(2001, 11, 15)).getTime()));
            System.out.println(ds.elementOnDuty((new GregorianCalendar(2001, 10, 15)).getTime()));
            System.out.println(ds.elementOnDuty((new GregorianCalendar(2001, 9, 15)).getTime()));
            System.out.println(ds.elementOnDuty((new GregorianCalendar(2001, 8, 15)).getTime()));
            System.out.println();
            System.out.println(ds.elementOnDuty((new GregorianCalendar(2001, 11, 1)).getTime()));
            System.out.println(ds.elementOnDuty((new GregorianCalendar(2001, 10, 1)).getTime()));
            System.out.println(ds.elementOnDuty((new GregorianCalendar(2001, 9, 1)).getTime()));
            System.out.println(ds.elementOnDuty((new GregorianCalendar(2001, 8, 1)).getTime()));
            System.out.println();
            System.out.println(ds.elementOnDuty((new GregorianCalendar(2001, 11, 31)).getTime()));
            System.out.println(ds.elementOnDuty((new GregorianCalendar(2001, 10, 30)).getTime()));
            System.out.println(ds.elementOnDuty((new GregorianCalendar(2001, 9, 31)).getTime()));
            System.out.println(ds.elementOnDuty((new GregorianCalendar(2001, 8, 30)).getTime()));
            System.out.println();
            System.out.println(ds.elementOnDuty((new GregorianCalendar(2002, 0, 31)).getTime()));
            System.out.println();
            System.out.println(ds.elementOnDuty((new GregorianCalendar(2001, 0, 31)).getTime()));
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }

    public static final String COL_FROM_DATE = "From_Date";
    Vector duties;
    Vector removed;
    Vector added;
    Vector updated;
    String table;
    String refKEY;
    String ownerColumn;
    String ownerValue;
}
