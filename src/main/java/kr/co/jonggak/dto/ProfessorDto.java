package kr.co.jonggak.dto;

import lombok.Data;

@Data
public class ProfessorDto {
	private String pro_id;
    private String pro_pw;
    private String pro_name;
    private String pro_room;
    private String pro_roomNum;
    private String pro_email;
    private int pic_id;
    private int dep_id;
    private String dep_name;
}
