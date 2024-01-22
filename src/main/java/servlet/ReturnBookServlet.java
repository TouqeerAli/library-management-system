package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.impl.UserBookRelationDAOImpl;

/**
 * Servlet implementation class ReturnBookServlet
 */
@WebServlet(urlPatterns = "/ReturnBook")
public class ReturnBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnBookServlet() {
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
		Integer user_id =Integer.parseInt( request.getParameter("user"));
		Integer book_id = Integer.parseInt(request.getParameter("book"));
		
		UserBookRelationDAOImpl ub = new UserBookRelationDAOImpl();
		ub.returnBook(user_id, book_id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/returnBook.jsp");
		dispatcher.forward(request, response);
	}

}
