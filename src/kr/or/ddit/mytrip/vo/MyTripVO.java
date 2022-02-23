package kr.or.ddit.mytrip.vo;

public class MyTripVO {
	
	private int mytrip_no;
	private String mem_id;
	private long atch_file_id;
	private String mytrip_title;
	private String mytrip_content;
	private String mytrip_date;
	private int mytrip_rec;
	private String stay_id;
	private String stay_name = "";
	
	
	
	public String getStay_name() {
		return stay_name;
	}
	public void setStay_name(String stay_name) {
		this.stay_name = stay_name;
	}
	public String getStay_id() {
		return stay_id;
	}
	public void setStay_id(String stay_id) {
		this.stay_id = stay_id;
	}
	public int getMytrip_no() {
		return mytrip_no;
	}
	public void setMytrip_no(int mytrip_no) {
		this.mytrip_no = mytrip_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public long getAtch_file_id() {
		return atch_file_id;
	}
	public void setAtch_file_id(long atch_file_id) {
		this.atch_file_id = atch_file_id;
	}
	public String getMytrip_title() {
		return mytrip_title;
	}
	public void setMytrip_title(String mytrip_title) {
		this.mytrip_title = mytrip_title;
	}
	public String getMytrip_content() {
		return mytrip_content;
	}
	public void setMytrip_content(String mytrip_content) {
		this.mytrip_content = mytrip_content;
	}
	public String getMytrip_date() {
		return mytrip_date;
	}
	public void setMytrip_date(String mytrip_date) {
		this.mytrip_date = mytrip_date;
	}
	public int getMytrip_rec() {
		return mytrip_rec;
	}
	public void setMytrip_rec(int mytrip_rec) {
		this.mytrip_rec = mytrip_rec;
	}
	       
	
}
