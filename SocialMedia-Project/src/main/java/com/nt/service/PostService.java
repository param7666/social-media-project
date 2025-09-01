package com.nt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.model.Post;
import com.nt.repository.IPostRepository;

@Service
public class PostService implements IPostServie{
	
	@Autowired
	private IPostRepository postRepo;

	@Override
	public String savePost(Post p) {
		System.out.println("PostService.savePost()");
		p.setLikesCount(0L);
		p.setCommentsCount(0L);
		Long postId=postRepo.save(p).getPostId();
		return "Post saved with id values "+postId;
	}

}
