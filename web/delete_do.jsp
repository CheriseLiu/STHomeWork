<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%--
  Created by IntelliJ IDEA.
  User: 11250
  Date: 2019/5/16
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="studentDaoImpl" scope="page" class="com.dao.student.impl.studentDaoImpl"/>
<jsp:useBean id="student" scope="page" class="com.entity.student.Student"/>
<html>
<head>
    <title>删除操作</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    boolean flag;
    flag = studentDaoImpl.deleteStudent(name);
    if (flag){
        response.sendRedirect("success.jsp");
    }else {
        response.sendRedirect("fail.jsp");
    }
%>
</body>
</html>
