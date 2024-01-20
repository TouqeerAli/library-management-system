<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Library System</title>
<style>
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
	justify-content: center;
	background-color: #3498db;
	padding: 10px;
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

.container {
	max-width: 1200px;
	margin: 20px auto;
	padding: 20px;
	background-color: white;
	height: 100%;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}
</style>
</head>
<body>

	<header>
		<h1>Online Library Management System</h1>
	</header>

	<nav>
		<a href="index.jsp">Home</a> <a href="#">About</a>
		<a href="userLogin.jsp">Login(User)</a> 
		<a href="librarianLogin.jsp">Login (Librarian)</a>
	</nav>
	<div class=layer>
		<div class="container">
			<!-- Add the content of your page here -->
			<p>Welcome to our beautiful Library System!</p>
		</div>
	</div>


</body>
</html>
