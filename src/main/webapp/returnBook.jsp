<%@ page import="java.util.List"%>
<%@ page import="model.Book"%>
<%@ page import="model.User"%>
<%@ page import="dao.BookDAO"%>
<%@ page import="dao.impl.*"%>
<%@ page import="dao.UserDAO"%>

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


.container {
            position: relative;
            width: 365px;
            margin: 20px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 1.0);
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            
        }

        main {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
           
        }

        .return-book {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .return-book-form{
        	margin:auto 30px;
        	
        }
        

      label {
            margin-bottom: 5px;
            display: block; 
    		 text-align: left; 
    		 font-weight:bold;
        }

        select, input {
            margin-bottom: 10px;
            padding: 8px;
            width: 300px;
            box-sizing: border-box;
        }

.btns{
	display:flex;
	justify-content:center;
}
.btns button {
	text-decoration: none;
	padding: 10px 20px;
	background-color: #3498db;
	color: #fff;
	white-space: normal;
	word-wrap: break-word;
	width: 110px;
	border-radius: 5px;
	border: 1px solid black;
}

.btns button:hover {
	background-color: #258cd1;
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
			<li><a href="assignBook.jsp">Assign Book</a></li>
			<li><a href="returnBook.jsp">Return Book</a></li>
			<li><a href="index.jsp">Log out</a></li>
		</ul>
	</nav>
	<div class="layer">
		<div class="container">
			<main>
			<div class="return-book">
				<h1>Return Book</h1>
			</div>
				<div class="return-book-form">
				<form action="ReturnBook" method="post">
					<label for="user">Select User</label> 
					<select name="user" id="user">
						<%
						// Assuming you have a method to fetch users from the database
						UserDAO userDAO = new UserDAOImpl();
						
						List<User> users = userDAO.getUsers();
						for (User user : users) {
						%>
						<option value="<%=user.getId()%>"><%=user.getFistName()%></option>
						<%
						}
						%>
					</select> 
					<label for="book">Select Book</label> <select name="book"
						id="book">
						<%
						// Assuming you have a method to fetch books from the database
						BookDAO bookDAO = new BookDAOImpl();
						List<Book> books = bookDAO.getAllBooks();
						
						for (Book book : books) {
						%>
						<option value="<%=book.getId()%>"><%=book.getTitle()%></option>
						<%
						}
						%>
					</select> 
					<div class="btns">
					<button  type="submit">Return</button>
					
					
					</div>
					
				</form>
				</div>
				
			</main>
		</div>
	</div>
</body>
</html>
