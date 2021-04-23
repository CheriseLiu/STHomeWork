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
<jsp:useBean id="personDaoImpl" scope="page" class="com.dao.person.impl.PersonDaoImpl"/>
<jsp:useBean id="person" scope="page" class="com.entity.person.Person"/>
<html>
<head>
    <title>删除操作</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    int _id = Integer.parseInt(id);
    boolean flag;
    flag = personDaoImpl.deletePerson(_id);
    if (flag){
        response.sendRedirect("success.jsp");
    }else {
        response.sendRedirect("fail.jsp");
    }
%>
</body>
</html>
