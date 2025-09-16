package com.nt.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import com.nt.model.Likes;

public interface ILikesRepository extends JpaRepository<Likes, Long> {

	 // Find a like by postId and userId
	Optional<Likes> findByPost_PostIdAndUser_Id(Long postId, Long userId);
    // Check if a user already liked a post
	boolean existsByPost_PostIdAndUser_Id(Long postId, Long userId);

    // Count total likes for a post
	Long countByPost_PostId(Long postId);

    // Get all likes for a post (if needed)
	List<Likes> findAllByPost_PostId(Long postId);
}
