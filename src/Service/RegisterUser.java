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

@WebServlet(name = "register", urlPatterns = { "/register" })
public class RegisterUser extends HttpServlet {

       
    public RegisterUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		User user = new User(firstName, lastName, email, password);
		
		UserDao dao = new UserDao();
		
		try {
			dao.save(user);
			request.setAttribute("msg", "User Registered Successfully.");		
			RequestDispatcher dispatcher = request.getRequestDispatcher("viewAll.jsp");
			dispatcher.include(request, response);
			//out.print("Data Successfully Inserted.");
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("errmsg", "User Registration Failed.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.include(request, response);
			System.out.println("Servlet Says : Data  Not entered." + e);
		}
			
		
		
	}

}
