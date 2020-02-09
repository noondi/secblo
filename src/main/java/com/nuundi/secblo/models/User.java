package com.nuundi.secblo.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;



@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String firstName;
	
	private String lastName;
	private String email;
	@Size(min=3, message="Password must be greater than 3 characters")
	 private String password;
	 
	 @Transient
	 @Size(min=3, message="Confirm Password must be at least 3 characters!")
	 private String passwordConfirmation;
	 
	 private String role;
	 
	 @Column(updatable=false)
	 private Date createdAt;
	 
	 private Date updatedAt;
//	 @ManyToMany(fetch = FetchType.LAZY)
//	 @JoinTable(
//	     name = "pools_users", 
//	     joinColumns = @JoinColumn(name = "user_id"), 
//	     inverseJoinColumns = @JoinColumn(name = "pool_id")
//	 )
//	 private List<Pool> pools;
//	 
//	 @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
//	 private List<Pool> hosted;

	
	 public User() {
	//super();
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}


	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public Date getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}


	public Date getUpdatedAt() {
		return updatedAt;
	}


	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	 

	
	
	
	
	
	 
	 
}
