package com.kaishengit.pojo;

import java.util.List;

public class Desk {

	private int id;
	private float price;
	private Bar bar;
	private List<Order> orderlist;
	
	private String orderid;
	private String barid;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public Bar getBar() {
		return bar;
	}
	public void setBar(Bar bar) {
		this.bar = bar;
	}
	public String getBarid() {
		return barid;
	}
	public void setBarid(String barid) {
		this.barid = barid;
	}

	public List<Order> getOrderlist() {
		return orderlist;
	}
	public void setOrderlist(List<Order> orderlist) {
		this.orderlist = orderlist;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	
	
}
