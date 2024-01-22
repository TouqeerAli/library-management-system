<%@ page import="java.util.List"%>
<%@ page import="model.Book"%>
<%@ page import="dao.BookDAO"%>

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
	align-items: center;
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

nav h2 {
	color: white;
}

.container {
	position: relative;
	max-width: 1420px;
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

table {
	width: 100%;
	margin-top: 20px;
	border-spacing: 0;
	border-collapse: separate;
	border-radius: 10px;
	border: 1px solid black;
}

th, td {
	padding: 8px;
	text-align: left;
	color: rgba(255, 255, 255, 0.8);
}

th {
	background-color: #242124;
	color: white;
	text-align: center;
}

td {
	color: black;
	text-align: center;
}

#first-th {
	border-top-left-radius: 10px;
}

#last-th {
	border-top-right-radius: 10px;
}

.form-container {
	display: none;
	width: 50%;
	margin: 20px auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	color: black;
}

.form-container label {
	display: block;
	margin-bottom: 8px;
}

.form-container input {
	width: 100%;
	padding: 8px;
	margin-bottom: 10px;
	box-sizing: border-box;
}

.form-container button {
	background-color: #4CAF50;
	color: #fff;
	padding: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
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

.updateBtn {
	text-decoration: none;
	margin-right: 10px;
	padding: 5px 10px;
	background-color: #4CAF50;
	color: #fff;
	border-radius: 5px;
}

//
_______________________________________________________



.updateButton {
	border: none;
	border-radius: 5px;
	background-color: #1c87c9;
	color: white;
	padding: 14px 20px;
	cursor: pointer;
	position: fixed;
}

#updateFormBtns{
	display:flex;
	flex-direction:column;
	justify-content:center;
	align-items:center;
	
}
#operationBtns{
display:flex;
	flex-direction:horixontal;
	justify-content:space-evenly;
	align-items:center;
}
.updatePopup {
	position: relative;
	text-align: left;
	width: 100%;
	font-weight: bold;
}

.formPopup {
	display: none;
	position: fixed;
	left: 45%;
	top: 5%;
	transform: translate(-50%, 5%);
	border: none;
	z-index: 9;
}

.formContainer {
	position: relative;
	max-width: 600px;
	margin: 20px auto;
	padding: 22px;
	background-color: rgba(255, 255, 255, 1);
	/* White color with 0.8 opacity */
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 1);
	border-radius: 5px;
}

.formContainer h2{
	text-align:center;
}
.formContainer input {
	padding: 8px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	width:300px;
}

.formContainer form{
	display: flex;
	flex-direction: column;
}



.formContainer .btn {
	padding: 12px 20px;
	border: none;
	background-color: #8ebf42;
	color: #fff;
	cursor: pointer;
	width: 100%;
	margin-bottom: 15px;
	opacity: 0.8;
}

.formContainer .cancel {
	background-color: #cc0000;
}

.formContainer .btn:hover, .updateButton:hover {
	opacity: 1;
}
</style>

<script>
	// Function to toggle the visibility of the form
	function toggleForm() {
		var form = document.getElementById("addBookForm");
		form.style.display = (form.style.display === "block") ? "none"
				: "block";
	}
</script>
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




			<table>
				<thead>
					<tr>
						<th id="first-th">ISBN</th>
						<th>Title</th>
						<th>Author</th>
						<th>Publisher</th>
						<th>Genre</th>
						<th>Available Copies</th>
						<th>Operations</th>
						<th id="last-th"></th>
					</tr>
				</thead>
				<tbody>
					<%
					List<Book> books = (List<Book>) request.getAttribute("books");

					if (books != null) {

						for (Book book : books) {
					%>
					<tr>

						<td><%=book.getIsbn()%></td>
						<td><%=book.getTitle()%></td>
						<td><%=book.getAuthor()%></td>
						<td><%=book.getPublisher()%></td>
						<td><%=book.getGenre()%></td>
						<td><%=book.getAvailableCopies()%></td>

						<td>
							<div class="btns" id="operationBtns">
							<button class="updateButton" onclick="updateForm('<%=book.getId()%>','<%=book.getIsbn()%>', '<%=book.getTitle()%>', '<%=book.getAuthor()%>', '<%=book.getPublisher()%>', '<%=book.getGenre()%>', '<%=book.getAvailableCopies()%>')">
									<strong>Update</strong>
								</button>
								<br>
								<!-- delete button-------------------------------------------------- -->
								<form action="DeleteBook?id=<%=book.getId()%>" method="post">
									<button type="submit">
									<strong>Delete</strong>
								</button>
								</form>
							
							</div>
								
							
							
							<div class="updatePopup">
								<div class="formPopup" id="popupForm">
								<div class="formContainer">
								
								
									<form action="updateBook" method="post">
										<h2>Update Book</h2>
										<input type="hidden" id="id" name="id">
										<label for="isbn">ISBN:</label> 
										<input type="text" id="isbn" name="isbn"  required> 
										<label for="title">Title:</label>
										<input type="text" id="title" name="title" required> 
										<label for="author">Author:</label> 
										<input type="text" id="author" name="author"  required> 
										<label for="publisher">Publisher:</label>
										<input type="text" id="publisher" name="publisher"required>
										<label for="genre">Genre:</label> 
										<input type="text" id="genre" name="genre" required> 
										<label for="available_copies">Available Copies:</label> 
										<input type="text" id="available_copies" name="available_copies" required>
										<div class="btns" id="updateFormBtns">
										<button type="submit" >Update</button>
										<br>
										<button type="button"  onclick="closeForm()">Close</button>
										</div>
										
									</form>
								</div>
								</div>
							</div> <script>
							function updateForm(id,isbn, title, author, publisher, genre, availableCopies) {
				                // Set the input field values in the update form
				               	document.getElementById("id").value = id;
				                document.getElementById("isbn").value = isbn;
				                document.getElementById("title").value = title;
				                document.getElementById("author").value = author;
				                document.getElementById("publisher").value = publisher;
				                document.getElementById("genre").value = genre;
				                document.getElementById("available_copies").value = availableCopies;
				                // Display the update form
				                document.getElementById("popupForm").style.display = "block";
				            }

								function closeForm() {
									document.getElementById("popupForm").style.display = "none";
								}
								// When the user clicks anywhere outside of the modal, close it
								window.onclick = function (event) {
								  let modal = document.getElementById("popupForm");
								  if (event.target == modal) {
								    closeForm();
								  }
								}
							</script>


							
							
						</td>
					</tr>
					<%
					}
					%>


				</tbody>
			</table>
			<%
			}
			%>
			<br>

			<!-- Button to toggle the form visibility -->
			<div class="btns">
				<button href="#" onclick="toggleForm()" class="addBookBtn">Add
					Book</button>

			</div>
			<div class="form-container" id="addBookForm">
				<h2 class="title">Add Book</h2>
				<form action="addBookServlet" method="post">
					<label for="isbn">ISBN:</label> <input type="text" id="isbn"
						name="isbn" required> <label for="title">Title:</label> <input
						type="text" id="title" name="title" required> <label
						for="author">Author:</label> <input type="text" id="author"
						name="author" required> <label for="publisher">Publisher:</label>
					<input type="text" id="publisher" name="publisher" required>
					<label for="genre">Genre:</label> <input type="text" id="genre"
						name="genre" required> <label for="available_copies">Available
						Copies:</label> <input type="text" id="available_copies"
						name="available_copies" required>
					<button type="submit">Add</button>
				</form>
			</div>



		</div>
	</div>
</body>
</html>
