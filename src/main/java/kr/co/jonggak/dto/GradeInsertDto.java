package kr.co.jonggak.dto;

import lombok.Data;

@Data
public class GradeInsertDto {
	private int myCla_id; // 나의 클래스 아이디
	private int at_score; //출석점수
	private int m_score; //중간점수
	private int f_score; //기말점수
	private int a_score; //과제점수
	
}
