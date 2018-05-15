package com.pwc.util;

import java.sql.*;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

public class DBConnAccess {
    private Connection conn;
    private Statement stmt;
    private DataSource ds;
    public DBConnAccess() {
        try {
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		ds = (DataSource)envContext.lookup("jdbc/ltdatabaseAccess");
            	conn = ds.getConnection();
            	stmt = conn.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	public Connection getConn(){
        try {
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}

	public Statement createStatement(){
        try {
            return stmt;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}

	public Statement createStatement(int i1,int i2){
        try {
        	stmt = conn.createStatement(i1,i2);
            return stmt;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}

	public CallableStatement prepareCall(String sql){
        try {
            CallableStatement cstmt = conn.prepareCall(sql);
            return cstmt;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
		
    public ResultSet executeQuery(String sql) {
        try {
            ResultSet rs = stmt.executeQuery(sql);
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean execute(String sql) {
        try {
            stmt.execute(sql);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean executeUpdate(String sql) {
        try {
            stmt.executeUpdate(sql);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public PreparedStatement getPreparedStmt(String sql) {
        PreparedStatement prepStmt = null;
        try {
            prepStmt = conn.prepareStatement(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return prepStmt;
    }


    public void close() {
        if (conn != null) {
            try {
                conn.close();
                conn = null;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
                stmt = null;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
