package com.sist.dao;

import java.sql.Date;

public class AcreviewDTO {
	private int rv_no;
	private String id;
	private int ac_mst_no;
	private int ac_review_score;
	private String rv_content;
	private int sympathy;
	private Date reg_date;
	public int getRv_no() {
		return rv_no;
	}
	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAc_mst_no() {
		return ac_mst_no;
	}
	public void setAc_mst_no(int ac_mst_no) {
		this.ac_mst_no = ac_mst_no;
	}
	public String getRv_content() {
		return rv_content;
	}
	
	public int getAc_review_score() {
		return ac_review_score;
	}
	public void setAc_review_score(int ac_review_score) {
		this.ac_review_score = ac_review_score;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public int getSympathy() {
		return sympathy;
	}
	public void setSympathy(int sympathy) {
		this.sympathy = sympathy;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
