package com.kaishengit.mapper;

import java.util.List;
import java.util.Map;

import com.kaishengit.pojo.Order;

public interface OrderMapper {

	public Order findById (String id);
	
	public void save (Order order);
	
	public void update (Order order);
	
	public int findByVipId(int vipid);
	
	public void del (String id);

	public List<Order> getCount(Map<String, String> map);
}
