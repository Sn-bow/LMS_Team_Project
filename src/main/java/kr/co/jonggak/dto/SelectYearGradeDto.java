package kr.co.jonggak.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SelectYearGradeDto {
	public String year;
	public Integer cla_sem;
	public Integer major;
	public Integer notMajor;
	public Integer realMajor;
	public Integer realNotMajor;
}
