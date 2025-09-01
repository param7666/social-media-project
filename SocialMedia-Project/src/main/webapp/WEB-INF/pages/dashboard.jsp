<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Social Media Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <style>
        body { margin:0; font-family: Arial, sans-serif; background:#f0f2f5; }
        .top-nav { background:#1877f2; color:white; padding:10px 20px; display:flex; justify-content:space-between; align-items:center; }
        .top-nav h1 { margin:0; font-size:20px; }
        .top-nav input { padding:5px; border-radius:20px; border:none; width:200px; }
        .dashboard-layout { display:flex; margin-top:20px; }
        .left-sidebar, .right-sidebar { width:20%; padding:15px; }
        .main-feed { width:60%; padding:15px; }
        .user-profile-card { background:white; padding:15px; border-radius:10px; box-shadow:0 2px 5px rgba(0,0,0,0.1); text-align:center; }
        .user-profile-card img { border-radius:50%; width:100px; height:100px; }
        .create-post, .post-card { background:white; padding:15px; border-radius:10px; margin-bottom:15px; box-shadow:0 2px 5px rgba(0,0,0,0.1); }
        .create-post textarea { width:100%; padding:10px; border-radius:8px; border:1px solid #ccc; resize:none; }
        .create-post input[type=file] { margin-top:10px; }
        .create-post button { margin-top:10px; background:#1877f2; color:white; border:none; padding:10px 20px; border-radius:5px; cursor:pointer; font-weight:bold; }
        .create-post button:hover { background:#145dbf; }
        .post-header { display:flex; align-items:center; }
        .post-header img { border-radius:50%; width:40px; height:40px; margin-right:10px; }
        .post-actions { margin-top:10px; display:flex; justify-content:space-between; }
        .post-actions button { background:none; border:none; cursor:pointer; color:#555; }
        .nav-menu { list-style:none; padding:0; }
        .nav-menu li { margin:10px 0; }
        .nav-menu a { text-decoration:none; color:#1877f2; font-weight:bold; }
    </style>
</head>
<body>

    <!-- Top Navigation -->
    <div class="top-nav">
        <h1>SocialApp</h1>
        <form action="search" method="post">
            <input type="text" name="userName" placeholder="Search...">
            <input type="submit" value="Search">
        </form>
        <div class="nav-icons">
            🔔 💬 <a href="logout" style="color:white; margin-left:15px;">Logout</a>
        </div>
    </div>

    <div class="dashboard-layout">

        <!-- Left Sidebar -->
        <div class="left-sidebar">
            <div class="user-profile-card">
                <c:if test="${not empty sessionScope.profileImage}">
                    <img src="data:image/jpeg;base64,${sessionScope.profileImage}" alt="Profile Picture"/>
                </c:if>
                <c:if test="${empty sessionScope.profileImage}">
                    <img src="images/default-avatar.png" alt="Profile Picture"/>
                </c:if>
                <h3>${sessionScope.user.firstName} ${sessionScope.user.lastName}</h3>
                <p>@${sessionScope.user.userName}</p>
            </div>

            <ul class="nav-menu">
                <li><a href="dashboard">🏠 Home</a></li>
                <li><a href="profile">👤 Profile</a></li>
                <li><a href="update">👥 update profile</a></li>
                <li><a href="messages">💬 Messages</a></li>
                <li><a href="settings">⚙️ Settings</a></li>
            </ul>
        </div>

        <!-- Main Feed -->
        <div class="main-feed">
          <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!-- Create Post Box -->
<div class="create-post">
    <form:form action="savePost" method="post" modelAttribute="p" enctype="multipart/form-data">
        <div style="margin-bottom:10px;">
            <form:textarea path="content" placeholder="What's on your mind, ${sessionScope.user.firstName}?..." 
                           style="width:100%; padding:10px; border-radius:8px; border:1px solid #ccc; resize:none;"/>
        </div>
        <div style="margin-bottom:10px;">
            <label for="imageUpload">📷 Add Image</label>
            <input type="file" id="imageUpload" name="imageFile" 
                   style="display:block; margin-top:5px;"/>
        </div>
        <button type="submit" 
                style="background:#1877f2; color:white; border:none; padding:10px 20px; border-radius:5px; cursor:pointer;">
            Post
        </button>
    </form:form>
</div>


            <!-- Example Post -->
            <div class="post-card">
                <div class="post-header">
                    <img src="images/default-avatar.png" alt="User Pic">
                    <strong>${sessionScope.user.userName}</strong>
                </div>
                <p style="margin-top:10px;">This is an example post on your social media feed 🚀</p>
                <div class="post-actions">
                    <button>👍 Like</button>
                    <button>💬 Comment</button>
                    <button>↪️ Share</button>
                </div>
            </div>
        </div>

        <!-- Right Sidebar -->
        <div class="right-sidebar">
            <h3>Suggestions</h3>
            <p>👤 John Doe <button>Add Friend</button></p>
            <p>👤 Jane Smith <button>Add Friend</button></p>

            <h3 style="margin-top:20px;">Trending</h3>
            <p>#JavaDevelopment</p>
            <p>#SpringBoot</p>
            <p>#SocialMediaApp</p>
            <p>#${result}</p>
            
        </div>
    </div>
</body>
</html>
