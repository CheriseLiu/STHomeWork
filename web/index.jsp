<%--
  Created by IntelliJ IDEA.
  User: 11250
  Date: 2019/5/15
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>登录</title>
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
      .login{
        border-radius: 10px;
        border: black 1px;
        background-color: lightskyblue;
        width: 600px;
        height: 500px;
        margin: 0 auto;
      }
      a{
        text-decoration: none;
      }
    </style>
  </head>
  <body>
  <div class="main">
    <p1>学生信息管理系统</p1>
    <br><br><br>
    <p2>登录页面</p2>
    <div class="login">
      <br><br><br><br><br><br>
      <form action="login_do.jsp" method="post">
          用户名：<input type="text" name="username">
          <br><br><br>
          密码：<input type="password" name="password">
          <br><br><br>
        <input type="submit" value="登录">
        <a href="register.jsp">点我注册</a>
      </form>
  </div>
  </div>
  </body>
</html>
