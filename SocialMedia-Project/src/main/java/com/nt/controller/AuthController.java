package com.nt.controller;

import java.net.Authenticator.RequestorType;
import java.net.http.HttpRequest;
import java.util.Base64;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.model.Post;
import com.nt.model.User;
import com.nt.service.IUserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {
	
	@Autowired
	private IUserService ser;
	
	//Handeler method for register user

	@PostMapping("/register")
	public String registerUser(@ModelAttribute User u, RedirectAttributes atrs) {
		System.out.println("AuthController.registerUser()");
		String result=ser.registerUser(u);
		System.out.println("AuthController.registerUser():: ");
		atrs.addFlashAttribute("result",result);
		return "redirect:/";
	}
	
	
	//Handeler method to login user
	
	@PostMapping("/login")
	public String loginUser(@ModelAttribute("user") User u,HttpSession session, RedirectAttributes atrs) {
		System.out.println("AuthController.loginUser()");
		System.out.println(u.getEmail());
		System.out.println(u.getPassword());
		User user=ser.loginUser(u.getEmail(), u.getPassword());
		System.out.println("AuthController.loginUser():: "+user.getFirstName());
		if(user!=null) {
			session.setAttribute("user", user); // session created...
			System.out.println("session created....");
			atrs.addFlashAttribute("msg","Login Success");
			return "redirect:/dashboard";// dashborad page...
		} else {
			atrs.addFlashAttribute("msg","Login fail");
			return "redirect:/";
		}
	}
	
	
	//Handler method to logout user
	@GetMapping("/logout")
	public String logout(HttpSession session, Map<String,Object> map) {
		System.out.println("AuthController.logout()");
	    session.invalidate(); // destroy session
	    map.put("result", "You have been logged out.");
	    return "redirect:/"; // back to login.jsp
	} 
}



//
//Endpoints:
//
//GET /login → login page
//POST /login → authenticate user
//GET /register → registration page
//POST /register → create new user
//GET /logout → logout user

/*

// ✅ Logout handler
@GetMapping("/logout")
public String logout(HttpSession session, Model model) {
    session.invalidate(); // destroy session
    model.addAttribute("result", "You have been logged out.");
    return "login"; // back to login.jsp
}  */
