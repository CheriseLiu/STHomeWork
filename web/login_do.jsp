<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%--
  Created by IntelliJ IDEA.
  User: 11250
  Date: 2019/5/15
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="userDaoImpl" scope="page" class="com.dao.student.impl.UserDaoImpl"/>
<jsp:useBean id="user" scope="page" class="com.entity.student.User"/>
<html>
<head>
    <title>登录处理</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    boolean flag;
    user.setUsername(username);
    user.setPassword(password);
    flag = userDaoImpl.searchUser(user);
    if (flag){
        response.sendRedirect("main.jsp");//重定向
    }
    else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
