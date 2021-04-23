package com.dao.student.impl;

import com.dao.student.studentDao;
import com.entity.student.Student;
import com.sql.student.studentSql;
import com.util.dbconn.DbCoon;
import com.util.dbconn.impl.DbCoonImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Liulq
 * @Description:
 * @Date: 23:27 2021/4/22
 */
public class studentDaoImpl implements studentDao {
    private Connection conn;

    private DbCoon dbCoon;

    public studentDaoImpl(){
        this.dbCoon = new DbCoonImpl();
    }

    @Override
    public boolean addStudent(Student student) {
        boolean flag = false;
        conn = null;
        PreparedStatement ps = null;
        try {
            this.conn = dbCoon.getConnection();
            ps = conn.prepareStatement(studentSql.addStudent);
            ps.setInt(1,student.getID());
            ps.setString(2,student.getName());
            ps.setString(3,student.getBirDate());
            ps.setString(4,student.getGender());
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
    public boolean searchStudent(Student student) {
        boolean flag = false;
        conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            this.conn = dbCoon.getConnection();
            ps = conn.prepareStatement(studentSql.searchStudent);
            ps.setInt(1,student.getID());
            ps.setString(2,student.getName());
            rs = ps.executeQuery();
            if (rs != null){
                System.out.println(flag + " flag in StudentDaoImpl");
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

    @Override
    public boolean deleteStudent(int ID) {
        boolean flag = false;
        conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            this.conn = dbCoon.getConnection();
            ps = conn.prepareStatement(studentSql.deleteStudent);
            ps.setInt(1,ID);
            rs = ps.executeQuery();
            if (rs != null){
                System.out.println(flag + " flag in StudentDaoImpl");
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

    @Override
    public boolean updateStudent(Student student) {
        boolean flag = false;
        conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            this.conn = dbCoon.getConnection();
            ps = conn.prepareStatement(studentSql.updateStudent);
            ps.setInt(1,student.getID());
            ps.setString(2,student.getName());
            ps.setString(3,student.getBirDate());
            ps.setString(4,student.getGender());
            rs = ps.executeQuery();
            if (rs != null){
                System.out.println(flag + " flag in StudentDaoImpl");
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
