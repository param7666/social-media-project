package com.nt.model;

import java.time.LocalDateTime;

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
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@Entity
@Table(name="PROJECT101_COMMENT")
//@SQLDelete(sql="UPDATE PROJECT101_COMMENT SET STATUS ='INACTIVE' WHERE CMT_ID = ? ") // FOR SOFT DELETION
//@SQLRestriction("STATUS <> 'INACTIVE' ") // FOR MAKING INACTIVE RECORD NOT PARTICEPATE

public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long cmtId;
	@NonNull
	@ManyToOne
    @JoinColumn(name = "postId", nullable = false)
	private Post post;
	@NonNull
	@ManyToOne
    @JoinColumn(name = "id", nullable = false)
	private User user;
	@NonNull
	private String content;
	private Long pcId; // parent comment id
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	private boolean isDeleted=false;
	
	public Comment() {
		System.out.println("Comment.Comment()");
	}

	
	@Override
	public String toString() {
		return "Comment [cmtId=" + cmtId + ", post=" + post + ", user=" + user + ", content=" + content + ", pcId="
				+ pcId + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + ", isDeleted=" + isDeleted + "]";
	}
	
	

}

//id (BIGINT, PRIMARY KEY, AUTO_INCREMENT)
//post_id (BIGINT, FOREIGN KEY → posts.id)
//user_id (BIGINT, FOREIGN KEY → users.id)
//content (TEXT, NOT NULL)
//parent_comment_id (BIGINT, FOREIGN KEY → comments.id, for replies)
//created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
//updated_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP ON UPDATE)
//is_deleted (BOOLEAN, DEFAULT FALSE)