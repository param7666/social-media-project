<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/styles.css"> <!-- keep your css -->
</head>
<body>
    <div class="dashboard-container">
        <h1 style="text-align: center; border: 2px red; background-color: yellow">Welcome to Your Dashboard</h1>
             <p>${msg}<p> 
        <!-- ✅ Show logged-in user info from session -->
        <c:if test="${not empty sessionScope.user}">
            <h2>Hello, ${sessionScope.user.userName} </h2>
            <p>Email: ${sessionScope.user.email}</p>
        </c:if>

        <!-- ✅ Dashboard content -->
        <div class="dashboard-content">
            <ul>
            		<li><a href="update">Update Details</a></li>
                <li><a href="profile">My Profile</a></li>
                
                <li><a href="settings">Settings</a></li>
                <li><a href="reports">Reports</a></li>
                <li><a href="logout">Logout</a></li>
            </ul>
        </div>
    </div>

</body>
</html>
