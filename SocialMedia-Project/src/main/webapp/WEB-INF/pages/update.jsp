<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Update Profile</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
            background-size: 400% 400%;
            animation: gradientShift 15s ease infinite;
            min-height: 100vh;
            padding: 20px;
            position: relative;
            overflow-x: hidden;
        }

        @keyframes gradientShift {
            0%, 100% { background-position: 0% 50%; }
            25% { background-position: 100% 50%; }
            50% { background-position: 100% 100%; }
            75% { background-position: 0% 100%; }
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: 
                radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(255, 119, 198, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 40% 40%, rgba(120, 219, 255, 0.2) 0%, transparent 50%);
            pointer-events: none;
            z-index: 1;
        }

        body::after {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: 
                radial-gradient(2px 2px at 20px 30px, rgba(255,255,255,0.15), transparent),
                radial-gradient(2px 2px at 40px 70px, rgba(255,255,255,0.1), transparent),
                radial-gradient(1px 1px at 90px 40px, rgba(255,255,255,0.1), transparent),
                radial-gradient(1px 1px at 130px 80px, rgba(255,255,255,0.1), transparent);
            background-repeat: repeat;
            background-size: 200px 200px;
            animation: sparkle 20s linear infinite;
            pointer-events: none;
            z-index: 1;
        }

        @keyframes sparkle {
            0%, 100% { opacity: 1; transform: scale(1); }
            50% { opacity: 0.5; transform: scale(1.1); }
        }

        .profile-container {
            max-width: 900px;
            margin: 40px auto;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 24px;
            box-shadow: 
                0 32px 64px rgba(0, 0, 0, 0.15),
                0 16px 32px rgba(0, 0, 0, 0.1),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            overflow: hidden;
            position: relative;
            z-index: 10;
            animation: slideUp 0.8s ease;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .profile-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 1px;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.8), transparent);
            animation: shimmer 3s ease-in-out infinite;
        }

        @keyframes shimmer {
            0%, 100% { opacity: 0; }
            50% { opacity: 1; }
        }

        .profile-header {
            background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 50%, #ec4899 100%);
            background-size: 200% 200%;
            animation: gradientMove 8s ease infinite;
            padding: 40px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        @keyframes gradientMove {
            0%, 100% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
        }

        .profile-header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: 
                radial-gradient(circle, rgba(255,255,255,0.1) 1px, transparent 1px),
                radial-gradient(circle, rgba(255,255,255,0.05) 1px, transparent 1px);
            background-size: 50px 50px, 100px 100px;
            animation: floatingDots 20s linear infinite;
            pointer-events: none;
        }

        @keyframes floatingDots {
            0% { transform: translate(-50%, -50%) rotate(0deg); }
            100% { transform: translate(-50%, -50%) rotate(360deg); }
        }

        h2 {
            font-family: 'Poppins', sans-serif;
            font-size: 2.5rem;
            font-weight: 700;
            color: white;
            margin: 0;
            letter-spacing: -1px;
            position: relative;
            z-index: 2;
            text-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }

        h2::after {
            content: '✨';
            position: absolute;
            right: -30px;
            top: -5px;
            font-size: 1.2rem;
            animation: sparkleRotate 2s ease-in-out infinite;
        }

        @keyframes sparkleRotate {
            0%, 100% { transform: rotate(0deg) scale(1); }
            50% { transform: rotate(180deg) scale(1.2); }
        }

        .profile-pic {
            margin: 30px 0;
            display: flex;
            justify-content: center;
            position: relative;
            z-index: 2;
        }

        .profile-pic img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid rgba(255, 255, 255, 0.3);
            box-shadow: 
                0 8px 25px rgba(0, 0, 0, 0.2),
                0 4px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.4s ease;
            animation: profileFloat 3s ease-in-out infinite;
        }

        @keyframes profileFloat {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }

        .profile-pic img:hover {
            transform: scale(1.1) translateY(-5px);
            box-shadow: 
                0 15px 40px rgba(0, 0, 0, 0.3),
                0 8px 15px rgba(0, 0, 0, 0.15);
            border-color: rgba(255, 255, 255, 0.6);
        }

        .form-content {
            padding: 50px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            position: relative;
        }

        .form-content::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: 
                radial-gradient(circle at 10% 20%, rgba(99, 102, 241, 0.05) 0%, transparent 50%),
                radial-gradient(circle at 90% 80%, rgba(139, 92, 246, 0.05) 0%, transparent 50%);
            pointer-events: none;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
            position: relative;
            z-index: 2;
        }

        .form-row {
            display: flex;
            flex-direction: column;
            position: relative;
            animation: fadeInUp 0.6s ease forwards;
            animation-delay: calc(var(--i) * 0.1s);
            opacity: 0;
        }

        .form-row:nth-child(1) { --i: 1; }
        .form-row:nth-child(2) { --i: 2; }
        .form-row:nth-child(3) { --i: 3; }
        .form-row:nth-child(4) { --i: 4; }
        .form-row:nth-child(5) { --i: 5; }
        .form-row:nth-child(6) { --i: 6; }
        .form-row:nth-child(7) { --i: 7; }
        .form-row:nth-child(8) { --i: 8; }
        .form-row:nth-child(9) { --i: 9; }
        .form-row:nth-child(10) { --i: 10; }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-row.full-width {
            grid-column: 1 / -1;
        }

        .form-row label {
            font-weight: 600;
            color: #374151;
            margin-bottom: 10px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            position: relative;
        }

        .form-row:focus-within label {
            color: #6366f1;
            transform: translateY(-2px);
        }

        .form-row input,
        .form-row textarea {
            padding: 16px 20px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 1rem;
            font-family: 'Inter', sans-serif;
            transition: all 0.3s ease;
            background: linear-gradient(135deg, #ffffff, #f8fafc);
            position: relative;
        }

        .form-row input:focus,
        .form-row textarea:focus {
            outline: none;
            border-color: #6366f1;
            box-shadow: 
                0 0 0 4px rgba(99, 102, 241, 0.1),
                0 8px 25px rgba(99, 102, 241, 0.15);
            transform: translateY(-2px);
            background: #ffffff;
        }

        .form-row input:hover:not(:focus),
        .form-row textarea:hover:not(:focus) {
            border-color: #cbd5e1;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        .form-row input[readonly] {
            background: linear-gradient(135deg, #f1f5f9, #e2e8f0);
            color: #64748b;
            cursor: not-allowed;
        }

        .form-row textarea {
            resize: vertical;
            min-height: 120px;
            font-family: 'Inter', sans-serif;
        }

        .form-row input[type="file"] {
            background: linear-gradient(135deg, #f8fafc, #f1f5f9);
            border: 2px dashed #cbd5e1;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            text-align: center;
            padding: 20px;
        }

        .form-row input[type="file"]:hover {
            border-color: #6366f1;
            background: linear-gradient(135deg, #f0f9ff, #e0f2fe);
        }

        .form-row input[type="file"]:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
        }

        .btn {
            background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 50%, #ec4899 100%);
            background-size: 200% 200%;
            color: white;
            border: none;
            padding: 18px 40px;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
            font-family: 'Poppins', sans-serif;
            text-transform: uppercase;
            letter-spacing: 1px;
            width: 100%;
            max-width: 300px;
            margin: 30px auto 0;
            display: block;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.6s;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 
                0 15px 35px rgba(99, 102, 241, 0.4),
                0 8px 15px rgba(0, 0, 0, 0.1);
            background-position: 100% 0;
            animation: buttonPulse 2s ease infinite;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn:active {
            transform: translateY(-1px);
            box-shadow: 
                0 8px 20px rgba(99, 102, 241, 0.3),
                0 4px 8px rgba(0, 0, 0, 0.1);
        }

        @keyframes buttonPulse {
            0%, 100% {
                box-shadow: 
                    0 15px 35px rgba(99, 102, 241, 0.4),
                    0 8px 15px rgba(0, 0, 0, 0.1);
            }
            50% {
                box-shadow: 
                    0 20px 45px rgba(99, 102, 241, 0.5),
                    0 12px 25px rgba(0, 0, 0, 0.15);
            }
        }

        /* Special styling for specific fields */
        .form-row input[type="date"] {
            color: #4b5563;
        }

        .form-row input[type="email"] {
            background: linear-gradient(135deg, #ffffff, #fefce8);
        }

        .form-row input[type="tel"] {
            background: linear-gradient(135deg, #ffffff, #f0f9ff);
        }

        /* Loading animation for form submission */
        .btn.loading {
            pointer-events: none;
            opacity: 0.7;
        }

        .btn.loading::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 20px;
            height: 20px;
            margin: -10px 0 0 -10px;
            border: 2px solid transparent;
            border-top: 2px solid #ffffff;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .profile-container {
                margin: 20px auto;
                border-radius: 16px;
            }

            .profile-header {
                padding: 30px 20px;
            }

            h2 {
                font-size: 2rem;
            }

            .form-content {
                padding: 30px 20px;
            }

            .form-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }

            .profile-pic img {
                width: 100px;
                height: 100px;
            }
        }

        @media (max-width: 480px) {
            .profile-container {
                margin: 10px;
            }

            .profile-header {
                padding: 20px 15px;
            }

            h2 {
                font-size: 1.75rem;
            }

            .form-content {
                padding: 20px 15px;
            }

            .profile-pic img {
                width: 80px;
                height: 80px;
            }
        }

        /* Success/Error message styling */
        .message {
            padding: 15px 20px;
            border-radius: 12px;
            margin-bottom: 25px;
            font-weight: 500;
            position: relative;
            animation: slideDown 0.5s ease;
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .message.success {
            background: linear-gradient(135deg, #dcfce7, #bbf7d0);
            border: 1px solid #86efac;
            color: #16a34a;
        }

        .message.error {
            background: linear-gradient(135deg, #fee2e2, #fecaca);
            border: 1px solid #f87171;
            color: #dc2626;
        }
    </style>
</head>
<body>

<div class="profile-container">
    <div class="profile-header">
        <h2>Update Profile</h2>
        
        <!-- Show existing profile picture if available -->
        <c:if test="${not empty user.profilePicture}">
            <div class="profile-pic">
                <img src="data:image/jpeg;base64,${user.profilePictureBase64}" alt="Profile Picture"/>
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