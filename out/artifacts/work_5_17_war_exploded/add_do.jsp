<%--
  Created by IntelliJ IDEA.
  User: 11250
  Date: 2019/5/17
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="personDaoImpl" scope="page" class="com.dao.person.impl.PersonDaoImpl"/>
<jsp:useBean id="person" scope="page" class="com.entity.person.Person"/>
<html>
<head>
    <title>添加处理</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    Integer _age = Integer.parseInt(age);
    String sex = request.getParameter("sex");
    boolean flag;
    person.setName(name);
    person.setAge(_age);
    person.setSex(sex);
    flag = personDaoImpl.addPerson(person);
    if (flag){
        response.sendRedirect("main.jsp");
    }else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
