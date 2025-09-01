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
        cursor: pointer;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    }

    .post-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }

    .post-image-container {
        position: relative;
        overflow: hidden;
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

    /* Post Details */
    .post-details {
        padding: 12px 16px;
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
    }

    /* Loading Animation */
    @keyframes pulse {
        0% { opacity: 1; }
        50% { opacity: 0.5; }
        100% { opacity: 1; }
    }

    .loading {
        animation: pulse 1.5s ease-in-out infinite;
    }

    /* Modal Styles */
    .modal {
        display: none;
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        animation: fadeIn 0.3s ease;
    }

    .modal.active {
        display: flex;
        align-items: center;
        justify-content: center;
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    .modal-content {
        background: #fff;
        border-radius: 12px;
        width: 90%;
        max-width: 400px;
        max-height: 90vh;
        overflow-y: auto;
        position: relative;
        animation: slideIn 0.3s ease;
    }

    @keyframes slideIn {
        from { transform: translateY(-50px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }

    .modal-header {
        padding: 16px 20px;
        border-bottom: 1px solid #efefef;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .modal-title {
        font-size: 16px;
        font-weight: 600;
        color: #262626;
    }

    .close {
        background: none;
        border: none;
        font-size: 18px;
        cursor: pointer;
        color: #8e8e8e;
    }

    .modal-body {
        padding: 20px;
    }

    /* Messages Modal */
    .message-item {
        display: flex;
        align-items: center;
        padding: 12px 0;
        border-bottom: 1px solid #efefef;
        cursor: pointer;
        transition: background-color 0.2s ease;
    }

    .message-item:hover {
        background-color: #f8f8f8;
        margin: 0 -20px;
        padding-left: 20px;
        padding-right: 20px;
    }

    .message-item:last-child {
        border-bottom: none;
    }

    .message-avatar {
        width: 56px;
        height: 56px;
        border-radius: 50%;
        margin-right: 12px;
        object-fit: cover;
    }

    .message-info {
        flex: 1;
    }

    .message-username {
        font-weight: 600;
        font-size: 14px;
        color: #262626;
        margin-bottom: 2px;
    }

    .message-preview {
        font-size: 14px;
        color: #8e8e8e;
    }

    .message-time {
        font-size: 12px;
        color: #8e8e8e;
    }

    /* Notifications Modal */
    .notification-item {
        display: flex;
        align-items: center;
        padding: 12px 0;
        border-bottom: 1px solid #efefef;
    }

    .notification-item:last-child {
        border-bottom: none;
    }

    .notification-avatar {
        width: 44px;
        height: 44px;
        border-radius: 50%;
        margin-right: 12px;
        object-fit: cover;
    }

    .notification-content {
        flex: 1;
        font-size: 14px;
        color: #262626;
        line-height: 1.4;
    }

    .notification-username {
        font-weight: 600;
    }

    .notification-time {
        font-size: 12px;
        color: #8e8e8e;
        margin-top: 4px;
    }

    /* Explore Search */
    .search-container {
        padding: 0;
    }

    .search-box {
        width: 100%;
        padding: 12px 16px;
        border: 1px solid #dbdbdb;
        border-radius: 8px;
        font-size: 16px;
        outline: none;
        margin-bottom: 20px;
    }

    .search-box:focus {
        border-color: #0095f6;
    }

    .search-results {
        max-height: 300px;
        overflow-y: auto;
    }

    .search-item {
        display: flex;
        align-items: center;
        padding: 8px 0;
        cursor: pointer;
        border-radius: 8px;
        transition: background-color 0.2s ease;
    }

    .search-item:hover {
        background-color: #f8f8f8;
        margin: 0 -20px;
        padding-left: 20px;
        padding-right: 20px;
    }

    .search-avatar {
        width: 44px;
        height: 44px;
        border-radius: 50%;
        margin-right: 12px;
        object-fit: cover;
    }

    .search-info {
        flex: 1;
    }

    .search-username {
        font-weight: 600;
        font-size: 14px;
        color: #262626;
    }

    .search-fullname {
        font-size: 14px;
        color: #8e8e8e;
    }

    /* Create Post Modal */
    .create-post-container {
        padding: 0;
    }

    .image-upload-area {
        border: 2px dashed #dbdbdb;
        border-radius: 8px;
        padding: 40px 20px;
        text-align: center;
        margin-bottom: 20px;
        cursor: pointer;
        transition: border-color 0.2s ease;
    }

    .image-upload-area:hover {
        border-color: #0095f6;
    }

    .image-upload-area.dragover {
        border-color: #0095f6;
        background-color: #f0f8ff;
    }

    .upload-icon {
        font-size: 48px;
        margin-bottom: 16px;
        color: #8e8e8e;
    }

    .upload-text {
        font-size: 16px;
        color: #262626;
        margin-bottom: 8px;
    }

    .upload-subtext {
        font-size: 14px;
        color: #8e8e8e;
    }

    .image-preview {
        max-width: 100%;
        max-height: 300px;
        border-radius: 8px;
        margin-bottom: 20px;
        object-fit: cover;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-label {
        display: block;
        font-size: 14px;
        font-weight: 600;
        color: #262626;
        margin-bottom: 8px;
    }

    .form-textarea {
        width: 100%;
        min-height: 100px;
        padding: 12px;
        border: 1px solid #dbdbdb;
        border-radius: 8px;
        font-size: 14px;
        font-family: inherit;
        resize: vertical;
        outline: none;
    }

    .form-textarea:focus {
        border-color: #0095f6;
    }

    .post-btn {
        width: 100%;
        padding: 12px;
        background: #0095f6;
        color: #fff;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.2s ease;
    }

    .post-btn:hover {
        background: #1877f2;
    }

    .post-btn:disabled {
        background: #b3d9ff;
        cursor: not-allowed;
    }

    .empty-state {
        text-align: center;
        padding: 40px 20px;
        color: #8e8e8e;
    }

    .empty-icon {
        font-size: 48px;
        margin-bottom: 16px;
    }

    .empty-text {
        font-size: 16px;
        margin-bottom: 8px;
    }

    .empty-subtext {
        font-size: 14px;
    }
</style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="/" class="logo">📷 SocialApp</a>
            <div class="nav-links">
                <a href="#" onclick="goHome()" title="Home">🏠</a>
                <a href="#" onclick="openExplore()" title="Explore">🔍</a>
                <a href="#" onclick="openMessages()" title="Messages">💬</a>
                <a href="#" onclick="openNotifications()" title="Notifications">❤️</a>
                <a href="#" onclick="openCreatePost()" title="Create Post">➕</a>
                <div class="settings-dropdown">
                    <a href="#" title="More">☰</a>
                    <div class="dropdown-content">
                        <a href="/settings">⚙️ Settings</a>
                        <a href="/activity">📊 Your Activity</a>
                        <a href="/saved">🔖 Saved</a>
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
            <c:forEach var="post" items="${posts}" varStatus="status">
                <div class="post-card" onclick="openPost('${post.postId}')">
                    <div class="post-image-container">
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
                    
                    <div class="post-details">
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
        </div>

    </div>

    <!-- Messages Modal -->
    <div id="messagesModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Messages</h3>
                <button class="close" onclick="closeModal('messagesModal')">&times;</button>
            </div>
            <div class="modal-body">
                <div class="empty-state">
                    <div class="empty-icon">💬</div>
                    <div class="empty-text">Your Messages</div>
                    <div class="empty-subtext">Send private photos and messages to a friend or group.</div>
                </div>
                
                <!-- Sample messages - you can replace with dynamic content -->
                <div style="display: none;" id="messagesList">
                    <div class="message-item" onclick="openChat('john_doe')">
                        <img src="https://via.placeholder.com/56/e1e1e1/808080?text=JD" alt="John Doe" class="message-avatar">
                        <div class="message-info">
                            <div class="message-username">john_doe</div>
                            <div class="message-preview">Hey! How's it going? 👋</div>
                        </div>
                        <div class="message-time">2h</div>
                    </div>
                    <div class="message-item" onclick="openChat('jane_smith')">
                        <img src="https://via.placeholder.com/56/e1e1e1/808080?text=JS" alt="Jane Smith" class="message-avatar">
                        <div class="message-info">
                            <div class="message-username">jane_smith</div>
                            <div class="message-preview">Thanks for the follow! 😊</div>
                        </div>
                        <div class="message-time">1d</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Notifications Modal -->
    <div id="notificationsModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Notifications</h3>
                <button class="close" onclick="closeModal('notificationsModal')">&times;</button>
            </div>
            <div class="modal-body">
                <div class="empty-state">
                    <div class="empty-icon">🔔</div>
                    <div class="empty-text">Activity On Your Posts</div>
                    <div class="empty-subtext">When someone likes or comments on one of your posts, you'll see it here.</div>
                </div>
                
                <!-- Sample notifications - you can replace with dynamic content -->
                <div style="display: none;" id="notificationsList">
                    <div class="notification-item">
                        <img src="https://via.placeholder.com/44/e1e1e1/808080?text=JD" alt="John Doe" class="notification-avatar">
                        <div class="notification-content">
                            <span class="notification-username">john_doe</span> liked your photo.
                            <div class="notification-time">2 hours ago</div>
                        </div>
                    </div>
                    <div class="notification-item">
                        <img src="https://via.placeholder.com/44/e1e1e1/808080?text=JS" alt="Jane Smith" class="notification-avatar">
                        <div class="notification-content">
                            <span class="notification-username">jane_smith</span> started following you.
                            <div class="notification-time">1 day ago</div>
                        </div>
                    </div>
                    <div class="notification-item">
                        <img src="https://via.placeholder.com/44/e1e1e1/808080?text=MW" alt="Mike Wilson" class="notification-avatar">
                        <div class="notification-content">
                            <span class="notification-username">mike_wilson</span> commented: "Great shot! 📸"
                            <div class="notification-time">3 days ago</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Explore Modal -->
    <div id="exploreModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Explore</h3>
                <button class="close" onclick="closeModal('exploreModal')">&times;</button>
            </div>
            <div class="modal-body search-container">
                <input type="text" class="search-box" placeholder="Search" onkeyup="performSearch(this.value)">
                <div class="search-results" id="searchResults">
                    <div class="empty-state">
                        <div class="empty-icon">🔍</div>
                        <div class="empty-text">Search</div>
                        <div class="empty-subtext">Search for people, hashtags and places</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Create Post Modal -->
    <div id="createPostModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Create New Post</h3>
                <button class="close" onclick="closeModal('createPostModal')">&times;</button>
            </div>
            <div class="modal-body create-post-container">
                <form id="createPostForm" onsubmit="submitPost(event)">
                    <div class="image-upload-area" onclick="document.getElementById('imageInput').click()" ondrop="dropHandler(event)" ondragover="dragOverHandler(event)">
                        <div class="upload-icon">📷</div>
                        <div class="upload-text">Drag photos and videos here</div>
                        <div class="upload-subtext">or click to select from your computer</div>
                    </div>
                    <input type="file" id="imageInput" accept="image/*,video/*" style="display: none;" onchange="handleFileSelect(event)">
                    <img id="imagePreview" class="image-preview" style="display: none;">
                    
                    <div class="form-group">
                        <label class="form-label" for="postContent">Caption</label>
                        <textarea id="postContent" class="form-textarea" placeholder="Write a caption..." maxlength="2200"></textarea>
                        <div style="text-align: right; font-size: 12px; color: #8e8e8e; margin-top: 4px;">
                            <span id="charCount">0</span>/2,200
                        </div>
                    </div>
                    
                    <button type="submit" class="post-btn" id="submitBtn" disabled>Share Post</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Modal Functions
        function openModal(modalId) {
            document.getElementById(modalId).classList.add('active');
            document.body.style.overflow = 'hidden';
        }

        function closeModal(modalId) {
            document.getElementById(modalId).classList.remove('active');
            document.body.style.overflow = 'auto';
        }

        // Navigation Functions
        function goHome() {
            window.location.href = 'home';
        }

        function openMessages() {
            openModal('messagesModal');
        }

        function openNotifications() {
            openModal('notificationsModal');
        }

        function openExplore() {
            openModal('exploreModal');
        }

        function openCreatePost() {
            openModal('createPostModal');
        }

        // Messages Functions
        function openChat(username) {
            alert(`Opening chat with ${username}...`);
            closeModal('messagesModal');
        }

        // Search Functions
        const searchData = [
            { username: 'john_doe', fullname: 'John Doe', avatar: 'JD' },
            { username: 'jane_smith', fullname: 'Jane Smith', avatar: 'JS' },
            { username: 'mike_wilson', fullname: 'Mike Wilson', avatar: 'MW' },
            { username: 'sarah_jones', fullname: 'Sarah Jones', avatar: 'SJ' },
            { username: 'alex_photo', fullname: 'Alex Photography', avatar: 'AP' },
            { username: 'travel_buddy', fullname: 'Travel Buddy', avatar: 'TB' }
        ];

        function performSearch(query) {
            const resultsContainer = document.getElementById('searchResults');
            
            if (query.trim() === '') {
                resultsContainer.innerHTML = `
                    <div class="empty-state">
                        <div class="empty-icon">🔍</div>
                        <div class="empty-text">Search</div>
                        <div class="empty-subtext">Search for people, hashtags and places</div>
                    </div>
                `;
                return;
            }

            const filteredResults = searchData.filter(item => 
                item.username.toLowerCase().includes(query.toLowerCase()) ||
                item.fullname.toLowerCase().includes(query.toLowerCase())
            );

            if (filteredResults.length === 0) {
                resultsContainer.innerHTML = `
                    <div class="empty-state">
                        <div class="empty-icon">😔</div>
                        <div class="empty-text">No results found</div>
                        <div class="empty-subtext">Try searching for something else</div>
                    </div>
                `;
                return;
            }

            resultsContainer.innerHTML = filteredResults.map(item => `
                <div class="search-item" onclick="viewProfile('${item.username}')">
                    <img src="https://via.placeholder.com/44/e1e1e1/808080?text=${item.avatar}" alt="${item.fullname}" class="search-avatar">
                    <div class="search-info">
                        <div class="search-username">${item.username}</div>
                        <div class="search-fullname">${item.fullname}</div>
                    </div>
                </div>
            `).join('');
        }

        function viewProfile(username) {
            alert(`Opening profile: ${username}`);
            closeModal('exploreModal');
        }

        // Create Post Functions
        let selectedFile = null;

        function handleFileSelect(event) {
            const file = event.target.files[0];
            if (file) {
                selectedFile = file;
                const reader = new FileReader();
                reader.onload = function(e) {
                    const preview = document.getElementById('imagePreview');
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                    
                    // Hide upload area
                    document.querySelector('.image-upload-area').style.display = 'none';
                    
                    validateForm();
                };
                reader.readAsDataURL(file);
            }
        }

        function dragOverHandler(event) {
            event.preventDefault();
            event.currentTarget.classList.add('dragover');
        }

        function dropHandler(event) {
            event.preventDefault();
            event.currentTarget.classList.remove('dragover');
            
            const files = event.dataTransfer.files;
            if (files.length > 0) {
                const file = files[0];
                if (file.type.startsWith('image/') || file.type.startsWith('video/')) {
                    document.getElementById('imageInput').files = files;
                    handleFileSelect({ target: { files: [file] } });
                }
            }
        }

        function validateForm() {
            const submitBtn = document.getElementById('submitBtn');
            const hasFile = selectedFile !== null;
            const hasContent = document.getElementById('postContent').value.trim() !== '';
            
            submitBtn.disabled = !hasFile;
        }

        function submitPost(event) {
            event.preventDefault();
            
            const content = document.getElementById('postContent').value;
            const formData = new FormData();
            
            if (selectedFile) {
                formData.append('image', selectedFile);
            }
            formData.append('content', content);
            
            // Simulate post submission
            alert('Post created successfully! 🎉');
            
            // Reset form
            document.getElementById('createPostForm').reset();
            document.getElementById('imagePreview').style.display = 'none';
            document.querySelector('.image-upload-area').style.display = 'block';
            selectedFile = null;
            validateForm();
            
            closeModal('createPostModal');
        }

        // Character counter for post content
        document.getElementById('postContent').addEventListener('input', function() {
            const charCount = this.value.length;
            document.getElementById('charCount').textContent = charCount;
            validateForm();
        });

        // Function to open individual post (you can implement modal or redirect)
        function openPost(postId) {
            // Implement post detail view
            window.location.href = '/post/' + postId;
        }

        // Add smooth scrolling for navigation
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth'
                    });
                }
            });
        });

        // Add loading effect to images
        document.querySelectorAll('img').forEach(img => {
            img.addEventListener('load', function() {
                this.classList.remove('loading');
            });
            img.classList.add('loading');
        });

        // Close modal when clicking outside
        document.querySelectorAll('.modal').forEach(modal => {
            modal.addEventListener('click', function(e) {
                if (e.target === this) {
                    closeModal(this.id);
                }
            });
        });

        // Keyboard shortcuts
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                // Close any open modal
                document.querySelectorAll('.modal.active').forEach(modal => {
                    closeModal(modal.id);
                });
            }
        });
    </script>

</body>
</html>