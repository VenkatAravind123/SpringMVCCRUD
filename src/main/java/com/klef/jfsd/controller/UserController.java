package com.klef.jfsd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.model.User;
import com.klef.jfsd.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userservice;
	
	
	@GetMapping("home")
	public ModelAndView index()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@GetMapping("adduser")
	public ModelAndView adduser()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adduser");
		return mv;
	}
	
	@PostMapping("insertuser")
	public ModelAndView insertuser(HttpServletRequest request)
	{
		int id = Integer.parseInt(request.getParameter("uid"));
		String name = request.getParameter("uname");
		String gender = request.getParameter("ugender");
		String dob = request.getParameter("udob");
		String email = request.getParameter("uemail");
		String contact = request.getParameter("ucontact");
		
		User  user = new User();
		user.setId(id);
		user.setName(name);
		user.setGender(gender);
		user.setDateofbirth(dob);
		user.setEmail(email);
		user.setContact(contact);
		
		
		String message = userservice.addUser(user);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addsuccess");
		mv.addObject("message",message);
		return mv;

	}
	
	@GetMapping("viewallusers")
	public ModelAndView viewallusers()
	{
		List<User> userlist = userservice.viewAllUsers();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewallusers");
		mv.addObject("userlist",userlist);
		return mv;
	}
	
	@GetMapping("updateuser")
	public ModelAndView updateuser()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateuser");
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView updateoperation(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		int id = Integer.parseInt(request.getParameter("uid")) ;
		String name = request.getParameter("uname");
		String email = request.getParameter("uemail");
		String contact = request.getParameter("ucontact");
		
		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setEmail(email);
		user.setContact(contact);
		
		
		User u = userservice.viewUserByID(id);
		
		
		if(u!=null)
		{
			String msg = userservice.updateUser(user);
			mv.setViewName("updatesuccess");
			mv.addObject("message",msg);
			
		}
		else
		{
			mv.setViewName("updatefail");
			mv.addObject("message","User ID Not Found");
			
		}
		return mv;
	}
	
	@GetMapping("deleteuser")
	public ModelAndView deleteuser()
	{
		List<User> userlist = userservice.viewAllUsers();
		ModelAndView mv = new ModelAndView();
		mv.addObject("userlist",userlist);
		return mv;
	}
	
	@GetMapping("delete")
	public String deleteoperation(@RequestParam("id") int uid)
	{
		userservice.deleteUser(uid);
		return "redirect:/deleteuser";
		
	}
	
	
	@GetMapping("viewuserbyid")
	public ModelAndView viewuserbyid()
	{
		ModelAndView mv = new ModelAndView("viewuserbyid");
		return mv;
	}
	
	@PostMapping("displayuser")
	public ModelAndView displayuser(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		int id = Integer.parseInt(request.getParameter("uid"));
		User user = userservice.viewUserByID(id);
		
		if(user != null)
		{
			mv.setViewName("displayuser");
			mv.addObject("user",user);
		}
		else {
			mv.setViewName("displayfail");
			mv.addObject("message","User ID Not Found");
		}
		return mv;
	}
}
