package com.controller.profiles;
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
public class ProfilesDAOImpl implements ProfilesDAO {

	@Autowired
	private SessionFactory sessionFactory;

	
	public void insert(Profiles p) {
		this.sessionFactory.getCurrentSession().save(p);
		
	}

	public void update(Profiles p) {
		this.sessionFactory.getCurrentSession().update(p);
		
	}

	public void delete(int pid) {
		this.sessionFactory.getCurrentSession().createQuery("delete from Profiles where id=:id").setInteger("id", pid).executeUpdate();
		
	}

	public List<Profiles> getAllProfiles() {
		
		return (List<Profiles>)this.sessionFactory.getCurrentSession().createQuery("from Profiles").list();	
	}

	public Profiles getProfilesbyId(int pid) {
		return (Profiles)this.sessionFactory.getCurrentSession().createQuery("from Profiles where id=:id").setInteger("id", pid).list().get(0);
	}

	public Profiles getProfilesbyEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Profiles> getAllEmail() {
		
		return (List<Profiles>)this.sessionFactory.getCurrentSession().createQuery("select email from Profiles").list();
		
	}

	
	
}
