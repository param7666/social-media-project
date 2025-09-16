package com.nt.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nt.model.Comment;

public interface ICommentRepository extends JpaRepository<Comment, Long> {

}
