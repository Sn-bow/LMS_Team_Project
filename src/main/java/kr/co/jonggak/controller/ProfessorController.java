package kr.co.jonggak.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jonggak.beans.UserBean;
import kr.co.jonggak.dto.ClassInquiryDto;
import kr.co.jonggak.dto.MyGradeDto;
import kr.co.jonggak.dto.ProfessorToClassDto;
import kr.co.jonggak.service.GradeService;
import kr.co.jonggak.service.LectureService;

@Controller
@RequestMapping("/professor")
public class ProfessorController {
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@Autowired
	private LectureService lectureService;
	
	@Autowired
	private GradeService gradeService;
	
	@GetMapping("/grade")
	public ModelAndView professorGradeInquiry() {
		ModelAndView mav = new ModelAndView();
		String year = loginUserBean.getYear();
		int sem = loginUserBean.getSemester();
		String pro_id = loginUserBean.getUser_id();
		// parameter : professorId
		List<ClassInquiryDto> classInquiryList = this.gradeService.getProfClassList(pro_id,year,sem);
		System.out.println("professorGradeInquiry : " + classInquiryList);
		mav.addObject("classInquiryList",classInquiryList);
		mav.addObject("loginUserBean",loginUserBean);
		mav.setViewName("professor/Pro_grade_Inquiry");
		return mav;
	}

	@GetMapping("/gradeInsert")
	public ModelAndView professorGradeInsert() {
		ModelAndView mav = new ModelAndView();
		String year = loginUserBean.getYear();
		int sem = loginUserBean.getSemester();
		String pro_id = loginUserBean.getUser_id();
		// parameter : professorId getGradeInsertList
		List<ClassInquiryDto> classInquiryList = this.gradeService.getProfClassList(pro_id,year,sem);
		System.out.println("professorGradeInsert : " + classInquiryList);
		mav.addObject("loginUserBean",loginUserBean);
		mav.addObject("classInquiryList",classInquiryList);
		mav.setViewName("professor/Pro_grade_Insert");
		return mav;
	}

	@PostMapping("/gradeInset")
	public String professorGradeInsert(@ModelAttribute MyGradeDto myGradeDto) {
		System.out.println(myGradeDto);
		if (myGradeDto.getMycla_id() != null && myGradeDto.getAt_score() != null) {
			this.gradeService.setGrade(myGradeDto);
			return "redirect:/professor/gradeInsert";
		} else {
			System.out.println("성적 입력 실패");
			return "redirect:/professor/gradeInsert";
		}
	}

	@PostMapping("/gradeUpgrade")
	public String professorGradeUpdate(Model model, @ModelAttribute MyGradeDto updateGradeDto) {
		System.out.println(updateGradeDto);
//		location.href="이동할_페이지명"
		if (updateGradeDto.getMycla_id() != null && updateGradeDto.getMygrade_id() != null
				&& updateGradeDto.getA_score() != null && updateGradeDto.getAt_score() != null
				&& updateGradeDto.getF_score() != null && updateGradeDto.getM_score() != null) {
			this.gradeService.updateGrade(updateGradeDto);
			model.addAttribute("callgrade", updateGradeDto.getMygrade_id());
			return "redirect:/professor/gradeInsert";
		} else {
			System.out.println("성적 업데이트 실패");
			return "redirect:/professor/gradeInsert";
		}
	}
	
	@GetMapping("/lectureCheck")
	public ModelAndView prfLectureCheck(String year) {
		ModelAndView mav = new ModelAndView();
		String prfId = loginUserBean.getUser_id();
		List<ProfessorToClassDto> prfClassList = this.lectureService.getPrfClassList(prfId, year);
		mav.addObject("loginUserBean", loginUserBean);
		mav.addObject("prfClassList", prfClassList);
		mav.setViewName("professor/lectureCheck");
		return mav;
	}
	
	@GetMapping("/pro_tt")
	public ModelAndView stu_tt() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("loginUserBean", loginUserBean);
		mav.setViewName("professor/professorClassTimeTable");
		return mav;
	}
}
