package com.dao.student.impl;

import com.dao.student.studentDao;
import com.entity.student.Student;
import com.sql.student.studentSql;
import com.util.dbconn.DbCoon;
import com.util.dbconn.impl.DbCoonImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    private int FieldNum;

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
    public String[][] searchStudent(String name) {
        String[][] result = null;
        conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        if (name.length()<0){
            return result;
        }
        try {
            this.conn = dbCoon.getConnection();
            ps = conn.prepareStatement(studentSql.searchStudent);
            List<Student> stu = new ArrayList<Student>();
            int i=0;
            ps.setString(1,name);
            rs = ps.executeQuery();
            while(rs.next()){
                buildList(rs, stu, i);
                i++;
            }
            if (stu.size()>0){
                result = new String[stu.size()][FieldNum];
                for (int j=0;j<stu.size();j++){
                    buildResult(result,stu,j);
                }
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            dbCoon.closeResultSet(rs);
            dbCoon.closePreparedStatement(ps);
            dbCoon.closeConnection(conn);
        }
        return result;
    }

    private void buildResult(String[][] result, List<Student> stu, int j) {
        Student stus = stu.get(j);
        result[j][0] = String.valueOf(stus.getID());
        result[j][1] = stus.getName();
        result[j][2] = stus.getBirDate();
        result[j][3] = stus.getGender();
    }

    private void buildList(ResultSet rs, List<Student> list, int i) throws SQLException {
        Student stu = new Student();
        stu.setID(i+1);
        stu.setBirDate(rs.getString("birDate"));
        stu.setGender(rs.getString("gender"));
        list.add(stu);
    }

    @Override
    public boolean deleteStudent(Student student) {
        boolean flag = false;
        conn = null;
        PreparedStatement ps = null;
        int rs = 0;
        if(student == null){
            return flag;
        }
        try {
            this.conn = dbCoon.getConnection();
            ps = conn.prepareStatement(studentSql.deleteStudent);
            ps.setString(1,student.getName());
            rs = ps.executeUpdate();
            if (rs == 1){
                System.out.println(flag + " flag in StudentDaoImpl");
                flag = true;
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            //dbCoon.closeResultSet(rs);
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
        int rs = 0;
        if (student == null){
            return flag;
        }
        try {
            this.conn = dbCoon.getConnection();
            ps = conn.prepareStatement(studentSql.updateStudent);
            ps.setString(1,student.getName());
            ps.setString(2,student.getBirDate());
            ps.setString(3,student.getGender());
            rs = ps.executeUpdate();
            if (rs == 1){
                System.out.println(flag + " flag in StudentDaoImpl");
                flag = true;
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            //dbCoon.closeResultSet(rs);
            dbCoon.closePreparedStatement(ps);
            dbCoon.closeConnection(conn);
        }
        return flag;
    }

    @Override
    public String[][] list(int pageNum) {
        String[][] result = null;
        conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        if(pageNum<1){
            return result;
        }
        List<Student> stus = new ArrayList<Student>();
        int i=0;
        int showNum = 0;
        int beginNum = (pageNum - 1) * showNum;
        try {
            this.conn = dbCoon.getConnection();
            ps = conn.prepareStatement(studentSql.findAll);
            rs = ps.executeQuery();
            while (rs.next()){
                buildList(rs,stus,i);
                i++;
            }
            if (stus.size()>0){
                result = new String[stus.size()][FieldNum];
                for (int j=0;j<stus.size();j++){
                    buildResult(result,stus,j);
                }
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            dbCoon.closeResultSet(rs);
            dbCoon.closePreparedStatement(ps);
            dbCoon.closeConnection(conn);
        }
        return result;
    }


}
