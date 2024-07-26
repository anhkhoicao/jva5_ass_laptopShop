package com.java5.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.java5.model.Products;



public class DataSharing {
public static HashMap<Integer, Products> products = new HashMap<>();
	
	static {
		// Add product into products list
		products.put(1, new Products(1, "Laptop Lenovo LOQ 15IAX9 83GS001RVN", true, "DELL", "Black", 8000000, 15, "lt1.webp", "Kich co: 1500x900, 8G ram, ...."));
		products.put(2, new Products(2, "Laptop ASUS TUF Gaming F15 FX507ZC4-HN074W", true, "Asus", "red", 15000000, 30, "lt2.webp", "Kich co: 2000x1700, 16G ram, ...."));
		products.put(3, new Products(3, "Laptop Gaming Acer Nitro 5 Tiger AN515 58 52SP", true, "Acer", "White", 7000000, 25, "lt3.webp", "Kich co: 1800x1200, 8G ram, ...."));
		products.put(4, new Products(4, "Laptop MSI Gaming GF63 12VE-460VN", true, "HP", "Blue", 8000000, 10, "lt4.webp", "Kich co: 1500x900, 8G ram, ...."));
		products.put(5, new Products(5, "Laptop ASUS VivoBook 15 OLED A1505VA-L1114W", false, "Asus", "Black", 15000000, 8, "lt5.webp", "Kich co: 1800x1200, 16G ram, ...."));
		products.put(6, new Products(6, "Laptop Lenovo IdeaPad Slim 3 14IAH8 83EQ0009VN", false, "HP", "Purple", 27000000, 28, "lt6.webp", "Kich co: 2000x1400, 16G ram, ...."));
		products.put(7, new Products(7, "Laptop ASUS Vivobook 14 X1404ZA-NK389W", false, "A", "Purple", 27000000, 28, "lt7.webp", "Kich co: 2000x1400, 16G ram, ...."));
		products.put(8, new Products(8, "Laptop Acer Aspire 3 A315-59-381E", false, "HP", "Purple", 27000000, 28, "lt8.webp", "Kich co: 2000x1400, 16G ram, ...."));
		products.put(9, new Products(9, "Laptop Dell Vostro 3520 F0V0VI3", false, "HP", "Purple", 27000000, 28, "lt9.webp", "Kich co: 2000x1400, 16G ram, ...."));
		products.put(10, new Products(10, "Laptop Dell Inspiron 15 3520 D5N53", false, "HP", "Purple", 27000000, 28, "lt10.webp", "Kich co: 2000x1400, 16G ram, ...."));
		products.put(11, new Products(11, "Laptop ASUS Gaming ROG ZEPHYRUS G16 GU605MI-QR116W", true, "HP", "Purple", 27000000, 28, "lt11.webp", "Kich co: 2000x1400, 16G ram, ...."));
		products.put(12, new Products(12, "Laptop MSI Pulse 17 AI C1VGKG-017VN", true, "HP", "Purple", 27000000, 28, "lt12.webp", "Kich co: 2000x1400, 16G ram, ...."));
	}
	public static List<Products> filterProductsByType(boolean type) {
        List<Products> filteredProducts = new ArrayList<>();
        for (Products product : products.values()) {
            if (product.isType() == type) {
                filteredProducts.add(product);
            }
        }
        return filteredProducts;
    }
}