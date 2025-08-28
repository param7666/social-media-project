              
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
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ff6b6b 0%, #4ecdc4 50%, #45b7d1 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            display: grid;
            grid-template-columns: 1fr 1fr;
            max-width: 1200px;
            width: 100%;
            min-height: 600px;
            overflow: hidden;
            position: relative;
        }

        .welcome-section {
            background: linear-gradient(135deg, #2d3748 0%, #1a202c 100%);
            color: white;
            padding: 60px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
        }

        .welcome-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="20" cy="20" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="80" cy="40" r="0.5" fill="rgba(255,255,255,0.1)"/><circle cx="40" cy="80" r="1.5" fill="rgba(255,255,255,0.05)"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>') repeat;
            opacity: 0.3;
        }

        .logo {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 15px;
            background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            position: relative;
            z-index: 1;
        }

        .tagline {
            font-size: 1.2rem;
            margin-bottom: 40px;
            opacity: 0.9;
            line-height: 1.4;
            position: relative;
            z-index: 1;
        }

        .features {
            list-style: none;
            position: relative;
            z-index: 1;
        }

        .features li {
            margin: 15px 0;
            padding-left: 30px;
            position: relative;
            font-size: 1rem;
            line-height: 1.5;
            opacity: 0.9;
            transform: translateX(-20px);
            animation: slideIn 0.6s ease forwards;
        }

        .features li:nth-child(1) { animation-delay: 0.1s; }
        .features li:nth-child(2) { animation-delay: 0.2s; }
        .features li:nth-child(3) { animation-delay: 0.3s; }
        .features li:nth-child(4) { animation-delay: 0.4s; }
        .features li:nth-child(5) { animation-delay: 0.5s; }

        .features li::before {
            content: '✓';
            position: absolute;
            left: 0;
            top: 0;
            background: linear-gradient(45deg, #ff6b6b, #4ecdc4);
            color: white;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: bold;
        }

        .form-section {
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-container {
            max-width: 400px;
            width: 100%;
            margin: 0 auto;
        }

        .form-tabs {
            display: flex;
            margin-bottom: 30px;
            background: #f8f9fa;
            border-radius: 12px;
            padding: 4px;
            position: relative;
        }

        .tab {
            flex: 1;
            text-align: center;
            padding: 12px 20px;
            cursor: pointer;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
            position: relative;
            z-index: 2;
        }

        .tab.active {
            background: linear-gradient(135deg, #ff6b6b, #4ecdc4);
            color: white;
            box-shadow: 0 4px 12px rgba(255, 107, 107, 0.3);
        }

        .tab:not(.active) {
            color: #666;
        }

        .tab:not(.active):hover {
            color: #333;
            background: rgba(255, 107, 107, 0.1);
        }

        .form {
            display: none;
            animation: fadeIn 0.3s ease;
        }

        .form.active {
            display: block;
        }

        .form h2 {
            color: #333;
            margin-bottom: 25px;
            font-size: 1.8rem;
            font-weight: 600;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
            font-size: 0.9rem;
        }

        .form-input {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: #fff;
        }

        .form-input:focus {
            outline: none;
            border-color: #ff6b6b;
            box-shadow: 0 0 0 3px rgba(255, 107, 107, 0.1);
            transform: translateY(-1px);
        }

        .form-input:hover:not(:focus) {
            border-color: #c7d0e8;
        }

        .submit-btn {
            width: 100%;
            background: linear-gradient(135deg, #ff6b6b, #4ecdc4);
            color: white;
            border: none;
            padding: 14px;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .submit-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s;
        }

        .submit-btn:hover::before {
            left: 100%;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(255, 107, 107, 0.3);
        }

        .submit-btn:active {
            transform: translateY(-1px);
        }

        .forgot-password {
            text-align: center;
            margin-top: 15px;
        }

        .forgot-password a {
            color: #ff6b6b;
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.3s ease;
        }

        .forgot-password a:hover {
            color: #e55555;
            text-decoration: underline;
        }

        .error-message {
            background: #fef2f2;
            color: #dc2626;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 15px;
            border-left: 4px solid #ef4444;
            animation: shake 0.5s ease-in-out;
        }

        .success-message {
            background: #ecfdf5;
            color: #047857;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 15px;
            border-left: 4px solid #4ecdc4;
            animation: slideDown 0.5s ease;
        }

        .field-error {
            color: #ef4444;
            font-size: 0.85rem;
            margin-top: 5px;
            display: block;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideIn {
            to { 
                opacity: 1; 
                transform: translateX(0); 
            }
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        @keyframes slideDown {
            from { 
                opacity: 0; 
                transform: translateY(-10px); 
            }
            to { 
                opacity: 1; 
                transform: translateY(0); 
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                grid-template-columns: 1fr;
                margin: 10px;
                max-width: none;
            }

            .welcome-section {
                padding: 40px 30px;
                text-align: center;
            }

            .logo {
                font-size: 2.5rem;
            }

            .form-section {
                padding: 30px 25px;
            }

            .form-row {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            body {
                padding: 10px;
            }

            .welcome-section {
                padding: 30px 20px;
            }

            .form-section {
                padding: 25px 20px;
            }

            .logo {
                font-size: 2rem;
            }

            .tagline {
                font-size: 1rem;
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
    </div>
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
        
        <%-- <div class="form-group">
            <form:label path="confirmPassword">Confirm Password</form:label>
            <form:password path="ConfirmPassword" 
                          class="form-input"
                          id="ConfirmPassword" 
                          placeholder="Confirm your password" 
                          required="true"/>
            <form:errors path="ConfirmPassword" cssClass="field-error"/>
        </div> --%>
        
        <div class="form-group">
        <label>Password</label>
        <input type="password"  class="form-input"
                          id="ConfirmPassword" 
                          placeholder="Confirm your password" 
                          required="true" /> 
        </div>
        
        <button type="submit" class="submit-btn">Create Account</button>
    </form:form>
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
    </script>
    
     <div class="tagline" style="background-color:red;">${result}</div> <br>
</body>
</html>