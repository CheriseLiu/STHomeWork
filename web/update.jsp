<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.entity.person.Person" %>
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
    <title>修改</title>
</head>
<body>
<%--<%--%>
    <%--String id = request.getParameter("id");--%>
<%--%>--%>
<div>
    <p1>请填入修改后的信息</p1>
    <form action="update_do.jsp?id=<%=request.getParameter("id")%>" method="post">
        <%--编号(不可改）：<input type="text" name="id" value="<%=id%>"/>--%>
        姓名：<input type="text" name="name">
        年龄：<input type="text" name="age">
        性别：<input type="text" name="sex">
        <input type="submit" value="提交">
    </form>
</div>
</body>
</html>
