package com.java5.services;

import java.util.List;
import com.java5.model.Products;

public interface ProductsService {
    List<Products> getAllProducts();
    List<Products> getProductsByType(boolean type);
    List<Products> getTop10CheapProducts();
    List<Products> getTop10ExpensiveProducts();
    List<Products> getProductsByBrand(String brand);
    List<Products> getProductsByColor(String color);
    Products getProductById(int id);
    List<Products> getProductsBySelectedId(List<Integer> ids);
}
