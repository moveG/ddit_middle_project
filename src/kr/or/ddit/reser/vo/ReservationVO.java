package kr.or.ddit.reser.vo;

public class ReservationVO {
	private String reser_no;
	private String mem_id;
	private String titem_id;
	private String stay_id;
	private int cart_no;
	private int reser_price;
	private String reser_date;
	private String reser_ckin;
	private String reser_ckout;
	private int people_a;
	private int people_c;
	private int people_b;
	
	public String getReser_no() {
		return reser_no;
	}
	public void setReser_no(String reser_no) {
		this.reser_no = reser_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getTitem_id() {
		return titem_id;
	}
	public void setTitem_id(String titem_id) {
		this.titem_id = titem_id;
	}
	public String getStay_id() {
		return stay_id;
	}
	public void setStay_id(String stay_id) {
		this.stay_id = stay_id;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getReser_price() {
		return reser_price;
	}
	public void setReser_price(int reser_price) {
		this.reser_price = reser_price;
	}
	public String getReser_date() {
		return reser_date;
	}
	public void setReser_date(String reser_date) {
		this.reser_date = reser_date;
	}
	public String getReser_ckin() {
		return reser_ckin;
	}
	public void setReser_ckin(String reser_ckin) {
		this.reser_ckin = reser_ckin;
	}
	public String getReser_ckout() {
		return reser_ckout;
	}
	public void setReser_ckout(String reser_ckout) {
		this.reser_ckout = reser_ckout;
	}
	public int getPeople_a() {
		return people_a;
	}
	public void setPeople_a(int people_a) {
		this.people_a = people_a;
	}
	public int getPeople_c() {
		return people_c;
	}
	public void setPeople_c(int people_c) {
		this.people_c = people_c;
	}
	public int getPeople_b() {
		return people_b;
	}
	public void setPeople_b(int people_b) {
		this.people_b = people_b;
	}
}
