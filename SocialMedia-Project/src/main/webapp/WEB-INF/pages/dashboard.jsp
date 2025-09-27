<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Social Media Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

    <link rel="stylesheet" href="css/styles.css">
    

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
            color: #1c1e21;
            line-height: 1.6;
            min-height: 100vh;
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

        /* Top Navbar */
        .top-nav {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            color: #1c1e21;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        .top-nav h1 {
            font-size: 28px;
            font-weight: 700;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .search-form {
            position: relative;
        }

        .search-form input[type="text"] {
            padding: 12px 20px 12px 45px;
            border-radius: 25px;
            border: 2px solid rgba(102, 126, 234, 0.2);
            width: 320px;
            outline: none;
            background: rgba(255, 255, 255, 0.9);
            color: #1c1e21;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .search-form input[type="text"]:focus {
            border-color: #667eea;
            box-shadow: 0 0 20px rgba(102, 126, 234, 0.3);
        }

        .search-form::before {
            content: '\f002';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #667eea;
            z-index: 1;
        }

        .search-form input[type="submit"] {
            background: linear-gradient(135deg, #667eea, #764ba2);
            border: none;
            color: white;
            padding: 12px 25px;
            border-radius: 25px;
            margin-left: 10px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        }

        .search-form input[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
        }

        .nav-icons {
            display: flex;
            gap: 25px;
            align-items: center;
        }

        .nav-icons i {
            font-size: 20px;
            color: #667eea;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .nav-icons i:hover {
            color: #764ba2;
            transform: scale(1.1);
        }

        .nav-icons a {
            color: #1c1e21;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            padding: 8px 15px;
            border-radius: 20px;
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
        }

        .nav-icons a:hover {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            transform: translateY(-2px);
        }

        /* Layout */
        .dashboard-layout {
            display: flex;
            max-width: 1400px;
            margin: 30px auto;
            gap: 25px;
            padding: 0 25px;
        }

        .left-sidebar, .right-sidebar {
            width: 300px;
        }
        .left-sidebar {
            position: sticky;
    			
        }

        .main-feed {
            flex: 1;
            max-width: 650px;
        }

        /* Enhanced Cards with Glassmorphism */
        .card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            margin-bottom: 25px;
            overflow: hidden;
            animation: slideInUp 0.6s ease-out;
            transition: all 0.3s ease;
            
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Enhanced Profile Card */
        .user-profile-card {
            text-align: center;
            padding: 30px 20px;
            
/*             background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
 */        }

        .user-profile-card img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            border: 4px solid #667eea;
            object-fit: cover;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
            transition: all 0.3s ease;
        }

        .user-profile-card img:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 35px rgba(102, 126, 234, 0.4);
        }

        .user-profile-card h3 {
            margin: 15px 0 8px 0;
            font-size: 20px;
            font-weight: 600;
          background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .user-profile-card p {
            color: #6c757d;
            font-size: 14px;
            font-weight: 500;
        }

        /* Enhanced Sidebar Menu */
        .nav-menu {
            list-style: none;
            padding: 0;
            position: sticky;
    			top: 0;
        }

        .nav-menu li a {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 18px 25px;
            text-decoration: none;
            color: #1c1e21;
            font-weight: 500;
            border-bottom: 1px solid rgba(102, 126, 234, 0.1);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .nav-menu li a::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 0;
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
            transition: width 0.3s ease;
            z-index: -1;
        }

        .nav-menu li a:hover::before {
            width: 100%;
        }

        .nav-menu li a:hover {
            color: #667eea;
            transform: translateX(5px);
        }

        .nav-menu li a i {
            font-size: 18px;
            color: #667eea;
        }

        /* Enhanced Buttons */
        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-weight: 600;
            cursor: pointer;
            padding: 12px 20px;
            border-radius: 25px;
            border: none;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
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

        .btn-primary {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
        }

        .btn-light {
            background: rgba(255, 255, 255, 0.9);
            color: #1c1e21;
            border: 1px solid rgba(102, 126, 234, 0.2);
        }

        .btn-light:hover {
            background: rgba(102, 126, 234, 0.1);
            color: #667eea;
            border-color: #667eea;
            transform: translateY(-1px);
        }

        /* Enhanced Post Cards */
        .post-card {
            position: relative;
            overflow: visible;
        }

        .post-header {
            display: flex;
            align-items: center;
            padding: 20px 25px;
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.05), rgba(118, 75, 162, 0.05));
        }

        .post-header img {
            border-radius: 50%;
            width: 50px;
            height: 50px;
            margin-right: 15px;
            border: 2px solid #667eea;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }

        .post-header h4 {
            font-weight: 600;
            margin-bottom: 3px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .post-time {
            font-size: 12px;
            color: #6c757d;
            font-weight: 500;
        }

        .post-content {
            padding: 0 25px 20px 25px;
        }

        .post-text {
            margin-bottom: 15px;
            font-size: 15px;
            line-height: 1.6;
            color: #1c1e21;
        }

        .post-image {
            width: 100%;
            border-radius: 15px;
            margin-top: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .post-image:hover {
            transform: scale(1.02);
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.15);
        }

        .post-stats {
            display: flex;
            justify-content: space-between;
            padding: 15px 25px;
            background: rgba(102, 126, 234, 0.05);
            border-top: 1px solid rgba(102, 126, 234, 0.1);
            border-bottom: 1px solid rgba(102, 126, 234, 0.1);
            font-size: 14px;
            color: #6c757d;
            font-weight: 500;
        }

        .post-actions {
            display: flex;
            justify-content: space-around;
            padding: 15px 25px 20px 25px;
            gap: 10px;
        }

        /* Enhanced Create Post */
        .create-post {
            padding: 25px;
        }

        .create-post textarea {
            width: 100%;
            border: 2px solid rgba(102, 126, 234, 0.2);
            border-radius: 15px;
            padding: 15px 20px;
            font-family: inherit;
            font-size: 15px;
            resize: vertical;
            min-height: 100px;
            outline: none;
            background: rgba(255, 255, 255, 0.9);
            transition: all 0.3s ease;
            margin-bottom: 15px;
        }

        .create-post textarea:focus {
            border-color: #667eea;
            box-shadow: 0 0 20px rgba(102, 126, 234, 0.2);
        }

        .create-post input[type="file"] {
            margin: 15px 0;
            padding: 10px;
            border: 2px dashed rgba(102, 126, 234, 0.3);
            border-radius: 10px;
            background: rgba(102, 126, 234, 0.05);
            width: 100%;
            transition: all 0.3s ease;
        }

        .create-post input[type="file"]:hover {
            border-color: #667eea;
            background: rgba(102, 126, 234, 0.1);
        }

        /* Enhanced Suggestions */
        .suggestions-card h3 {
            padding: 20px 25px;
            border-bottom: 1px solid rgba(102, 126, 234, 0.1);
            font-size: 18px;
            font-weight: 600;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .suggestion-item, .trending-item {
            padding: 15px 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: all 0.3s ease;
            border-bottom: 1px solid rgba(102, 126, 234, 0.05);
        }

        .suggestion-item:hover, .trending-item:hover {
            background: rgba(102, 126, 234, 0.05);
            transform: translateX(5px);
        }

        .trending-item a {
            color: #667eea;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .trending-item a:hover {
            color: #764ba2;
            text-decoration: none;
        }

        /* News Card Styles */
        .news-card {
        width:400px;
            margin-bottom: 25px;
        }

        .news-item {
            padding: 15px 20px;
            border-bottom: 1px solid rgba(102, 126, 234, 0.1);
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .news-item:hover {
            background: rgba(102, 126, 234, 0.05);
            transform: translateX(3px);
        }

        .news-item:last-child {
            border-bottom: none;
        }

        .news-image {
            width: 100%;
            height: 170px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .news-image:hover {
            transform: scale(1.02);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }

        .news-title {
            font-size: 14px;
            font-weight: 600;
            color: #1c1e21;
            margin-bottom: 8px;
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .news-description {
            font-size: 12px;
            color: #6c757d;
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            margin-bottom: 8px;
        }

        .news-source {
            font-size: 11px;
            color: #667eea;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .news-source i {
            font-size: 10px;
        }

        /* Error message styling */
        .error-message {
            padding: 20px;
            text-align: center;
            color: #e74c3c;
            font-size: 14px;
            font-weight: 500;
        }

        /* Enhanced Comment Section */
        .comment-section {
            background: rgba(102, 126, 234, 0.02);
            border-radius: 0 0 20px 20px;
        }

        .comment-section input[type="text"] {
            border: 2px solid rgba(102, 126, 234, 0.2);
            border-radius: 25px;
            padding: 10px 20px;
            outline: none;
            background: rgba(255, 255, 255, 0.9);
            transition: all 0.3s ease;
        }

        .comment-section input[type="text"]:focus {
            border-color: #667eea;
            box-shadow: 0 0 15px rgba(102, 126, 234, 0.2);
        }

        /* Like button enhancement */
        .btn.liked {
            background: linear-gradient(135deg, #ff6b6b, #ee5a24) !important;
            color: white !important;
            transform: scale(1.05);
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

        /* Responsive Design */
        @media (max-width: 768px) {
            .dashboard-layout {
                flex-direction: column;
                padding: 0 15px;
            }
            
            .left-sidebar, .right-sidebar {
                width: 100%;
                order: 2;
            }
            
            .main-feed {
                order: 1;
                max-width: none;
            }

            .top-nav {
                padding: 10px 15px;
            }

            .top-nav h1 {
                font-size: 24px;
            }

            .search-form input[type="text"] {
                width: 200px;
            }

            .nav-icons {
                gap: 15px;
            }

            .card {
                border-radius: 15px;
            }

            .post-header, .post-content, .post-actions {
                padding-left: 20px;
                padding-right: 20px;
            }

            .news-image {
                height: 100px;
            }
        }

        @media (max-width: 480px) {
            .search-form {
                display: none;
            }

            .top-nav {
                justify-content: space-between;
            }

            .nav-icons a span {
                display: none;
            }
        }

        /* Loading animation for posts */
        @keyframes shimmer {
            0% {
                background-position: -200px 0;
            }
            100% {
                background-position: calc(200px + 100%) 0;
            }
        }

        .loading {
            animation: shimmer 1.5s ease-in-out infinite;
            background: linear-gradient(90deg, transparent, rgba(102, 126, 234, 0.1), transparent);
            background-size: 200px 100%;
        }
    </style>
</head>
<body>

    <!-- Top Navigation -->
    <div class="top-nav">
        <h1>SocialApp</h1>
        <div class="search-form">
            <form action="search" method="post">
                <input type="text" name="userName" placeholder="Search users...">
                <input type="submit" value="Search">
            </form>
        </div>
        <div class="nav-icons">
            <i class="fa-regular fa-bell"></i>
            <i class="fa-regular fa-comment-dots"></i>
            <a href="logout"><i class="fa-solid fa-right-from-bracket"></i> <span>Logout</span></a>
        </div>
    </div>

    <div class="dashboard-layout">

        <!-- Left Sidebar -->
        <div class="left-sidebar">
            <div class="card user-profile-card">
                <c:if test="${not empty sessionScope.profileImage}">
                    <img src="data:image/jpeg;base64,${sessionScope.profileImage}" alt="Profile Picture"/>
                </c:if>
                <c:if test="${empty sessionScope.profileImage}">
                    <img src="images/default-avatar.png" alt="Profile Picture"/>
                </c:if>
                <h3 style="background-color: white"> ${sessionScope.user.firstName} ${sessionScope.user.lastName}</h3>
                <p>@${sessionScope.user.userName}</p>
            </div>

            <ul class="card nav-menu">
                <li><a href="dashboard"><i class="fa-solid fa-house"></i> Home</a></li>
                <li><a href="profile"><i class="fa-solid fa-user"></i> Profile</a></li>
                <li><a href="update"><i class="fa-solid fa-pen"></i> Update Profile</a></li>
                <li><a href="messages"><i class="fa-solid fa-message"></i> Messages</a></li>
                <li><a href="settings"><i class="fa-solid fa-gear"></i> Settings</a></li>
            </ul>
        </div>

        <!-- Main Feed -->
        <div style="width: 100px" class="main-feed">
            <!-- Create Post Box -->
            <div class="card create-post">
                <form:form action="savePost" method="post" modelAttribute="p" enctype="multipart/form-data">
                    <form:textarea path="content" rows="3" placeholder="What's on your mind, ${sessionScope.user.firstName}?"/>
                    <input type="file" name="imageFile" accept="image/*" style="margin:10px 0;">
                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-paper-plane"></i> Post</button>
                </form:form>
            </div>

            <!-- Posts Feed -->
            <c:choose>
                <c:when test="${not empty posts}">
                    <c:forEach var="post" items="${posts}" varStatus="status">
                        <div class="card post-card">
                            <div class="post-header">
                                <c:choose>
                                    <c:when test="${not empty post.user.profilePicture}">
                                        <img src="data:image/jpeg;base64,${post.user.profilePicture}" alt="Profile Picture"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="images/default-avatar.png" alt="Profile Picture"/>
                                    </c:otherwise>
                                </c:choose>
                                <div>
                                    <h4>${post.user.firstName} ${post.user.lastName}</h4>
                                    <div class="post-time">
                                        <c:if test="${not empty post.createDate}">
                                            ${post.createDate}
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="post-content">
                                <c:if test="${not empty post.content}">
                                    <div class="post-text">${post.content}</div>
                                </c:if>
                                <c:if test="${not empty postImages[status.index]}">
                                    <img src="data:image/jpeg;base64,${postImages[status.index]}" class="post-image"/>
                                </c:if>
                            </div>
                            <div class="post-stats">
                                <span id="likes-count-${post.postId}">
                                    <c:choose>
                                        <c:when test="${not empty post.likesCount}">${post.likesCount}</c:when>
                                        <c:otherwise>0</c:otherwise>
                                    </c:choose> Likes
                                </span>
                                <span id="comments-count-${post.postId}">
                                    <c:choose>
                                        <c:when test="${not empty post.commentsCount}">${post.commentsCount}</c:when>
                                        <c:otherwise>0</c:otherwise>
                                    </c:choose> Comments
                                </span>
                            </div>
                            <div class="post-actions">
                                <button class="btn btn-light" onclick="toggleLike(${post.postId}, this)">
                                    <i class="fa-regular fa-thumbs-up"></i> Like
                                </button>
                                <button class="btn btn-light" onclick="toggleComments(${post.postId})">
                                    <i class="fa-regular fa-comment"></i> Comment
                                </button>
                                <button class="btn btn-light">
                                    <i class="fa-solid fa-share"></i> Share
                                </button>
                            </div>
                            <div class="comment-section" id="comments-${post.postId}" style="display:none; padding:15px;">
                                <input type="text" placeholder="Write a comment..." id="comment-input-${post.postId}" style="width:80%; padding:8px; border-radius:20px; border:1px solid #ddd;">
                                <button class="btn btn-primary" onclick="addComment(${post.postId})">Post</button>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="card" style="text-align:center; padding:40px;">
                        <div style="font-size: 48px; color: #667eea; margin-bottom: 20px;">
                            <i class="fa-regular fa-comments"></i>
                        </div>
                        <h3 style="margin-bottom: 10px; color: #667eea;">No posts yet</h3>
                        <p style="color: #6c757d;">Be the first to share something with your friends!</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

 <!-- Right Sidebar -->
        <div class="right-sidebar">
            <!-- Suggestions Card -->
            <div class="card suggestions-card">
                <h3>Suggestions for you</h3>
                <div class="suggestion-item">
                    <span><i class="fa-regular fa-user"></i> John Doe</span>
                    <button class="btn btn-light">Add Friend</button>
                </div>
                <div class="suggestion-item">
                    <span><i class="fa-regular fa-user"></i> Jane Smith</span>
                    <button class="btn btn-light">Add Friend</button>
                </div>
                <div class="suggestion-item">
                    <span><i class="fa-regular fa-user"></i> Mike Johnson</span>
                    <button class="btn btn-light">Add Friend</button>
                </div>
            </div>

            <!-- Trending Card -->
            <div class="card suggestions-card">
                <h3>Trending</h3>
                <div class="trending-item"><a href="#">#JavaDevelopment</a></div>
                <div class="trending-item"><a href="#">#SpringBoot</a></div>
                <div class="trending-item"><a href="#">#SocialMediaApp</a></div>
                <div class="trending-item"><a href="#">#WebDevelopment</a></div>
                <c:if test="${not empty result}">
                    <div class="trending-item"><a href="#">#${result}</a></div>
                </c:if>
            </div>

            <!-- News Card -->
            <div class="card news-card">
                <h3 style="padding: 20px 25px; border-bottom: 1px solid rgba(102, 126, 234, 0.1); font-size: 18px; font-weight: 600; background: linear-gradient(135deg, #667eea, #764ba2); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">
                    <i class="fa-solid fa-newspaper"></i> Latest News
                </h3>
                
                <c:choose>
                    <c:when test="${not empty news}">
                        <c:forEach var="article" items="${news}" begin="0" end="9">
                            <div class="news-item" onclick="openNewsLink('${article.url}')">
                                <c:if test="${not empty article.urlToImage}">
                                    <img src="${article.urlToImage}" alt="News Image" class="news-image" 
                                         onerror="this.style.display='none'"/>
                                </c:if>
                                
                                <div class="news-title">
                                    <c:choose>
                                        <c:when test="${fn:length(article.title) > 60}">
                                            ${fn:substring(article.title, 0, 60)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${article.title}
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                
                                <c:if test="${not empty article.description}">
                                    <div class="news-description">
                                        <c:choose>
                                            <c:when test="${fn:length(article.description) > 80}">
                                                ${fn:substring(article.description, 0, 80)}...
                                            </c:when>
                                            <c:otherwise>
                                                ${article.description}
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </c:if>
                                
                                <div class="news-source">
                                    <i class="fa-solid fa-globe"></i>
                                    <c:choose>
                                        <c:when test="${not empty article.source.name}">
                                            ${article.source.name}
                                        </c:when>
                                        <c:otherwise>
                                            Unknown Source
                                        </c:otherwise>
                                    </c:choose>
                                    <c:if test="${not empty article.publishedAt}">
                                        <c:set var="dateStr" value="${article.publishedAt}" />
                                        <c:choose>
                                            <c:when test="${fn:contains(dateStr, 'T')}">
                                                <c:set var="datePart" value="${fn:substring(dateStr, 0, 10)}" />
                                                <c:set var="year" value="${fn:substring(datePart, 0, 4)}" />
                                                <c:set var="month" value="${fn:substring(datePart, 5, 7)}" />
                                                <c:set var="day" value="${fn:substring(datePart, 8, 10)}" />
                                                • <c:choose>
                                                    <c:when test="${month eq '01'}">Jan</c:when>
                                                    <c:when test="${month eq '02'}">Feb</c:when>
                                                    <c:when test="${month eq '03'}">Mar</c:when>
                                                    <c:when test="${month eq '04'}">Apr</c:when>
                                                    <c:when test="${month eq '05'}">May</c:when>
                                                    <c:when test="${month eq '06'}">Jun</c:when>
                                                    <c:when test="${month eq '07'}">Jul</c:when>
                                                    <c:when test="${month eq '08'}">Aug</c:when>
                                                    <c:when test="${month eq '09'}">Sep</c:when>
                                                    <c:when test="${month eq '10'}">Oct</c:when>
                                                    <c:when test="${month eq '11'}">Nov</c:when>
                                                    <c:when test="${month eq '12'}">Dec</c:when>
                                                    <c:otherwise>${month}</c:otherwise>
                                                </c:choose> ${day}
                                            </c:when>
                                            <c:otherwise>
                                                • ${fn:substring(article.publishedAt, 0, 10)}
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:when test="${not empty error}">
                        <div class="error-message">
                            <i class="fa-solid fa-exclamation-triangle"></i>
                            <p>${error}</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="error-message">
                            <i class="fa-solid fa-newspaper"></i>
                            <p>No news available at the moment</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script>
    function toggleLike(postId, button) {
        // Disable button during request
        $(button).prop('disabled', true);
        const originalText = $(button).html();
        $(button).html('<i class="fa-solid fa-spinner fa-spin"></i> Processing...');
        
        // Send AJAX GET request using jQuery
        $.ajax({
            url: '${pageContext.request.contextPath}/posts/like',
            type: 'GET',
            data: { postId: postId },
            dataType: 'json',
            success: function(data) {
                if (data.success) {
                    // Update button appearance
                    if (data.isLiked) {
                        $(button).addClass('liked');
                        $(button).html('<i class="fa-solid fa-thumbs-up"></i> Liked');
                    } else {
                        $(button).removeClass('liked');
                        $(button).html('<i class="fa-regular fa-thumbs-up"></i> Like');
                    }
                    
                    // Update likes count
                    $('#likes-count-' + postId).text(data.likeCount + ' Likes');
                } else {
                    alert(data.message || 'Error processing like');
                    $(button).html(originalText);
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                alert('Failed to process like. Please try again.');
                $(button).html(originalText);
            },
            complete: function() {
                // Re-enable button
                $(button).prop('disabled', false);
            }
        });
    }

    function toggleComments(postId) {
        const section = document.getElementById('comments-' + postId);
        section.style.display = section.style.display === 'block' ? 'none' : 'block';
    }

    function addComment(postId) {
        const input = document.getElementById('comment-input-' + postId);
        if (input.value.trim()) {
            const commentsCountElement = document.getElementById('comments-count-' + postId);
            const currentCount = parseInt(commentsCountElement.textContent);
            commentsCountElement.textContent = (currentCount + 1) + ' Comments';
            input.value = '';
            alert('Comment added!');
        }
    }

    // Function to open news links in a new tab
    function openNewsLink(url) {
        if (url && url.trim() !== '') {
            window.open(url, '_blank');
        }
    }

    // Add hover effects for news items
    $(document).ready(function() {
        $('.news-item').hover(
            function() {
                $(this).css('cursor', 'pointer');
            },
            function() {
                $(this).css('cursor', 'default');
            }
        );

        // Handle image loading errors
        $('.news-image').on('error', function() {
            $(this).hide();
        });
    });
   </script>
   </body>
   </html>