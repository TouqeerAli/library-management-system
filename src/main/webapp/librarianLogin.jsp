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
	position: relative;
	max-width: 400px;
	margin: 20px auto;
	padding: 20px;
	background-color: rgba(255, 255, 255, 0.8);
	/* White color with 0.8 opacity */
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

.container form {
	display: flex;
	flex-direction: column;
}

.container label {
	margin-bottom: 5px;
	font-weight: bold; /* Make labels bold */
}

.container input {
	padding: 8px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.container button {
	padding: 10px;
	margin: 10px;
	background-color: #3498db;
	color: white;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.container button:hover {
	background-color: #2980b9;
}

.container .login {
	text-align: center;
}

.container p {
	margin: 10px 0; /* Add some margin to separate from the buttons */
}

.container a {
	text-decoration: none;
	color: #3498db;
	font-weight: bold; /* Make signup link bold */
}

.container a:hover {
	text-decoration: underline; /* Add underline on hover */
}

.container .signup-container {
	display: flex;
	align-items: center; /* Align items vertically in the center */
	justify-content: space-evenly;
}
</style>
</head>
<body>

	<header>
		<h1>Online Library Management System</h1>
	</header>

	<nav>
		<a href="index.jsp">Home</a> <a href="#">About</a> <a href="userLogin">Login
			(User)</a> <a href="librarianLogin.jsp">Login (Librarian)</a>
	</nav>

	<div class="layer">
		<div class="container">
			<div class=login>
				<h1>Login(Librarian)</h1>
			</div>

			<form action="LibrarianLogin" method="post">
				<label for="username">User Name:</label> <input type="text"
					id="username" name="username" required> <label
					for="password">Password:</label> <input type="password"
					id="password" name="password" required>
				<%
				String error = (String) session.getAttribute("error");
				if (error != null) {
				%>
				<p style="color: red;"><%=error%></p>
				<%
				session.removeAttribute("error");
				%>
				<%
				}
				%>
				<button type="submit">Login</button>
				<div class="signup-container">
					<p>Don't have an account?</p>
					<a href="librarianSignUp.jsp"> Sign up</a>
				</div>

			</form>
		</div>
	</div>

</body>
</html>
