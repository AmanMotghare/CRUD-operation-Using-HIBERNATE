package Service;

import Model.User;
import Model.UserDao;

public class Authenticate {
	
	public boolean AuthenticateUser(String Email, String Password){
		
		UserDao dao = new UserDao();
		
		User user = dao.AuthenticateUser(Email, Password);
		System.out.println("In Authenticate : USER IS " + user);
		
		if(user!=null){
			return true;
		}
		else{
			return false;
		}
		
	}
	
}
