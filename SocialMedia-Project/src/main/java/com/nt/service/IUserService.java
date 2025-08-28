package com.nt.service;

import com.nt.model.User;

import jakarta.servlet.http.HttpSession;

public interface IUserService {
	
	public String registerUser(User user);
	public User loginUser(String userName,String password);
	public String updateProfile(User u);
	public User getUserById(long Id);
		
	


}
//registerUser() -- complete
//loginUser() -- complete
//getUserById()
//getUserByUsername()
//updateProfile() --> complete
//searchUsers()
//getUserStats() (posts count, followers count, following count)
