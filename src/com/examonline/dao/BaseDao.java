package com.examonline.dao;

import java.io.Serializable;
import java.util.List;

import com.examonline.util.PageInfo;

public interface BaseDao<T> {

	public void saveEntity(T t);
	
	public void saveOrUpdate(T t);
	
	public void updateEntity(T t);
	
	public void delteEntity(T t);
	
	public void newEntity(T t);
	
	public void batchEntityByHql(String hql,Object...objects);
	
	public T getEntity(Serializable id);
	
	public T loadEntity(Serializable id);
	
	public List<T> findEntiyByHql(String hql,Object...objects);
	
	public Object getUniqueResult(String hql,Object...objects);
	
	public List<T> getSplitPage(String hql,PageInfo pageInfo); 
}
