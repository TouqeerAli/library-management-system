package servlet;

import java.awt.print.Book;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import dao.impl.UserBookRelationDAOImpl;
import model.User;

/**
 * Servlet implementation class AssignBookServlet
 */
@WebServlet(urlPatterns = "/AssignBook")
public class AssignBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignBookServlet() {
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
	ub.assign(user_id, book_id);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("/assignBook.jsp");
	dispatcher.forward(request, response);
		
		
	}

}
