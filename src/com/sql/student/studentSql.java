package com.sql.student;

public class studentSql {
    public static String addStudent = "INSERT INTO t_stu(name,birDate,gender) VALUES(?,?,?)";

    public static String searchStudent = "SELECT * FROM t_stu WHERE name=?";

    public static String deleteStudent = "DELETE * FROM t_stu WHERE name=?";

    public static String updateStudent = "UPDATE t_stu SET birDate = ? WHERE name=?";

    public static String findAll = "SELECT * FROM t_stu LIMIT ?,?";
}
