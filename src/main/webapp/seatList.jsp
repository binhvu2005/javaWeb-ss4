Skip to content
Navigation Menu
theminhdayma
javaWebSession04

Type / to search
Code
Issues
Pull requests
Actions
Projects
Security
Insights
Files
Go to file
t
Session04
build
gradle/wrapper
src/main
java/com/data/session04
webapp
BaiTap
Bai1
Bai2
Bai3
Bai4
Bai5
Bai6
Bai7
Bai8
Bai9
Bai9.jsp
Demo
WEB-INF
index.jsp
build.gradle
gradlew
gradlew.bat
settings.gradle
javaWebSession04/Session04/src/main/webapp/BaiTap/Bai9
/Bai9.jsp
theminhdayma
theminhdayma
Add files via upload
cfe267b
·
7 hours ago
javaWebSession04/Session04/src/main/webapp/BaiTap/Bai9
/Bai9.jsp

Code

Blame
57 lines (53 loc) · 1.53 KB
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách ghế</title>
    <style>
        .seat-grid {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }
        .seat-item {
            border: 1px solid #ccc;
            padding: 10px;
            width: 100px;
            text-align: center;
        }
        .booked {
            background-color: #f8d7da;
        }
        .message {
            margin-top: 20px;
            font-weight: bold;
            color: green;
        }
    </style>
</head>
<body>
<h2>Chọn ghế</h2>
<form method="post" action="SeatServlet">
    <div class="seat-grid">
        <c:forEach var="seat" items="${seats}">
            <div class="seat-item ${seat.booked ? 'booked' : ''}">
                <p>${seat.name}</p>
                <p>${seat.price} VNĐ</p>

                <c:if test="${!seat.booked}">
                    <input type="checkbox" name="selectedSeats" value="${seat.id}" />
                </c:if>

                <c:if test="${seat.booked}">
                    <input type="checkbox" disabled />
                    <p style="color:red;">Đã đặt</p>
                </c:if>
            </div>
        </c:forEach>
    </div>
    <br/>
    <button type="submit">Thanh toán</button>
</form>

<c:if test="${not empty message}">
    <div class="message">${message}</div>
</c:if>

</body>
</html>
javaWebSession04/Session04/src/main/webapp/BaiTap/Bai9/Bai9.jsp at main · theminhdayma/javaWebSession04