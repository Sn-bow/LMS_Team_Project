package kr.co.jonggak.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProfessorToClassDto {
	private Integer cla_id;
	private String cla_name;
	private String pro_id;
	private Integer cla_level;
	private Integer cla_grade;
	private String claroom_name;
	private String cla_week;
	private String cla_open;
	private String cla_close;
	private Integer dep_id;
	private String cla_end;
	private String clayear;
}
