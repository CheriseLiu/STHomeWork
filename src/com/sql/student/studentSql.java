package com.sql.student;

public class studentSql {
    public static String addStudent = "INSERT INTO t_stuinfo(ID,name,birDate,gender) VALUES(?,?)";

    public static String searchStudent = "SELECT * FROM t_stuinfo WHERE ID=? OR name=?";

    public static String deleteStudent = "DELETE * FROM t_stuinfo WHERE ID=?";

    public static String updateStudent = "UPDATE * FROM t_stuinfo WHERE ID=?";
}
