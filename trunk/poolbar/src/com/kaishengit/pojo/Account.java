package com.kaishengit.pojo;

import java.util.List;

public class Account {

	private String id;
	private String name;
	private String password;
	private String role;
	private Bar bar;
	private List<Order> orderlist;
	private String barid;
	
	
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Bar getBar() {
		return bar;
	}
	public void setBar(Bar bar) {
		this.bar = bar;
	}
	public List<Order> getOrderlist() {
		return orderlist;
	}
	public void setOrderlist(List<Order> orderlist) {
		this.orderlist = orderlist;
	}
	public String getBarid() {
		return barid;
	}
	public void setBarid(String barid) {
		this.barid = barid;
	}
	
	
	
}
