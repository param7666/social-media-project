<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to SocialConnect</title>
    
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
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            overflow-x: hidden;
        }

        @keyframes gradientShift {
            0%, 100% {
                background-position: 0% 50%;
            }
            25% {
                background-position: 100% 50%;
            }
            50% {
                background-position: 100% 100%;
            }
            75% {
                background-position: 0% 100%;
            }
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
            0%, 100% {
                opacity: 1;
                transform: scale(1);
            }
            50% {
                opacity: 0.5;
                transform: scale(1.1);
            }
        }

        .container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            max-width: 1200px;
            width: 100%;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 24px;
            box-shadow: 
                0 32px 64px rgba(0, 0, 0, 0.15),
                0 16px 32px rgba(0, 0, 0, 0.1),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            overflow: hidden;
            min-height: 650px;
            position: relative;
            z-index: 10;
            transform: perspective(1000px) rotateX(2deg);
            transition: transform 0.6s ease;
        }

        .container:hover {
            transform: perspective(1000px) rotateX(0deg) scale(1.02);
        }

        .container::before {
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

        .welcome-section {
            background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 50%, #ec4899 100%);
            background-size: 200% 200%;
            animation: gradientMove 8s ease infinite;
            padding: 60px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            color: white;
            position: relative;
            overflow: hidden;
        }

        @keyframes gradientMove {
            0%, 100% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
        }

        .welcome-section::before {
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

        .welcome-section::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: 
                linear-gradient(45deg, transparent 30%, rgba(255,255,255,0.05) 50%, transparent 70%);
            animation: lightSweep 4s ease-in-out infinite;
            pointer-events: none;
        }

        @keyframes lightSweep {
            0%, 100% { transform: translateX(-100%); }
            50% { transform: translateX(100%); }
        }

        .logo {
            font-family: 'Poppins', sans-serif;
            font-size: 3.2rem;
            font-weight: 800;
            margin-bottom: 20px;
            letter-spacing: -2px;
            position: relative;
            background: linear-gradient(45deg, #ffffff, #f0f9ff, #ffffff);
            background-size: 200% 200%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: textShine 3s ease-in-out infinite;
            text-shadow: 0 0 30px rgba(255,255,255,0.5);
        }

        @keyframes textShine {
            0%, 100% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
        }

        .logo::after {
            content: '✨';
            position: absolute;
            right: -40px;
            top: -10px;
            font-size: 1.5rem;
            animation: sparkleRotate 2s ease-in-out infinite;
        }

        @keyframes sparkleRotate {
            0%, 100% { transform: rotate(0deg) scale(1); }
            50% { transform: rotate(180deg) scale(1.2); }
        }

        .tagline {
            font-size: 1.3rem;
            margin-bottom: 50px;
            opacity: 0.95;
            line-height: 1.5;
            font-weight: 300;
            animation: fadeInUp 1s ease 0.5s both;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 0.95;
                transform: translateY(0);
            }
        }

        .features {
            list-style: none;
            padding: 0;
        }

        .features li {
            margin: 18px 0;
            padding: 16px 0;
            padding-left: 40px;
            position: relative;
            font-size: 1.05rem;
            opacity: 0;
            font-weight: 400;
            transition: all 0.4s ease;
            animation: slideInLeft 0.6s ease forwards;
            animation-delay: calc(var(--i) * 0.1s);
        }

        .features li:nth-child(1) { --i: 1; }
        .features li:nth-child(2) { --i: 2; }
        .features li:nth-child(3) { --i: 3; }
        .features li:nth-child(4) { --i: 4; }
        .features li:nth-child(5) { --i: 5; }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-30px);
            }
            to {
                opacity: 0.9;
                transform: translateX(0);
            }
        }

        .features li::before {
            content: '✓';
            position: absolute;
            left: 0;
            color: #10b981;
            font-weight: bold;
            font-size: 14px;
            background: linear-gradient(135deg, #ffffff, #f0fdf4);
            border-radius: 50%;
            width: 28px;
            height: 28px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 
                0 4px 12px rgba(16, 185, 129, 0.3),
                0 2px 4px rgba(0, 0, 0, 0.1);
            border: 2px solid rgba(16, 185, 129, 0.2);
            transition: all 0.3s ease;
        }

        .features li:hover {
            opacity: 1;
            transform: translateX(10px);
        }

        .features li:hover::before {
            transform: scale(1.1) rotate(360deg);
            box-shadow: 
                0 6px 20px rgba(16, 185, 129, 0.4),
                0 3px 8px rgba(0, 0, 0, 0.15);
        }

        .form-section {
            padding: 60px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            position: relative;
        }

        .form-section::before {
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

        .form-container {
            width: 100%;
            position: relative;
            z-index: 2;
        }

        .form-tabs {
            display: flex;
            margin-bottom: 40px;
            border-bottom: 2px solid #f1f5f9;
            position: relative;
            border-radius: 8px 8px 0 0;
            overflow: hidden;
        }

        .form-tabs::before {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50%;
            height: 3px;
            background: linear-gradient(90deg, #6366f1, #8b5cf6);
            transition: transform 0.3s ease;
            border-radius: 3px;
        }

        .form-tabs.register::before {
            transform: translateX(100%);
        }

        .tab {
            flex: 1;
            padding: 18px 0;
            text-align: center;
            font-weight: 600;
            color: #64748b;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            font-size: 1.05rem;
            background: linear-gradient(135deg, #f8fafc, #f1f5f9);
        }

        .tab:first-child {
            border-radius: 8px 0 0 0;
        }

        .tab:last-child {
            border-radius: 0 8px 0 0;
        }

        .tab.active {
            color: #6366f1;
            background: linear-gradient(135deg, #ffffff, #f8fafc);
            box-shadow: 
                0 -4px 12px rgba(99, 102, 241, 0.1),
                inset 0 1px 0 rgba(255, 255, 255, 0.8);
        }

        .tab:hover:not(.active) {
            color: #475569;
            background: linear-gradient(135deg, #ffffff, #f8fafc);
            transform: translateY(-2px);
        }

        .form {
            display: none;
            animation: formSlideIn 0.5s ease both;
        }

        .form.active {
            display: block;
        }

        @keyframes formSlideIn {
            from { 
                opacity: 0; 
                transform: translateY(20px) scale(0.95);
            }
            to { 
                opacity: 1; 
                transform: translateY(0) scale(1);
            }
        }

        .form h2 {
            color: #1f2937;
            margin-bottom: 30px;
            font-size: 2.2rem;
            font-weight: 700;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1f2937, #4f46e5);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-align: center;
            position: relative;
        }

        .form h2::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: linear-gradient(90deg, #6366f1, #8b5cf6);
            border-radius: 2px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            color: #374151;
            font-weight: 600;
            font-size: 0.95rem;
            transition: color 0.3s ease;
        }

        .form-input {
            width: 100%;
            padding: 16px 20px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: linear-gradient(135deg, #ffffff, #f8fafc);
            font-family: 'Inter', sans-serif;
            position: relative;
        }

        .form-input:focus {
            outline: none;
            border-color: #6366f1;
            box-shadow: 
                0 0 0 4px rgba(99, 102, 241, 0.1),
                0 8px 25px rgba(99, 102, 241, 0.15);
            transform: translateY(-2px);
            background: #ffffff;
        }

        .form-input:hover:not(:focus) {
            border-color: #cbd5e1;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        .form-group:focus-within label {
            color: #6366f1;
            transform: translateY(-2px);
        }

        .submit-btn {
            width: 100%;
            background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 50%, #ec4899 100%);
            background-size: 200% 200%;
            color: white;
            border: none;
            padding: 18px 0;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.4s ease;
            margin-top: 15px;
            position: relative;
            overflow: hidden;
            font-family: 'Poppins', sans-serif;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .submit-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.6s;
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 
                0 15px 35px rgba(99, 102, 241, 0.4),
                0 8px 15px rgba(0, 0, 0, 0.1);
            background-position: 100% 0;
            animation: buttonPulse 2s ease infinite;
        }

        .submit-btn:hover::before {
            left: 100%;
        }

        .submit-btn:active {
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

        .forgot-password {
            text-align: center;
            margin-top: 25px;
        }

        .forgot-password a {
            color: #6366f1;
            text-decoration: none;
            font-size: 0.95rem;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
            padding: 8px 16px;
            border-radius: 8px;
        }

        .forgot-password a::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(99, 102, 241, 0.1), rgba(139, 92, 246, 0.1));
            border-radius: 8px;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .forgot-password a:hover {
            color: #4f46e5;
            transform: translateY(-2px);
        }

        .forgot-password a:hover::before {
            opacity: 1;
        }0 10px 25px rgba(99, 102, 241, 0.3);
        }

        .submit-btn:active {
            transform: translateY(0);
        }

        .forgot-password {
            text-align: center;
            margin-top: 20px;
        }

        .forgot-password a {
            color: #6366f1;
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.3s ease;
        }

        .forgot-password a:hover {
            color: #4f46e5;
            text-decoration: underline;
        }

        .error-message {
            background: #fee2e2;
            border: 1px solid #fecaca;
            color: #dc2626;
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 0.9rem;
            display: none;
        }

        .success-message {
            background: #dcfce7;
            border: 1px solid #bbf7d0;
            color: #16a34a;
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 0.9rem;
        }

        .field-error {
            color: #dc2626;
            font-size: 0.8rem;
            margin-top: 5px;
            display: block;
        }

        /* Result parameter styling */
        .result-message {
            position: fixed;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            background: #dc2626;
            color: white;
            padding: 15px 25px;
            border-radius: 8px;
            box-shadow: 0 10px 30px rgba(220, 38, 38, 0.3);
            font-weight: 500;
            z-index: 1000;
            animation: slideUp 0.3s ease;
            max-width: 90%;
            text-align: center;
        }

        @keyframes slideUp {
            from {
                transform: translate(-50%, 100%);
                opacity: 0;
            }
            to {
                transform: translate(-50%, 0);
                opacity: 1;
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                grid-template-columns: 1fr;
                margin: 10px;
                border-radius: 15px;
            }

            .welcome-section {
                padding: 40px 30px;
                order: 2;
            }

            .form-section {
                padding: 40px 30px;
                order: 1;
            }

            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }

            .logo {
                font-size: 2.2rem;
            }

            .tagline {
                font-size: 1rem;
            }

            .features li {
                font-size: 0.9rem;
            }
        }

        @media (max-width: 480px) {
            .container {
                margin: 5px;
            }

            .welcome-section,
            .form-section {
                padding: 30px 20px;
            }

            .logo {
                font-size: 2rem;
            }

            .form h2 {
                font-size: 1.5rem;
            }
        }

        /* Additional animations */
        .welcome-section {
            animation: slideInLeft 0.6s ease;
        }

        .form-section {
            animation: slideInRight 0.6s ease;
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-30px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(30px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Welcome Section -->
        <div class="welcome-section">
            <div class="logo">SocialConnect</div>
            <div class="tagline">Connect with friends and the world around you</div>
            
            <ul class="features">
                <li>Share photos and updates with friends</li>
                <li>Connect with people you know</li>
                <li>Discover new communities</li>
                <li>Stay updated with latest news</li>
                <li>Express yourself freely</li>
            </ul>
        </div>

        <!-- Form Section -->
        <div class="form-section">
            <div class="form-container">
                <div class="form-tabs">
                    <div class="tab active" onclick="switchTab('login')">Login</div>
                    <div class="tab" onclick="switchTab('register')">Sign Up</div>
                </div>

                <!-- Login Form -->
                <div id="loginForm" class="form active">
                    <h2>Welcome Back!</h2>

                    <div class="error-message" id="loginError"></div>

                    <!-- Spring Form -->
                    <form:form action="login" method="post" modelAttribute="user" >
                        <div class="form-group">
                            <form:label path="email">Email or Username</form:label>
                            <form:input path="email" name="email" id="loginEmail" class="form-input" placeholder="Enter your email or username" required="true"/>
                        </div>

                        <div class="form-group">
                            <form:label path="password">Password</form:label>
                            <form:password path="password" name="password" id="loginPassword" class="form-input" placeholder="Enter your password" required="true"/>
                        </div>

                        <button type="submit" class="submit-btn">Login</button>

                        <div class="forgot-password">
                            <a href="#" onclick="showForgotPassword()">Forgot your password?</a>
                        </div>
                        <br>
                    </form:form>
                </div>

                <!-- Register Form -->
                <div id="registerForm" class="form">
                    <h2>Create Account</h2>
                    
                    <!-- Success Message -->
                    <c:if test="${not empty successMessage}">
                        <div class="success-message" id="registerSuccess">${successMessage}</div>
                    </c:if>
                    
                    <!-- Error Message -->
                    <c:if test="${not empty errorMessage}">
                        <div class="error-message" id="registerError">${errorMessage}</div>
                    </c:if>
                    
                    <!-- Registration Form with ModelAttribute -->
                    <form:form action="register" 
                               method="post" 
                               modelAttribute="user"
                               onsubmit="handleRegister(event)">
                        
                        <div class="form-row">
                            <div class="form-group">
                                <form:label path="firstName">First Name</form:label>
                                <form:input type="text" 
                                           path="firstName" 
                                           class="form-input" 
                                           id="firstName"
                                           placeholder="First name" 
                                           required="true"/>
                                <form:errors path="firstName" cssClass="field-error"/>
                            </div>
                            
                            <div class="form-group">
                                <form:label path="lastName">Last Name</form:label>
                                <form:input type="text" 
                                           path="lastName" 
                                           class="form-input"
                                           id="lastName"
                                           placeholder="Last name" 
                                           required="true"/>
                                <form:errors path="lastName" cssClass="field-error"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <form:label path="email">Email</form:label>
                            <form:input type="email" 
                                       path="email" 
                                       class="form-input"
                                       id="email"
                                       placeholder="Enter your email" 
                                       required="true"/>
                            <form:errors path="email" cssClass="field-error"/>
                        </div>
                        
                        <div class="form-group">
                            <form:label path="userName">Username</form:label>
                            <form:input type="text" 
                                       path="userName" 
                                       class="form-input" 
                                       id="userName"
                                       placeholder="Choose a username" 
                                       required="true"/>
                            <form:errors path="userName" cssClass="field-error"/>
                        </div>
                        
                        <div class="form-group">
                            <form:label path="password">Password</form:label>
                            <form:password path="password" 
                                          class="form-input" 
                                          id="password"
                                          placeholder="Create a password" 
                                          required="true"/>
                            <form:errors path="password" cssClass="field-error"/>
                        </div>
                        
                        <div class="form-group">
                            <label>Confirm Password</label>
                            <input type="password" class="form-input"
                                              id="ConfirmPassword" 
                                              placeholder="Confirm your password" 
                                              required="true" /> 
                        </div>
                        
                        <button type="submit" class="submit-btn">Create Account</button>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Switch between login and register tabs
        function switchTab(tabName) {
            // Update tabs
            document.querySelectorAll('.tab').forEach(tab => {
                tab.classList.remove('active');
            });
            event.target.classList.add('active');
            
            // Update forms
            document.querySelectorAll('.form').forEach(form => {
                form.classList.remove('active');
            });
            
            if (tabName === 'login') {
                document.getElementById('loginForm').classList.add('active');
            } else {
                document.getElementById('registerForm').classList.add('active');
            }
            
            // Clear messages
            clearMessages();
        }

        // Handle login form submission
        function handleLogin(event) {
            event.preventDefault();
            
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            
            // Clear previous messages
            clearMessages();
            
            // Basic validation
            if (!email || !password) {
                showMessage('loginError', 'Please fill in all fields');
                return;
            }
            
            // Simulate login process
            if (email === 'demo@example.com' && password === 'password') {
                alert('Login successful! Redirecting to homepage...');
                // In real implementation, redirect to homepage
                // window.location.href = '/home';
            } else {
                showMessage('loginError', 'Invalid email/username or password');
            }
        }

        function handleRegister(event) {
            // Prevent form submission for validation
            event.preventDefault();

            // Get password and confirm password fields
            const password = document.getElementById("password").value.trim();
            const confirmPassword = document.getElementById("ConfirmPassword").value.trim();

            // Check if empty
            if (password === "" || confirmPassword === "") {
                alert("Password fields cannot be empty.");
                return false;
            }

            // Check length (optional)
            if (password.length < 6) {
                alert("Password must be at least 6 characters long.");
                return false;
            }

            // Check match
            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false;
            }

            // ✅ If everything is fine, submit the form
            event.target.submit();
        }

        function clearMessages() {
            document.querySelectorAll('.error-message, .success-message').forEach(msg => {
                msg.style.display = 'none';
            });
        }

        function showMessage(elementId, message) {
            const element = document.getElementById(elementId);
            if (element) {
                element.textContent = message;
                element.style.display = 'block';
            }
        }
    </script>
    
    <!-- Result Parameter Display -->
    <c:if test="${not empty result}">
        <div class="result-message">${result}</div>
    </c:if>
</body>
</html>