<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 08/05/2025
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>bài 2</title>
    <style>
        .login-form {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        if (username.equals("admin") && password.equals("123456")) {
            request.setAttribute("username", username);
        } else {
            request.setAttribute("error", "true");
        }
    }
%>
<div class="login-form">
    <h1>Đăng nhập</h1>
    <form method="post" action="login.jsp">
        <div class="form-group">
            <label for="username">Tên đăng nhập:</label>
            <input type="text" name="username" id="username" required/>
        </div>
        <div class="form-group">
            <label for="password">Mật khẩu:</label>
            <input type="password" name="password" id="password" required/>
        </div>
        <div class="form-group">
            <input type="submit" value="Đăng nhập"/>
        </div>

        <c:if test="${not empty requestScope.error}">
            <div class="error">Tên đăng nhập hoặc mật khẩu không đúng</div>
        </c:if>
        <c:if test="${not empty requestScope.username}">
            <div class="success">Đăng nhập thành công. Xin chào ${requestScope.username}!</div>
        </c:if>
    </form>
</div>
</body>
</html>
