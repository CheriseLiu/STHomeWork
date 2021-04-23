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
            <th>编号</th><th>姓名</th><th>年龄</th><th>性别</th><th>操作1</th><th>操作2</th>
        </tr>
            <tr>
                <td>${status.index+1}</td>
                <td>
                        ${person.name}
                </td>
                <td>
                        ${person.age}
                </td>
                <td>
                        ${person.sex}
                </td>
                <td><a href="delete_do.jsp?id=${person.id}">删除</a> </td>
                <td><a href="update.jsp?id=${person.id}">修改</a> </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="7" align="right"><a href="add.jsp">添加</a> </td>
        </tr>
    </table>
</div>
</body>
</html>
