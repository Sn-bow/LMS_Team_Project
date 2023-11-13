package kr.co.jonggak.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.jonggak.dto.ChoseGradeInquiryDto;
import kr.co.jonggak.dto.ClassInforDto;
import kr.co.jonggak.dto.ClassInquiryDto;
import kr.co.jonggak.dto.GradeInquiryDto;
import kr.co.jonggak.dto.MyGradeDto;

public interface GradeDao {

	@Select("SELECT \n"
			+ "        j.CLA_ID , j.CLA_NAME , j.CLA_GRADE , j.CLA_WEEK , j.CLA_OPEN , j.CLA_CLOSE , j.CLA_LEVEL, \n"
			+ "			j.CLA_MAXPEO , m.MAJOR_STATE , e.ELECTIVES_STA , c.CLAROOM_NAME \n"
			+ "			FROM JCLASS j \n"
			+ "			INNER JOIN MAJOR m ON j.MAJOR_ID = m.MAJOR_ID \n"
			+ "			INNER JOIN ELECTIVES e ON j.ELECTIVES_ID = e.ELECTIVES_ID \n"
			+ "			INNER JOIN CLASSROOM c ON j.CLAROOM_ID = c.CLAROOM_ID \n"
			+ "			WHERE j.PRO_ID = #{professorId} AND TO_CHAR(j.cla_end, 'YYYY') = #{now_year} AND j.cla_sem = #{cla_sem}")
	public List<ClassInquiryDto> getProfClassList(@Param("professorId") String porfessorId, @Param("now_year") String now_year, @Param("cla_sem") int cla_sem);
	
	
	@Select("SELECT jc.CLA_ID, jc.CLA_NAME , cr.CLAROOM_NAME , jc.CLA_WEEK , jc.CLA_OPEN , jc.CLA_CLOSE "
			+ "FROM jclass jc "
			+ "INNER JOIN CLASSROOM cr "
			+ "ON jc.CLAROOM_ID = cr.CLAROOM_ID WHERE CLA_ID = #{claId} ")
	public ClassInforDto getClassInfo(@Param("claId") int claId);
	
	@Select("SELECT * FROM v_student_inquiry WHERE CLA_ID = #{claId} AND TO_CHAR(CLA_END, 'YYYY') = #{defaultDate} AND CLA_SEM = #{semster}")
	public List<GradeInquiryDto> getGradeInquiryList(@Param("claId") int claId, @Param("defaultDate") String nowYear, @Param("semster") int sem);
	
	@Select("SELECT * FROM v_student_insert WHERE CLA_ID = #{claId} AND TO_CHAR(CLA_END, 'YYYY') = #{defaultDate} AND CLA_SEM = #{semster}")
	public List<GradeInquiryDto> getGradeInsertList(@Param("claId") int claId, @Param("defaultDate") String nowYear, @Param("semster") int sem);

	@Insert("INSERT INTO MYGRADE(MYCLA_ID, AT_SCORE, M_SCORE, F_SCORE, A_SCORE) VALUES(#{mycla_id},#{at_score},#{m_score},#{f_score},#{a_score})")
	public int setGrade(MyGradeDto myGradeDto); 
	
	@Select("SELECT * FROM MYGRADE WHERE mygrade_id = #{mygrade_id}")
	public MyGradeDto getMyGrade(@Param("mygrade_id") int mygrade_id);
	
	@Update("UPDATE MYGRADE SET AT_SCORE = #{at_score}, M_SCORE = #{m_score}, F_SCORE = #{f_score}, A_SCORE = #{a_score} WHERE MYGRADE_ID = #{mygrade_id}")
	public int updateGrade(MyGradeDto myGradeDto);
	
	@Select("SELECT myc.MYCLA_ID, myc.STU_ID, myc.CLA_ID, myc.AT_SCORE, myc.M_SCORE, myc.F_SCORE, myc.A_SCORE, jc.CLA_NAME, jc.CLA_GRADE, jc.CLA_LEVEL, TO_CHAR(jc.CLA_END, 'YYYY') AS year , jc.DEP_ID, jc.CLA_SEM FROM ( "
			+ "	SELECT mc.MYCLA_ID , mc.STU_ID , mc.CLA_ID , mg.MYGRADE_ID , mg.AT_SCORE , mg.M_SCORE , mg.F_SCORE , mg.A_SCORE FROM myclass mc JOIN MYGRADE mg ON mc.MYCLA_ID = mg.MYCLA_ID "
			+ ") myc JOIN jclass jc ON myc.CLA_ID = jc.CLA_ID WHERE myc.STU_ID = #{stu_id} AND TO_CHAR(jc.CLA_END, 'YYYY') = #{year} AND jc.CLA_SEM = #{cla_sem}")
	public List<ChoseGradeInquiryDto> getChoseGradeInquiryList(@Param("stu_id") String stu_id, @Param("year") String year, @Param("cla_sem") int cla_sem);
	

}
