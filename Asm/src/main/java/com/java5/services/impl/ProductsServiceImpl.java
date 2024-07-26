package com.java5.services.impl;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import com.java5.model.Products;
import com.java5.services.ProductsService;
import com.java5.utils.DataSharing;

@Service
public class ProductsServiceImpl implements ProductsService {

    private Map<Integer, Products> productMap = DataSharing.products;

    @Override
    public List<Products> getAllProducts() {
        return productMap.values().stream().collect(Collectors.toList());
    }

    @Override
    public List<Products> getProductsByType(boolean type) {
        return productMap.values().stream()
                .filter(product -> product.isType() == type)
                .collect(Collectors.toList());
    }

    @Override
    public List<Products> getTop10CheapProducts() {
        return productMap.values().stream()
                .sorted(Comparator.comparing(Products::getPrice))
                .limit(10)
                .collect(Collectors.toList());
    }

    @Override
    public List<Products> getTop10ExpensiveProducts() {
        return productMap.values().stream()
                .sorted(Comparator.comparing(Products::getPrice).reversed())
                .limit(10)
                .collect(Collectors.toList());
    }

    @Override
    public List<Products> getProductsByBrand(String brand) {
        return productMap.values().stream()
                .filter(product -> product.getBrand().equalsIgnoreCase(brand))
                .collect(Collectors.toList());
    }

    @Override
    public List<Products> getProductsByColor(String color) {
        return productMap.values().stream()
                .filter(product -> product.getColor().equalsIgnoreCase(color))
                .collect(Collectors.toList());
    }

    @Override
    public Products getProductById(int id) {
        return productMap.get(id);
    }

    @Override
    public List<Products> getProductsBySelectedId(List<Integer> ids) {
        return ids.stream()
                .map(productMap::get)
                .collect(Collectors.toList());
    }
}
