<!-- Author: Angie Toh Anqi
Class: DIT/FT/2A/02
Date: 8/6/2023
Description: ST0510/JAD Assignment 1 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Member</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
</head>
<body>
	<%@page import="java.sql.*"%>
	<%@include file="header.html"%>
	<%
	String dm_userID = (String) session.getAttribute("sessUserID");
	String dm_userRole = (String) session.getAttribute("sessUserRole");
	String dm_loginStatus = (String) session.getAttribute("loginStatus");

	if (dm_userID == null || !dm_loginStatus.equals("success")) {
		response.sendRedirect("login.jsp?errCode=sessionTimeOut");
	}

	String id = request.getParameter("id");
	String first_name = request.getParameter("first_name");
	String last_name = request.getParameter("last_name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	try {
		// Step1: Load JDBC Driver
		// Class.forName("com.mysql.cj.jdbc.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/bookstore?user=root&password=root&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		// Step 4: Create Statement object
		// Statement stmt = conn.createStatement();

		// Step 5: Execute SQL Command
		String sqlStr = "SELECT * FROM members WHERE member_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();

		// Step 6: Process Result
		if (rs.next()) {
			first_name = rs.getString("first_name");
			last_name = rs.getString("last_name");
			email = rs.getString("email");
			password = rs.getString("password");
		}

		// Step 7: Close connection
		conn.close();

	} catch (Exception e) {
		out.print("Error :" + e);
	}

	String oldFirstName = first_name;
	String oldLastName = last_name;
	String oldEmail = email;
	String oldPassword = password;
	%>

	<div align="center">
		<h2>Edit Member</h2>
		<form action="updateMember.jsp" method="POST">
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td style="padding: 5px;">id:</td>
					<td style="padding: 5px;"><input type="text" name="id"
						value="<%=id%>" readonly="readonly" style="padding: 3px;"></td>
				</tr>
				<tr>
					<td style="padding: 5px;">first name:</td>
					<td style="padding: 5px;"><input type="text" name="first_name"
						value="<%=first_name%>" style="padding: 3px;"> <input
						type="hidden" name="oldFirstName" value="<%=oldFirstName%>"></td>
				</tr>
				<tr>
					<td style="padding: 5px;">last name:</td>
					<td style="padding: 5px;"><input type="text" name="last_name"
						value="<%=last_name%>" style="padding: 3px;"> <input
						type="hidden" name="oldLastName" value="<%=oldLastName%>"></td>
				</tr>
				<tr>
					<td style="padding: 5px;">email:</td>
					<td style="padding: 5px;"><input type="text" name="email"
						value="<%=email%>" style="padding: 3px;"> <input
						type="hidden" name="oldEmail" value="<%=oldEmail%>"></td>
				</tr>
				<tr>
					<td style="padding: 5px;">password:</td>
					<td style="padding: 5px;"><input type="text" name="password"
						value="<%=password%>" style="padding: 3px;"> <input
						type="hidden" name="oldPassword" value="<%=oldPassword%>"></td>
				</tr>
				<tr>
					<td colspan="2" align="center" style="padding: 5px;"><input
						type="submit" value="Update"></td>
				</tr>
			</table>
		</form>
		<br> <a href='manageMembers.jsp'><button>Back</button></a> <br>
	</div>

	<%@include file="footer.html"%>
</body>
</html>