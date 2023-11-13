package kr.co.jonggak.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.jonggak.dto.StuAllGradeDto;
import kr.co.jonggak.dto.StuNowGradeDto;
import kr.co.jonggak.dto.StudentDto;
import kr.co.jonggak.dto.StudentRequest;

public interface StudentDao {

	// 금학기 성적조회
	@Select("SELECT jc.cla_name, p.pro_name, jc.cla_grade, mg.at_score, mg.m_score, mg.f_score, mg.a_score, "
			+ "    CASE " + "        WHEN s.dep_id = jc.dep_id AND jc.major_id != 3 THEN "
			+ "            (SELECT major_state FROM major WHERE major_id = jc.major_id) "
			+ "        WHEN jc.major_id = 3 THEN "
			+ "            (SELECT electives_sta FROM electives WHERE electives_id = jc.electives_id) "
			+ "        ELSE "
			+ "            (SELECT electives_sta FROM electives WHERE electives_id = jc.electives_id) "
			+ "    END AS cla_state " + "FROM myClass mc " + "JOIN jclass jc ON mc.cla_id = jc.cla_id "
			+ "JOIN professor p ON jc.pro_id = p.pro_id " + "LEFT JOIN myGrade mg ON mc.myCla_id = mg.myCla_id "
			+ "LEFT JOIN student s ON mc.stu_id = s.stu_id "
			+ "WHERE mc.stu_id = #{stu_id} AND TO_CHAR(jc.cla_end, 'YYYY') = #{now_year} AND jc.cla_sem = #{cla_sem}")
	List<StuNowGradeDto> getStuNowGrade(@Param("stu_id") String stu_id, @Param("now_year") String now_year, @Param("cla_sem") int cla_sem);

	// 전체 성적 조회 - 년도/ 학기별취득학점
		@Select("SELECT TO_CHAR(jc.cla_end, 'YYYY') AS choess_year, jc.cla_sem, "
				+ "    SUM( CASE WHEN jc.dep_id = s.dep_id THEN jc.cla_grade ELSE 0 END) AS applyM_grade, "
				+ "    SUM( CASE WHEN jc.dep_id != s.dep_id THEN jc.cla_grade ELSE 0 END) AS applyE_grade, "
				+ "    SUM( CASE WHEN jc.dep_id = s.dep_id THEN jc.cla_grade ELSE 0 END + CASE WHEN jc.dep_id != s.dep_id THEN jc.cla_grade ELSE 0 END) AS applyTotal_grade, "
				+ "    SUM( CASE WHEN jc.dep_id = s.dep_id AND (mg.at_score + mg.m_score + mg.f_score + mg.a_score > 60) THEN jc.cla_grade ELSE 0 END) AS getM_grade, "
				+ "    SUM( CASE WHEN jc.dep_id != s.dep_id AND (mg.at_score + mg.m_score + mg.f_score + mg.a_score > 60) THEN jc.cla_grade ELSE 0 END) AS getE_grade, "
				+ "    SUM( CASE WHEN jc.dep_id = s.dep_id AND (mg.at_score + mg.m_score + mg.f_score + mg.a_score > 60) THEN jc.cla_grade ELSE 0 END + "
				+ "    	 CASE WHEN jc.dep_id != s.dep_id AND (mg.at_score + mg.m_score + mg.f_score + mg.a_score > 60) THEN jc.cla_grade ELSE 0 END) AS getTotal_gtade, "
				+ "	   COUNT(*) AS cla_count "
				+ "FROM myClass mc "
				+ "JOIN mygrade mg ON mc.mycla_id = mg.mycla_id "
				+ "JOIN jclass jc ON mc.cla_id = jc.cla_id "
				+ "JOIN student s ON mc.stu_id = s.stu_id "
				+ "WHERE mc.stu_id = #{stu_id} "
				+ "GROUP BY "
				+ "    TO_CHAR(jc.cla_end, 'YYYY'), "
				+ "    jc.cla_sem, s.stu_id "
				+ "ORDER BY choess_year ASC, jc.cla_sem ASC")
	List<StuAllGradeDto> getStuApplyGrade(String stu_id);

	@Select("SELECT TO_CHAR(jc.cla_end, 'YYYY') AS choess_year, jc.cla_sem, jc.cla_id, jc.cla_name, jc.cla_grade, "
			+ "    CASE WHEN jc.dep_id = s.dep_id AND jc.major_id != 3 THEN "
			+ "        (SELECT major_state FROM MAJOR WHERE major_id = jc.major_id) "
			+ "        ELSE "
			+ "        (SELECT electives_sta FROM electives WHERE electives_id = jc.electives_id) "
			+ "    END AS cla_state, "
			+ "    sum(mg.at_score + mg.m_score + mg.f_score + mg.a_score) AS total_score "
			+ "FROM jclass jc "
			+ "JOIN myClass mc ON mc.cla_id = jc.cla_id "
			+ "JOIN student s ON mc.stu_id = s.stu_id "
			+ "JOIN MYGRADE mg ON mc.mycla_id = mg.mycla_id "
			+ "WHERE mc.stu_id = #{stu_id}"
			+ "AND TO_CHAR(jc.cla_end, 'YYYY') = #{choess_year} "
			+ "AND jc.cla_sem = #{cla_sem}"
			+ "GROUP BY "
			+ "    TO_CHAR(jc.cla_end, 'YYYY'), s.stu_id, "
			+ "    jc.cla_sem, jc.cla_id, jc.cla_name, jc.cla_grade, jc.dep_id, s.dep_id, jc.major_id, jc.electives_id")
	List<StuAllGradeDto> getMinuteGrade(StudentRequest studentRequest);

	@Select("SELECT * FROM student")
		List<StudentDto> getStudentList();
	
	@Select("SELECT S.*,D.DEP_NAME AS DEP_NAME "
			+ "FROM student s "
			+ "JOIN DEPARTMENT D ON S.DEP_ID = D.DEP_ID "
			+ "WHERE (#{filter} = '학번' AND stu_id LIKE '%' || #{searchText} || '%') "
			+ "    OR (#{filter} = '이름' AND stu_name LIKE '%' || #{searchText} || '%') "
			+ "    OR (#{filter} = '생년월일' AND stu_rnn LIKE '%' || #{searchText} || '%') "
			+ "    OR (#{filter} = '전화번호' AND stu_phoneNum LIKE '%' || #{searchText} || '%')")
	List<StudentDto> getfilterList(@Param("filter") String filter,@Param("searchText") String searchText);

	@Insert("insert into student values(#{stu_id}, #{stu_pw}, #{stu_name}, #{stu_rnn}, #{stu_phoneNum}, #{stu_address}, #{stu_email}, 1, 'P20231023', 1, To_date('23-03','YY-MM'), To_date('26-02','YY-MM'), 1, 2, '재학')")
	int insertStudent(StudentDto sdto);

}
