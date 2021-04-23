package com.util.dbconn.impl;

import com.util.dbconn.DbCoon;

import java.sql.*;

public class DbCoonImpl implements DbCoon{

    private final String DRIVER = "com.mysql.jdbc.Driver";
    private final String URL = "jdbc:mysql://localhost:3306/user";
    private final String USERNAME = "root";
    private final String PASSWORD = "mysql";
    private Connection conn = null;

    public DbCoonImpl(){
        try {
            //1.加载JDBC驱动程序
            Class.forName(DRIVER);
            //2.建立数据库连接
            this.conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
        }catch (Exception ex)
        {
            System.out.println("无法连接到数据库！");
        }
    }

//链接数据库
    public Connection getConnection(){
        return this.conn;
    }

    //关闭数据库
    @Override
    public void closeConnection(Connection conn) {
        if (conn!=null){
            try {
                conn.close();
            }catch (SQLException ex)
            {
                ex.printStackTrace();
            }
        }
    }

    //关闭预处理结果
    @Override
    public void closePreparedStatement(PreparedStatement ps) {
        if (ps!=null){
            try {
                ps.close();
            }catch (SQLException ex)
            {
                ex.printStackTrace();
            }
        }
    }

    //关闭结果集
    @Override
    public void closeResultSet(ResultSet rs) {
        if (rs!=null){
            try {
                rs.close();
            }catch (SQLException ex)
            {
                ex.printStackTrace();
            }
        }
    }
}
