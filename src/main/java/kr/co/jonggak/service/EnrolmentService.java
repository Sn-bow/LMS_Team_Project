package kr.co.jonggak.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jonggak.dao.EnrolmentDao;
import kr.co.jonggak.dto.EnrolmentDto;

@Service
public class EnrolmentService {

	@Autowired
	private EnrolmentDao EnrolmentDao;

	public List<EnrolmentDto> getEnrolmentList(String stuId) {
		List<EnrolmentDto> EnrolmentList = EnrolmentDao.getEnrolmentList(stuId);
		System.out.println(EnrolmentList);
		return EnrolmentList;
	}

	public int getStatus(int claId) {
		return EnrolmentDao.getStatus(claId);
	}

	public void insertMyclass(String stu_id, int claId) {
		EnrolmentDao.insertMyclass(stu_id,claId);
	}

	public int deleteMyclass(String stu_id, int claId) {
		int rs = EnrolmentDao.deleteMyclass(stu_id, claId);
		return rs;
	}

	public List<EnrolmentDto> getEnrolmentListLevel(String stuid, String variable,String claNameFilter, int level, String year) {
		return EnrolmentDao.getEnrolmentListLevel(stuid, variable, claNameFilter, level, year);
	}

	public List<Integer> getclaIdList(String stuId) {
		return EnrolmentDao.getclaIdList(stuId);
	}

	public int getConfirmCheck(String stuId, int cla_id) {
		return EnrolmentDao.getConfirmCheck(stuId,cla_id);
	}

	public int deleteMygrade(int myclaId) {
		return EnrolmentDao.deleteMygrade(myclaId);
	}

	public int selectMyclass(String stu_id, int claId) {
		return EnrolmentDao.selectMyclass(stu_id, claId);
	}

}