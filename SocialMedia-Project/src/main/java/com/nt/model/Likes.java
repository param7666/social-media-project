package com.nt.model;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.SQLRestriction;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;

@Data
@AllArgsConstructor
@Entity
@Table(name="PROJECT101_Likes")
//@SQLDelete(sql="UPDATE project101_likes SET STATUS ='INACTIVE' WHERE L_ID = ?  ") // FOR SOFT DELETION
//@SQLRestriction("STATUS <> 'INACTIVE' ") // FOR MAKING INACTIVE RECORD NOT PARTICEPATE

public class Likes {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long lId;
	@NonNull
	@ManyToOne
    @JoinColumn(name = "postId", nullable = false)
	private Post post;
	@NonNull
	@ManyToOne
    @JoinColumn(name = "id", nullable = false)
	private User user;
	@CreationTimestamp
	private LocalDateTime createdAt;
	
	public Likes () {
		System.out.println("Likes.Likes()");
	}

	@Override
	public String toString() {
		return "Likes [lId=" + lId + ", post=" + post + ", user=" + user + ", createdAt=" + createdAt + "]";
	}
	
	

}

/*
id (BIGINT, PRIMARY KEY, AUTO_INCREMENT)
post_id (BIGINT, FOREIGN KEY → posts.id)
user_id (BIGINT, FOREIGN KEY → users.id)
created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
UNIQUE constraint on (post_id, user_id)

*/