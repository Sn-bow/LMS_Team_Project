package kr.co.jonggak.dto;

import lombok.Data;

@Data
public class StuAllGradeDto {
	
	private String choess_year; //선택년도
	private String stu_id;
	private int cla_sem;
	
	// 신청학점
	private int applyM_grade;
	private int applyE_grade;
	private int applyTotal_grade;
	
	// 취득학점
	private int getM_grade;
	private int getE_grade;
	private int getTotal_gtade;
	
	//
	private int cla_id;
	private String cla_name;
	private int cla_grade;
	private String cla_state;
	private int total_score;
	private int cla_count;
	
	
	
	
	
	
	

}
