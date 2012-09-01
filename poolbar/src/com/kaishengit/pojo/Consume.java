package com.kaishengit.pojo;

public class Consume {

	private String id;
	private int num;
	private Order order;
	private Produce produce;
	
	private String produceid;
	private String orderid;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Produce getProduce() {
		return produce;
	}
	public void setProduce(Produce produce) {
		this.produce = produce;
	}
	public String getProduceid() {
		return produceid;
	}
	public void setProduceid(String produceid) {
		this.produceid = produceid;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	
	
}
