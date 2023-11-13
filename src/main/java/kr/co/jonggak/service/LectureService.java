package kr.co.jonggak.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jonggak.dao.LectureDao;
import kr.co.jonggak.dto.ClassConfirmDto;
import kr.co.jonggak.dto.LecturInquiryDto;
import kr.co.jonggak.dto.LectureInfoDto;
import kr.co.jonggak.dto.ProfessorToClassDto;


@Service
public class LectureService {

	@Autowired
	private LectureDao LectureDao;
	
	
	public List<LecturInquiryDto> getLecturInquiryList(String student_id, String year, int sem) {
		return LectureDao.getLecturInquiryList(student_id,year,sem);
		
	}
	
	public LecturInquiryDto getLecturInquiry(String student_id, int mycla_id) {
		return LectureDao.getLecturInquiry(student_id, mycla_id);
	}
	
	public int setClassConfirm(ClassConfirmDto classConfirmDto, int myclass_id) {
		classConfirmDto.setMyCla_id(myclass_id);
		if (classConfirmDto.getItem1() != null) {
			return LectureDao.setClassConfirm(classConfirmDto);
		} else {
			return 0;
		}	
	}
	
	public List<ProfessorToClassDto> getPrfClassList(String prf_id, String year) {
		return LectureDao.getPrfClassList(prf_id, year);
	}
	
	public LectureInfoDto getLectureInfo(int cla_id) {
		return LectureDao.getLectureInfo(cla_id);
	}
	
	public List<String> getFeedbackList(int cla_id) {
		return LectureDao.getFeedbackList(cla_id);
	}
}
