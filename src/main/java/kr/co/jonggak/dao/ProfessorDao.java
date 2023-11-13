package kr.co.jonggak.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.jonggak.dto.GradeInsertDto;
import kr.co.jonggak.dto.ProfessorDto;
import kr.co.jonggak.dto.ProfessorInquiryDTO;
import kr.co.jonggak.dto.StudentDto;

public interface ProfessorDao {

	@Select("SELECT " + "j.CLA_ID , j.CLA_NAME , j.CLA_GRADE , j.CLA_WEEK , j.CLA_OPEN , j.CLA_CLOSE , j.CLA_LEVEL, "
			+ "j.CLA_MAXPEO , m.MAJOR_STATE , e.ELECTIVES_STA , c.CLAROOM_NAME " + "FROM JCLASS j "
			+ "INNER JOIN MAJOR m ON j.MAJOR_ID = m.MAJOR_ID "
			+ "INNER JOIN ELECTIVES e ON j.ELECTIVES_ID = e.ELECTIVES_ID "
			+ "INNER JOIN CLASSROOM c ON j.CLAROOM_ID = c.CLAROOM_ID " + "WHERE j.PRO_ID = #{professorId}")
	List<ProfessorInquiryDTO> getClassList(@Param("professorId") String professorId);

	@Insert("INSERT INTO MYGRADE(myCla_id, at_score , m_score, f_score, a_score) VALUES(#{myCla_id}, #{at_score}, #{m_score}, #{f_score}, #{a_score})")
	int getGradeInsert(GradeInsertDto gradeInsertDto);

	@Select("SELECT * FROM professor")
	List<ProfessorDto> getProfessorList();

	@Select("SELECT P.*,D.DEP_NAME AS DEP_NAME "
			+ "FROM professor P "
			+ "JOIN DEPARTMENT D ON P.DEP_ID = D.DEP_ID "
			+ "WHERE (#{filter} = '교번' AND pro_id LIKE '%' || #{searchText} || '%') "
			+ "    OR (#{filter} = '이름' AND pro_name LIKE '%' || #{searchText} || '%') "
			+ "    OR (#{filter} = '전화번호' AND pro_roomNum LIKE '%' || #{searchText} || '%')")
	List<ProfessorDto> getfilterList(@Param("filter") String filter,@Param("searchText") String searchText);

}
