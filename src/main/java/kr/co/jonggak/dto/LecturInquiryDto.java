package kr.co.jonggak.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LecturInquiryDto {
	private Integer confirm_id;
	private String pro_name;
	private Integer mycla_id;
	private String stu_id;
	private Integer cla_id;
	private String cla_name;
	private String pro_id;
	private Integer cla_grade;
}
