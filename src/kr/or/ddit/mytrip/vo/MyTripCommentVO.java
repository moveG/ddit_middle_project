package kr.or.ddit.mytrip.vo;

public class MyTripCommentVO {

	private int mytrip_no = 0;
	private String mem_id;
	private String mytripc_content;
	private String mytripc_date;
	private int mytripc_no = 0;
	private int depth = 0;
	private int mytripc_p_no = 0;
	
	
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
	public String getMytripc_content() {
		return mytripc_content;
	}
	public void setMytripc_content(String mytripc_content) {
		this.mytripc_content = mytripc_content;
	}
	public String getMytripc_date() {
		return mytripc_date;
	}
	public void setMytripc_date(String mytripc_date) {
		this.mytripc_date = mytripc_date;
	}
	public int getMytripc_no() {
		return mytripc_no;
	}
	public void setMytripc_no(int mytripc_no) {
		this.mytripc_no = mytripc_no;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getMytripc_p_no() {
		return mytripc_p_no;
	}
	public void setMytripc_p_no(int mytripc_p_no) {
		this.mytripc_p_no = mytripc_p_no;
	}
	
	
	
}
