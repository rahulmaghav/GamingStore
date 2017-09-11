package com.controller.cart;

import javax.annotation.Generated;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Cart {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String shippingaddress;
	private String billingaddress;
	private String username;
	private int pid;
	private int quantity;
	
	
	public int getId() {
		return id;
	}
	
	
	public void setId(int id) {
		this.id = id;
	}
	
	
	public String getShippingaddress() {
		return shippingaddress;
	}
	
	
	public void setShippingaddress(String shippingaddress) {
		this.shippingaddress = shippingaddress;
	}
	
	
	public String getBillingaddress() {
		return billingaddress;
	}
	
	
	public void setBillingaddress(String billingaddress) {
		this.billingaddress = billingaddress;
	}
	
	
	public String getUsername() {
		return username;
	}
	
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	public int getPid() {
		return pid;
	}
	
	
	public void setPid(int pid) {
		this.pid = pid;
	}
	
	
	public int getQuantity() {
		return quantity;
	}
	
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
	
}
