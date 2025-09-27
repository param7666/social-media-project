<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Update Profile</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            background-attachment: fixed;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            color: #1c1e21;
            line-height: 1.6;
        }

        /* Glassmorphism overlay */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: 
                radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(255, 255, 255, 0.15) 0%, transparent 50%),
                radial-gradient(circle at 40% 40%, rgba(120, 119, 198, 0.2) 0%, transparent 50%);
            pointer-events: none;
            z-index: -1;
        }

        .profile-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 25px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
            max-width: 900px;
            width: 100%;
            overflow: hidden;
            animation: slideInUp 0.8s ease-out;
            position: relative;
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .profile-header {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
            padding: 40px 30px;
            text-align: center;
            border-bottom: 1px solid rgba(102, 126, 234, 0.1);
            position: relative;
        }

        .profile-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: 
                radial-gradient(circle at 30% 30%, rgba(102, 126, 234, 0.2) 0%, transparent 50%),
                radial-gradient(circle at 70% 70%, rgba(118, 75, 162, 0.2) 0%, transparent 50%);
            pointer-events: none;
            z-index: 0;
        }

        .profile-header > * {
            position: relative;
            z-index: 1;
        }

        .profile-header h2 {
            font-size: 32px;
            font-weight: 700;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
        }

        .profile-header h2::before {
            content: '\f007';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .profile-pic {
            margin: 20px 0;
            display: flex;
            justify-content: center;
        }

        .profile-pic img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 4px solid #667eea;
            object-fit: cover;
            box-shadow: 0 15px 35px rgba(102, 126, 234, 0.4);
            transition: all 0.3s ease;
        }

        .profile-pic img:hover {
            transform: scale(1.05);
            box-shadow: 0 20px 45px rgba(102, 126, 234, 0.5);
        }

        .form-content {
            padding: 40px 30px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }

        .form-row {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .form-row.full-width {
            grid-column: 1 / -1;
        }

        label {
            font-weight: 600;
            color: #1c1e21;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        label::before {
            content: attr(data-icon);
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            color: #667eea;
            font-size: 16px;
        }

        /* Icon mappings */
        label[for*="id"]::before { content: '\f2bb'; }
        label[for*="userName"]::before { content: '\f007'; }
        label[for*="password"]::before { content: '\f023'; }
        label[for*="firstName"]::before { content: '\f406'; }
        label[for*="lastName"]::before { content: '\f406'; }
        label[for*="email"]::before { content: '\f0e0'; }
        label[for*="mobileNo"]::before { content: '\f095'; }
        label[for*="date_of_birth"]::before { content: '\f073'; }
        label[for*="location"]::before { content: '\f3c5'; }
        label[for*="bio"]::before { content: '\f044'; }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="tel"],
        input[type="date"],
        input[type="file"],
        textarea {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid rgba(102, 126, 234, 0.2);
            border-radius: 15px;
            outline: none;
            background: rgba(255, 255, 255, 0.9);
            color: #1c1e21;
            font-size: 15px;
            font-family: inherit;
            transition: all 0.3s ease;
            position: relative;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus,
        input[type="tel"]:focus,
        input[type="date"]:focus,
        textarea:focus {
            border-color: #667eea;
            box-shadow: 0 0 20px rgba(102, 126, 234, 0.3);
            transform: translateY(-2px);
        }

        input[readonly] {
            background: rgba(102, 126, 234, 0.1);
            cursor: not-allowed;
            opacity: 0.8;
        }

        textarea {
            resize: vertical;
            min-height: 120px;
        }

        /* Enhanced File Input */
        input[type="file"] {
            position: relative;
            cursor: pointer;
            padding: 20px;
            text-align: center;
            border: 2px dashed rgba(102, 126, 234, 0.3);
            background: rgba(102, 126, 234, 0.05);
            transition: all 0.3s ease;
        }

        input[type="file"]:hover {
            border-color: #667eea;
            background: rgba(102, 126, 234, 0.1);
            transform: translateY(-2px);
        }

        input[type="file"]::before {
            content: 'Choose Profile Picture';
            display: block;
            color: #667eea;
            font-weight: 600;
            margin-bottom: 5px;
        }

        input[type="file"]::after {
            content: 'Click to browse or drag and drop';
            display: block;
            color: #6c757d;
            font-size: 12px;
        }

        input[type="file"][data-filename]::before {
            content: 'Selected: ' attr(data-filename);
            color: #10b981;
        }

        /* Enhanced Button */
        .btn {
            background: linear-gradient(135deg, #667eea, #764ba2);
            border: none;
            color: white;
            padding: 18px 40px;
            border-radius: 25px;
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            font-family: inherit;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            box-shadow: 0 8px 30px rgba(102, 126, 234, 0.4);
            margin: 20px auto;
            min-width: 200px;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            transition: all 0.3s ease;
            transform: translate(-50%, -50%);
            z-index: 0;
        }

        .btn:hover::before {
            width: 300px;
            height: 300px;
        }

        .btn > * {
            position: relative;
            z-index: 1;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 45px rgba(102, 126, 234, 0.6);
        }

        .btn:active {
            transform: translateY(-1px);
        }

        .btn.loading {
            background: linear-gradient(135deg, #6c757d, #495057);
            cursor: not-allowed;
            pointer-events: none;
        }

        .btn.loading::after {
            content: '';
            width: 20px;
            height: 20px;
            border: 2px solid transparent;
            border-top: 2px solid white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin-left: 10px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Home Link Styling */
        a[href="home"] {
            position: fixed;
            top: 30px;
            left: 30px;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            color: #667eea;
            text-decoration: none;
            padding: 12px 20px;
            border-radius: 25px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            gap: 8px;
            z-index: 1000;
        }

        a[href="home"]::before {
            content: '\f015';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
        }

        a[href="home"]:hover {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 12px 35px rgba(102, 126, 234, 0.4);
        }

        /* Success/Error States */
        .form-row input.success,
        .form-row textarea.success {
            border-color: #10b981;
            box-shadow: 0 0 20px rgba(16, 185, 129, 0.2);
        }

        .form-row input.error,
        .form-row textarea.error {
            border-color: #ef4444;
            box-shadow: 0 0 20px rgba(239, 68, 68, 0.2);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                padding: 10px;
            }

            .profile-container {
                border-radius: 20px;
                margin: 0;
            }

            .profile-header {
                padding: 30px 20px;
            }

            .profile-header h2 {
                font-size: 28px;
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

            a[href="home"] {
                top: 15px;
                left: 15px;
                padding: 10px 15px;
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            .profile-header h2 {
                font-size: 24px;
                flex-direction: column;
                gap: 10px;
            }

            .btn {
                width: 100%;
                padding: 16px 30px;
            }

            input[type="text"],
            input[type="password"],
            input[type="email"],
            input[type="tel"],
            input[type="date"],
            input[type="file"],
            textarea {
                padding: 12px 15px;
                font-size: 14px;
            }
        }

        /* Scrollbar styling */
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.1);
        }

        ::-webkit-scrollbar-thumb {
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: linear-gradient(135deg, #764ba2, #667eea);
        }

        /* Floating Labels Effect */
        .form-row {
            position: relative;
        }

        .form-row input:focus + label,
        .form-row input:not(:placeholder-shown) + label,
        .form-row textarea:focus + label,
        .form-row textarea:not(:placeholder-shown) + label {
            transform: translateY(-25px) scale(0.85);
            color: #667eea;
        }

        /* Micro-interactions */
        .form-row:hover input,
        .form-row:hover textarea {
            border-color: rgba(102, 126, 234, 0.4);
        }

        /* Form validation indicators */
        .form-row::after {
            content: '';
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            width: 20px;
            height: 20px;
            opacity: 0;
            transition: all 0.3s ease;
        }

        .form-row.valid::after {
            content: '\f00c';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            color: #10b981;
            opacity: 1;
        }

        .form-row.invalid::after {
            content: '\f00d';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            color: #ef4444;
            opacity: 1;
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
                <img src="data:image/jpeg;base64,${user.profilePicture}" alt="Profile Picture"/>
            </div>
        </c:if>
    </div>

    <div class="form-content">
        <!-- Binding to modelAttribute="user" -->
        <form:form action="updateProfile" method="post" modelAttribute="user" enctype="multipart/form-data">
            
            <div class="form-grid">
                <div class="form-row">
                    <form:input path="id" readonly="true" placeholder="User ID"/>
                    <form:label path="id">User ID</form:label>
                </div>

                <div class="form-row">
                    <form:input path="userName" placeholder="Enter your username"/>
                    <form:label path="userName">Username</form:label>
                </div>

                <div class="form-row">
                    <form:input path="password" type="password" placeholder="Enter your password"/>
                    <form:label path="password">Password</form:label>
                </div>

                <div class="form-row">
                    <form:input path="firstName" placeholder="Enter your first name"/>
                    <form:label path="firstName">First Name</form:label>
                </div>

                <div class="form-row">
                    <form:input path="lastName" placeholder="Enter your last name"/>
                    <form:label path="lastName">Last Name</form:label>
                </div>

                <div class="form-row">
                    <form:input path="email" type="email" placeholder="Enter your email address"/>
                    <form:label path="email">Email Address</form:label>
                </div>

                <div class="form-row">
                    <form:input path="mobileNo" type="tel" placeholder="Enter your mobile number"/>
                    <form:label path="mobileNo">Mobile Number</form:label>
                </div>

                <div class="form-row">
                    <form:input path="date_of_birth" type="date"/>
                    <form:label path="date_of_birth">Date of Birth</form:label>
                </div>

                <div class="form-row">
                    <form:input path="location" placeholder="Enter your location"/>
                    <form:label path="location">Location</form:label>
                </div>

                <div class="form-row">
                    <input type="file" name="profilePictureFile" accept="image/*"/>
                    <label>Profile Picture</label>
                </div>

                <div class="form-row full-width">
                    <form:textarea path="bio" rows="4" placeholder="Tell us about yourself..."/>
                    <form:label path="bio">Bio</form:label>
                </div>
            </div>

            <div class="form-row">
                <button type="submit" class="btn" onclick="this.classList.add('loading')">
                    <i class="fa-solid fa-user-pen"></i>
                    Update Profile
                </button>
            </div>

        </form:form>
    </div>
</div>

<a href="home">Home</a>

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
                const formRow = this.closest('.form-row');
                if (this.value.trim() && !this.readOnly) {
                    this.style.borderColor = '#10b981';
                    this.style.boxShadow = '0 0 0 3px rgba(16, 185, 129, 0.1)';
                    formRow.classList.add('valid');
                    formRow.classList.remove('invalid');
                } else if (this.hasAttribute('required') && !this.value.trim()) {
                    formRow.classList.add('invalid');
                    formRow.classList.remove('valid');
                }
            });

            // Real-time validation for email
            if (input.type === 'email') {
                input.addEventListener('input', function() {
                    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    const formRow = this.closest('.form-row');
                    if (emailRegex.test(this.value)) {
                        formRow.classList.add('valid');
                        formRow.classList.remove('invalid');
                    } else if (this.value.length > 0) {
                        formRow.classList.add('invalid');
                        formRow.classList.remove('valid');
                    }
                });
            }

            // Real-time validation for mobile
            if (input.type === 'tel') {
                input.addEventListener('input', function() {
                    const phoneRegex = /^[\d\s\-\+\(\)]{10,}$/;
                    const formRow = this.closest('.form-row');
                    if (phoneRegex.test(this.value)) {
                        formRow.classList.add('valid');
                        formRow.classList.remove('invalid');
                    } else if (this.value.length > 0) {
                        formRow.classList.add('invalid');
                        formRow.classList.remove('valid');
                    }
                });
            }
        });

        // Enhanced form submission
        form.addEventListener('submit', function(e) {
            const submitBtn = document.querySelector('.btn');
            const originalText = submitBtn.innerHTML;
            submitBtn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Updating...';
            
            // Remove loading class after 3 seconds (adjust based on your needs)
            setTimeout(() => {
                submitBtn.classList.remove('loading');
                submitBtn.innerHTML = originalText;
            }, 3000);
        });

        // Add smooth scroll to form on page load
        const profileContainer = document.querySelector('.profile-container');
        profileContainer.scrollIntoView({ behavior: 'smooth', block: 'center' });

        // Enhanced file drop functionality
        if (fileInput) {
            ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
                fileInput.addEventListener(eventName, preventDefaults, false);
            });

            function preventDefaults(e) {
                e.preventDefault();
                e.stopPropagation();
            }

            ['dragenter', 'dragover'].forEach(eventName => {
                fileInput.addEventListener(eventName, highlight, false);
            });

            ['dragleave', 'drop'].forEach(eventName => {
                fileInput.addEventListener(eventName, unhighlight, false);
            });

            function highlight() {
                fileInput.style.background = 'rgba(102, 126, 234, 0.2)';
                fileInput.style.borderColor = '#667eea';
            }

            function unhighlight() {
                fileInput.style.background = 'rgba(102, 126, 234, 0.05)';
                fileInput.style.borderColor = 'rgba(102, 126, 234, 0.3)';
            }

            fileInput.addEventListener('drop', handleDrop, false);

            function handleDrop(e) {
                const files = e.dataTransfer.files;
                if (files.length > 0) {
                    fileInput.files = files;
                    const fileName = files[0].name;
                    fileInput.setAttribute('data-filename', fileName);
                }
            }
        }
    });
</script>

</body>
</html>