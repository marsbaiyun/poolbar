package com.kaishengit.mapper;

import java.util.List;

import com.kaishengit.pojo.Vip;

public interface VipMapper {

	public Vip findById (int id);
	
	public void save (Vip vip);
	
	public void update(Vip vip);

	public void del (int id);

	public List<Vip> findAll();

	public List<Vip> find(Vip vip);
}
