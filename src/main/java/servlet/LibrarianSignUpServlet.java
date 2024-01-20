package servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LibrarianDAO;
import dao.impl.LibrarianDAOImpl;
import model.Librarian;


import java.io.IOException;

/**
 * Servlet implementation class LibrarianSignUpServlet
 */
@WebServlet(urlPatterns = "/LibrarianSignUpServlet")
public class LibrarianSignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LibrarianSignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Librarian librarian = new Librarian();
		librarian.setFistName(firstName);
		librarian.setLastName(lastName);
		librarian.setEmail(email);
		librarian.setPassword(password);
		
		LibrarianDAO librarianDAO = new LibrarianDAOImpl();
		
		librarianDAO.addUser(librarian);
		RequestDispatcher r = request.getRequestDispatcher("librarianLogin.jsp");
		r.forward(request, response);
	}

}
