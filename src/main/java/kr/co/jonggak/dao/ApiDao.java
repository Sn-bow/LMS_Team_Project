package kr.co.jonggak.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.jonggak.dto.MyclassDto;

public interface ApiDao {
	@Select("SELECT C.CLA_NAME, C.CLA_OPEN, C.CLA_CLOSE, C.CLA_WEEK, MA.MAJOR_STATE, EL.ELECTIVES_STA "
			+ "FROM MYCLASS M INNER JOIN STUDENT S ON M.STU_ID = S.STU_ID "
			+ "INNER JOIN JCLASS C ON M.CLA_ID = C.CLA_ID "
			+ "INNER JOIN MAJOR MA ON C.MAJOR_ID = MA.MAJOR_ID "
			+ "INNER JOIN ELECTIVES EL ON EL.ELECTIVES_ID = C.ELECTIVES_ID "
			+ "WHERE TO_CHAR(CLA_END, 'YYYY') LIKE '%' || #{year} || '%' AND CLA_SEM = #{semester} AND M.STU_ID = #{id}")
	    List<MyclassDto> getClassesS(@Param("year") int year, @Param("semester") int semester,@Param("id") String id);
	
	@Select("SELECT C.CLA_NAME, C.CLA_OPEN, C.CLA_CLOSE, C.CLA_WEEK, MA.MAJOR_STATE, EL.ELECTIVES_STA "
			+ "FROM PROFESSOR P "
			+ "INNER JOIN JCLASS C ON P.PRO_ID = C.PRO_ID "
			+ "INNER JOIN MAJOR MA ON C.MAJOR_ID = MA.MAJOR_ID "
			+ "INNER JOIN ELECTIVES EL ON EL.ELECTIVES_ID = C.ELECTIVES_ID "
			+ "WHERE TO_CHAR(CLA_END, 'YYYY') LIKE '%' || #{year} || '%' AND CLA_SEM = #{semester} AND P.PRO_ID = #{id}")
	List<MyclassDto> getClassesP(@Param("year") int year, @Param("semester") int semester,@Param("id") String id);

}
