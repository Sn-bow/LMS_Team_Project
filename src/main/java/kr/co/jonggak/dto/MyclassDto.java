package kr.co.jonggak.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MyclassDto {
	private int mycla_id;
	private String stu_id;
	private int cla_id;
	private String cla_name;
	private String cla_open;
	private String cla_close;
	private int cla_openint;
	private int cla_closeint;
	private String cla_week;
	private String major_name;
	private String electives_name;
}
