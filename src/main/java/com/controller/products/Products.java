package com.controller.products;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="Products_Information")
public class Products {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private int pid;	
    
	private String name;
	private String description;
	private String category;
	private String price;
	private String image;
	private String suppliername;
	private String quantity;
	
	
	@Transient
	private MultipartFile theImage;
	
	
	
	
	
	public String getSuppliername() {
		return suppliername;
	}

	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	
	public MultipartFile getTheImage() {
		return theImage;
	}

	public void setTheImage(MultipartFile theImage) {
		this.theImage = theImage;
	}


	private boolean active=true;
	
	public Products() {
		
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
	
	public String getImage() {
		return image;
	}




	public void setImage(String image) {
		this.image = image;
	}




	public int getPid() {
		return pid;
	}
	
	
	public void setPid(int pid) {
		this.pid = pid;
	}
	
	@NotEmpty(message="Name cannot be Empty")
	public String getName() {
		return name;
	}
	
	
	public void setName(String name) {
		this.name = name;
	}
	
	@NotEmpty(message="Description cannot be Empty")
	public String getDescription() {
		return description;
	}
	
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	public String getCategory() {
		return category;
	}
	
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	@NotEmpty(message="Price cannot be Empty")
	public String getPrice() {
		return price;
	}
	
	
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	
}
