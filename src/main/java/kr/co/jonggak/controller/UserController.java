package kr.co.jonggak.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jonggak.beans.UserBean;
import kr.co.jonggak.service.UserService;
import kr.co.jonggak.validator.UserValidator;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	// UserService.java에서 주입해옴
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@GetMapping("/login")
	public String login(@ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean,
			@RequestParam(value = "fail", defaultValue = "false") boolean fail, Model model) {
		// fail에 false면 실패가 아니므로 로그인 창이 띄워짐
		// login_fail.jsp에서 fail=true가 넘어오므로 fail는 true(실패)가 되어 실패창이 띄워짐
		model.addAttribute("fail", fail);

		return "user/login";
	}

	@PostMapping("/login_pro")
	public String login_pro(@Valid @ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean,
			BindingResult result, Model model) {
		System.out.println("login_pro :");
		System.out.println(tempLoginUserBean);
		String userId = tempLoginUserBean.getUser_id();
		if (userId != null && (userId.startsWith("A") || userId.startsWith("S") || userId.startsWith("P"))) {
			if (result.hasErrors()) {
				return "user/login";
			}
			
			userService.getLoginUserInfo(tempLoginUserBean);

			if (loginUserBean.isUserLogin() == true) {
				return "user/login_success";
			} else {
				return "user/login_fail";
			}
		} else {
            // 아이디가 A, S, P로 시작하지 않으면 로그인 실패 처리
            model.addAttribute("fail", true);
            return "user/login";
        }

	}

	@GetMapping("/join")
	public ModelAndView join(@ModelAttribute("joinUserBean") UserBean joinUserBean) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("loginUserBean", loginUserBean);
		mav.setViewName("user/join");
		return mav;
	}

	@GetMapping("/modify")
	public String modify() {
		System.out.println("modify");

		return "user/modify";
	}

	@GetMapping("/logout")
	public String logout() {

		loginUserBean.setUser_idx(0);
		loginUserBean.setUser_name(null);
		loginUserBean.setUser_id(null);
		loginUserBean.setUser_pw(null);
		loginUserBean.setUserLogin(false);
		return "user/logout";
	}

	@PostMapping("/join_pro")
	public ModelAndView join_pro(@Valid @ModelAttribute("joinUserBean") UserBean joinUserBean, BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if (result.hasErrors()) {
			mav.setViewName("user/join");
			return mav;
		}
		userService.addUserInfo(joinUserBean);
		mav.setViewName("user/join_success");
		return mav;
	}

//	@PostMapping("/join_student")
//	public ModelAndView join_student(@Valid @ModelAttribute("joinStudentDto") StudentDto joinStudentDto, BindingResult result) {
//		ModelAndView mav = new ModelAndView();
//		if (result.hasErrors()) {
//			mav.setViewName("user/join");
//			return mav;
//		}
//		userService.addUserInfoS(joinStudentDto);
//		mav.setViewName("user/join_success");
//		return mav;
//	}
//	
//	@PostMapping("/join_professor")
//	public ModelAndView join_professor(@Valid @ModelAttribute("joinProfessorDto") ProfessorDto joinProfessorDto, BindingResult result) {
//		ModelAndView mav = new ModelAndView();
//		if (result.hasErrors()) {
//			mav.setViewName("user/join");
//			return mav;
//		}
//		userService.addUserInfoP(joinProfessorDto);
//		mav.setViewName("user/join_success");
//		return mav;
//	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		UserValidator validator1 = new UserValidator();
		binder.addValidators(validator1);
	}

	@GetMapping("/not_login")
	public String not_login() {
		return "user/not_login";
	}

}
