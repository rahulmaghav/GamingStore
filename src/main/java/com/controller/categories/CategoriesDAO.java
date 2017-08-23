package com.controller.categories;
import java.util.List;
public interface CategoriesDAO {

	

	
	public void insert( Categories c );
	public void update( Categories c );
	public void delete( int cid );

	public List<Categories> getAllCategories();
	public Categories getCategoriesbyId(int cid);
	public Categories getCategoriesbyName(String name);

	
}
