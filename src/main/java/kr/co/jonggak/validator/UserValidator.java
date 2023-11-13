package kr.co.jonggak.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.jonggak.beans.UserBean;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return UserBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		// 형변환
		UserBean userBean = (UserBean) target;
		// 유효성검사를 하는 bean의 이름 찍어보기
		String beanName = errors.getObjectName(); // 1차 솔루션 (객체명 확인)
		// System.out.println(beanName);

		if(beanName.equals("joinUserBean")) {
			if(userBean.getUser_pw().equals(userBean.getUser_pw2()) == false) {
				errors.rejectValue("user_pw", "NotEquals");
				errors.rejectValue("user_pw2", "NotEquals");
			}
			
			if(userBean.isUserIdExist() == false) {
				errors.rejectValue("user_id", "DontCheckUserIdExist");
			}
		}
	}

}
