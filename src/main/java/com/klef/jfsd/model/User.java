package com.klef.jfsd.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_table")
public class User 
{
	@Id
	@Column(name="user_id")
	private int id;
	@Column(name="user_name")
	private String name;
	@Column(name="user_gender")
	private String gender;
	@Column(name="user_dob")
	private String dateofbirth;
	@Column(name="user_email")
	private String email;
	@Column(name="user_contact")
	private String contact;
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", gender=" + gender + ", dateofbirth=" + dateofbirth + ", email="
				+ email + ", contact=" + contact + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDateofbirth() {
		return dateofbirth;
	}
	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	

}
