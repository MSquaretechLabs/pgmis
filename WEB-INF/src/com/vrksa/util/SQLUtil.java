// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SQLUtil.java

package com.vrksa.util;

import java.sql.*;

public class SQLUtil
{

    public SQLUtil()
    {
    }

    public static String detailedResultMetaDataReport(ResultSet rs)
        throws SQLException
    {
        ResultSetMetaData md = rs.getMetaData();
        StringBuffer b = new StringBuffer(10000);
        b.append("Metadata report for result set ");
        b.append(rs.toString());
        b.append("\n");
        for(int i = 1; i <= md.getColumnCount(); i++)
        {
            b.append(md.getTableName(i));
            b.append("\t");
            b.append(md.getColumnName(i));
            b.append("\t");
            b.append(md.getColumnTypeName(i));
            b.append("\t");
            b.append(md.getColumnLabel(i));
            b.append("\t");
            b.append(md.getPrecision(i));
            b.append("\t");
            b.append(md.getScale(i));
            b.append("\t");
            b.append(md.getCatalogName(i));
            b.append("\t");
            b.append(typeName(md.getColumnType(i)));
            b.append("\t");
        }

        return b.toString();
    }

    public static String typeName(int sqlType)
    {
        switch(sqlType)
        {
        case -7: 
            return "BIT";

        case -6: 
            return "TINYINT";

        case 5: // '\005'
            return "SMALLINT";

        case 4: // '\004'
            return "INTEGER";

        case -5: 
            return "BIGINT";

        case 6: // '\006'
            return "FLOAT";

        case 7: // '\007'
            return "REAL";

        case 8: // '\b'
            return "DOUBLE";

        case 2: // '\002'
            return "NUMERIC";

        case 3: // '\003'
            return "DECIMAL";

        case 1: // '\001'
            return "CHAR";

        case 12: // '\f'
            return "VARCHAR";

        case -1: 
            return "LONGVARCHAR";

        case 91: // '['
            return "DATE";

        case 92: // '\\'
            return "TIME";

        case 93: // ']'
            return "TIMESTAMP";

        case -2: 
            return "BINARY";

        case -3: 
            return "VARBINARY";

        case -4: 
            return "LONGVARBINARY";

        case 0: // '\0'
            return "NULL";

        case 1111: 
            return "OTHER";

        case 2000: 
            return "JAVA_OBJECT";

        case 2001: 
            return "DISTINCT";

        case 2002: 
            return "STRUCT";

        case 2003: 
            return "ARRAY";

        case 2004: 
            return "BLOB";

        case 2005: 
            return "CLOB";

        case 2006: 
            return "REF";
        }
        return "type " + sqlType;
    }

    public static void parseSelect(String s)
    {
    }
}
