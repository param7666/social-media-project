package com.nt.controller;


import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.model.User;
import com.nt.service.IUserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	
	@Autowired
	private IUserService ser;
	
	@GetMapping("/update")
	public String updateProfile(@ModelAttribute("user")User u,HttpSession session) {
		System.out.println("UserController.updateProfile()");
		User user = (User) session.getAttribute("user"); // fetch session data 
		BeanUtils.copyProperties(user, u); // add to model attribute
		System.out.println("UserController.updateProfile():: "+user.toString());
		return "update";
	}
	
	@PostMapping("updateProfile")
	public String updateProfile(@ModelAttribute("user") User u,RedirectAttributes atrs,
			@RequestParam("profilePictureFile") MultipartFile file,HttpSession session) {
		System.out.println("UserController.updateProfile()");
		try {
            if (!file.isEmpty()) {
                u.setProfilePicture(file.getBytes());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Update session object also
        session.setAttribute("user", u);
        System.out.println("UserController.updateProfile():: "+u);
        String result=ser.updateProfile(u); 
        System.out.println(result);
        atrs.addFlashAttribute("result",result);
        return "dashboard";
	}
	
	@GetMapping("/profile")
	public String profile(HttpSession ses,Map<String, Object> map) {
		User user=(User)ses.getAttribute("user");
		System.out.println("UserController.profile():: "+user.toString());
		User userDetails=ser.getUserById(user.getId());
		System.out.println("UserController.profile():: "+userDetails);
		 if (userDetails.getProfilePicture() != null) {
		        String base64Image = Base64.getEncoder().encodeToString(userDetails.getProfilePicture());
		        map.put("profileImage", base64Image);
		    }
		map.put("userDetails", userDetails);
		return "profile";
	}
	
	@PostMapping("/search")
	public String searchUserchProfile(HttpServletRequest req,Map<String, Object> map) {
		String userName=req.getParameter("userName");
		System.out.println("UserController.searchUserchProfile()"+userName);
		List<User> users=ser.searchUser(userName);
		System.out.println("UserController.searchUserchProfile()"+users);
		if(users!=null) {
			
			map.put("userList", users);
		} else {
			map.put("message", "Users Not found");
		}
		return "search";
	}

}


//GET /users/{username} → user profile
//PUT /users/profile → update profile
//POST /users/{id}/follow → follow/unfollow user
//GET /users/{id}/followers → get followers
//GET /users/{id}/following → get following list
