<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<!-- Author: Chen Lexuan
Class: DIT/FT/2A/02
Date: 8/6/2023
Description: ST0510/JAD Assignment 1 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="./css/login.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>login</title>
<style>
.center-image {
	display: flex;
	justify-content: center;
	align-items: center;
}

.center-image img {
	max-width: 100%;
	max-height: 80vh;
	object-fit: contain;
}
</style>
<script>
document.addEventListener("DOMContentLoaded", function() {
    <% //init variables
    String message = request.getParameter("statusCode");

    //out.print (message);
    if (message != null && message.equals("invalidLogin")) {%>
      alert("Wrong email or password!");
    <%}

    if (message != null && message.equals("sessionTimeOut")) {%>
      alert("Session timed out. Please log in again!");
    <%}%>
  });
</script>
</head>
<body>
	<div class="login-form">
		<div class="center-image">
			<img src="./img/kittyLogo.png" alt="Kitty books">
		</div>
		<form action="<%=request.getContextPath()%>/verifyUserServlet"
			method="post">
			<h2 class="text-center">Log in</h2>
			<div class="form-group">
				<input type="text" class="form-control" name="email"
					placeholder="Email address" required="required">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="pwd"
					placeholder="Password" required="required">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-block" id="Login">Log
					in</button>
			</div>
			<div class="clearfix">
				<a href="register_member.jsp" class="pull-left">Sign up</a> <a
					href="<%=request.getContextPath()%>/logoutUserServlet"
					class="pull-right">Use as Guest</a>
			</div>

		</form>
	</div>
</body>
</html>