package com.controller.cart;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;




@Repository
@Transactional
public class CartDAOImpl implements CartDAO {

	@Autowired
	private SessionFactory sessionFactory;

	
	public void insert(Cart c) {
		this.sessionFactory.getCurrentSession().save(c);		
	}

	public void update(Cart c) {
		this.sessionFactory.getCurrentSession().update(c);
		
	}

	public void delete(int pdid) {
		this.sessionFactory.getCurrentSession().createQuery("delete from Cart where id=:id").setInteger("id", pdid).executeUpdate();
		
	}

	public List<Cart> getAllCart() {
		return (List<Cart>)this.sessionFactory.getCurrentSession().createQuery("from Cart").list();	
	}

	public Cart getCartbyId(int pdid) {
	
		return (Cart)this.sessionFactory.getCurrentSession().createQuery("from Cart where id=:id").setInteger("id", pdid).list().get(0);
		
	}

	public List<Cart> getProductsbyName(String name) {
		
		return (List<Cart>)this.sessionFactory.getCurrentSession().createQuery("from Cart where username=:name").setString("name", name).list();
		
	}

	public void update(String user, String ship, String bill) {
		this.sessionFactory.getCurrentSession().createQuery("update Cart set shippingaddress = :ship, billingaddress= :bill where username=:name").setString("ship", ship).setString("bill", bill).setString("name", user).executeUpdate();
	}

	
	
}
