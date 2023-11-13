package kr.co.jonggak.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ClassInforDto {
	private Integer cla_id;
	private String cla_name;
	private String claroom_name;
	private String cla_week;
	private String cla_open;
	private String cla_close;
}
