package kr.co.jonggak.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jonggak.dao.GradeDao;
import kr.co.jonggak.dto.ChoseGradeInquiryDto;
import kr.co.jonggak.dto.ClassInforDto;
import kr.co.jonggak.dto.ClassInquiryDto;
import kr.co.jonggak.dto.GradeInquiryDto;
import kr.co.jonggak.dto.MyGradeDto;

@Service
public class GradeService {

	@Autowired
	private GradeDao gradeDao;

	public List<ClassInquiryDto> getProfClassList(String professorId, String year, int sem) {
		return gradeDao.getProfClassList(professorId,year,sem);
	}

	public ClassInforDto getClassInfo(int classId) {
		return gradeDao.getClassInfo(classId);
	}

	public List<GradeInquiryDto> getGradeInquiryList(int classId, String nowYear, int sem) {
		return this.gradeDao.getGradeInquiryList(classId, nowYear, sem);
	}

	public List<GradeInquiryDto> getGradeInsertList(int classId, String nowYear, int sem) {
		return this.gradeDao.getGradeInsertList(classId, nowYear, sem);
	}

	public int setGrade(MyGradeDto myGradeDto) {
		return gradeDao.setGrade(myGradeDto);
	}

	public int updateGrade(MyGradeDto updateGradeDto) {
		return gradeDao.updateGrade(updateGradeDto);
	}
	
	public List<ChoseGradeInquiryDto> getChoseGradeInquiryList(String stu_id, String year, int cla_sem) {
		return this.gradeDao.getChoseGradeInquiryList(stu_id, year, cla_sem);
	}

}
