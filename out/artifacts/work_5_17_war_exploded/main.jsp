<%@page import="java.util.List" %>
<%@page import="com.entity.student.Student" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="com.dao.student.impl.studentDaoImpl" %>
<%--
  Created by IntelliJ IDEA.
  User: 11250
  Date: 2019/5/16
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:useBean id="personDaoImpl" scope="page" class="com.dao.student.impl.studentDaoImpl"/>
<jsp:useBean id="person" scope="page" class="com.entity.student.Student"/>
<html>
<head>
    <title>表单页</title>
</head>
<body>
<div style="margin-top: 180px;" align="center">
    <table border="1px solid">
        <tr bgcolor="#a9a9a9">
            <th>1</th>
            <td><a href="add.jsp">插入</a> </td>
        </tr>
        <tr>
            <th>2</th>
            <td><a href="">查找</a> </td>
        </tr>
        <tr>
            <th>3</th>
            <td><a href="delete_do.jsp">删除</a> </td>
        </tr>
        <tr>
            <th>4</th>
            <td><a href="update.jsp">修改</a> </td>
        </tr>
        <tr>
            <th>5</th>
        </tr>
        <tr>
            <th>6</th>
            <td><a href="index.jsp">退出</a> </td>
        </tr>
    </table>
</div>
</body>
</html>
