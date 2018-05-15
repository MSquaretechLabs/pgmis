// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Table.java

package com.vrksa.database.sql.defn;

import com.vrksa.database.*;
import java.io.PrintStream;
import java.sql.*;
import java.util.Hashtable;
import java.util.Vector;

public class Table
{
    protected class Key
    {

        String column;
        short seq;
        String keyName;

        protected Key()
        {
        }
    }

    protected class Column
    {

        public String sqlDefn(SqlDatabase db)
        {
            StringBuffer b = new StringBuffer(name);
            b.append(" ");
            String d = db.getDataTypeName(dataType, size, decimals);
            if(d.length() == 0)
            {
                System.out.println("Column" + name + " data type " + dataType + " " + typeName + " not found");
                d = typeName;
            }
            b.append(d);
            return b.toString();
        }

        public String getKey()
        {
            return name;
        }

        String name;
        String typeName;
        String remarks;
        short dataType;
        int size;
        int decimals;
        boolean nullable;

        protected Column()
        {
        }
    }


    public static Table[] getSchemaTables(MultiDbConnectionManager mgr)
        throws NoConnection, SQLException
    {
        String types[] = new String[1];
        types[0] = "TABLE";
        Connection c = mgr.getConnection();
        DatabaseMetaData meta = c.getMetaData();
        String schema = mgr.getUserSchemaName();
        ResultSet rs = meta.getTables(null, schema, null, types);
        Vector allTbls = new Vector();
        Table t;
        for(; rs.next(); allTbls.add(t))
        {
            String type = rs.getString(4);
            t = new Table();
            t.catalog = rs.getString(1);
            t.schema = rs.getString(2);
            t.name = rs.getString(3);
            t.remarks = rs.getString(5);
        }

        rs.close();
        Table tbls[] = new Table[allTbls.size()];
        for(int i = 0; i < allTbls.size(); i++)
        {
            Table t = (Table)allTbls.elementAt(i);
            tbls[i] = t;
            for(rs = meta.getColumns(null, schema, t.name, null); rs.next(); t.addColumn(rs.getString(4), rs.getShort(5), rs.getString(6), rs.getInt(7), rs.getInt(9), rs.getString(18).equals("NO"), rs.getString(12)));
            rs.close();
            try
            {
                try
                {
                    for(rs = meta.getPrimaryKeys(null, schema, t.name); rs.next(); t.addPrimKey(rs.getString(4), rs.getShort(5), rs.getString(6)));
                    continue;
                }
                catch(SQLException e)
                {
                    int iNot = e.toString().indexOf("not");
                    int iSupport = e.toString().indexOf("support");
                    if(iNot == -1 || iSupport == -1)
                        throw e;
                }
                continue;
            }
            finally
            {
                rs.close();
            }
        }

        mgr.releaseConnection(c);
        return tbls;
    }

    public Table()
    {
        columns = new Vector();
        colHash = new Hashtable();
    }

    public int getColumnCount()
    {
        return columns.size();
    }

    public String getKey()
    {
        return name;
    }

    public String sqlCreate(SqlDatabase db)
    {
        StringBuffer b = new StringBuffer("Create table " + name + "(\n");
        for(int i = 0; i < columns.size(); i++)
        {
            Column col = (Column)columns.elementAt(i);
            b.append(col.sqlDefn(db));
            if(i < columns.size() - 1)
                b.append(",\n");
        }

        b.append(")");
        return b.toString();
    }

    public String sqlSelect()
    {
        StringBuffer b = new StringBuffer("Select ");
        for(int i = 0; i < columns.size(); i++)
        {
            Column col = (Column)columns.elementAt(i);
            b.append(col.name);
            if(i < columns.size() - 1)
                b.append(", ");
        }

        b.append("\nFrom " + name);
        return b.toString();
    }

    public String sqlInsert()
    {
        StringBuffer b = new StringBuffer("Insert Into " + name + "(");
        for(int i = 0; i < columns.size(); i++)
        {
            Column col = (Column)columns.elementAt(i);
            b.append(col.name);
            if(i < columns.size() - 1)
                b.append(", ");
        }

        b.append(") ");
        return b.toString();
    }

    public String sqlValues()
    {
        StringBuffer b = new StringBuffer("values (");
        for(int i = 0; i < columns.size(); i++)
        {
            b.append("?");
            if(i < columns.size() - 1)
                b.append(", ");
        }

        b.append(") ");
        return b.toString();
    }

    protected void addColumn(String name, short dataType, String typeName, int size, int decimals, boolean nullable, String remarks)
    {
        Column col = null. new Column();
        col.name = name;
        col.typeName = typeName;
        col.remarks = remarks;
        col.dataType = dataType;
        col.size = size;
        col.decimals = decimals;
        col.nullable = nullable;
        colHash.put(col.getKey(), col);
        columns.add(col);
    }

    protected void addPrimKey(String s, short word0, String s1)
    {
    }

    String catalog;
    String schema;
    String name;
    String remarks;
    Vector columns;
    Hashtable colHash;
}
