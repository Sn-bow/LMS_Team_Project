package kr.co.jonggak.dto;

import lombok.Data;

@Data
public class JclassDto {
	private int cla_id; 		// 강의아이디
	private String cla_name; 	// 강의이름
	private String pro_id; 		// 교수번호
	private int cla_grade; 		// 강의별학점
	private int cla_maxPeo; 	// 강의정원
	private String cla_week; 	// 요일
	private String cla_open; 	// 강의시작시간
	private String cla_close; 	// 강의끝나는시간
	private int cla_openint; 	// 강의시작시간
	private int cla_closeint; 	// 강의끝나는시간
	private String cla_end; 	// 종강날짜
	private int major_id; 		// 전공아이디
	private int electives_id; 	// 교양아이디
	private int claRoom_id; 	// 강의실아이디
	private int cla_sem; 		// 학기
	private int dep_id; 		// 학과아이디
	private String claRoom_name; // 강의실이름
	private String claRoom_address; // 강의 주소

}
