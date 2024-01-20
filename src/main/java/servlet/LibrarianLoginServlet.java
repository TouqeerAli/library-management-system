package servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dao.impl.UserDAOImpl;
import model.User;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class LibrarianLoginServlet
 */
@WebServlet(urlPatterns = "/LibrarianLogin")
public class LibrarianLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LibrarianLoginServlet() {
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
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		UserDAO userDAO = new UserDAOImpl();
		List<User> usersList = userDAO.getUsers();
		
		for(User user : usersList) {
			if(user.getEmail().equals(userName) && user.getPassword().equals(password)) {
				
			RequestDispatcher r =	request.getRequestDispatcher("/librarianHome.jsp");
				r.forward(request, response);
			}else if(usersList.indexOf(user) == (usersList.size()-1)){

				HttpSession session = request.getSession();
				session.setAttribute("error", "Invalid username or password");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/librarianLogin.jsp");
				dispatcher.include(request, response);
			}
		}
	}

}
