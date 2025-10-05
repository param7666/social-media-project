<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${userDetails.userName} - Profile</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;
        background: #fafafa;
        color: #262626;
        line-height: 1.5;
    }

    /* Navigation Bar */
    .navbar {
        background: #fff;
        border-bottom: 1px solid #dbdbdb;
        padding: 8px 0;
        position: sticky;
        top: 0;
        z-index: 100;
    }

    .nav-container {
        max-width: 975px;
        margin: 0 auto;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 20px;
    }

    .logo {
        font-size: 24px;
        font-weight: bold;
        color: #262626;
        text-decoration: none;
        font-family: 'Dancing Script', cursive;
    }

    .nav-links {
        display: flex;
        gap: 20px;
        align-items: center;
    }

    .nav-links a {
        color: #262626;
        text-decoration: none;
        font-size: 22px;
        transition: color 0.2s ease;
    }

    .nav-links a:hover {
        color: #8e8e8e;
    }

    /* Main Container */
    .main-container {
        max-width: 975px;
        margin: 0 auto;
        background: #fff;
        min-height: calc(100vh - 60px);
    }

    /* Profile Header */
    .profile-header {
        display: flex;
        align-items: center;
        padding: 30px 20px;
        background: #fff;
        border-bottom: 1px solid #efefef;
        gap: 30px;
    }

    .profile-pic-container {
        flex-shrink: 0;
    }

    .profile-header img {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid #dbdbdb;
        cursor: pointer;
        transition: transform 0.2s ease;
    }

    .profile-header img:hover {
        transform: scale(1.05);
    }

    .profile-info {
        flex: 1;
    }

    .profile-top {
        display: flex;
        align-items: center;
        gap: 20px;
        margin-bottom: 20px;
    }

    .profile-info h2 {
        font-size: 28px;
        font-weight: 300;
        color: #262626;
    }

    .profile-buttons {
        display: flex;
        gap: 8px;
    }

    .btn {
        padding: 8px 16px;
        border: 1px solid #dbdbdb;
        background: #fff;
        border-radius: 4px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        text-decoration: none;
        color: #262626;
        transition: background-color 0.2s ease;
    }

    .btn:hover {
        background: #f5f5f5;
    }

    .btn-primary {
        background: #0095f6;
        color: #fff;
        border-color: #0095f6;
    }

    .btn-primary:hover {
        background: #1877f2;
    }

    .profile-stats {
        display: flex;
        gap: 40px;
        margin-bottom: 20px;
    }

    .stat {
        display: flex;
        align-items: center;
        gap: 4px;
        font-size: 16px;
    }

    .stat-number {
        font-weight: 600;
        color: #262626;
    }

    .stat-label {
        color: #262626;
    }

    .profile-bio {
        font-size: 16px;
        color: #262626;
        line-height: 1.4;
    }

    .profile-name {
        font-weight: 600;
        margin-bottom: 4px;
    }

    /* Profile Navigation Tabs */
    .profile-nav {
        display: flex;
        justify-content: center;
        border-top: 1px solid #efefef;
        background: #fff;
    }

    .profile-nav a {
        padding: 16px 0;
        margin: 0 30px;
        text-decoration: none;
        color: #8e8e8e;
        font-size: 12px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 1px;
        border-top: 1px solid transparent;
        transition: color 0.2s ease;
        display: flex;
        align-items: center;
        gap: 6px;
    }

    .profile-nav a.active {
        color: #262626;
        border-top-color: #262626;
    }

    .profile-nav a:hover {
        color: #262626;
    }

    /* Posts Grid */
    .posts-container {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 15px;
        padding: 20px;
        background: #fafafa;
    }

    .post-card {
        background: #fff;
        border: 1px solid #dbdbdb;
        border-radius: 12px;
        overflow: hidden;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        position: relative;
    }

    .post-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }

    .post-image-container {
        position: relative;
        overflow: hidden;
        cursor: pointer;
    }

    .post-image {
        width: 100%;
        height: 300px;
        object-fit: cover;
        transition: transform 0.3s ease;
    }

    .post-card:hover .post-image {
        transform: scale(1.05);
    }

    .post-overlay {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: linear-gradient(to bottom, transparent 0%, rgba(0, 0, 0, 0.7) 100%);
        display: flex;
        align-items: flex-end;
        justify-content: center;
        opacity: 0;
        transition: opacity 0.3s ease;
        padding: 15px;
    }

    .post-card:hover .post-overlay {
        opacity: 1;
    }

    .post-overlay-stats {
        display: flex;
        gap: 20px;
    }

    .post-stat {
        display: flex;
        align-items: center;
        gap: 6px;
        color: #fff;
        font-weight: 600;
        font-size: 14px;
    }

    /* Delete Button */
    .delete-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        background: #ed4956;
        border: none;
        border-radius: 50%;
        width: 36px;
        height: 36px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        opacity: 0;
        transition: opacity 0.3s ease, transform 0.2s ease;
        z-index: 50;
        font-size: 18px;
        box-shadow: 0 2px 8px rgba(237, 73, 86, 0.4);
        text-decoration: none;
    }

    .post-card:hover .delete-btn {
        opacity: 1;
    }

    .delete-btn:hover {
        transform: scale(1.1);
        background: #c13344;
        box-shadow: 0 4px 12px rgba(237, 73, 86, 0.6);
    }

    .delete-btn:active {
        transform: scale(0.95);
    }

    /* Post Details */
    .post-details {
        padding: 12px 16px;
        cursor: pointer;
    }

    .post-content {
        font-size: 14px;
        color: #262626;
        margin-bottom: 8px;
        line-height: 1.4;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .post-meta {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 12px;
        color: #8e8e8e;
    }

    .likes-comments {
        display: flex;
        align-items: center;
        gap: 12px;
        font-weight: 500;
        color: #262626;
    }

    .likes-comments span {
        display: flex;
        align-items: center;
        gap: 4px;
    }

    .post-date {
        font-size: 11px;
        color: #8e8e8e;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    /* Settings Dropdown */
    .settings-dropdown {
        position: relative;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        right: 0;
        background: #fff;
        min-width: 200px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        border: 1px solid #dbdbdb;
        border-radius: 8px;
        z-index: 1;
        overflow: hidden;
    }

    .dropdown-content a {
        color: #262626;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        font-size: 14px;
        transition: background-color 0.2s ease;
    }

    .dropdown-content a:hover {
        background: #f5f5f5;
    }

    .settings-dropdown:hover .dropdown-content {
        display: block;
    }

    /* Empty State */
    .empty-state {
        text-align: center;
        padding: 60px 20px;
        color: #8e8e8e;
        grid-column: 1 / -1;
    }

    .empty-icon {
        font-size: 64px;
        margin-bottom: 20px;
    }

    .empty-text {
        font-size: 22px;
        margin-bottom: 10px;
        font-weight: 300;
    }

    .empty-subtext {
        font-size: 16px;
    }

    /* Mobile Responsive */
    @media (max-width: 768px) {
        .profile-header {
            padding: 16px;
            gap: 20px;
        }

        .profile-header img {
            width: 77px;
            height: 77px;
        }

        .profile-top {
            flex-direction: column;
            align-items: flex-start;
            gap: 16px;
        }

        .profile-info h2 {
            font-size: 24px;
        }

        .profile-stats {
            gap: 20px;
        }

        .profile-nav a {
            margin: 0 15px;
        }

        .posts-container {
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            padding: 10px;
        }

        .post-image {
            height: 200px;
        }
    }

    @media (max-width: 480px) {
        .posts-container {
            grid-template-columns: 1fr;
        }
    }
</style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="/" class="logo">📷 SocialApp</a>
            <div class="nav-links">
                <a href="home" title="Home">🏠</a>
                <a href="#" title="Explore">🔍</a>
                <a href="#" title="Messages">💬</a>
                <a href="#" title="Notifications">❤️</a>
                <a href="#" title="Create Post">➕</a>
                <div class="settings-dropdown">
                    <a href="#" title="More">☰</a>
                    <div class="dropdown-content">
                        <a href="/settings">⚙️ Settings</a>
                        <a href="/activity">📊 Your Activity</a>
                        <a href="/saved">🔖 Saved</a>
                        <a href="delete-account">❌👤 Delete Account</a>
                        <a href="/switch">🔄 Switch Account</a>
                        <a href="/logout">↩️ Log Out</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Container -->
    <div class="main-container">
        
        <!-- Profile Header -->
        <div class="profile-header">
            <div class="profile-pic-container">
                <c:choose>
                    <c:when test="${not empty profileImage}">
                        <img src="data:image/jpeg;base64,${profileImage}" alt="Profile Picture">
                    </c:when>
                    <c:otherwise>
                        <img src="https://via.placeholder.com/150/e1e1e1/808080?text=👤" alt="Default Profile Picture">
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="profile-info">
                <div class="profile-top">
                    <h2>${userDetails.userName}</h2>
                    <div class="profile-buttons">
                        <a href="/edit-profile" class="btn">Edit profile</a>
                        <a href="/settings" class="btn">⚙️</a>
                    </div>
                </div>

                <div class="profile-stats">
                    <div class="stat">
                        <span class="stat-number">${fn:length(posts)}</span>
                        <span class="stat-label">posts</span>
                    </div>
                    <div class="stat">
                        <span class="stat-number">120</span>
                        <span class="stat-label">followers</span>
                    </div>
                    <div class="stat">
                        <span class="stat-number">200</span>
                        <span class="stat-label">following</span>
                    </div>
                </div>

                <div class="profile-bio">
                    <div class="profile-name">${userDetails.firstName} ${userDetails.lastName}</div>
                    ${userDetails.bio}
                </div>
            </div>
        </div>

        <!-- Profile Navigation Tabs -->
        <div class="profile-nav">
            <a href="#posts" class="active">
                📱 <span>POSTS</span>
            </a>
            <a href="#reels">
                🎥 <span>REELS</span>
            </a>
            <a href="#saved">
                🔖 <span>SAVED</span>
            </a>
            <a href="#tagged">
                🏷️ <span>TAGGED</span>
            </a>
        </div>

        <!-- Posts Grid -->
        <div class="posts-container">
            <c:choose>
                <c:when test="${not empty posts}">
                    <c:forEach var="post" items="${posts}" varStatus="status">
                        <div class="post-card">
                            <!-- Delete Button Form -->
                            <form action="delete-post" method="post" style="display: inline;">
                                <input type="hidden" name="postId" value="${post.postId}">
                                <button type="submit" class="delete-btn" title="Delete Post" 
                                        onclick="return confirm('Are you sure you want to delete this post?');">🗑️</button>
                            </form>

                            <div class="post-image-container" onclick="window.location.href='/post/${post.postId}'">
                                <c:choose>
                                    <c:when test="${not empty post.image}">
                                        <img src="data:image/jpeg;base64,${postImages[status.index]}" alt="Post Image" class="post-image">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://via.placeholder.com/300/e1e1e1/808080?text=📷" alt="No Image" class="post-image">
                                    </c:otherwise>
                                </c:choose>
                                
                                <div class="post-overlay">
                                    <div class="post-overlay-stats">
                                        <div class="post-stat">
                                            <span>❤️</span>
                                            <span>${post.likesCount}</span>
                                        </div>
                                        <div class="post-stat">
                                            <span>💬</span>
                                            <span>${post.commentsCount}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="post-details" onclick="window.location.href='/post/${post.postId}'">
                                <div class="post-content">${post.content}</div>
                                <div class="post-meta">
                                    <div class="likes-comments">
                                        <span>❤️ ${post.likesCount}</span>
                                        <span>💬 ${post.commentsCount}</span>
                                    </div>
                                    <span class="post-date">${post.createDate}</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <div class="empty-icon">📷</div>
                        <div class="empty-text">No Posts Yet</div>
                        <div class="empty-subtext">Start sharing your moments</div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

    </div>
    <div>
   <h3 style="color: red">${msg}</h3> <br>
    </div>

</body>
</html>