package kr.co.jonggak.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.jonggak.beans.BoardBean;
import kr.co.jonggak.beans.UserBean;
import kr.co.jonggak.dto.ChoseGradeInquiryDto;
import kr.co.jonggak.dto.ClassInforDto;
import kr.co.jonggak.dto.EnrolmentDto;
import kr.co.jonggak.dto.GradeInquiryDto;
import kr.co.jonggak.dto.LectureInfoDto;
import kr.co.jonggak.dto.MyclassDto;
import kr.co.jonggak.dto.MyclassRequest;
import kr.co.jonggak.dto.ProfessorDto;
import kr.co.jonggak.dto.StuAllGradeDto;
import kr.co.jonggak.dto.StudentDto;
import kr.co.jonggak.dto.StudentRequest;
import kr.co.jonggak.request.ClaSemAndYearRequest;
import kr.co.jonggak.request.ClassIdRequest;
import kr.co.jonggak.service.ApiService;
import kr.co.jonggak.service.BoardService;
import kr.co.jonggak.service.EnrolmentService;
import kr.co.jonggak.service.GradeService;
import kr.co.jonggak.service.LectureService;
import kr.co.jonggak.service.ProfessorService;
import kr.co.jonggak.service.StudentService;

@RestController
@RequestMapping("/api")
public class ApiController {

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@Autowired
	private ApiService apisvc;

	@Autowired
	public EnrolmentService EnrolmentService;

	@Autowired
	private GradeService gradeService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private LectureService lectureService;

	@Autowired
	private StudentService studentService;
	
	@Autowired
	private ProfessorService professorService;
	
	@PostMapping("/NotiListFiltering")
	public List<BoardBean> NotiListFiltering(@RequestParam String filter, @RequestParam String searchText) {
		System.out.println("NotiListFiltering() 실행");
		List<BoardBean> filterList = boardService.getfilterList(filter,searchText);
		System.out.println(filterList);
		return filterList;
	}
	
	@PostMapping("/ProinfoFiltering")
	public List<ProfessorDto> ProinfoFiltering(@RequestParam String filter, @RequestParam String searchText) {
		System.out.println("ProinfoFiltering() 실행");
		List<ProfessorDto> filterList = professorService.getfilterList(filter,searchText);
		System.out.println(filterList);
		return filterList;
	}
	
	@PostMapping("/StuinfoFiltering")
	 public List<StudentDto> stuInfoFiltering(@RequestParam String filter, @RequestParam String searchText) {
		System.out.println("stuInfoFiltering() 실행");
		List<StudentDto> filterList = studentService.getfilterList(filter,searchText);
        return filterList;
    }
	
	@PostMapping("/Search")
	public @ResponseBody List<EnrolmentDto> Search(@RequestParam("claNameFilter") String claNameFilter,
			@RequestParam("variable") String variable, @RequestParam("Level") int Level,
			@RequestParam("claIds") String claIds) throws JsonMappingException, JsonProcessingException {
		String year = loginUserBean.getYear();
		ObjectMapper mapper = new ObjectMapper();
		List<Integer> claIdsList = mapper.readValue(claIds, new TypeReference<List<Integer>>() {});
		System.out.println("Search ajax 실행 : "+claIdsList);
		List<EnrolmentDto> EnrolmentList = new ArrayList<>(EnrolmentService.getEnrolmentListLevel(loginUserBean.getUser_id(), variable, claNameFilter, Level, year));
		Iterator<EnrolmentDto> iterator = EnrolmentList.iterator();
		while (iterator.hasNext()) {
			EnrolmentDto edto = iterator.next();
			for (int claid : claIdsList) {
				if (edto.getCla_id() == claid) {
					iterator.remove(); // 현재 요소 제거
					break; // 이미 해당 요소를 찾아 제거했으므로 더 이상 비교할 필요 없음
				}
			}
		}
		return EnrolmentList;
	}

	@PostMapping("/DeleteList")
	public @ResponseBody int DeleteList(int claId) {
		String stu_id = loginUserBean.getUser_id();
		System.out.println("ApiController DeleteList() 실행");
		System.out.println("선택한 강의 아이디 : " + claId);
		int rs = 0;
		int myclaId = EnrolmentService.selectMyclass(stu_id, claId);
		System.out.println();
		if(myclaId > 0) {
			rs += EnrolmentService.deleteMygrade(myclaId);
		}
		rs += EnrolmentService.deleteMyclass(stu_id, claId);
		return rs;
	}

