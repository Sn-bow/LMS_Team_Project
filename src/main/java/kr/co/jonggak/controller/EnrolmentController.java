package kr.co.jonggak.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jonggak.beans.UserBean;
import kr.co.jonggak.dto.EnrolmentDto;
import kr.co.jonggak.service.EnrolmentService;

@Controller
@RequestMapping("/enrolment")
public class EnrolmentController {
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
   @Autowired
   public EnrolmentService EnrolmentService;

   @GetMapping("/enrolm")
   public ModelAndView main() {
	   ModelAndView mav = new ModelAndView();
      String stuId = loginUserBean.getUser_id();
      String year = loginUserBean.getYear();
      String major = loginUserBean.getMajor();
      int ck = 0;
      boolean remove = false;
      
      List<Integer> claIdsList = EnrolmentService.getclaIdList(stuId);
      System.out.println("EnrolmentController 실행 : " + claIdsList);
      List<EnrolmentDto> EnrolmentList = EnrolmentService.getEnrolmentList(stuId);
      List<EnrolmentDto> removedItems = new ArrayList<>();
      Iterator<EnrolmentDto> iterator = EnrolmentList.iterator();
      System.out.println("EnrolmentList : "+EnrolmentList);
	    while (iterator.hasNext()) {
	    	remove = false;
	        EnrolmentDto edto = iterator.next();
	        for (int claid : claIdsList) {
	            if (edto.getCla_id() == claid) {
	                removedItems.add(edto);  // 삭제 대상이 되는 요소를 새 리스트에 추가
	                remove = true;
	                break;  // 이미 해당 요소를 찾아 제거했으므로 더 이상 비교할 필요 없음
	            }
	        }
	        if (!remove && !(edto.getCla_end().equals(year))) {
	            remove = true;
	        }
	        if (remove) {
	            iterator.remove();  // 현재 요소 제거
	        }
	    }
	    
	  for(EnrolmentDto rl : removedItems) {
		  ck = EnrolmentService.getConfirmCheck(stuId,rl.getCla_id());
		  rl.setCk(ck);
	  }
	  
      mav.addObject("major", major);
      mav.addObject("loginUserBean", loginUserBean);
      mav.addObject("EnrolmentList", EnrolmentList);
      mav.addObject("removedItems", removedItems);
      mav.setViewName("enrolment/enrolm");
      return mav;
   }
}