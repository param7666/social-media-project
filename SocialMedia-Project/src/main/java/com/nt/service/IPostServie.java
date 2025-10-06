package com.nt.service;

import java.util.List;


import com.nt.model.Post;

public interface IPostServie {
	
	public String savePost(Post p);
	
	public List<Post> showPostByDate();
	
	public String deletePost(Long id) throws Exception;
		
	

}
