package kr.co.jonggak.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jonggak.beans.BoardBean;
import kr.co.jonggak.beans.UserBean;
import kr.co.jonggak.service.BoardService;

@Controller
public class MainController {
	// UserService.java에서 주입해옴
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	@Autowired
	private BoardService bSvc;

	@GetMapping("/main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		List<BoardBean> boardListSet = bSvc.getBoardList();
		int totalDataCount = boardListSet.size(); // 전체 데이터 개수
		int dataPerPage = 0;
		int endpage = 0;
		mav.addObject("loginUserBean", loginUserBean);
		mav.addObject("currentPage", 1);

		if (loginUserBean.getUser_idx() == 3) {
			dataPerPage = 10; // 한 페이지에 보여줄 데이터 개수
			endpage = (int) Math.ceil((double) totalDataCount / dataPerPage); // 총 페이지 수
			List<BoardBean> boardList = bSvc.getPage10(1);
			mav.addObject("boardList",boardList);
			mav.addObject("endpage",endpage);
			mav.setViewName("admin/mainpage"); // 관리자 페이지로 이동.
		} else{
			dataPerPage = 5; // 한 페이지에 보여줄 데이터 개수
			endpage = (int) Math.ceil((double) totalDataCount / dataPerPage); // 총 페이지 수
			List<BoardBean> boardList = bSvc.getPage5(1);
			mav.addObject("boardList",boardList);
			mav.addObject("endpage",endpage);
			mav.setViewName("main");
		}
		return mav;
	}

}
