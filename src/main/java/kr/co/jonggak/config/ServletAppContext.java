package kr.co.jonggak.config;

import javax.annotation.Resource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.jonggak.beans.UserBean;
import kr.co.jonggak.dao.ApiDao;
import kr.co.jonggak.dao.BoardDao;
import kr.co.jonggak.dao.EnrolmentDao;
import kr.co.jonggak.dao.GradeDao;
import kr.co.jonggak.dao.LectureDao;
import kr.co.jonggak.dao.ProfessorDao;
import kr.co.jonggak.dao.StudentDao;
import kr.co.jonggak.dao.TopMenuDao;
import kr.co.jonggak.dao.UserDao;
import kr.co.jonggak.interceptor.CheckLoginInterceptor;

// 어노테이션이 셋팅되어 있는 클래스를 등록 
@EnableWebMvc
@ComponentScan("kr.co.jonggak.controller")
@ComponentScan("kr.co.jonggak.dao")
@ComponentScan("kr.co.jonggak.service")

@PropertySource("/WEB-INF/properties/db.properties")
public class ServletAppContext implements WebMvcConfigurer {

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@Value("${db.classname}")
	private String db_classname;

	@Value("${db.url}")
	private String db_url;

	@Value("${db.username}")
	private String db_username;

	@Value("${db.password}")
	private String db_password;

	// Controller의 메서드가 반환하는 jsp의 이름 앞뒤에 경로와 확장자를 붙혀주도록 설정한다.
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	// 정적 파일의 경로를 매핑한다.
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
	}

	// 데이터베이스 접속 정보를 관리하는 Bean
	@Bean
	public BasicDataSource dataSource() {
		System.out.println(db_classname);
		System.out.println(db_url);
		System.out.println(db_username);
		System.out.println(db_password);
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);

		return source;
	}

	// 쿼리문과 접속 정보를 관리하는 객체
	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(source);
		SqlSessionFactory factory = factoryBean.getObject();
		return factory;
	}

	// Interceptors 등록
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		WebMvcConfigurer.super.addInterceptors(registry);

		CheckLoginInterceptor checkLoginInterceptor = new CheckLoginInterceptor(loginUserBean);
		InterceptorRegistration reg1 = registry.addInterceptor(checkLoginInterceptor);
		reg1.addPathPatterns("/user/modify", "/user/logout", "/board/*");
		reg1.excludePathPatterns("/main");
	}

	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasenames("/WEB-INF/properties/error_message");
		return res;
	}
	
	@Bean
	public StandardServletMultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver(); //객체 생성하여 반환
	}
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer PropertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
	
	@Bean
	public MapperFactoryBean<TopMenuDao> getTopMenuDao(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<TopMenuDao> factoryBean = new MapperFactoryBean<TopMenuDao>(TopMenuDao.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<ApiDao> getApiDao(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<ApiDao> factoryBean = new MapperFactoryBean<ApiDao>(ApiDao.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<GradeDao> getGradeDao(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<GradeDao> factoryBean = new MapperFactoryBean<GradeDao>(GradeDao.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<ProfessorDao> getProfessorDao(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<ProfessorDao> factoryBean = new MapperFactoryBean<ProfessorDao>(ProfessorDao.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<StudentDao> getStudentDao(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<StudentDao> factoryBean = new MapperFactoryBean<StudentDao>(StudentDao.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	@Bean
	public MapperFactoryBean<UserDao> getUserDao(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<UserDao> factoryBean = new MapperFactoryBean<UserDao>(UserDao.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	@Bean
	public MapperFactoryBean<BoardDao> getBoardDao(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<BoardDao> factoryBean = new MapperFactoryBean<BoardDao>(BoardDao.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	@Bean
	public MapperFactoryBean<EnrolmentDao> getEnrolmentDao(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<EnrolmentDao> factoryBean = new MapperFactoryBean<EnrolmentDao>(EnrolmentDao.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	@Bean
	public MapperFactoryBean<LectureDao> getLectureDao(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<LectureDao> factoryBean = new MapperFactoryBean<LectureDao>(LectureDao.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

}
