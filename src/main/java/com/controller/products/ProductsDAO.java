package com.controller.products;
import java.util.List;
public interface ProductsDAO {

	
	public void insert( Products p );
	public void update( Products p );
	public void delete( int pdid );

	public List<Products> getAllProducts();
	public Products getProductsbyId(int pdid);
	public List<Products> getProductsbySupplierName(String name);
	public List<Products> getProductsbyCategoryName(String name);

	
}
