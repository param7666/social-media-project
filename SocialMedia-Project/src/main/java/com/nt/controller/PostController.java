package com.nt.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.model.Post;
import com.nt.model.User;
import com.nt.service.IPostServie;

import jakarta.servlet.http.HttpSession;

@Controller
public class PostController {
	
	@Autowired
	private IPostServie postService;

	@PostMapping("/savePost")
	public String savePost(@ModelAttribute("p") Post post,@RequestParam("imageFile") MultipartFile file, HttpSession ses,RedirectAttributes atrs) throws IOException {
		System.out.println("PostController.savePost()");
		User user=(User)ses.getAttribute("user");
		
            post.setImage(file.getBytes());
        
		post.setUser(user);
		String result=postService.savePost(post);
		atrs.addFlashAttribute("result",result);
		return "dashboard";
	}
}
