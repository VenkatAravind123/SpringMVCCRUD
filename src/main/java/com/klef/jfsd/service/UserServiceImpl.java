package com.klef.jfsd.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import com.klef.jfsd.dao.UserDAO;
import com.klef.jfsd.model.User;

public class UserServiceImpl implements UserService
{
	@Autowired
	private UserDAO userdao;

	public UserDAO getUserdao() {
		return userdao;
	}

	public void setUserdao(UserDAO userdao) {
		this.userdao = userdao;
	}

	@Override
	public String addUser(User user) {
	
		return userdao.addUser(user);
	}

	@Override
	public List<User> viewAllUsers() {
		
		return userdao.viewAllUsers();
	}

	@Override
	public String updateUser(User user) {
		
		return userdao.updateUser(user);
	}

	@Override
	public User viewUserByID(int uid) {
		
		return userdao.viewUserByID(uid);
	}

	@Override
	public String deleteUser(int uid) {
		return userdao.deleteUser(uid);
	}
	
	
	
	
	

}
