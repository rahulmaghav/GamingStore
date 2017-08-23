package com.controller.profiles;
import javax.persistence.*;
import javax.validation.constraints.*;



@Entity
@Table(name="Profiles_Information")
public class Profiles {
    
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	
	private String username;
	private String password;
	private String email;
	private String phone;
	private String address;
	
	@Transient
	private String confirmpassword;

	
	private boolean active=true;
	private String role="ROLE_USER";
	
	public boolean isActive() {
		return active;
	}


	public void setActive(boolean active) {
		this.active = active;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


		
	public String getConfirmpassword() {
		return confirmpassword;
	}


	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}


	public Profiles() {
		
	}


	public int getId() {
		return id;
	}
	
	
	public void setId(int id) {
		this.id = id;
	}
	
	@Pattern(regexp="^[a-zA-Z0-9_]{5,20}$",message="Invalid Username. Min Length: 5, Max Length: 20")
	public String getUsername() {
		return username;
	}
	
	
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	@Pattern(regexp="^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@!%*?&_])[A-Za-z\\d$@!%*?&_]{8,20}$",message="Invalid Password. Min Length: 5, Max Length: 20")
	public String getPassword() {
		return password;
	}
	
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	@Pattern(regexp="^[a-zA-Z0-9]{2,20}@[a-zA-Z]{2,20}\\.[a-zA-Z]{2,20}(\\.[a-zA-Z]{2,20}){0,1}$",message="Invalid Email")
	public String getEmail() {
		return email;
	}
	
	
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	@Pattern(regexp="^[789]{1}[0-9]{9}$",message="Invalid Phone")
	public String getPhone() {
		return phone;
	}
	
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	@Pattern(regexp="^[A-Za-z\\d$@!%*?&_]{5,}$",message="Invalid Address. Min Length: 5")
	public String getAddress() {
		return address;
	}
	
	
	public void setAddress(String address) {
		this.address = address;
	}


	
	
}
