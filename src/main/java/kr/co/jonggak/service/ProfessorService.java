package kr.co.jonggak.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jonggak.dao.ProfessorDao;
import kr.co.jonggak.dto.GradeInsertDto;
import kr.co.jonggak.dto.ProfessorDto;
import kr.co.jonggak.dto.ProfessorInquiryDTO;
import kr.co.jonggak.dto.StudentDto;

@Service
public class ProfessorService {

	@Autowired
	private ProfessorDao professorDao;

	@Autowired
	public ProfessorService(ProfessorDao professorDao) {
		this.professorDao = professorDao;
	}

	public List<ProfessorInquiryDTO> getClassList(String professorId) {
		return professorDao.getClassList(professorId);
	}

	public int getGradeInsert(GradeInsertDto gradeInsertDto) {
		System.out.println("GradeInsertService 실행");
		return professorDao.getGradeInsert(gradeInsertDto);
	}

	public List<ProfessorDto> getProfessorList() {
		return professorDao.getProfessorList();
	}

	public List<ProfessorDto> getfilterList(String filter, String searchText) {
		return professorDao.getfilterList(filter,searchText);
	}

}
