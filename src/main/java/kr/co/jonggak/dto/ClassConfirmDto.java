package kr.co.jonggak.dto;

import lombok.Data;

@Data
public class ClassConfirmDto {
	
	   private int confirm_id;       // 강의평가아이디
	   private Integer item1 ;    // 항목1
	   private Integer item2 ;    // 항목2
	   private Integer item3 ;    // 항목3	
	   private Integer item4 ;    // 항목4
	   private String feedback ;    // 교수에게 하고 싶은말
	   private Integer myCla_id ;    // 나의수강내역아이디
	   
	   
}
