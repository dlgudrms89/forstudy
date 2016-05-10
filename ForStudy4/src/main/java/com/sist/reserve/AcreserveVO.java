package com.sist.reserve;

import java.util.Date;

public class AcreserveVO {
    private int no;
    private String id;
    private String ac_name;
    private String ac_class;
    private String ac_tel;
    private String day;
    private int price;
    private int reserve_check;
    
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAc_name() {
		return ac_name;
	}
	public void setAc_name(String ac_name) {
		this.ac_name = ac_name;
	}
	public String getAc_class() {
		return ac_class;
	}
	public void setAc_class(String ac_class) {
		this.ac_class = ac_class;
	}
	public String getAc_tel() {
		return ac_tel;
	}
	public void setAc_tel(String ac_tel) {
		this.ac_tel = ac_tel;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getReserve_check() {
		return reserve_check;
	}
	public void setReserve_check(int reserve_check) {
		this.reserve_check = reserve_check;
	}
    
    
}
