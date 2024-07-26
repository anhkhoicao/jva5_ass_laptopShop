package com.java5.model;



public class Products implements Cloneable {

	// Attributes
	private int id;
	private String name;
	private boolean type;
	private String brand;
	private String color;	
	private double price;
	private int quantity;
	private String image;
	private String description;


	// Constructors
	public Products() {

	}

	

	public Products(int id, String name, boolean type, String brand, String color, double price, int quantity,
			String image, String description) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.brand = brand;
		this.color = color;
		this.price = price;
		this.quantity = quantity;
		this.image = image;
		this.description = description;
	}



	// Method
	public Products orderProduct(int quantity) {
		Products prod = null;
		if (quantity <= this.quantity) {
			try {
				prod = (Products) this.clone();
				prod.setQuantity(quantity);
				this.quantity -= quantity;
			} catch (CloneNotSupportedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return prod;
	}

	// Getters and setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}


	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}



	public boolean isType() {
		return type;
	}



	public void setType(boolean type) {
		this.type = type;
	}



	public String getBrand() {
		return brand;
	}



	public void setBrand(String brand) {
		this.brand = brand;
	}



	public String getColor() {
		return color;
	}



	public void setColor(String color) {
		this.color = color;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}
	

}

