package mypackage3.com.vrksa.util;

import java.text.*;
import java.util.*;

// Referenced classes of package com.vrksa.util:
//            UtilCalendar

public class DateUtil
{

    public DateUtil()
    {
    }

    public static final int GregorianMonthFromName(String name)
    {
        name = name.toLowerCase();
        if(name.equals("jan"))
            return 0;
        if(name.equals("feb"))
            return 1;
        if(name.equals("mar"))
            return 2;
        if(name.equals("apr"))
            return 3;
        if(name.equals("may"))
            return 4;
        if(name.equals("jun"))
            return 5;
        if(name.equals("jul"))
            return 6;
        if(name.equals("aug"))
            return 7;
        if(name.equals("sep"))
            return 8;
        if(name.equals("oct"))
            return 9;
        if(name.equals("nov"))
            return 10;
        return !name.equals("dec") ? -1 : 11;
    }

    public static Date getMonthStart(int year, int month)
    {
        GregorianCalendar cal = new GregorianCalendar(year, month, 1, 0, 0, 0);
        return cal.getTime();
    }

    public static Date getMonthStart(Date dt)
    {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(dt);
        return getMonthStart(cal.get(1), cal.get(2));
    }

    public static Date getMonthEnd(int year, int month)
    {
        GregorianCalendar cal = new GregorianCalendar(year, month, 1, 23, 59, 59);
        cal.set(5, cal.getActualMaximum(5));
        return cal.getTime();
    }

    public static Date getMonthEnd(Date dt)
    {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(dt);
        return getMonthEnd(cal.get(1), cal.get(2));
    }

    public static Date getDayStart(Date dt)
    {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(dt);
        cal.set(11, 0);
        cal.set(12, 0);
        cal.set(13, 0);
        cal.set(14, 0);
        return cal.getTime();
    }

    public static Date parse(String value, DateFormat fmt[])
    {
        if(value == null)
            return null;
        for(int i = 0; i < fmt.length;)
            try
            {
                Date dt = fmt[i].parse(value);
                Date date = dt;
                return date;
            }
            catch(ParseException e)
            {
                i++;
            }
            catch(Exception e)
            {
                i++;
            }

        return null;
    }

    public static Date parseDateTime(String value)
    {
        Date dt = parse(value, fmtDateTime);
        if(dt == null)
            dt = parse(value, fmtDate);
        return dt;
    }

    public static Date parse(String value, int format)
    {
        if(value == null)
            return null;
        switch(format)
        {
        case 0: // '\0'
            Date dt = parse(value, fmtDate);
            if(dt == null)
                dt = parse(value, fmtDateTime);
            return dt;

        case 1: // '\001'
        case 2: // '\002'
            return parseDateTime(value);

        case 3: // '\003'
            return parse(value, fmtTime);
        }
        return null;
    }

    public static String getMediumDate(Date dt)
    {
        return fmtDate[2].format(dt);
    }

    public static String getMediumDateTime(Date dt)
    {
        return fmtDateTime[2].format(dt);
    }

    public static String getSimpleDate(Date dt)
    {
        return fmtDate[3].format(dt);
    }

    public static String getSimpleTime(Date dt)
    {
        return fmtTime[3].format(dt);
    }

    public static String getSimpleDateTime(Date dt)
    {
        return fmtDateTime[3].format(dt);
    }

