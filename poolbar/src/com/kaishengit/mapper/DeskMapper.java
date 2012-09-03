package com.kaishengit.mapper;

import java.util.List;

import com.kaishengit.pojo.Desk;

public interface DeskMapper {

    public List<Desk> findAll(String barid);
    
	public Desk findById (Desk desk);
	
	public void save (Desk desk);
	
	public void checkout(String orderid);
	
	public void updateOrderChange (Desk desk);
	
	public List<Desk> findEmpty(Desk desk);
	
	public void del (int id);
}
