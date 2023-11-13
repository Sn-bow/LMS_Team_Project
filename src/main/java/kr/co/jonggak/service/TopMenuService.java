package kr.co.jonggak.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jonggak.beans.BoardInfoBean;
import kr.co.jonggak.dao.TopMenuDao;

@Service
public class TopMenuService {
	@Autowired
	private TopMenuDao topMenuDao;
	
	public List<BoardInfoBean> getTopMenuList(){
		List<BoardInfoBean> topMenuList = topMenuDao.getTopMenuList();
		System.out.println(topMenuList);
		return topMenuList;
	}
}
