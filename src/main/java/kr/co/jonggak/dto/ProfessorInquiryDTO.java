package kr.co.jonggak.dto;

import lombok.Data;

@Data
public class ProfessorInquiryDTO {
	private int cla_id;
	private String cla_name;
	private int cla_grade;
	private int cla_level;
	private String cla_week;
	private String cla_open;
	private String cla_close;
	private int cla_maxpeo;
	private String major_state;
	private String electives_sta;
	private String claroom_name;
}
