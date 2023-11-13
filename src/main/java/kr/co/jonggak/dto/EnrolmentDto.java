package kr.co.jonggak.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EnrolmentDto {
   private int cla_id;
   private String classification;
   private String dep_name;
   private String cla_name;
   private int cla_level;
   private int cla_grade;
   private String pro_name;
   private String cla_week;
   private String cla_open;
   private String cla_close;
   private String claroom_name;
   private int enrolment;
   private int enrolmentMax;
   private String cla_end;
   private int ck;
   
}