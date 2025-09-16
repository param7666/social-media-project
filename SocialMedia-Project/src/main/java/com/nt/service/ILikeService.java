package com.nt.service;

import java.util.List;

import com.nt.model.Likes;
import com.nt.model.User;

public interface ILikeService {

	public void likePost(Long postId, Long userId);
	
	public void unlikePost(Long postId, Long userId);
	
	public boolean isPostLikedByUser(Long postId, Long userId);
	
	public Long getPostLikeCount(Long postId);
	
	public List<Likes> getPostLikes(Long postId);
}

//likePost()
//unlikePost()
//isPostLikedByUser()
//getPostLikeCount()
//getPostLikes()