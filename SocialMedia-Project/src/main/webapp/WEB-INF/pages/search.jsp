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
    }
    .user-card {
        width: 350px;
        background: #fff;
        border-radius: 12px;
        box-shadow: 0px 4px 6px rgba(0,0,0,0.1);
        margin: 15px;
        padding: 20px;
        display: inline-block;
        vertical-align: top;
    }
    .profile-pic img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid #ddd;
    }
    .user-info {
        margin-top: 10px;
    }
    .user-info h3 {
        margin: 5px 0;
        color: #333;
    }
    .user-info p {
        margin: 0;
        font-size: 14px;
        color: #666;
    }
    .actions {
        margin-top: 15px;
    }
    .actions form {
        display: inline-block;
        margin-right: 5px;
    }
    .actions button {
        padding: 6px 12px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
    }
    .add-btn {
        background: #4CAF50;
        color: white;
    }
    .remove-btn {
        background: #f44336;
        color: white;
    }
    .view-btn {
        background: #2196F3;
        color: white;
    }
</style>
</head>
<body>

    <c:forEach var="user" items="${userList}" varStatus="status">
        <div class="user-card">
            <div class="profile-pic">
                <c:choose>
                    <c:when test="${not empty profileImages[status.index]}">
                        <img src="data:image/jpeg;base64,${profileImages[status.index]}" alt="Profile Picture"/>
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
                <form action="viewProfile" method="post">
                    <input type="hidden" name="id" value="${user.id}">
                    <button type="submit" class="view-btn">View Profile</button>
                </form>
            </div>
        </div>
    </c:forEach>

</body>
</html>
