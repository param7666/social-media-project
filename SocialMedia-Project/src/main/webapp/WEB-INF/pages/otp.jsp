<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    // Get user information from session
    String phoneNumber = (String) session.getAttribute("phoneNumber");
    String email = (String) session.getAttribute("email");
    String errorMessage = (String) request.getAttribute("errorMessage");
    String successMessage = (String) request.getAttribute("successMessage");
    
    // Default values if not in session
    if (phoneNumber == null) phoneNumber = "+1 (555) 123-4567";
    if (email == null) email = "user@example.com";
%> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verify Your Account</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 450px;
            width: 100%;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .logo {
            width: 80px;
            height: 80px;
            background: linear-gradient(45deg, #667eea, #764ba2);
            border-radius: 50%;
            margin: 0 auto 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            color: white;
            font-weight: bold;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        h1 {
            color: #333;
            font-size: 28px;
            margin-bottom: 10px;
            font-weight: 700;
        }

        .subtitle {
            color: #666;
            font-size: 16px;
            margin-bottom: 20px;
            line-height: 1.5;
        }

        .contact-display {
            color: #667eea;
            font-weight: 600;
            margin-bottom: 30px;
        }

        .form-group {
            margin: 30px 0;
        }

        .form-label {
            display: block;
            color: #333;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 10px;
            text-align: left;
        }

        .otp-input {
            width: 100%;
            padding: 18px;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            text-align: center;
            font-size: 24px;
            font-weight: 600;
            color: #333;
            background: white;
            transition: all 0.3s ease;
            outline: none;
            letter-spacing: 8px;
        }

        .otp-input:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            transform: translateY(-2px);
        }

        .otp-input.error {
            border-color: #ff6b6b;
            animation: shake 0.5s;
            background-color: #fff5f5;
        }

        .otp-input.success {
            border-color: #28a745;
            background-color: #f0fff4;
        }

        @keyframes shake {
            0%, 20%, 40%, 60%, 80% { transform: translateX(-5px); }
            10%, 30%, 50%, 70% { transform: translateX(5px); }
            90%, 100% { transform: translateX(0); }
        }

        .char-count {
            text-align: right;
            font-size: 12px;
            color: #888;
            margin-top: 5px;
        }

        .verify-btn {
            width: 100%;
            padding: 16px;
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 20px;
            position: relative;
            overflow: hidden;
        }

        .verify-btn:hover:not(:disabled) {
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.3);
        }

        .verify-btn:active:not(:disabled) {
            transform: translateY(0);
        }

        .verify-btn:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        .verify-btn.loading {
            position: relative;
            color: transparent;
        }

        .verify-btn.loading::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 20px;
            height: 20px;
            margin: -10px 0 0 -10px;
            border: 2px solid transparent;
            border-top: 2px solid white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .resend-container {
            margin-top: 25px;
            color: #666;
            font-size: 14px;
        }

        .resend-btn {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            cursor: pointer;
            transition: color 0.3s ease;
            border: none;
            background: none;
            padding: 0;
        }

        .resend-btn:hover:not(:disabled) {
            color: #764ba2;
            text-decoration: underline;
        }

        .resend-btn:disabled {
            color: #ccc;
            cursor: not-allowed;
        }

        .timer {
            color: #667eea;
            font-weight: 600;
        }

        .message {
            padding: 12px;
            border-radius: 8px;
            margin: 15px 0;
            font-size: 14px;
            font-weight: 500;
            opacity: 0;
            transform: translateY(-10px);
            transition: all 0.3s ease;
        }

        .message.success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .message.error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .message.show {
            opacity: 1;
            transform: translateY(0);
        }

        .input-hint {
            font-size: 12px;
            color: #888;
            margin-top: 5px;
            text-align: left;
        }

        @media (max-width: 480px) {
            .container {
                padding: 30px 20px;
            }
            
            .otp-input {
                padding: 15px;
                font-size: 20px;
                letter-spacing: 6px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">SM</div>
        <h1>Verify Your Account</h1>
        <p class="subtitle">We've sent a 6-digit verification code to your email</p>
        <div class="contact-display"><%= email %></div>
        
        <!-- Server-side messages -->
        <% if (errorMessage != null) { %>
            <div class="message error show">
                <%= errorMessage %>
            </div>
        <% } %>
        
        <% if (successMessage != null) { %>
            <div class="message success show">
                <%= successMessage %>
            </div>
        <% } %>
        
        <!-- Client-side message container -->
        <div id="message" class="message"></div>
        
        <form id="otpForm" method="POST" action="${pageContext.request.contextPath}/verifyOTP">
            <!-- Hidden field for phone number -->
            <input type="hidden" name="phoneNumber" value="<%= phoneNumber %>" />
            
            <!-- CSRF Token (if using Spring Security or similar) -->
            <c:if test="${not empty _csrf}">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </c:if>
            
            <div class="form-group">
                <label class="form-label" for="otpCode">Enter 6-Digit Code</label>
                <input 
                    type="text" 
                    id="otpCode" 
                    name="otpCode"
                    class="otp-input" 
                    placeholder="000000"
                    maxlength="6"
                    autocomplete="one-time-code"
                    inputmode="numeric"
                    pattern="[0-9]{6}"
                    required
                    value="${param.otpCode}"
                >
                <div class="char-count"><span id="charCount">0</span>/6</div>
                <div class="input-hint">Enter the 6-digit code sent to your email</div>
            </div>
            
            <button type="submit" class="verify-btn" id="verifyBtn">Verify Code</button>
        </form>
        
        <div class="resend-container">
            <span>Didn't receive the code? </span>
            <form id="resendForm" method="POST" action="${pageContext.request.contextPath}/resendOTP" style="display: inline;">
                <input type="hidden" name="phoneNumber" value="<%= phoneNumber %>" />
                <input type="hidden" name="email" value="<%= email %>" />
                
                <c:if test="${not empty _csrf}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                </c:if>
                
                <button type="button" class="resend-btn" id="resendBtn">Resend Code</button>
            </form>
            <div id="timer" class="timer"></div>
        </div>
    </div>

    <script>
        class OTPVerification {
            constructor() {
                this.form = document.getElementById('otpForm');
                this.resendForm = document.getElementById('resendForm');
                this.input = document.getElementById('otpCode');
                this.verifyBtn = document.getElementById('verifyBtn');
                this.resendBtn = document.getElementById('resendBtn');
                this.timer = document.getElementById('timer');
                this.message = document.getElementById('message');
                this.charCount = document.getElementById('charCount');
                
                this.resendTimer = 30;
                this.timerInterval = null;
                this.isVerifying = false;
                
                this.init();
            }
            
            init() {
                this.setupEventListeners();
                this.startResendTimer();
                this.input.focus();
                
                // Initialize character count
                this.updateCharCount(this.input.value.length);
                this.verifyBtn.disabled = this.input.value.length !== 6;
            }
            
            setupEventListeners() {
                // Input validation and formatting
                this.input.addEventListener('input', (e) => this.handleInput(e));
                this.input.addEventListener('paste', (e) => this.handlePaste(e));
                this.input.addEventListener('keydown', (e) => this.handleKeyDown(e));
                
                // Form submission with loading state
                this.form.addEventListener('submit', (e) => this.handleSubmit(e));
                
                // Resend button
                this.resendBtn.addEventListener('click', () => this.handleResend());
            }
            
            handleInput(e) {
                let value = e.target.value.replace(/\D/g, ''); // Only allow digits
                
                if (value.length > 6) {
                    value = value.slice(0, 6);
                }
                
                e.target.value = value;
                this.updateCharCount(value.length);
                this.clearMessage();
                this.clearInputState();
                
                // Enable/disable verify button
                this.verifyBtn.disabled = value.length !== 6 || this.isVerifying;
            }
            
            handlePaste(e) {
                e.preventDefault();
                const paste = (e.clipboardData || window.clipboardData).getData('text');
                const digits = paste.replace(/\D/g, '').slice(0, 6);
                
                this.input.value = digits;
                this.updateCharCount(digits.length);
                this.verifyBtn.disabled = digits.length !== 6 || this.isVerifying;
                this.clearMessage();
                this.clearInputState();
            }
            
            handleKeyDown(e) {
                // Allow: backspace, delete, tab, escape, enter
                if ([8, 9, 27, 13, 46].indexOf(e.keyCode) !== -1 ||
                    // Allow: Ctrl+A, Ctrl+C, Ctrl+V, Ctrl+X
                    (e.keyCode === 65 && e.ctrlKey === true) ||
                    (e.keyCode === 67 && e.ctrlKey === true) ||
                    (e.keyCode === 86 && e.ctrlKey === true) ||
                    (e.keyCode === 88 && e.ctrlKey === true)) {
                    return;
                }
                
                // Ensure that it is a number and stop the keypress
                if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                    e.preventDefault();
                }
            }
            
            handleSubmit(e) {
                const otpCode = this.input.value.trim();
                
                if (otpCode.length !== 6) {
                    e.preventDefault();
                    this.showMessage('Please enter a 6-digit code', 'error');
                    return;
                }
                
                // Show loading state
                this.isVerifying = true;
                this.verifyBtn.disabled = true;
                this.verifyBtn.classList.add('loading');
                this.clearMessage();
                
                // Let the form submit normally to the server
                // The loading state will be cleared when the page reloads or redirects
            }
            
            handleResend() {
                if (this.resendBtn.disabled) return;
                
                this.clearMessage();
                this.clearInputState();
                this.input.value = '';
                this.updateCharCount(0);
                this.verifyBtn.disabled = true;
                this.input.focus();
                
                // Show loading message
                this.showMessage('📱 Sending new code...', 'success');
                
                // Submit the resend form
                this.resendForm.submit();
            }
            
            updateCharCount(count) {
                this.charCount.textContent = count;
            }
            
            showMessage(text, type) {
                this.message.textContent = text;
                this.message.className = `message ${type} show`;
                
                if (type === 'error') {
                    setTimeout(() => this.clearMessage(), 3000);
                }
            }
            
            clearMessage() {
                this.message.classList.remove('show');
            }
            
            clearInputState() {
                this.input.classList.remove('error', 'success');
            }
            
            startResendTimer() {
                this.resendTimer = 30;
                this.resendBtn.disabled = true;
                this.updateTimerDisplay();
                
                this.timerInterval = setInterval(() => {
                    this.resendTimer--;
                    this.updateTimerDisplay();
                    
                    if (this.resendTimer <= 0) {
                        clearInterval(this.timerInterval);
                        this.resendBtn.disabled = false;
                        this.timer.textContent = '';
                    }
                }, 1000);
            }
            
            updateTimerDisplay() {
                if (this.resendTimer > 0) {
                    this.timer.textContent = `Resend available in ${this.resendTimer}s`;
                }
            }
        } 
        
        // Initialize when page loads
        document.addEventListener('DOMContentLoaded', () => {
            new OTPVerification();
        });
        
        // Handle server-side error messages
        <% if (errorMessage != null) { %>
            document.addEventListener('DOMContentLoaded', () => {
                const input = document.getElementById('otpCode');
                if (input) {
                    input.classList.add('error');
                    input.focus();
                    input.select();
                }
            });
        <% } %>
    </script>
</body>
</html> --%>







<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String errorMessage = (String) request.getAttribute("errorMessage");
    String successMessage = (String) request.getAttribute("successMessage");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP Verification</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        .logo {
            width: 60px;
            height: 60px;
            background: linear-gradient(45deg, #667eea, #764ba2);
            border-radius: 50%;
            margin: 0 auto 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: white;
            font-weight: bold;
        }

        h1 {
            color: #333;
            font-size: 24px;
            margin-bottom: 10px;
        }

        .subtitle {
            color: #666;
            font-size: 14px;
            margin-bottom: 30px;
        }

        .form-group {
            margin: 20px 0;
            text-align: left;
        }

        .form-label {
            display: block;
            color: #333;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .otp-input {
            width: 100%;
            padding: 15px;
            border: 2px solid #ddd;
            border-radius: 8px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            letter-spacing: 5px;
        }

        .otp-input:focus {
            outline: none;
            border-color: #667eea;
        }

        .verify-btn {
            width: 100%;
            padding: 15px;
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 20px;
        }

        .verify-btn:hover {
            opacity: 0.9;
        }

        .resend-link {
            margin-top: 20px;
            color: #666;
            font-size: 14px;
        }

        .resend-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: bold;
        }

        .resend-link a:hover {
            text-decoration: underline;
        }

        .message {
            padding: 10px;
            border-radius: 5px;
            margin: 15px 0;
            font-size: 14px;
        }

        .message.success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .message.error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        @media (max-width: 480px) {
            .container {
                padding: 20px;
            }
            
            .otp-input {
                font-size: 18px;
                letter-spacing: 3px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">OTP</div>
        <h1>Verify OTP</h1>
        <p class="subtitle">Enter the 6-digit code sent to your email/phone</p>
        
        <!-- Show messages if available -->
        <% if (errorMessage != null) { %>
            <div class="message error">
                <%= errorMessage %>
            </div>
        <% } %>
        
        <% if (successMessage != null) { %>
            <div class="message success">
                <%= successMessage %>
            </div>
        <% } %>
        
        <form method="POST" action="verifyOTP">
            <div class="form-group">
                <label class="form-label" for="otpCode">OTP Code</label>
                <input 
                    type="text" 
                    id="otpCode" 
                    name="otpCode"
                    class="otp-input" 
                    placeholder="000000"
                    maxlength="6"
                    required
                    onkeypress="return isNumberKey(event)"
                >
            </div>
            
            <button type="submit" class="verify-btn">Verify OTP</button>
        </form>
        
        <div class="resend-link">
            Didn't receive code? 
            <a href="resendOTP">Resend OTP</a>
        </div>
    </div>

    <script>
        // Simple function to allow only numbers
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
        
        // Focus on input when page loads
        window.onload = function() {
            document.getElementById('otpCode').focus();
        };
    </script>
</body>
</html>