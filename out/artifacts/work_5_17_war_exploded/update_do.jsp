<%@ page import="com.entity.person.Person" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%--
  Created by IntelliJ IDEA.
  User: 11250
  Date: 2019/5/17
  Time: 23:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="personDaoImpl" scope="page" class="com.dao.person.impl.PersonDaoImpl"/>
<jsp:useBean id="person" scope="page" class="com.entity.person.Person"/>
<html>
<head>
    <title>修改处理</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    int _id = Integer.parseInt(id);
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    int _age = Integer.parseInt(age);
    String sex = request.getParameter("sex");
    boolean flag;
    person.setId(_id);
    person.setName(name);
    person.setAge(_age);
    person.setSex(sex);
    flag = personDaoImpl.updatePerson(person);
    if (flag){
        response.sendRedirect("main.jsp");
    }else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>