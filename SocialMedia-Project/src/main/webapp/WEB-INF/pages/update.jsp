<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Update Profile</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    
</head>
<body>

<div class="profile-container">
    <div class="profile-header">
        <h2>Update Profile</h2>
        
        <!-- Show existing profile picture if available -->
        <c:if test="${not empty user.profilePicture}">
            <div class="profile-pic">
                <img src="data:image/jpeg;base64,${user.profilePicture}" alt="Profile Picture"/>
            </div>
        </c:if>
    </div>

    <div class="form-content">
        <!-- Binding to modelAttribute="user" -->
        <form:form action="updateProfile" method="post" modelAttribute="user" enctype="multipart/form-data">
            
            <div class="form-grid">
                <div class="form-row">
                    <form:label path="id">User ID</form:label>
                    <form:input path="id" readonly="true"/>
                </div>

                <div class="form-row">
                    <form:label path="userName">Username</form:label>
                    <form:input path="userName" placeholder="Enter your username"/>
                </div>

                <div class="form-row">
                    <form:label path="password">Password</form:label>
                    <form:input path="password" type="password" placeholder="Enter your password"/>
                </div>

                <div class="form-row">
                    <form:label path="firstName">First Name</form:label>
                    <form:input path="firstName" placeholder="Enter your first name"/>
                </div>

                <div class="form-row">
                    <form:label path="lastName">Last Name</form:label>
                    <form:input path="lastName" placeholder="Enter your last name"/>
                </div>

                <div class="form-row">
                    <form:label path="email">Email Address</form:label>
                    <form:input path="email" type="email" placeholder="Enter your email address"/>
                </div>

                <div class="form-row">
                    <form:label path="mobileNo">Mobile Number</form:label>
                    <form:input path="mobileNo" type="tel" placeholder="Enter your mobile number"/>
                </div>

                <div class="form-row">
                    <form:label path="date_of_birth">Date of Birth</form:label>
                    <form:input path="date_of_birth" type="date"/>
                </div>

                <div class="form-row">
                    <form:label path="location">Location</form:label>
                    <form:input path="location" placeholder="Enter your location"/>
                </div>

                <div class="form-row">
                    <label>Profile Picture</label>
                    <input type="file" name="profilePictureFile" accept="image/*"/>
                </div>

                <div class="form-row full-width">
                    <form:label path="bio">Bio</form:label>
                    <form:textarea path="bio" rows="4" placeholder="Tell us about yourself..."/>
                </div>
            </div>

            <div class="form-row">
                <button type="submit" class="btn" onclick="this.classList.add('loading')">Update Profile</button>
            </div>

        </form:form>
    </div>
</div>

<script>
    // Add some interactive effects
    document.addEventListener('DOMContentLoaded', function() {
        // File input enhancement
        const fileInput = document.querySelector('input[type="file"]');
        if (fileInput) {
            fileInput.addEventListener('change', function(e) {
                if (e.target.files.length > 0) {
                    const fileName = e.target.files[0].name;
                    e.target.setAttribute('data-filename', fileName);
                }
            });
        }

        // Form validation enhancement
        const form = document.querySelector('form');
        const inputs = document.querySelectorAll('input, textarea');
        
        inputs.forEach(input => {
            input.addEventListener('blur', function() {
                if (this.value.trim() && !this.readOnly) {
                    this.style.borderColor = '#10b981';
                    this.style.boxShadow = '0 0 0 3px rgba(16, 185, 129, 0.1)';
                }
            });
        });

        // Enhanced form submission
        form.addEventListener('submit', function(e) {
            const submitBtn = document.querySelector('.btn');
            submitBtn.textContent = 'Updating...';
            
            // Remove loading class after 3 seconds (adjust based on your needs)
            setTimeout(() => {
                submitBtn.classList.remove('loading');
                submitBtn.textContent = 'Update Profile';
            }, 3000);
        });
    });
</script>

</body>
</html>