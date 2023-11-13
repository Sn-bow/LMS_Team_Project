package kr.co.jonggak.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GradeInquiryDto {
	private String stu_id;
	private String stu_name;
	private String dep_name; 
	private Integer stu_semester;
	private Integer stu_level; 
	private Integer cla_id; 
	private Integer at_score; 
	private Integer m_score; 
	private Integer f_score; 
	private Integer a_score; 
	private Integer mycla_id; 
	private Integer mygrade_id;
}
