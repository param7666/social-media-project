package com.nt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.model.Likes;
import com.nt.model.Post;
import com.nt.model.User;
import com.nt.repository.ILikesRepository;
import com.nt.repository.IPostRepository;
import com.nt.repository.UserRepository;
@Service
public class LikeSevice implements ILikeService{
	
	@Autowired
	private IPostRepository postRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ILikesRepository likeRepository;

	// 1. Like a post
	@Override
    public void likePost(Long postId, Long userId) {
        Post post = postRepository.findById(postId)
                .orElseThrow(() -> new RuntimeException("Post not found"));
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        if (!likeRepository.existsByPost_PostIdAndUser_Id(postId, userId)) {
            Likes like = new Likes();
            like.setPost(post);
            like.setUser(user);
            likeRepository.save(like);
        }
    }

	// 2. Unlike a post
	@Override
    public void unlikePost(Long postId, Long userId) {
        likeRepository.findByPost_PostIdAndUser_Id(postId, userId)
                .ifPresent(likeRepository::delete);
    }

	// 3. Check if user already liked
	@Override
    public boolean isPostLikedByUser(Long postId, Long userId) {
        return likeRepository.existsByPost_PostIdAndUser_Id(postId, userId);
    }

	@Override
	 public Long getPostLikeCount(Long postId) {
        return likeRepository.countByPost_PostId(postId);
    }

	 public List<Likes> getPostLikes(Long postId) {
	        return likeRepository.findAllByPost_PostId(postId);
	    }

}
