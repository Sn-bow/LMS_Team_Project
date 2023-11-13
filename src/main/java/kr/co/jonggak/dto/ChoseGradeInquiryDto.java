package kr.co.jonggak.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChoseGradeInquiryDto {
	private Integer mycla_id;
	private String stu_id;
	private Integer cla_id; 
	private Integer at_score; 
	private Integer m_score;
	private Integer f_score; 
	private Integer a_score; 
	private String cla_name; 
	private Integer cla_grade; 
	private Integer cla_level; 
	private String year;
	private Integer dep_id;
}
