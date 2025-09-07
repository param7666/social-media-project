package com.nt.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import jakarta.annotation.Nonnull;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Version;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import java.util.*;

@Entity
@Table(name="PROJECT101_USER")
@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor

//@SQLDelete(sql="UPDATE ACTOR1001 SET STATUS ='INACTIVE' WHERE AID = ? AND UPDATE_COUNT=? ") // FOR SOFT DELETION
//@SQLRestriction("STATUS <> 'INACTIVE' ") // FOR MAKING INACTIVE RECORD NOT PARTICEPATE
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Nonnull
	@Column(length = 20)
	private String userName;
	
	@Nonnull
	@Column(length = 20)
	private String password;

	
	@Nonnull
	@Column(length = 20)
	private String firstName;
	
	@Nonnull
	@Column(length = 20)
	private String lastName;
	
	@Nonnull
	@Column(length = 30)
	private String email;
	
	private Long mobileNo;
	
	private String bio;
	@Lob
	private byte[] profilePicture;
	
	
	private LocalDate date_of_birth;
	
	private String location;
	
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Post> posts;
	
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

	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password=" + password + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", email=" + email + ", mobileNo=" + mobileNo + ", bio=" + bio
				+ ", date_of_birth=" + date_of_birth + ", location=" + location + ", posts=" + posts + ", createDate="
				+ createDate + ", updateTime=" + updateTime + ", updateCount=" + updateCount + ", createdBy="
				+ createdBy + ", updateBy=" + updateBy + ", status=" + status + "]";
	}
	
	
	

}


/*
id (BIGINT, PRIMARY KEY, AUTO_INCREMENT)
username (VARCHAR(50), UNIQUE, NOT NULL)
email (VARCHAR(100), UNIQUE, NOT NULL)
password (VARCHAR(255), NOT NULL)
first_name (VARCHAR(50), NOT NULL)
last_name (VARCHAR(50), NOT NULL)
bio (TEXT)
profile_picture (VARCHAR(255))  --> later implemention
cover_picture (VARCHAR(255))
date_of_birth (DATE)
location (VARCHAR(100))
website (VARCHAR(255)) -->--> later implemention
created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
updated_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP ON UPDATE)
is_active (BOOLEAN, DEFAULT TRUE)
 */