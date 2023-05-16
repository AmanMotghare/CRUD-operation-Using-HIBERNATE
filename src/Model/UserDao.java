package Model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class UserDao {
	
	Configuration cfg;
	SessionFactory factory;
	Session session;
	Transaction tx;
	
	public UserDao() {
		super();
		// TODO Auto-generated constructor stub
		
		cfg= new Configuration();
		cfg.configure("hibernate.cfg.xml");
		
		factory =  cfg.buildSessionFactory();
		
		session = factory.openSession();
		
		tx =  session.beginTransaction();
	}
	
	public void save (User user){
		session.save(user);
		System.out.println("User Saved");
		//allUsers();
		closeAll();
	}
	
	public List<User> allUsers (){
		Query query = session.createQuery("from User");
		
		List<User> list = query.list();
		
		for (User user : list) {
			System.out.println(user);
		}
		
		closeAll();
		
		return list;
	}
	
	public User findByid(int id){
		Query query = session.createQuery("from User u WHERE u.id = "+id);
		User user = null;
		List list = query.list();
		
		if(list.size()==1){
			user = (User) list.get(0);
		}
		
		closeAll();
		return user;
	}
	
	
	public void closeAll(){
		tx.commit();
		session.close();
		factory.close();
	}


}
