package com.kaishengit.mapper;

import com.kaishengit.pojo.Vip;

public interface VipMapper {

	public Vip findById (String id);
	
	public void save (Vip vip);
	
	public void update (Vip vip);
	
	public void del (String id);
}