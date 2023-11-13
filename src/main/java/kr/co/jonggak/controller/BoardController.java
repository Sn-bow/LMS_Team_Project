package kr.co.jonggak.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jonggak.beans.BoardBean;
import kr.co.jonggak.beans.UserBean;
import kr.co.jonggak.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	@Autowired
	private BoardService bSvc;
	
	@GetMapping("/main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		List<BoardBean> boardListSet = bSvc.getBoardList();
		int totalDataCount = boardListSet.size(); // 전체 데이터 개수
		int dataPerPage = 10; // 한 페이지에 보여줄 데이터 개수
		int endpage = (int) Math.ceil((double) totalDataCount / dataPerPage); // 총 페이지 수
		
		mav.addObject("currentPage", 1);
		mav.addObject("endpage",endpage);
		mav.addObject("loginUserBean",loginUserBean);
		mav.setViewName("board/main");
		return mav;
	}
	
	@GetMapping("/read")
	public ModelAndView read(int noti_id) {
		ModelAndView mav = new ModelAndView();
		BoardBean boardDto = bSvc.getBoardRead(noti_id);
		mav.addObject("boardDto",boardDto);
		mav.addObject("loginUserBean",loginUserBean);
		mav.setViewName("board/read");
		return mav;
	}
	
	@GetMapping("/write")
	public ModelAndView write() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("loginUserBean",loginUserBean);
		mav.setViewName("board/write");
		return mav;
	}
	
	@PostMapping("/writeForm")
	public ModelAndView writeForm(BoardBean boardBean) {
		boardBean.setA_id(loginUserBean.getUser_id());
		System.out.println("writeForm :");
		System.out.println(boardBean);
		ModelAndView mav = new ModelAndView();
		int boardDto = bSvc.getBoardWrite(boardBean);
		mav.addObject("loginUserBean",loginUserBean);
		//@ModelAttribute 
		if(boardDto >= 1) {
			mav.setViewName("redirect:/board/main");
		}else {
			mav.setViewName("board/write");
		}
		return mav;
	}
	
	// 수정하기 누를 시 보여지는 화면
	@GetMapping("/modify")
	public ModelAndView modify(@PathParam("noti_id") int noti_id) {
		ModelAndView mav = new ModelAndView();
		System.out.println(noti_id);
		System.out.println("modify =>");
		BoardBean bdto = bSvc.getBoardRead(noti_id);
		mav.addObject("bdto",bdto);
		mav.addObject("loginUserBean",loginUserBean);
		mav.setViewName("board/modify");
		return mav;
	}
	
	// 수정완료 누른 후
	@PostMapping("/modifyForm")
	public ModelAndView modifys(BoardBean boardBean) {
		System.out.println(boardBean);
		System.out.println("modifys=>");
		
		ModelAndView mav = new ModelAndView();
		int board = bSvc.getBoardModify(boardBean);
		System.out.println(board);
		
		mav.addObject("loginUserBean",loginUserBean);
		if(board >= 1) {
			mav.setViewName("redirect:/board/main");
		}else {
			mav.setViewName("board/modify");
		}

		return mav;
	}

	@GetMapping("/delete")
	public ModelAndView delete(@PathParam("noti_id") int noti_id) {
		ModelAndView mav = new ModelAndView();
		System.out.println(noti_id);
		System.out.println("modifys=>");
		int board = bSvc.getBoardDelete(noti_id);
		System.out.println(board);
		System.out.println("getBoardDelete=>");
		mav.addObject("loginUserBean",loginUserBean);
		if(board >= 1) {
			mav.setViewName("redirect:/board/main");
		}else {
			mav.setViewName("board/delete");
		}
		System.out.println("mav=>");
		System.out.println(mav);
		return mav;
	}
}
