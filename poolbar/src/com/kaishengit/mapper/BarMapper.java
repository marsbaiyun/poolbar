package com.kaishengit.mapper;

import java.util.Map;

import com.kaishengit.pojo.Bar;

public interface BarMapper {

	public Bar findById (String id);
	
	public void save (Bar bar);
	
	public void update (Bar bar);
	
	public void del (String id);

	public String getTotal(Map<String, String> map);
}
