package com.sql.user;

/**
 * @Author: Liulq
 * @Description:
 * @Date: 11:15 2021/4/23
 */
public class userSql {
    public static String addUser = "INSERT INTO t_userinfo(username,password) VALUES(?,?)";

    public static String searchUser = "SELECT * FROM t_userinfo WHERE username=? ADD password=?";
}
