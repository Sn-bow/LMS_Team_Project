package kr.co.jonggak.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jonggak.beans.UserBean;
import kr.co.jonggak.dto.ClassConfirmDto;
import kr.co.jonggak.dto.LecturInquiryDto;
import kr.co.jonggak.dto.StuAllGradeDto;
import kr.co.jonggak.dto.StuNowGradeDto;
import kr.co.jonggak.service.LectureService;
import kr.co.jonggak.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@Autowired
	private StudentService Stusvc;
	
	@Autowired
	private LectureService lectureService;
	
	@GetMapping("/nowGradeInquiry")
	public ModelAndView StuNowGrade() {
		ModelAndView mav = new ModelAndView();

		String stu_id = loginUserBean.getUser_id();
		String now_year = loginUserBean.getYear();
		int cla_sem = loginUserBean.getSemester();
		
		List<StuNowGradeDto> StuNowGrade = Stusvc.getStuNowGrade(stu_id, now_year, cla_sem);

		mav.addObject("StuNowGrade", StuNowGrade);
		mav.addObject("loginUserBean", loginUserBean);
		mav.setViewName("/student/nowGradeInquiry");
		return mav;
	}

	@GetMapping("/stu_tt")
	public ModelAndView stu_tt() {
		ModelAndView mav = new ModelAndView();

		mav.addObject("loginUserBean", loginUserBean);
//		mav.setViewName("student/stu_tt");
		mav.setViewName("student/studentClassTimeTable");
		return mav;
	}

	@GetMapping("/allGradeInquiry")
	public ModelAndView Stu_all_Inquiry() {
		ModelAndView mav = new ModelAndView();
		String stu_id = loginUserBean.getUser_id();
		List<StuAllGradeDto> StuApplyGrade = this.Stusvc.getStuApplyGrade(stu_id);
		System.out.println(StuApplyGrade);
		mav.addObject("StuApplyGrade", StuApplyGrade);
		mav.addObject("loginUserBean", loginUserBean);
		mav.setViewName("student/allGradeInquiry");
		return mav;
	}

	@GetMapping("/lectureInquiry")
	public ModelAndView lectureInquiry(Model model) {
		ModelAndView mav = new ModelAndView();
		String year = loginUserBean.getYear();
		int sem = loginUserBean.getSemester();
		String student_id = loginUserBean.getUser_id();
		List<LecturInquiryDto> lectureList = this.lectureService.getLecturInquiryList(student_id, year, sem);
		mav.addObject("lectureList", lectureList);
		mav.addObject("loginUserBean", loginUserBean);
		mav.setViewName("student/lectureInquiry");
		return mav;
	}
	
	@GetMapping("/lectureInsert/{id}")
	public ModelAndView lectureInsert(Model model, @PathVariable("id") int myclass_id) {
		ModelAndView mav = new ModelAndView();
		String student_id = loginUserBean.getUser_id();
		LecturInquiryDto lectur = this.lectureService.getLecturInquiry(student_id, myclass_id);
		mav.addObject("myclass_id", myclass_id);
		mav.addObject("lectur", lectur);
		mav.addObject("loginUserBean", loginUserBean);
		mav.setViewName("student/classConfirm");
		return mav;
	}
	
	@PostMapping("/lectureInsert/{id}")
	public String lectureInsert(@ModelAttribute ClassConfirmDto classConfirmDto, @PathVariable("id") int myclass_id) {
		int result = this.lectureService.setClassConfirm(classConfirmDto, myclass_id);
		if (result > 0) {
			return "redirect:/student/lectureInquiry";
		}else {
			return "redirect:/student/lectureInsert/" + myclass_id;
		}
	}
}
