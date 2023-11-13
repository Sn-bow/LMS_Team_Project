package kr.co.jonggak.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyGradeDto {
	private Integer mygrade_id;
	private Integer mycla_id;
	private Integer at_score;
	private Integer m_score;
	private Integer f_score;
	private Integer a_score;
}
