package com.learn.mycart.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryId;
	private String categoryTitle;
	private String categoryDescriptioin;
	@OneToMany(mappedBy = "category")
	private List<Product> products=new ArrayList<Product>();
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(int categoryId, String categoryTitle, String categoryDescriptioin) {
		super();
		this.categoryId = categoryId;
		this.categoryTitle = categoryTitle;
		this.categoryDescriptioin = categoryDescriptioin;
	}

	public Category(String categoryTitle, String categoryDescriptioin,List<Product> products) {
		super();
		this.categoryTitle = categoryTitle;
		this.categoryDescriptioin = categoryDescriptioin;
		this.products=products;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryTitle() {
		return categoryTitle;
	}

	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}

	public String getCategoryDescriptioin() {
		return categoryDescriptioin;
	}

	public void setCategoryDescriptioin(String categoryDescriptioin) {
		this.categoryDescriptioin = categoryDescriptioin;
	}

	
	
	
	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDescriptioin="
				+ categoryDescriptioin + "]";
	}
	
}
