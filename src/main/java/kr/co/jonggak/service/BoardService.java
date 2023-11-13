package kr.co.jonggak.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jonggak.beans.BoardBean;
import kr.co.jonggak.dao.BoardDao;

@Service
public class BoardService {
	@Autowired
	private BoardDao boardDao;
	
	public List<BoardBean> getBoardList() {
		List<BoardBean> boardList = boardDao.getBoardList();
		return boardList;
	}

	public BoardBean getBoardRead(int noti_id) {
		BoardBean boardDto = boardDao.getBoardRead(noti_id);
		System.out.println("getBoardRead()");
		return boardDto;
	}

	public int getBoardWrite(BoardBean boardBean) {
		int boardDto = boardDao.getBoardWrite(boardBean);
		System.out.println("getBoardWrite()");
		return boardDto;
	}

	public int getBoardModify(BoardBean boardDto) {
		int boardList = boardDao.getBoardModify(boardDto);
		System.out.println("getBoardModify()");
		return boardList;
	}
	
	public int getBoardDelete(int noti_id) {
		int boardList = boardDao.getBoardDelete(noti_id);
		System.out.println("getBoardDelete()");
		return boardList;
	}

	public List<BoardBean> getPage5(int page) {
		int rnum = 1;
		int rownum = page * 5;
		if(page > 1) {
			rnum = ((page-1)*5) + 1;
		}
		return boardDao.getPage(rnum, rownum);
	}
	
	public List<BoardBean> getPage10(int page) {
		int rnum = 1;
		int rownum = page * 10;
		if(page > 1) {
			rnum = ((page-1)*10) + 1;
		}
		return boardDao.getPage(rnum, rownum);
	}

	public List<BoardBean> getfilterList(String filter, String searchText) {
		return boardDao.getfilterList(filter,searchText);
	}
	
}
