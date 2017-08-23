package com.controller.products;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;





@Repository
@Transactional
public class ProductsDAOImpl implements ProductsDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void insert(Products p) {
		this.sessionFactory.getCurrentSession().save(p);
		
	}

	public void update(Products p) {
		this.sessionFactory.getCurrentSession().update(p);
		
	}

	public void delete(int pdid) {
		this.sessionFactory.getCurrentSession().createQuery("delete from Products where pid=:id").setInteger("id", pdid).executeUpdate();
		
	}

	public List<Products> getAllProducts() {
	
		return (List<Products>)this.sessionFactory.getCurrentSession().createQuery("from Products").list();	
	}

	public Products getProductsbyId(int pdid) {
		return (Products)this.sessionFactory.getCurrentSession().createQuery("from Products where pid=:id").setInteger("id", pdid).list().get(0);
	}

	public Products getProductsbyName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

}
