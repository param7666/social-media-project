package com.nt.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nt.model.Post;

public interface IPostRepository extends JpaRepository<Post, Long>{

}
