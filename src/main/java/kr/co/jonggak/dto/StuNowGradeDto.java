package kr.co.jonggak.dto;

import lombok.Data;

@Data
public class StuNowGradeDto {
	// 학생정보
	private String stu_name; //학생이름
	private String stu_id; // 학번
	private String dep_name; // 학과
	private int stu_level; //학년
	private int stu_semester; //학기
	// 금학기 성적조회
	private String cla_name; //강의이름
	private String pro_name; //교수이름
	private String cla_state; // 전공 교양 구분
	private int cla_grade; //강의별학점
	private int at_score; //출석
	private int m_score; //중간점수
	private int f_score; //기말점수
	private int a_score; //과제

	

}
