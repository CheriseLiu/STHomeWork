<%--
  Created by IntelliJ IDEA.
  User: 11250
  Date: 2019/5/17
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="studentDaoImpl" scope="page" class="com.dao.student.impl.studentDaoImpl"/>
<jsp:useBean id="student" scope="page" class="com.entity.student.Student"/>
<html>
<head>
    <title>添加处理</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String birDate = request.getParameter("birDate");
    String gender = request.getParameter("gender");
    boolean flag;
    student.setName(name);
    student.setBirDate(birDate);
    student.setGender(gender);
    flag = studentDaoImpl.addStudent(student);
    if (flag){
        response.sendRedirect("success.jsp");
    }else {
        response.sendRedirect("fail.jsp");
    }
%>
</body>
</html>
