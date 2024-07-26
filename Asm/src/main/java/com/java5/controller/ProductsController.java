package com.java5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java5.services.CookieService;
import com.java5.services.ParamService;
import com.java5.services.ProductsService;
import com.java5.services.SessionService;

@Controller
public class ProductsController {

    @Autowired
    private ProductsService productService;

    @Autowired
    ParamService param;

    @Autowired
    SessionService session;

    @Autowired
    CookieService cookieService;

    @GetMapping("/products")
    public String getTop10CheapProducts(Model model) {
        model.addAttribute("products", productService.getTop10CheapProducts());
        return "index";
    }

    @GetMapping("/products/list")
    public String getAllProducts(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "index";
    }

    @GetMapping("/products/type")
    public String getProductsByType(@RequestParam boolean type, Model model) {
        model.addAttribute("products", productService.getProductsByType(type));
        return "index";
    }


    @GetMapping("/products/top10expensive")
    public String getTop10ExpensiveProducts(Model model) {
        model.addAttribute("products", productService.getTop10ExpensiveProducts());
        return "index";
    }

    @GetMapping("/products/brand")
    public String getProductsByBrand(@RequestParam String brand, Model model) {
        model.addAttribute("products", productService.getProductsByBrand(brand));
        return "index";
    }

    @GetMapping("/products/color")
    public String getProductsByColor(@RequestParam String color, Model model) {
        model.addAttribute("products", productService.getProductsByColor(color));
        return "index";
    }

    @GetMapping("/product")
    public String getProductById(@RequestParam int id, Model model) {
        model.addAttribute("product", productService.getProductById(id));
        return "detailproduct"; // Assuming you have a separate view for product details
    }

    @GetMapping("/products/selected")
    public String getProductsBySelectedId(@RequestParam List<Integer> ids, Model model) {
        model.addAttribute("products", productService.getProductsBySelectedId(ids));
        return "index";
    }
}
