package com.nt.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.model.User;
import com.nt.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class UserService implements IUserService{
	
	@Autowired
	private UserRepository repo;

	@Override
	public String registerUser(User user) {
		System.out.println("UserService.registerUser()");
		Long id=repo.save(user).getId();
		System.out.println("user id "+id);
		return "User regisration Success with "+id+" id";
	}

	
	
	@Override
	public User loginUser(String email, String password) {
		System.out.println("UserService.loginUser()");
		System.out.println(email);
		System.out.println(password);
		User u=repo.login(email, password);
		return u;
	}



	@Override
	public String updateProfile(User u) {
		System.out.println("UserService.updateProfile()");
		System.out.println("UserService.updateProfile():: "+u.getId());
		Optional<User> opt=repo.findById(u.getId());
		if(opt.isPresent()) {
			User user=opt.get();
			u.setUpdateCount(user.getUpdateCount());
			u.setUpdateBy(System.getProperty("user.name"));
			repo.save(u);
			return u.getId()+" is updated...";
		}
		
		return "User details not found"; 
	}



	@Override
	public User getUserById(long id) {
		System.out.println("UserService.getUserById()");
		User user=repo.findById(id).orElseThrow(()-> new IllegalArgumentException("User Not found"));
		System.out.println("UserService.getUserById():: "+user.toString());
		return user;
	}


	// method to search user using userName
	@Override
	public List<User> searchUser(String userName) {
		System.out.println("UserService.searchUser()");
		List<User> userList=repo.findByUserNameContainingIgnoreCase(userName);
		System.out.println("UserService.searchUser()"+userList);
		return userList;
	}

	
}












































//@Override
//public Optional<User> loginUser(String userName, String password) {
//    System.out.println("UserService.loginUser()");
//    
//    User u = repo.login(userName, password)
//                 .orElseThrow(() -> new IllegalArgumentException("User Not found"));
//    
//    return Optional.of(u);
//}
//
//