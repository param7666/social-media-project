package com.nt.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.nt.model.User;

public interface UserRepository extends JpaRepository<User, Long>{

	@Query("from User  where email = ?1 and password = ?2")
	public User login(@Param("email") String email, 
	           @Param("password") String password);

}

//findByUsername()
//findByEmail()
//findByUsernameContaining() (for search)
//findByIsActiveTrue()