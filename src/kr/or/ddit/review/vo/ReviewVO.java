package kr.or.ddit.review.vo;

public class ReviewVO {
	private int review_no;
	private String reser_no;
	private String review_content;
	private String review_date;
	private String review_mod;
	private String mem_id;
	private String stay_id;
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getReser_no() {
		return reser_no;
	}
	public void setReser_no(String reser_no) {
		this.reser_no = reser_no;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getReview_mod() {
		return review_mod;
	}
	public void setReview_mod(String review_mod) {
		this.review_mod = review_mod;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getStay_id() {
		return stay_id;
	}
	public void setStay_id(String stay_id) {
		this.stay_id = stay_id;
	}
}
