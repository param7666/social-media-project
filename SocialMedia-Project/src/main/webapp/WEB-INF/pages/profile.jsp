<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile page</title>
</head>
<body>
<h1 style="text-align:center;">Wellcome to profile page...</h1>
  <!-- Show existing profile picture if available -->
    <c:if test="${not empty userDetails.profilePicture}">
        <div class="profile-pic">
            <img src="data:image/jpeg;base64,${userDetails.profilePicture}" alt="Profile Picture"/>
        </div>
    </c:if>

<p>id: ${userDetails.id}</p> <br>
<p>username: ${userDetails.userName}</p> <br>

<p>Fisrt Name: ${userDetails.firstName}</p> <br>

<p>Last Name: ${userDetails.lastName}</p> <br>

<p>email: ${userDetails.email}</p> <br>

<p>mobileNo: ${userDetails.mobileNo}</p> <br>

<p>date_of_birth: ${userDetails.date_of_birth}</p> <br>

<p>location: ${userDetails.location}</p> <br>

</body>
</html>