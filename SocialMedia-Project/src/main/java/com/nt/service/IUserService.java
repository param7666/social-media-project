package com.nt.service;

import java.util.List;

import com.nt.model.User;

import jakarta.servlet.http.HttpSession;

public interface IUserService {
	
	public String registerUser(User user);
	public User loginUser(String userName,String password);
	public String updateProfile(User u);
	public User getUserById(long Id);
	public List<User> searchUser(String userName);
	public boolean isEmailExists(String email);
		
	


}
//registerUser() -- complete
//loginUser() -- complete
//getUserById()
//getUserByUsername()
//updateProfile() --> complete
//searchUsers()  --> complete
//getUserStats() (posts count, followers count, following count)
