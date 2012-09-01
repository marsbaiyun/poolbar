package com.kaishengit.mapper;

import com.kaishengit.pojo.Order;

public interface OrderMapper {

	public Order findById (String id);
	
	public void save (Order order);
	
	public void update (Order order);
	
	public void del (String id);
}
