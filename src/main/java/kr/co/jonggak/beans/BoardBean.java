package kr.co.jonggak.beans;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class BoardBean {
	private int noti_id;
	private String a_id;
	private String title;
	private String content;
	private int hit;
	private String registration;
	private int page;
	public void setNoti_id(int noti_id) {
		this.noti_id = noti_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public void setRegistration(String registration) {
		this.registration = registration.substring(0,10);
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	
}
