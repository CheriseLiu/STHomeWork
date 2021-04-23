package com.sql.student;

public class StudentSql {
    public static String addStudent = "INSERT INTO t_userinfo(ID,name,birDate,gender) VALUES(?,?)";

    public static String searchStudent = "SELECT * FROM t_userinfo WHERE ID=? OR name=?";
}
