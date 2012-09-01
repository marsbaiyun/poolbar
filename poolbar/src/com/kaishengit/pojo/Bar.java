package com.kaishengit.pojo;

import java.util.List;

public class Bar {

	private String id;
	private String name;
	private String address;
	private int desknum;
	private List<Account> accountlist;
	private List<Order> orderlist;
	private List<Produce> producelist;
	private List<Desk> desklist;
	
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getDesknum() {
		return desknum;
	}
	public void setDesknum(int desknum) {
		this.desknum = desknum;
	}
	public List<Account> getAccountlist() {
		return accountlist;
	}
	public void setAccountlist(List<Account> accountlist) {
		this.accountlist = accountlist;
	}
	public List<Order> getOrderlist() {
		return orderlist;
	}
	public void setOrderlist(List<Order> orderlist) {
		this.orderlist = orderlist;
	}
	public List<Produce> getProducelist() {
		return producelist;
	}
	public void setProducelist(List<Produce> producelist) {
		this.producelist = producelist;
	}
	public List<Desk> getDesklist() {
		return desklist;
	}
	public void setDesklist(List<Desk> desklist) {
		this.desklist = desklist;
	}
	
	
}
