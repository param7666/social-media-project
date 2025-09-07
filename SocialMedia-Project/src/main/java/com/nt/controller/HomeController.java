package com.nt.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.nt.model.Post;
import com.nt.model.User;
import com.nt.service.IPostServie;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired
	private IPostServie postService;
	
	@SuppressWarnings("unused")
	@GetMapping("/dashboard")
	public String dashboard(@ModelAttribute("user") User u,@ModelAttribute("p")Post post,HttpSession session, Map<String,Object> map) {
		System.out.println("HomeController.dashboard() entered");
		User user=(User)session.getAttribute("user");
		System.out.println("HomeController.dashboard()"+user.getFirstName());
		if(user!=null) {
			if (user.getProfilePicture() != null) {
	            String base64Image = Base64.getEncoder().encodeToString(user.getProfilePicture());
	            session.setAttribute("profileImage", base64Image); // store in session
	            
	        }
			List<Post> posts=postService.showPostByDate();
			List<String> images=new ArrayList<>();
			for(Post p:posts) {
				images.add(Base64.getEncoder().encodeToString(p.getImage()));
			}
			map.put("posts", posts);
			map.put("postImages", images);
			return "dashboard";
			
		} else {
			return "redirect:/";
		}
	
		
	}

}
//Endpoints:
//
//GET / → home/news feed page
//GET /profile/{username} → user profile page
//GET /search → search results page
