package kr.co.jonggak.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.SessionScope;

import kr.co.jonggak.beans.UserBean;

@Configuration
public class RootAppContext {
	// 이름으로 구분하여 등록
	@Bean("loginUserBean")
	@SessionScope
	public UserBean loginUserBean() {
		System.out.println("loginUserBean");
		return new UserBean();
	}

}