package com.controller.categories;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.controller.products.Products;


@Repository
@Transactional
public class CategoriesDAOImpl implements CategoriesDAO {

	@Autowired
	private SessionFactory sessionFactory;

	
	public void insert(Categories c) {
		this.sessionFactory.getCurrentSession().save(c);
		
	}

	public void update(Categories c) {
		this.sessionFactory.getCurrentSession().update(c);
		
	}

	public void delete(int cid) {
		this.sessionFactory.getCurrentSession().createQuery("delete from Categories where catid=:id").setInteger("id", cid).executeUpdate();
		
	}

	public List<Categories> getAllCategories() {
		
		return (List<Categories>)this.sessionFactory.getCurrentSession().createQuery("from Categories").list();		
	}


	public Categories getCategoriesbyId(int cid) {
		return (Categories)this.sessionFactory.getCurrentSession().createQuery("from Categories where catid=:id").setInteger("id", cid).list().get(0);

	}

	public Categories getCategoriesbyName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
