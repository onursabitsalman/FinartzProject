package oss.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class User {
	
	@Id
	private String id;
	private String name;
	private String surname;
	private String telNo;
	
	
	public User() {
		super();
	}
	
	
	public User(String id, String name, String surname, String telNo) {
		super();
		this.id = id;
		this.name = name;
		this.surname = surname;
		this.telNo = telNo;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getTelNo() {
		return telNo;
	}
	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}
}
