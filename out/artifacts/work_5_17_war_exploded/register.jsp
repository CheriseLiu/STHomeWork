<%--
  Created by IntelliJ IDEA.
  User: 11250
  Date: 2019/5/15
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <meta charset="UTF-8">
    <style>
        body{
            text-align: center;
        }
        p1{
            font-size: 30px;
        }
        p2{
            font-size: 20px;
        }
        .main{
            text-align: center;
            background-color: lightblue;
            width: 100%;
            height: 800px;
        }
        .set{
            border-radius: 10px;
            border: black 1px;
            background-color: lightskyblue;
            width: 600px;
            height: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div class="main">
    <p1>学生信息采集系统</p1>
    <br><br><br>
    <p2>注册页面</p2>
    <div class="set">
        <br><br><br><br><br><br>
        <form action="register_do.jsp" method="post">
            用户名：<input type="text" name="username">
            <br><br><br>
            密码：<input type="text" name="password">
            <br><br><br>
            <input type="submit" value="注册">
        </form>
    </div>
</div>
</body>
</html>
