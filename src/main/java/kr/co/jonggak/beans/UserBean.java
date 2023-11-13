package kr.co.jonggak.beans;

import java.time.LocalDateTime;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserBean {
	private int user_idx;
	@Size(min = 2, max = 4)
	@Pattern(regexp = "[가-힣]*")
	private String user_name;
	@Size(min = 4, max = 20)
	@Pattern(regexp = "[a-zA-Z0-9]*") // 영어 또는 숫자만 입력 자주 쓰이는 정규식(Regular Expression)
	private String user_id;
	@Size(min = 4, max = 20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String user_pw;
	
	private boolean userLogin;

	private boolean userIdExist;
	
	private LocalDateTime currentTime;
	
    private String year;
    
    private String month;
    
    private int semester;
    
    private int level;
    
    private String major;
    
	//초기화 :처음에는 중복검사를 하지 않으므로 false
	public UserBean() {
		this.userIdExist = false;
		this.userLogin = false;
		this.currentTime = LocalDateTime.now(); // 현재 시간 초기화
        this.year = String.valueOf(this.currentTime.getYear()); // 연도 정보 추출
        this.month = String.valueOf(this.currentTime.getMonth()); // 월 정보 추출
        System.out.println("this.month : " + this.month);
        switch (this.month) {
        case "MARCH": case "APRIL": case "MAY": case "JUNE": case "JULY": case "AUGUST":
            this.semester = 1;
            break;
        case "SEPTEMBER": case "OCTOBER": case "NOVEMBER": case "DECEMBER": case "JANUARY": case "FEBRUARY":
			this.semester = 2;
			break;
		}
	}

	@Size(min = 4, max = 20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String user_pw2;

}
