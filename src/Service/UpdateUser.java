package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.User;
import Model.UserDao;

/**
 * Servlet implementation class UpdateUser
 */
@WebServlet(name = "update", urlPatterns = { "/update" })
public class UpdateUser extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

		PrintWriter out = response.getWriter();

		int id = Integer.parseInt(request.getParameter("id"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User user = new User(id, firstName, lastName, email, password);

		UserDao dao = new UserDao();

		try {
			dao.updateUser(user);
			System.out.println("User Updated.");

			RequestDispatcher dispatcher = request.getRequestDispatcher("viewAll.jsp");
			dispatcher.include(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("User details not Updated." + e);
		}

	}

}
