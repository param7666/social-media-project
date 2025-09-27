package com.nt.controller;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.nt.mailConfig.MailConfiguration;
import com.nt.model.User;
import com.nt.service.IUserService;
import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {
	
	@Autowired
	private IUserService ser;
	@Autowired
	private MailConfiguration mail;
	
	//Handeler method for register user

	@PostMapping("/register")
	public String registerUser(@ModelAttribute User u, HttpSession ses,RedirectAttributes atrs) throws Exception {
		System.out.println("AuthController.registerUser()");
		if(ser.isEmailExists(u.getEmail())) {
			System.out.println("Email already registered. Please login!");
			atrs.addFlashAttribute("result", "Email already registered. Please login!");
			return "redirect:/";
		} else {
		ses.setAttribute("user", u);
		Integer otp=mail.sendOtp(u.getEmail());
		ses.setAttribute("otp", otp);
		return "redirect:/otpPageLoader";
		}
	}
	
	
	@GetMapping("/otpPageLoader")
	public String openOtpPage() {
		System.out.println("From otpPageLoader");
//		System.out.println("From otpPageLoader OTP:: "+otp);
		return "otp";
	}
	
	@PostMapping("/verifyOTP")
	public String verifyOtp(@RequestParam("otpCode")Integer otpCode, HttpSession ses,RedirectAttributes atrs) {
		System.out.println("AuthController.verifyOtp()");
		 User user = (User) ses.getAttribute("user");
	     Integer otp = (Integer) ses.getAttribute("otp");

	     System.out.println("Verifying OTP for: " + user);
	     System.out.println("User entered: " + otpCode + ", Actual OTP: " + otp);
	     
	     if(otpCode!=null && otpCode.equals(otp)) {
	    	 String result=ser.registerUser(user);
	    	 ses.removeAttribute("user");
	    	 ses.removeAttribute("otp");
	    	 System.out.println("OTP Verification Pass");
	    	 atrs.addFlashAttribute("result",result);
	    	 return "redirect:/";
	     } else {
	    	 System.out.println("OTP Verification Fail");
	    	 atrs.addFlashAttribute("result","OTP Verification Fail");
	    	 return "redirect:/";
	     }
	}
	
	
	//Handeler method to login user
	
	@PostMapping("/login")
	public String loginUser(@ModelAttribute("user") User u,HttpSession session, RedirectAttributes atrs) {
		System.out.println("AuthController.loginUser()");
		System.out.println(u.getEmail());
		System.out.println(u.getPassword());
		User user=ser.loginUser(u.getEmail(), u.getPassword());
		if(user!=null) {
			System.out.println("AuthController.loginUser():: "+user.getFirstName());
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