    public static Calendar getUKStyleLongDateCalendar(String dateStr, boolean strict)
        throws ParseException
    {
        StringTokenizer dateParts = new StringTokenizer(dateStr, " ");
        if(strict && dateParts.countTokens() != 4)
            throw new ParseException("Incorrect UKStyle Long Date", dateParts.countTokens());
        int day;
        int month;
        int year;
        int hour;
        int minute;
        if(dateParts.hasMoreElements())
        {
            String s = (String)dateParts.nextElement();
            s = s.substring(0, s.length() - 2);
            day = (new Integer(s)).intValue();
            if(dateParts.hasMoreElements())
            {
                s = (String)dateParts.nextElement();
                month = GregorianMonthFromName(s);
                if(dateParts.hasMoreElements())
                {
                    s = (String)dateParts.nextElement();
                    year = (new Integer(s)).intValue();
                    if(dateParts.hasMoreElements())
                    {
                        s = (String)dateParts.nextElement();
                        s = s.substring(0, 5);
                        StringTokenizer timeParts = new StringTokenizer(s, ":");
                        if(timeParts.hasMoreElements())
                        {
                            s = (String)timeParts.nextElement();
                            hour = (new Integer(s)).intValue();
                            if(timeParts.hasMoreElements())
                            {
                                s = (String)timeParts.nextElement();
                                minute = (new Integer(s)).intValue();
                            } else
                            {
                                minute = 0;
                            }
                        } else
                        {
                            hour = 0;
                            minute = 0;
                        }
                    } else
                    {
                        hour = 0;
                        minute = 0;
                    }
                } else
                {
                    year = 1;
                    hour = 0;
                    minute = 0;
                }
            } else
            {
                month = 1;
                year = 1;
                hour = 0;
                minute = 0;
            }
        } else
        {
            day = 1;
            month = 1;
            year = 1;
            hour = 0;
            minute = 0;
        }
        return new GregorianCalendar(year, month, day, hour, minute);
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

    public static double DateDiff(int units, Date dateFrom, Date dateTo)
    {
        UtilCalendar calFrom = new UtilCalendar();
        calFrom.setTime(dateFrom);
        UtilCalendar calTo = new UtilCalendar();
        calTo.setTime(dateTo);
        long diffInMillis = calTo.getTimeInMillis() - calFrom.getTimeInMillis();
        switch(units)
        {
        case 5: // '\005'
            return (double)(diffInMillis / (long)0x5265c00);

        case 10: // '\n'
            return (double)(diffInMillis / (long)0x36ee80);

        case 12: // '\f'
            return (double)(diffInMillis / (long)60000);

        case 13: // '\r'
            return (double)(diffInMillis / (long)1000);

        case 14: // '\016'
            return (double)(diffInMillis / (long)1);

        case 6: // '\006'
        case 7: // '\007'
        case 8: // '\b'
        case 9: // '\t'
        case 11: // '\013'
        default:
            return 0.0D;
        }
    }

    public static long longDateDiff(int units, Date dateFrom, Date dateTo)
    {
        Double dblDiff = new Double(DateDiff(units, dateFrom, dateTo));
        return dblDiff.longValue();
    }

    static GregorianCalendar systemCalendar = new GregorianCalendar();
    public static DateFormat fmtDate[];
    public static DateFormat fmtDateTime[];
    public static DateFormat fmtTime[];
    public static SimpleDateFormat sdf;
    public static final int DATE_DateOnly = 0;
    public static final int DATE_DateTime = 1;
    public static final int DATE_Precise = 2;
    public static final int DATE_TimeOnly = 3;

    static 
    {
        fmtDate = new DateFormat[6];
        fmtDateTime = new DateFormat[8];
        fmtTime = new DateFormat[4];
        fmtDate[0] = DateFormat.getDateInstance(0);
        fmtDate[1] = DateFormat.getDateInstance(1);
        fmtDate[2] = DateFormat.getDateInstance(2);
        fmtDate[3] = DateFormat.getDateInstance(3);
        fmtDate[4] = new SimpleDateFormat();
        sdf = (SimpleDateFormat)fmtDate[4];
        sdf.applyPattern("yyyy-MM-dd");
        fmtDate[5] = new SimpleDateFormat();
        sdf = (SimpleDateFormat)fmtDate[5];
        sdf.applyPattern("MMM dd yyyy");
        fmtTime[3] = DateFormat.getTimeInstance(3);
        fmtTime[2] = DateFormat.getTimeInstance(2);
        fmtTime[1] = DateFormat.getTimeInstance(1);
        fmtTime[0] = DateFormat.getTimeInstance(0);
        fmtDateTime[3] = DateFormat.getDateTimeInstance(3, 3);
        fmtDateTime[2] = DateFormat.getDateTimeInstance(2, 2);
        fmtDateTime[1] = DateFormat.getDateTimeInstance(1, 1);
        fmtDateTime[0] = DateFormat.getDateTimeInstance(0, 0);
        fmtDateTime[4] = new SimpleDateFormat();
        fmtDateTime[5] = new SimpleDateFormat();
        fmtDateTime[6] = new SimpleDateFormat();
        fmtDateTime[7] = new SimpleDateFormat();
        sdf = (SimpleDateFormat)fmtDateTime[4];
        sdf.applyPattern("yyyy-MM-dd H:mm:ss");
        sdf = (SimpleDateFormat)fmtDateTime[5];
        sdf.applyPattern("MMM dd yyyy H:mm:ss");
        sdf = (SimpleDateFormat)fmtDateTime[6];
        sdf.applyPattern("yyyy-MM-dd H:mm:ss.S");
        sdf = (SimpleDateFormat)fmtDateTime[7];
        sdf.applyPattern("MMM dd yyyy H:mm:ss.S");
    }
}
