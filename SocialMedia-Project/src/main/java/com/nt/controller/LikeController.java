package com.nt.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.nt.model.User;
import com.nt.service.ILikeService;
import jakarta.servlet.http.HttpSession;

@Controller
//@RequestMapping("/posts")
public class LikeController {

	 @Autowired
	 private ILikeService likeService;

	    @GetMapping("/posts/like")
	    @ResponseBody   // ensures JSON response (not JSP view)
	    public Map<String, Object> toggleLike(
	            @RequestParam("postId") Long postId,
	            HttpSession session) {

	        Map<String, Object> response = new HashMap<>();

	        // ✅ Get logged-in user from session
	        User user = (User) session.getAttribute("user");
	        if (user == null) {
	            response.put("success", false);
	            response.put("message", "User not logged in");
	            return response;
	        }

	        Long userId = user.getId();
	        boolean isLiked;

	        // ✅ Toggle logic
	        if (likeService.isPostLikedByUser(postId, userId)) {
	            likeService.unlikePost(postId, userId);
	            isLiked = false;
	        } else {
	            likeService.likePost(postId, userId);
	            isLiked = true;
	        }

	        // ✅ Always return updated like count
	        Long likeCount = likeService.getPostLikeCount(postId);

	        response.put("success", true);
	        response.put("isLiked", isLiked);
	        response.put("likeCount", likeCount);

	        return response;
	    }
}
