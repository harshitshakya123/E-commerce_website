package com.learn.mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Pid;
	private String pName;
    @Column(length =3000)
	private String pDesc;
	private String pPhoto;
	private int pPrice;
	private int pDiscount;
	private int pQuantity;
	@ManyToOne
	private Category category;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Product(String pName, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity,Category category) {
		super();
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
		this.category=category;
	}


	public int getPid() {
		return Pid;
	}


	public void setPid(int pid) {
		Pid = pid;
	}


	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
	}


	public String getpDesc() {
		return pDesc;
	}


	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}


	public String getpPhoto() {
		return pPhoto;
	}


	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}


	public int getpPrice() {
		return pPrice;
	}


	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}


	public int getpDiscount() {
		return pDiscount;
	}


	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}


	public int getpQuantity() {
		return pQuantity;
	}


	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}
	
	


	public Category getCategory() {
		return category;
	}


	public void setCategory(Category category) {
		this.category = category;
	}


	@Override
	public String toString() {
		return "Product [Pid=" + Pid + ", pName=" + pName + ", pDesc=" + pDesc + ", pPhoto=" + pPhoto + ", pPrice="
				+ pPrice + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + "]";
	}
	
	
	//calculate price after discount
	public int getPriceAfterApplyDiscount() {
		int d=(int) ((this.getpDiscount()/100.0) * this.getpPrice());
		return this.getpPrice() - d;
	}
	
	
	
	
	
	
	
	
	
	
	
}
