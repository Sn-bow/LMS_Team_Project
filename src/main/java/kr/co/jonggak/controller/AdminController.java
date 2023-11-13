package kr.co.jonggak.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jonggak.beans.UserBean;
import kr.co.jonggak.dto.ProfessorDto;
import kr.co.jonggak.dto.StudentDto;
import kr.co.jonggak.service.ProfessorService;
import kr.co.jonggak.service.StudentService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	@Autowired
	private StudentService ssvc;
	
	@Autowired
	private ProfessorService psvc;
	
	@GetMapping("/studentInfo")
	public ModelAndView studentInfo() {
		ModelAndView mav = new ModelAndView();
		
		if(loginUserBean.getUser_idx() == 3) {
		List<StudentDto> studentListSet = ssvc.getStudentList();
		int totalDataCount = studentListSet.size(); // 전체 데이터 개수
		int dataPerPage = 10; // 한 페이지에 보여줄 데이터 개수
		int endpage = (int) Math.ceil((double) totalDataCount / dataPerPage); // 총 페이지 수
		mav.addObject("currentPage", 1);
		mav.addObject("endpage",endpage);
		mav.setViewName("admin/studentInfo");
		}else {
			mav.setViewName("redirect:/main");
		}
		return mav;
	}
	
	@GetMapping("/professorInfo")
	public ModelAndView professorInfo() {
		ModelAndView mav = new ModelAndView();
		
		if(loginUserBean.getUser_idx() == 3) {
		List<ProfessorDto> professorListSet = psvc.getProfessorList();
		int totalDataCount = professorListSet.size(); // 전체 데이터 개수
		int dataPerPage = 10; // 한 페이지에 보여줄 데이터 개수
		int endpage = (int) Math.ceil((double) totalDataCount / dataPerPage); // 총 페이지 수
		mav.addObject("currentPage", 1);
		mav.addObject("endpage",endpage);
		mav.setViewName("admin/professorInfo");
		} else {
			mav.setViewName("redirect:/main");
		}
		return mav;
	}
	
	@GetMapping("/studentInsert")
	public ModelAndView studentInsert() {
		ModelAndView mav = new ModelAndView();
		if(loginUserBean.getUser_idx() == 3) {
			mav.setViewName("admin/studentInsert");
		}else {
			mav.setViewName("redirect:/main");
		}
		return mav;
	}
	
	@PostMapping("/studnetInsertForm")
	public ModelAndView studnetInsertForm(@RequestBody StudentDto sdto) {
		ModelAndView mav = new ModelAndView();
		int rs = ssvc.insertStudent(sdto);
		
		
		if(loginUserBean.getUser_idx() == 3) {
			mav.setViewName("admin/studentInsert");
		}else {
			mav.setViewName("redirect:/main");
		}
		return mav;
	}
}
