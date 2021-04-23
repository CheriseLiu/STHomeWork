package com.dao.user.impl;

import com.dao.user.userDao;
import com.entity.user.User;
import com.sql.user.userSql;
import com.util.dbconn.DbCoon;
import com.util.dbconn.impl.DbCoonImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @Author: Liulq
 * @Description:
 * @Date: 11:21 2021/4/23
 */
public class userDaoImpl implements userDao {

    private Connection conn;

    private DbCoon dbCoon;

    public userDaoImpl(){
        this.dbCoon = new DbCoonImpl();
    }

    @Override
    public boolean addUser(User user) {
        boolean flag = false;
        conn = null;
        PreparedStatement ps = null;
        try {
            this.conn = dbCoon.getConnection();
            ps = conn.prepareStatement(userSql.addUser);
            ps.setString(1,user.getUsername());
            ps.setString(2,user.getPassword());
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            dbCoon.closePreparedStatement(ps);
            dbCoon.closeConnection(conn);
        }
        return flag;
    }

    @Override
    public boolean searchUser(User user) {
        boolean flag = false;
        conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            this.conn = dbCoon.getConnection();
            ps = conn.prepareStatement(userSql.searchUser);
            ps.setString(1,user.getUsername());
            ps.setString(2,user.getPassword());
            rs = ps.executeQuery();
            if (rs != null){
                System.out.println(flag + " flag in UserDaoImpl");
                flag = true;
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            dbCoon.closeResultSet(rs);
            dbCoon.closePreparedStatement(ps);
            dbCoon.closeConnection(conn);
        }
        return flag;
    }
}
