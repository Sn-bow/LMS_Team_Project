package kr.co.jonggak.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LectureInfoDto {
	
	private Integer all_student_count;
	private Integer response_student_count;
	private Integer item1_avg;
	private Integer item2_avg;
	private Integer item3_avg;
	private Integer item4_avg;
	
}
