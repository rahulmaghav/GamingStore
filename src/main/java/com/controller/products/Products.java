package com.controller.products;
import javax.persistence.*;

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
	
	private boolean active;
	
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
	
	
	public String getName() {
		return name;
	}
	
	
	public void setName(String name) {
		this.name = name;
	}
	
	
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
	
	
	public String getPrice() {
		return price;
	}
	
	
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	
}
