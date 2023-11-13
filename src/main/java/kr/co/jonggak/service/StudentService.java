package kr.co.jonggak.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jonggak.dao.StudentDao;
import kr.co.jonggak.dto.StuAllGradeDto;
import kr.co.jonggak.dto.StuNowGradeDto;
import kr.co.jonggak.dto.StudentDto;
import kr.co.jonggak.dto.StudentRequest;


@Service
public class StudentService {
	@Autowired
	private StudentDao Studao;
	
	public List<StuNowGradeDto> getStuNowGrade(String stu_id, String now_year, int cla_sem){
		List<StuNowGradeDto> StuNowGrade = Studao.getStuNowGrade(stu_id, now_year, cla_sem);
		System.out.println(StuNowGrade);
		return StuNowGrade;
	}

	public List<StuAllGradeDto> getStuApplyGrade(String stu_id) {
		return this.Studao.getStuApplyGrade(stu_id);
	}

	// 선택한 년/학기 성적조회
	public List<StuAllGradeDto> getMinuteGrade(StudentRequest studentRequest) {
		List<StuAllGradeDto> MinuteGrade = Studao.getMinuteGrade(studentRequest);
		System.out.println(MinuteGrade);
		return MinuteGrade;
	}

	public List<StudentDto> getStudentList() {
		return Studao.getStudentList();
	}

	public List<StudentDto> getfilterList(String filter, String searchText) {
		return Studao.getfilterList(filter,searchText);
	}

	public int insertStudent(StudentDto sdto) {
		return Studao.insertStudent(sdto);
	}


}
