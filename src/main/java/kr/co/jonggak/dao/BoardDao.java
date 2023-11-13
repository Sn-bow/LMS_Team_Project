package kr.co.jonggak.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.jonggak.beans.BoardBean;

public interface BoardDao {
	
	@Select("SELECT * " +
			"FROM notice " +
			"WHERE noti_id = #{noti_id}")
	BoardBean getBoardRead(int noti_id);
	
	@Select("SELECT * " +
			"FROM notice ORDER BY noti_id desc")
	List<BoardBean> getBoardList();

	@Insert("INSERT INTO notice " +
			"VALUES (notice_se.nextval, #{a_id}, #{title}, #{content}, default, sysdate)" )
	int getBoardWrite(BoardBean boardBean);

	@Update("UPDATE notice " +
			"SET title = #{title}, content = #{content} " +
			"WHERE noti_id = #{noti_id}")
	int getBoardModify(BoardBean boardBean);

	@Delete("DELETE FROM notice " + 
			"WHERE noti_id = #{noti_id}")
	int getBoardDelete(int noti_id);

	
	@Select("SELECT * FROM "
			+ " ( SELECT a.*, ROWNUM rnum "
			+ "	  FROM " 
			+ "( SELECT * "
			+ "   FROM notice "
			+ "   ORDER BY noti_id DESC "
			+ "    ) a "
			+ "    WHERE ROWNUM <= #{rownum} "
			+ ") "
			+ "WHERE rnum >= #{rnum}")
	List<BoardBean> getPage(@Param("rnum") int rnum,@Param("rownum") int rownum);

	@Select("SELECT * "
			+ "FROM notice "
			+ "WHERE (#{filter} = '제목' AND title LIKE '%' || #{searchText} || '%') "
			+ "    OR (#{filter} = '작성자' AND a_id LIKE '%' || #{searchText} || '%') "
			+ "    OR (#{filter} = '날짜' AND registration LIKE '%' || #{searchText} || '%')")
	List<BoardBean> getfilterList(@Param("filter") String filter,@Param("searchText") String searchText);
	
	
}