	@PostMapping("/Valid")
	public @ResponseBody int Valid(int claId) {
		String stu_id = loginUserBean.getUser_id();
		System.out.println("ApiController Valid() 실행");
		System.out.println("선택한 강의 아이디 : " + claId);
		int sta = EnrolmentService.getStatus(claId);
		EnrolmentService.insertMyclass(stu_id, claId);
		System.out.println(sta);
		return sta;
	}

	@GetMapping("/PageSel")
	public @ResponseBody List<BoardBean> PageSel(int page) {
		System.out.println("ApiController PageSel() 실행");
		System.out.println("현재 페이지 : " + page);
		List<BoardBean> bl = boardService.getPage10(page);
		System.out.println(bl);
		return bl;
	}
	
	@GetMapping("/PageSel5")
	public @ResponseBody List<BoardBean> PageSel5(int page) {
		System.out.println("ApiController PageSel5() 실행");
		System.out.println("현재 페이지 : " + page);
		List<BoardBean> bl = boardService.getPage5(page);
		System.out.println(bl);
		return bl;
	}
	
//	=====================================================================================

	@PostMapping("/timetable")
	public List<MyclassDto> getTimetable(@RequestBody MyclassRequest request) {
		System.out.println("ApiController getTimetable() 실행");
		System.out.println(request.getYear());
		System.out.println(request.getSemester());
		return apisvc.getClasses(request.getYear(), request.getSemester(), loginUserBean.getUser_id());
	}

//	=====================================================================================

	@PostMapping("/classInfo")
	public ClassInforDto getClassInfo(@RequestBody ClassIdRequest classIdRequest) {
		// classId
		ClassInforDto classInfo = this.gradeService.getClassInfo(classIdRequest.getClaId());
		return classInfo;
	}

	@PostMapping("/gradeInquiry")
	public List<GradeInquiryDto> getGradeInquiry(@RequestBody ClassIdRequest classIdRequest) {
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int sem = 0;
		String nowDateYear = String.valueOf(year);
		int nowDateMonth = now.getMonthValue();
		System.out.println(nowDateYear);
		System.out.println(nowDateMonth);
		if (nowDateMonth >= 3 && nowDateMonth <= 7) {
			sem = 1;
		} else if (nowDateMonth >= 9 && nowDateMonth <= 12) {
			sem = 2;
		}
		List<GradeInquiryDto> gradeInquiryList = this.gradeService.getGradeInquiryList(classIdRequest.getClaId(),
				nowDateYear, sem);
		return gradeInquiryList;
	}

	@PostMapping("/gradeInsert")
	public List<GradeInquiryDto> getGradeInsert(@RequestBody ClassIdRequest classIdRequest) {
		String year = loginUserBean.getYear();
		int sem = loginUserBean.getSemester();
		List<GradeInquiryDto> gradeInsertList = this.gradeService.getGradeInsertList(classIdRequest.getClaId(),year, sem);

		for (GradeInquiryDto a : gradeInsertList) {
			System.out.println(a);
		}

		return gradeInsertList;
	}

	@PostMapping("/LectureInfo")
	public LectureInfoDto getLectureInfo(@RequestBody ClassIdRequest classIdRequest) {
		return this.lectureService.getLectureInfo(classIdRequest.getClaId());
	}

	@PostMapping("/lectureFeedback")
	public List<String> getFeedbackList(@RequestBody ClassIdRequest classIdRequest) {
		return this.lectureService.getFeedbackList(classIdRequest.getClaId());
	}

//=====================================================================================

	@PostMapping("/allGradeInquiry")
	public List<ChoseGradeInquiryDto> getAllGradeInquiryList(@RequestBody ClaSemAndYearRequest claSemAndYearRequest) {
		String stuId = loginUserBean.getUser_id();
		return this.gradeService.getChoseGradeInquiryList(stuId, claSemAndYearRequest.getYear(),
				claSemAndYearRequest.getCla_sem());
	}
	
	@PostMapping("/MinuteGrade")
	public List<StuAllGradeDto> getMinuteGrade(HttpServletRequest request, @RequestBody StudentRequest studentRequest) {
		String stu_id = loginUserBean.getUser_id();
		studentRequest.setStu_id(stu_id);
		List<StuAllGradeDto> MinuteGrade = this.studentService.getMinuteGrade(studentRequest);
		System.out.println(MinuteGrade);
		return MinuteGrade;
	}
}
