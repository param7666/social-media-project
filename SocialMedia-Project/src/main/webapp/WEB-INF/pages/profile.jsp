<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Page</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #6dd5ed, #2193b0);
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 600px;
        margin: 60px auto;
        background: #fff;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        text-align: center;
        animation: fadeIn 1s ease-in-out;
    }

    .profile-pic img {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        border: 5px solid #2193b0;
        box-shadow: 0px 5px 15px rgba(0,0,0,0.3);
        object-fit: cover;
        transition: transform 0.3s ease-in-out;
    }

    .profile-pic img:hover {
        transform: scale(1.1);
    }

    h1 {
        margin-top: 15px;
        font-size: 28px;
        color: #333;
    }

    .details {
        margin-top: 25px;
        text-align: left;
    }

    .details p {
        font-size: 18px;
        margin: 10px 0;
        padding: 10px;
        background: #f8f9fa;
        border-radius: 8px;
        transition: background 0.3s ease;
    }

    .details p:hover {
        background: #e3f2fd;
    }

    .label {
        font-weight: bold;
        color: #2193b0;
    }

    @keyframes fadeIn {
        from {opacity: 0; transform: translateY(-20px);}
        to {opacity: 1; transform: translateY(0);}
    }
</style>
</head>
<body>
    <div class="container">
        <c:if test="${not empty profileImage}">
            <div class="profile-pic">
                <img src="data:image/jpeg;base64,${profileImage}" alt="Profile Picture"/>
            </div>
        </c:if>

        <h1>Welcome, ${userDetails.userName} 👋</h1>

        <div class="details">
            <p><span class="label">ID:</span> ${userDetails.id}</p>
            <p><span class="label">First Name:</span> ${userDetails.firstName}</p>
            <p><span class="label">Last Name:</span> ${userDetails.lastName}</p>
            <p><span class="label">Email:</span> ${userDetails.email}</p>
            <p><span class="label">Mobile No:</span> ${userDetails.mobileNo}</p>
            <p><span class="label">Date of Birth:</span> ${userDetails.date_of_birth}</p>
            <p><span class="label">Location:</span> ${userDetails.location}</p>
        </div>
    </div>
</body>
</html>
