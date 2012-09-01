package com.kaishengit.pojo;

public class Desk {

	private int id;
	private float price;
	private Bar bar;
	private Order order;
	
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

	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
    public Order getOrder() {
        return order;
    }
    public void setOrder(Order order) {
        this.order = order;
    }
	
	
}
