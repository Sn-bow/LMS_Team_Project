package kr.co.jonggak.dto;

import java.util.Date;

import lombok.Data;

@Data
public class StudentInsertDto {
	private String stu_id;
    private String stu_pw;
    private String stu_name;
    private String stu_rnn;
    private String stu_phoneNum;
    private String stu_address;
    private String stu_email;
    private int pic_id;
    private String pro_id;
    private int dep_id;
    private Date startYear;
    private Date endYear;
    private int stu_level;
    private int stu_semester;
    private String stu_state;
    private String dep_name;
}
