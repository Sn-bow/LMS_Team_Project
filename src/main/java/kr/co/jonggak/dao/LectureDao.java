package kr.co.jonggak.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.jonggak.dto.ClassConfirmDto;
import kr.co.jonggak.dto.LecturInquiryDto;
import kr.co.jonggak.dto.LectureInfoDto;
import kr.co.jonggak.dto.ProfessorToClassDto;

public interface LectureDao {

	@Select("SELECT c.CONFIRM_ID, ci.* "
			+ "FROM CLASSCONFIRM c "
			+ "RIGHT JOIN ( "
			+ "SELECT p.PRO_NAME, cl.* "
			+ "FROM PROFESSOR p "
			+ "JOIN ( "
			+ "        SELECT m.MYCLA_ID, m.STU_ID, m.CLA_ID, j.CLA_NAME, j.PRO_ID, j.CLA_GRADE "
			+ "        FROM MYCLASS m "
			+ "        JOIN JCLASS j ON m.CLA_ID = j.CLA_ID "
			+ "        WHERE STU_ID = #{student_id} "
			+ "        AND TO_CHAR(j.CLA_END, 'YYYY') = #{now_year} "
			+ "        AND j.CLA_SEM = #{cla_sem} "
			+ "    ) cl ON p.PRO_ID = cl.PRO_ID "
			+ ") ci ON c.MYCLA_ID = ci.MYCLA_ID")
	public List<LecturInquiryDto> getLecturInquiryList(@Param("student_id") String student_id, @Param("now_year") String year, @Param("cla_sem") int sem);
	
	@Select("SELECT c.CONFIRM_ID , ci.* FROM CLASSCONFIRM c "
			+ "RIGHT JOIN ( "
			+ "SELECT p.PRO_NAME , cl.* FROM PROFESSOR p "
			+ "JOIN ( "
			+ "SELECT m.MYCLA_ID , m.STU_ID , m.CLA_ID , j.CLA_NAME , j.PRO_ID , j.CLA_GRADE  FROM MYCLASS m "
			+ "JOIN JCLASS j ON m.CLA_ID = j.CLA_ID "
			+ ") cl ON  p.PRO_ID = cl.PRO_ID "
			+ "WHERE STU_ID = #{student_id} "
			+ ") ci ON c.MYCLA_ID = ci.MYCLA_ID "
			+ "WHERE ci.MYCLA_ID = #{mycla_id}")
	public LecturInquiryDto getLecturInquiry(@Param("student_id") String student_id, @Param("mycla_id") int mycla_id);
	
	@Insert("INSERT INTO CLASSCONFIRM(confirm_id, item1, item2, item3, item4, feedback, mycla_id) VALUES(classConfirm_se.nextval, #{item1},#{item2},#{item3},#{item4},#{feedback}, #{myCla_id})")
	public int setClassConfirm(ClassConfirmDto classConfirmDto);
	
	@Select("SELECT jc.CLA_ID, jc.PRO_ID, jc.CLA_NAME, jc.CLA_GRADE, jc.CLA_LEVEL,TO_CHAR(jc.CLA_END,'YYYY') AS CLAYEAR, jc.CLAROOM_ID, jc.CLA_WEEK, jc.CLA_OPEN, jc.CLA_CLOSE, jc.DEP_ID, cr.CLAROOM_NAME "
			+ "FROM jclass jc JOIN classroom cr "
			+ "ON jc.claroom_id = cr.claroom_id "
			+ "WHERE jc.pro_id = #{prf_id} AND TO_CHAR(CLA_END,'YYYY')= #{year}")
	public List<ProfessorToClassDto> getPrfClassList(@Param("prf_id") String professor_id, @Param("year") String year);
	
	@Select("SELECT "
			+ "    COUNT(*) AS all_student_count, "
			+ "    COUNT(cf.mycla_id) AS response_student_count, "
			+ "    NVL(AVG(item1),0) AS item1_avg, "
			+ "    NVL(AVG(item2),0) AS item2_avg, "
			+ "    NVL(AVG(item3),0) AS item3_avg, "
			+ "    NVL(AVG(item4),0) AS item4_avg  "
			+ "FROM myclass mc "
			+ "LEFT JOIN classconfirm cf ON mc.mycla_id = cf.mycla_id "
			+ "WHERE mc.cla_id = #{cla_id}")
	public LectureInfoDto getLectureInfo(@Param("cla_id") int cla_id);
	
	@Select("SELECT cf.FEEDBACK FROM myclass mc JOIN classconfirm cf ON mc.mycla_id = cf.mycla_id WHERE cla_id = #{cla_id}")
	public List<String> getFeedbackList(@Param("cla_id") int cla_id);
}
