package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import dao.impl.*;
/**
 * Servlet implementation class DeleteBookServlet
 */
@WebServlet(urlPatterns = "/DeleteBook")
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		 if (id != null) {
	            try {
	                
	                int bookid = Integer.parseInt(id);

	                BookDAO bookDAO = new BookDAOImpl();
	                bookDAO.deleteBook(bookid);
	                response.sendRedirect("GetAllBooks");
	            } catch (NumberFormatException e) {
	                e.printStackTrace(); 
	                response.sendRedirect("GetAllBooks");
	            }
	        } else {
	            response.sendRedirect("GetAllBooks"); 
	        }
	    }
	}


