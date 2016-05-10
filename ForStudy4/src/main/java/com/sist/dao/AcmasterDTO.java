package com.sist.dao;

import java.sql.Date;

public class AcmasterDTO {
	private int ac_mst_no;
	private String ac_name;
	private String ac_address;
	private Date reg_date;
	private String ac_tel;
	private String ac_field;
	private int ac_teacher;
	private int ac_review_count;
	private double ac_reviewavg;
	
	
	public int getAc_review_count() {
		return ac_review_count;
	}
	public void setAc_review_count(int ac_review_count) {
		this.ac_review_count = ac_review_count;
	}
	
	
	public double getAc_reviewavg() {
		return ac_reviewavg;
	}
	public void setAc_reviewavg(double ac_reviewavg) {
		this.ac_reviewavg = ac_reviewavg;
	}


	private String ac_program;
	public int getAc_mst_no() {
		return ac_mst_no;
	}
	public void setAc_mst_no(int ac_mst_no) {
		this.ac_mst_no = ac_mst_no;
	}
	public String getAc_name() {
		return ac_name;
	}
	public void setAc_name(String ac_name) {
		this.ac_name = ac_name;
	}
	public String getAc_address() {
		return ac_address;
	}
	public void setAc_address(String ac_address) {
		this.ac_address = ac_address;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getAc_tel() {
		return ac_tel;
	}
	public void setAc_tel(String ac_tel) {
		this.ac_tel = ac_tel;
	}
	public String getAc_field() {
		return ac_field;
	}
	public void setAc_field(String ac_field) {
		this.ac_field = ac_field;
	}
	public int getAc_teacher() {
		return ac_teacher;
	}
	public void setAc_teacher(int ac_teacher) {
		this.ac_teacher = ac_teacher;
	}
	public String getAc_program() {
		return ac_program;
	}
	public void setAc_program(String ac_program) {
		this.ac_program = ac_program;
	}
	
	
	
	
	
}
