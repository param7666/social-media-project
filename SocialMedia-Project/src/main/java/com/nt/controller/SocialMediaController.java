package com.nt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.nt.model.User;

@Controller
public class SocialMediaController {
	
	@GetMapping("/")
	public String welcome(@ModelAttribute("user") User u) {
		System.out.println("SocialMediaController.welcome()");
		return "welcome";
	}

}


