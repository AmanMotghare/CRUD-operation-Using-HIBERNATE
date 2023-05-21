package Service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import Model.User;
import Model.UserDao;


@WebServlet(name = "login", urlPatterns = { "/login" })
public class LoginUser extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String Email = request.getParameter("email");
		String Password = request.getParameter("password");
		
		Authenticate auth = new Authenticate();
		
		
		if(auth.AuthenticateUser(Email, Password)){
			System.out.println("User found");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("email", Email);
			session.setAttribute("password", Password);
			
			RequestDispatcher dispather = request.getRequestDispatcher("welcomePage.jsp");
			dispather.forward(request, response);
		}
		else{
			
			System.out.println("Login Failed.");
			request.setAttribute("loginerrmsg", "Invalid Credentials!");
			
			RequestDispatcher dispather = request.getRequestDispatcher("login.jsp");
			dispather.forward(request, response);
		}
		
		
	}

}
