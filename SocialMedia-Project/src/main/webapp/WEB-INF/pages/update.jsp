<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Update Profile</title>

</head>
<body>

<div class="profile-container">
    <h2>Update Profile</h2>

    <!-- Show existing profile picture if available -->
    <c:if test="${not empty user.profilePicture}">
        <div class="profile-pic">
            <img src="data:image/jpeg;base64,${user.profilePictureBase64}" alt="Profile Picture"/>
        </div>
    </c:if>

    <!-- Binding to modelAttribute="user" -->
    <form:form action="updateProfile" method="post" modelAttribute="user" enctype="multipart/form-data">
			
		<div class="form-row">
            <form:label path="id">id</form:label>
            <form:input path="id" readonly="true"/>
        </div>
		
        <div class="form-row">
            <form:label path="userName">Username</form:label>
            <form:input path="userName" />
        </div>

        <div class="form-row">
            <form:label path="password">Password</form:label>
            <form:input path="password"/>
        </div>

        <div class="form-row">
            <form:label path="firstName">First Name</form:label>
            <form:input path="firstName"/>
        </div>

        <div class="form-row">
            <form:label path="lastName">Last Name</form:label>
            <form:input path="lastName"/>
        </div>

        <div class="form-row">
            <form:label path="email">Email</form:label>
            <form:input path="email" type="email"/>
        </div>

        <div class="form-row">
            <form:label path="mobileNo">Mobile No</form:label>
            <form:input path="mobileNo"/>
        </div>

        <div class="form-row">
            <form:label path="bio">Bio</form:label>
            <form:textarea path="bio" rows="3"/>
        </div>

       <div class="form-row">
    <label>Profile Picture</label>
    <input type="file" name="profilePictureFile"/> <!-- Changed name -->
</div>

        <div class="form-row">
            <form:label path="date_of_birth">Date of Birth</form:label>
            <form:input path="date_of_birth" type="date"/>
        </div>

        <div class="form-row">
            <form:label path="location">Location</form:label>
            <form:input path="location"/>
        </div>

        <div class="form-row">
            <button type="submit" class="btn">Update Profile</button>
        </div>

    </form:form>
</div>

</body>
</html>
