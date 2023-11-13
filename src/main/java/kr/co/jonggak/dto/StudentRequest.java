package kr.co.jonggak.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudentRequest {
	private String stu_id;
	private String choess_year;
	private int cla_sem;
}
