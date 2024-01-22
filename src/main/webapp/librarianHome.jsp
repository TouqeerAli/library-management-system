<%@ page import="dao.BookDAO" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="dao.impl.BookDAOImpl" %>
<%@ page import="dao.impl.UserDAOImpl" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Librarian Dashboard</title>
<style type="text/css">
body {
    min-height: 100vh;
	margin: 0;
	padding: 0;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-image: url("Library-background.jpg");
	background-size: cover;
	background-position: center;
}

header {
	background-color: #333;
	color: white;
	padding: 15px;
	text-align: center;
}

nav {
	display: flex;
	justify-content: space-between; 
	align-items:center;
	background-color: #3498db;
	padding: 5px;
	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	
	
	
}

nav a {
	color: white;
	text-decoration: none;
	padding: 10px 20px;
	margin: 0 10px;
	border-radius: 5px;
	transition: background-color 0.3s;
}

nav a:hover {
	background-color: #2980b9;
}
nav h2{
	color:white;
}
.container {
	position: relative;
	max-width: 1200px;
	margin: 20px auto;
	padding: 20px;
	background-color: rgba(255, 255, 255, 1.0);
	/* White color with 0.8 opacity */
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

h1 {
	font-size: 24px;
}



nav ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

nav li {
	margin-right: 20px; /* Adjust for spacing between nav items */
}

a {
	text-decoration: none;
	color: #333;
}

main {
	margin-top: 20px;
	display: flex;
	justify-content: space-around;
}

.box {
	width: 25%;
	padding: 20px;
	border: 1px solid #ccc;
	text-align: center;
	margin-bottom: 20px; /* Add spacing between boxes */
}

h2 {
	margin-bottom: 10px;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover {
	background-color: #111;
}
</style>
</head>
<body>
	<header>
		<h1>Online Library Management System</h1>
	</header>

	<nav>
		<h2>Librarian Dashboard</h2>
		<ul>
			<li><a href="librarianHome.jsp">Home</a></li>
			<li><a href="GetAllBooks">Manage Books</a></li>
			<li><a href="assignBook.java">Assign Book</a></li>
			<li><a href="returnBook.jsp">Return Book</a></li>
			<li><a href="index.jsp">Log out</a></li>
		</ul>
	</nav>
<div class="layer">
	<div class="container">
	<main>
		<div class="box">
			<h2>Total Books</h2>
			<% 
				BookDAO bookDAO = new BookDAOImpl();
			%>
			<p><%= bookDAO.getTotalBooks() %></p>
		</div>
		<div class="box">
			<h2>Total Users</h2>
			<% 
				UserDAO userDAO = new UserDAOImpl();
			%>
			<p><%= userDAO.getTotalUsers() %></p>
		</div>
		
	</main>
	</div>
	</div>
</body>
</html>
