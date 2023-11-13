package kr.co.jonggak.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jonggak.beans.UserBean;
import kr.co.jonggak.dao.UserDao;

@Service
public class UserService {
	// RootAppContext.java에서 주입한 부분
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@Autowired
	private UserDao userDao;// 데이터베이스 주입

	public void addUserInfo(UserBean joinUserBean) {
		UserBean joinUserBean2 = new UserBean();
		if (joinUserBean.getUser_id().substring(0, 1).equals("S")) {
			joinUserBean2.setUser_idx(1);
			userDao.addUserInfoS(joinUserBean);
		} else if (joinUserBean.getUser_id().substring(0, 1).equals("P")) {
			joinUserBean2.setUser_idx(2);
			userDao.addUserInfoP(joinUserBean);
		} else if (joinUserBean.getUser_id().substring(0, 1).equals("A")) {
			System.out.println("어드민 계정 생성 불가.");
		}
	}

	public void getLoginUserInfo(UserBean tempLoginUserBean) {
		UserBean tempLoginUserBean2 = new UserBean();
		String name = null;
		String major = null;
		if (tempLoginUserBean.getUser_id().substring(0, 1).equals("S")) {
			tempLoginUserBean2 = userDao.getLoginUserInfoS(tempLoginUserBean);
			if (tempLoginUserBean2 != null) {
				tempLoginUserBean2.setUser_idx(1);
			}
		} else if (tempLoginUserBean.getUser_id().substring(0, 1).equals("P")) {
			tempLoginUserBean2 = userDao.getLoginUserInfoP(tempLoginUserBean);
			if (tempLoginUserBean2 != null) {
				tempLoginUserBean2.setUser_idx(2);
			}
		} else if (tempLoginUserBean.getUser_id().substring(0, 1).equals("A")) {
			tempLoginUserBean2 = userDao.getLoginUserInfoA(tempLoginUserBean);
			if (tempLoginUserBean2 != null) {
				tempLoginUserBean2.setUser_idx(3);
			}
		}
		// 가져온 데이터가 있다면
		if (tempLoginUserBean2 != null) {

			if (tempLoginUserBean2.getUser_idx() == 1) {
				// 학생
				UserBean info = userDao.getInfoS(tempLoginUserBean2.getUser_id());
				loginUserBean.setLevel(info.getLevel());
				loginUserBean.setSemester(info.getSemester());
				loginUserBean.setMajor(info.getMajor());
				loginUserBean.setUser_name(info.getUser_name());
			} else if (tempLoginUserBean2.getUser_idx() == 2) {
				// 교수
				name = userDao.getLoginName(tempLoginUserBean2.getUser_id());
				major = userDao.getMajorP(tempLoginUserBean2.getUser_id());
				loginUserBean.setMajor(major);
				loginUserBean.setUser_name(name);
			}

			loginUserBean.setUser_idx(tempLoginUserBean2.getUser_idx());
			loginUserBean.setUser_id(tempLoginUserBean2.getUser_id());
			loginUserBean.setUserLogin(true);
			System.out.println(loginUserBean);
			System.out.println("상태 : " + loginUserBean.isUserLogin());
		}
	}

}