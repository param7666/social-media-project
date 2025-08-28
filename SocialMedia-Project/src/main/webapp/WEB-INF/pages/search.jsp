<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f2f2f2;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 80%;
        margin: 20px auto;
    }
    h1 {
        text-align: center;
        color: #333;
    }
    .user-card {
        display: flex;
        align-items: center;
        background: #fff;
        padding: 15px;
        margin: 15px 0;
        border-radius: 12px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .profile-pic {
        margin-right: 20px;
    }
    .profile-pic img {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid #4CAF50;
    }
    .user-info {
        flex: 1;
    }
    .user-info h3 {
        margin: 0;
        font-size: 18px;
        color: #333;
    }
    .user-info p {
        margin: 3px 0;
        color: #777;
        font-size: 14px;
    }
    .actions form {
        display: inline-block;
        margin: 0 5px;
    }
    .actions button {
        padding: 6px 12px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
        transition: 0.3s;
    }
    .add-btn { background: #4CAF50; color: white; }
    .remove-btn { background: #f44336; color: white; }
    .view-btn { background: #2196F3; color: white; }
    .actions button:hover {
        opacity: 0.8;
    }
</style>
</head>
<body>

<div class="container">
    <h1>Discover People</h1>

    <c:forEach var="user" items="${userList}">
        <div class="user-card">
            <div class="profile-pic">
                <c:choose>
                    <c:when test="${not empty user.profilePicture}">
                        <img src="data:image/jpeg;base64,${user.profilePicture}" alt="Profile Picture"/>
                    </c:when>
                    <c:otherwise>
                        <img src="default-avatar.png" alt="Default Profile"/>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="user-info">
                <h3>${user.firstName} ${user.lastName}</h3>
                <p><strong>Location:</strong> ${user.location}</p>
            </div>

            <div class="actions">
                <!-- Add Friend -->
                <form action="addFriend" method="post">
                    <input type="hidden" name="id" value="${user.id}">
                    <button type="submit" class="add-btn">Add Friend</button>
                </form>

                <!-- Remove Friend -->
                <form action="removeFriend" method="post">
                    <input type="hidden" name="id" value="${user.id}">
                    <button type="submit" class="remove-btn">Remove Friend</button>
                </form>

                <!-- View Profile -->
                <form action="viewProfile" method="get">
                    <input type="hidden" name="id" value="${user.id}">
                    <button type="submit" class="view-btn">View Profile</button>
                </form>
            </div>
        </div>
    </c:forEach>

</div>

</body>
</html>
