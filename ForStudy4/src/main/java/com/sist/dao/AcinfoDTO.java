package com.sist.dao;

public class AcinfoDTO {
	private int ac_mst_no;
	private int ac_sub_no;
	private int ac_no;
	private String ac_name;
	private String ac_address;
	private String ac_class;
	private String ac_tel;
	private String ac_field;
	private String ac_program;
	private int ac_inwon;
	private int ac_time;
	private int ac_totalval;
	private int ac_teacher;
	private AcmasterDTO ac_masterDTO = new AcmasterDTO();
	private int ac_list_no;
	
	public int getAc_list_no() {
		return ac_list_no;
	}
	public void setAc_list_no(int ac_list_no) {
		this.ac_list_no = ac_list_no;
	}
	public AcmasterDTO getAc_masterDTO() {
		return ac_masterDTO;
	}
	public void setAc_masterDTO(AcmasterDTO ac_masterDTO) {
		this.ac_masterDTO = ac_masterDTO;
	}
	
	public int getAc_sub_no() {
		return ac_sub_no;
	}
	public void setAc_sub_no(int ac_sub_no) {
		this.ac_sub_no = ac_sub_no;
	}
	public int getAc_mst_no() {
		return ac_mst_no;
	}
	public void setAc_mst_no(int ac_mst_no) {
		this.ac_mst_no = ac_mst_no;
	}
	public String getAc_tel() {
		return ac_tel;
	}
	public void setAc_tel(String ac_tel) {
		this.ac_tel = ac_tel;
	}
	public int getAc_no() {
		return ac_no;
	}
	public void setAc_no(int ac_no) {
		this.ac_no = ac_no;
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
	public String getAc_class() {
		return ac_class;
	}
	public void setAc_class(String ac_class) {
		this.ac_class = ac_class;
	}
	public String getAc_field() {
		return ac_field;
	}
	public void setAc_field(String ac_field) {
		this.ac_field = ac_field;
	}
	public String getAc_program() {
		return ac_program;
	}
	public void setAc_program(String ac_program) {
		this.ac_program = ac_program;
	}
	public int getAc_inwon() {
		return ac_inwon;
	}
	public void setAc_inwon(int ac_inwon) {
		this.ac_inwon = ac_inwon;
	}
	public int getAc_time() {
		return ac_time;
	}
	public void setAc_time(int ac_time) {
		this.ac_time = ac_time;
	}
	public int getAc_totalval() {
		return ac_totalval;
	}
	public void setAc_totalval(int ac_totalval) {
		this.ac_totalval = ac_totalval;
	}
	public int getAc_teacher() {
		return ac_teacher;
	}
	public void setAc_teacher(int ac_teacher) {
		this.ac_teacher = ac_teacher;
	}
	
	
	
	
	
}
