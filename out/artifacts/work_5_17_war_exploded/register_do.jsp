<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%--
  Created by IntelliJ IDEA.
  User: 11250
  Date: 2019/5/17
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="userDaoImpl" scope="page" class="com.dao.user.impl.UserDaoImpl"/>
<jsp:useBean id="user" scope="page" class="com.entity.user.User"/>
<html>
<head>
    <title>注册处理</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String n_username = request.getParameter("username");
    String n_password = request.getParameter("password");
    boolean flag;
    user.setUsername(n_username);
    user.setPassword(n_password);
    flag = userDaoImpl.addUser(user);
    if (flag){
        System.out.println("恭喜您注册成功，请登录！");
        response.sendRedirect("index.jsp");
    }else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
