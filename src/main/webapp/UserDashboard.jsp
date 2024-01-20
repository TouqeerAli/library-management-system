<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	justify-content: center;
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
    margin-bottom: 10px;
    text-align:center;
}



main {
    margin-top: 20px;
}

h2 {
    font-size: 20px;
    margin-bottom: 10px;
    color:white;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 10px;
    border: 1px solid #ccc;
    text-align: left;
}

thead{
	background-color:#333;
	color:white;
}
#assignedBooks{
	color:black;
}

</style>
</head>

<body>
<header>

        <h1>Online Library Management System</h1>
        
        
    </header>

	<nav>
	<h2>User Dashboard</h2>
		
		<a href="index.jsp">Log out</a>
	</nav>
	<div class="layer">
	<div class="container">
	<span><h2 id="assignedBooks">Assigned Books</h2></span>
    <main>
        
        <table>
            <thead>
                <tr>
                    <th>ISBN</th>
                    <th>Title</th>
                    <th>Issue Date</th>
                    <th>Return Date</th>
                </tr>
            </thead>
            <tbody>
                </tbody>
        </table>
    </main>
    </div>
    </div>
</body>
</html>