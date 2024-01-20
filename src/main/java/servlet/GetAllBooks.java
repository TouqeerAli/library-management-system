package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.BookDAO;
import dao.impl.*;
import model.Book;
/**
 * Servlet implementation class GetAllBooks
 */
@WebServlet(urlPatterns = "/GetAllBooks")
public class GetAllBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAllBooks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		BookDAO bookDAO = new BookDAOImpl();
		List<Book> books = bookDAO.getAllBooks();
		
		for(Book book : books) {
			System.out.println("Book "+ book.getTitle());
		}
		if (books != null && !books.isEmpty()) {
		    request.setAttribute("books", books);
		} else {
			request.setAttribute("books", null);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/manageBooks.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
