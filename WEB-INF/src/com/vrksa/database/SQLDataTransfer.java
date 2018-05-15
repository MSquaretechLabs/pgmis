// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SQLDataTransfer.java

package com.vrksa.database;

import com.vrksa.database.sql.defn.Table;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.*;
import java.util.Hashtable;

// Referenced classes of package com.vrksa.database:
//            MultiDbConnectionManager, NoConnection

public class SQLDataTransfer
{

    public SQLDataTransfer(String srcDB, String srcDrvr, String destDB, String destDrvr)
        throws NoConnection, IllegalAccessException, InstantiationException, ClassNotFoundException, SQLException, IOException
    {
        srcMgr = new MultiDbConnectionManager(srcDB, srcDrvr);
        destMgr = new MultiDbConnectionManager(destDB, destDrvr);
    }

    protected boolean destTableExists(Table tbl)
    {
        if(lookup == null)
        {
            lookup = new Hashtable();
            for(int i = 0; i < destTables.length; i++)
                lookup.put(destTables[i].getKey(), destTables[i]);

        }
        return lookup.containsKey(tbl.getKey());
    }

    private void test(Connection con)
        throws SQLException
    {
        String sql = "Insert Into APP_PARAM(ID, NAME, ADRS_LINE1, ADRS_LINE2, CITY, STATE, PIN_CODE, PRN_FILE_PATH)  values (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, "2");
        ps.setString(2, "2");
        ps.setString(3, "2");
        ps.setString(4, "2");
        ps.setString(5, "2");
        ps.setString(6, "2");
        ps.setString(7, "2");
        ps.setString(8, "2");
        ps.execute();
    }

    public void doTransfer(boolean overwrite)
        throws NoConnection, SQLException, IOException
    {
        srcTables = Table.getSchemaTables(srcMgr);
        destTables = Table.getSchemaTables(destMgr);
        Connection srcCon = null;
        Connection destCon = null;
        Statement selStatement = null;
        PreparedStatement insStatement = null;
        ResultSet rs = null;
        ResultSetMetaData rsmd = null;
        for(int i = 0; i < srcTables.length; i++)
        {
            Table tbl = srcTables[i];
            System.out.println("Processing Table: " + tbl.getKey());
            if(!destTableExists(tbl))
                destMgr.createTable(tbl);
            String sqlSel = tbl.sqlSelect();
            String sqlIns = tbl.sqlInsert() + "\n " + tbl.sqlValues();
            System.out.println(sqlIns);
            try
            {
                srcCon = srcMgr.getConnection();
                destCon = destMgr.getConnection();
                selStatement = srcCon.createStatement();
                insStatement = destCon.prepareStatement(sqlIns);
                rs = selStatement.executeQuery(sqlSel);
                rsmd = rs.getMetaData();
                for(; rs.next(); insStatement.execute())
                {
                    for(int col = 1; col <= tbl.getColumnCount(); col++)
                        switch(rsmd.getColumnType(col))
                        {
                        case 1: // '\001'
                        case 12: // '\f'
                            String s = rs.getString(col);
                            if(s == null)
                                insStatement.setNull(col, rsmd.getColumnType(col));
                            else
                                insStatement.setString(col, s);
                            break;

                        case 11: // '\013'
                        case 91: // '['
                        case 92: // '\\'
                        case 93: // ']'
                            Date dt = rs.getDate(col);
                            if(dt == null)
                                insStatement.setNull(col, 93);
                            else
                                insStatement.setDate(col, dt);
                            break;

                        case 2: // '\002'
                        case 3: // '\003'
                        case 8: // '\b'
                            insStatement.setDouble(col, rs.getDouble(col));
                            break;

                        case 4: // '\004'
                            insStatement.setInt(col, rs.getInt(col));
                            break;

                        default:
                            System.err.println(rsmd.getColumnType(col) + " Data Type [" + rsmd.getColumnTypeName(col) + "] for " + rsmd.getColumnName(col) + " not supported");
                            insStatement.setNull(col, rsmd.getColumnType(col));
                            break;
                        }

                }

                rs.close();
                rs = null;
                selStatement.close();
                selStatement = null;
                insStatement.close();
                insStatement = null;
            }
            catch(NoConnection nce)
            {
                throw nce;
            }
            finally
            {
                if(rs != null)
                    rs.close();
                if(selStatement != null)
                    selStatement.close();
                if(insStatement != null)
                    insStatement.close();
                srcMgr.releaseConnection(srcCon);
                srcMgr.releaseConnection(destCon);
            }
        }

    }

    public static String getUsage()
    {
        StringBuffer sb = new StringBuffer("Usage is\n\t");
        sb.append("SQLDataTransfer <sourcedb> <sourceDriver>");
        sb.append(" <destdb> <destDriver>\n\t");
        sb.append("{refer to the database.properties file for details}");
        return sb.toString();
    }

    public static void main(String args[])
    {
        try
        {
            SQLDataTransfer t = new SQLDataTransfer("APTEMP", "odbc", "AP", "thin");
            t.doTransfer(true);
        }
        catch(Exception e)
        {
            e.printStackTrace(System.out);
        }
    }

    MultiDbConnectionManager srcMgr;
    MultiDbConnectionManager destMgr;
    Table srcTables[];
    Table destTables[];
    Hashtable lookup;
}
