package com.nt.controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
		System.out.println("PostController.savePost() Entered");
		User user=(User)ses.getAttribute("user");
		
            post.setImage(file.getBytes());
        
		post.setUser(user);
		String result=postService.savePost(post);
		System.out.println(result);
		atrs.addFlashAttribute("result",result);
		System.out.println("Redirected to dashboard form savePost");
		return "redirect:/dashboard";
	}
	
	@PostMapping("/delete-post")
	public String deletePost(@RequestParam("postId") Long postId,RedirectAttributes atrs) {
		System.out.println("PostController.deletePost()");
	    try {
	        String message=postService.deletePost(postId);
	        System.out.println(message);
	        atrs.addFlashAttribute("msg",message);
	    } catch (Exception e) {
	        e.printStackTrace();
	        atrs.addFlashAttribute("msg",e.getMessage());
	    }
	    return "redirect:/profile"; // Redirect back to profile page
	}

}
