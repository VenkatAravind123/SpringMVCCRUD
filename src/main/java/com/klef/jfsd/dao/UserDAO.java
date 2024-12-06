package com.klef.jfsd.dao;

import java.util.List;

import com.klef.jfsd.model.User;

public interface UserDAO 
{
	public String addUser(User user);
	public List<User> viewAllUsers();
	public String updateUser(User user);
	public User viewUserByID(int uid);
	public String deleteUser(int uid);

}
