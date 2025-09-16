package com.nt.model;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import jakarta.annotation.Nonnull;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Version;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@Entity
@Table(name="project101_post")
@AllArgsConstructor
@RequiredArgsConstructor
public class Post {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO )
	private Long postId;
	@Nonnull
	private String content;
	
	@Lob
	private byte[] image;
	private Long likesCount;
	private Long commentsCount;
	
	@ManyToOne
    @JoinColumn(name = "id", nullable = false)  // Foreign key
    private User user;
	
	@OneToMany(mappedBy = "post", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Likes> likes;
	@OneToMany(mappedBy = "post", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Comment> comment;
	
	@CreationTimestamp
	private LocalDateTime createDate;
	
	@UpdateTimestamp
	private LocalDateTime updateTime;
	
	@Version
	private Integer updateCount;
	
	@Column(length = 20, updatable = false)
	private String createdBy;
	
	@Column(length = 20, insertable = false)
	private String updateBy;
	
	@Column(length = 20)
	private String status="active";
	
	public Post() {
		System.out.println("Post.Post()");
	}

	@Override
	public String toString() {
		return "Post [id=" + postId + ", content=" + content + ", image=" + Arrays.toString(image)
				+ ", likesCount=" + likesCount + ", commentsCount=" + commentsCount + ", createDate=" + createDate
				+ ", updateTime=" + updateTime + ", updateCount=" + updateCount + ", createdBy=" + createdBy
				+ ", updateBy=" + updateBy + ", status=" + status + "]";
	}
	
	

}


/*
Posts Table

id (BIGINT, PRIMARY KEY, AUTO_INCREMENT)
user_id (BIGINT, FOREIGN KEY → users.id)
content (TEXT, NOT NULL)
image_url (VARCHAR(255))
video_url (VARCHAR(255))
likes_count (INT, DEFAULT 0)
comments_count (INT, DEFAULT 0)
created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
updated_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP ON UPDATE)
is_deleted (BOOLEAN, DEFAULT FALSE)

*/
