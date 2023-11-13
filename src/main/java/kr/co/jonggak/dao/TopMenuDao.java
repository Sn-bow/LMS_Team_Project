package kr.co.jonggak.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.jonggak.beans.BoardInfoBean;

public interface TopMenuDao {
	@Select("select board_info_idx, board_info_name from board_info_table order by board_info_idx")
	List<BoardInfoBean> getTopMenuList();
	
}
