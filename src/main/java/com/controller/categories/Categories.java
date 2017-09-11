package com.controller.categories;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import java.util.HashSet;
import java.util.Set;
import com.controller.products.*;


@Entity
@Table(name="Categories_Information")
public class Categories {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private	int catid;
	
	private String name;
	private String description;
	
	
	@OneToMany(cascade = CascadeType.ALL)
	private Set<Products> products=new HashSet<Products>(0);
	
	public Set<Products> getProducts() {
		return products;
	}


	public void setProducts(Set<Products> products) {
		this.products = products;
	}


	public Categories() {
	
	}


	public int getCatid() {
		return catid;
	}
	
	
	public void setCatid(int catid) {
		this.catid = catid;
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
	
	
	
}
