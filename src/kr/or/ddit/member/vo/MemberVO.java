package kr.or.ddit.member.vo;

public class MemberVO {
	
	private String mem_id;
	private String mem_name;
	private String mem_pass;
	private String mem_email;
	private String mem_add;
	private String mem_add1;
	private String mem_add2;
	private String mem_bir;
	private String mem_tel;
	private String mem_class;
	private int mem_zip;
	private int atch_file_id;
	
	
	public String getMem_add1() {
		return mem_add1;
	}
	public void setMem_add1(String mem_add1) {
		this.mem_add1 = mem_add1;
	}
	public String getMem_add2() {
		return mem_add2;
	}
	public void setMem_add2(String mem_add2) {
		this.mem_add2 = mem_add2;
	}
	public int getMem_zip() {
		return mem_zip;
	}
	public void setMem_zip(int mem_zip) {
		this.mem_zip = mem_zip;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_add() {
		return mem_add ;
	}
	public void setMem_add(String mem_add) {
		this.mem_add = mem_add + " " +mem_add1 + mem_add2;
	}
	public String getMem_bir() {
		return mem_bir;
	}
	public void setMem_bir(String mem_bir) {
		this.mem_bir = mem_bir;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_class() {
		return mem_class;
	}
	public void setMem_class(String mem_class) {
		this.mem_class = mem_class;
	}
	public int getAtch_file_id() {
		return atch_file_id;
	}
	public void setAtch_file_id(int atch_file_id) {
		this.atch_file_id = atch_file_id;
	}
	
	
}
