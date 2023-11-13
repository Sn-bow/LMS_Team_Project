package kr.co.jonggak.beans;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ContentBean {
	private int content_idx;
	//NOTNULL 과 같음
	@NotBlank
	private String content_subject;
	@NotBlank
	private String content_text;
	private String content_file;
	private int content_writer_idx;
	private int content_board_idx;
	private String content_date;
	
}
