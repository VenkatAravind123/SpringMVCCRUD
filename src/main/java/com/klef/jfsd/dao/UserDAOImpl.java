package com.klef.jfsd.dao;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.klef.jfsd.model.User;

@Transactional
public class UserDAOImpl implements UserDAO{
	
	private HibernateTemplate hibernatetemplate;
	

	public HibernateTemplate getHibernatetemplate() {
		return hibernatetemplate;
	}

	public void setHibernatetemplate(HibernateTemplate hibernatetemplate) {
		this.hibernatetemplate = hibernatetemplate;
	}

	@Override
	public String addUser(User user) {
		hibernatetemplate.persist(user);
		return "User Added Successfully";
	}

	@Override
	public List<User> viewAllUsers() {
		
		return hibernatetemplate.loadAll(User.class);//to fetch all records from the database
	}

	@Override
	public String updateUser(User user) {
		User u = hibernatetemplate.get(User.class, user.getId());
		u.setId(user.getId());
		u.setName(user.getName());
		u.setEmail(user.getEmail());
		u.setContact(user.getContact());
		
		return "User Updated Successfully";
	}

	@Override
	public User viewUserByID(int uid) {
		User u = hibernatetemplate.get(User.class, uid);
		return u;
	}

	@Override
	public String deleteUser(int uid) {
		User u = hibernatetemplate.get(User.class, uid);
		hibernatetemplate.delete(u);
		return "User Deleted Successfully";
	}

}
