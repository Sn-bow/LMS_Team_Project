package kr.co.jonggak.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import kr.co.jonggak.dto.EnrolmentDto;

public interface EnrolmentDao {
   @Select("SELECT  "
   		+ "            CASE  "
   		+ "                  WHEN D.DEP_NAME = ( "
   		+ "                      SELECT DEP_NAME "
   		+ "                      FROM STUDENT S "
   		+ "                      JOIN DEPARTMENT D ON S.DEP_ID = D.DEP_ID "
   		+ "                      WHERE S.STU_ID = #{stuId} "
   		+ "                  )  "
   		+ "                  THEN '전공' "
   		+ "                  ELSE '교양' "
   		+ "              END AS 분류,  "
   		+ "              D.DEP_NAME AS 학과이름, "
   		+ "              J.CLA_NAME AS 교과목명, "
   		+ "              J.CLA_LEVEL AS 학년, "
   		+ "              J.CLA_GRADE AS 학점, "
   		+ "              P.PRO_NAME AS 교수명, "
   		+ "              J.CLA_WEEK AS 요일, "
   		+ "              J.CLA_OPEN AS 강의시작시간, "
   		+ "              J.CLA_CLOSE AS 강의종료시간, "
   		+ "              R.CLAROOM_NAME AS 강의실, "
   		+ "              COUNT(J.CLA_ID) AS 수강인원, "
   		+ "              J.CLA_MAXPEO AS 수강인원_MAX, "
   		+ "              J.CLA_ID AS 수강ID,  "
   		+ "              TO_CHAR(J.CLA_END, 'YYYY') AS 종강일자 "
   		+ "              FROM JCLASS J "
   		+ "              JOIN MYCLASS M ON J.CLA_ID = M.CLA_ID "
   		+ "              JOIN DEPARTMENT D ON J.DEP_ID = D.DEP_ID "
   		+ "              JOIN PROFESSOR P ON J.PRO_ID = P.PRO_ID "
   		+ "              JOIN CLASSROOM R ON J.CLAROOM_ID = R.CLAROOM_ID   "
   		+ "              GROUP BY D.DEP_NAME, J.CLA_NAME, J.CLA_LEVEL, J.CLA_GRADE, P.PRO_NAME, "
   		+ "              J.CLA_WEEK, J.CLA_OPEN, J.CLA_CLOSE, D.DEP_ADDRESS, J.CLA_MAXPEO, R.CLAROOM_NAME, J.CLA_ID, J.CLA_END")
    @Results({
           @Result(property = "classification", column = "분류"),
           @Result(property = "dep_name", column = "학과이름"),
           @Result(property = "cla_name", column = "교과목명"),
           @Result(property = "cla_level", column = "학년"),
           @Result(property = "cla_grade", column = "학점"),
           @Result(property = "pro_name", column = "교수명"),
           @Result(property = "cla_week", column = "요일"),
           @Result(property = "cla_open", column = "강의시작시간"),
           @Result(property = "cla_close", column = "강의종료시간"),
           @Result(property = "claroom_name", column = "강의실"),
           @Result(property = "enrolment", column = "수강인원"),
           @Result(property = "enrolmentMax", column = "수강인원_MAX"),
   		   @Result(property = "cla_id", column = "수강ID"),
           @Result(property = "cla_end", column = "종강일자")})
   List<EnrolmentDto> getEnrolmentList(@Param("stuId") String stuId);
   
   @Select("SELECT " +
		   "CASE " +
		   "    WHEN D.DEP_NAME = ( " +
		   "        SELECT DEP_NAME " +
		   "        FROM STUDENT S " +
		   "        JOIN DEPARTMENT D ON S.DEP_ID = D.DEP_ID " +
		   "        WHERE S.STU_ID = #{stuId} " +
		   "    ) " +
		   "    THEN '전공' " +
		   "    ELSE '교양' " +
		   "END AS 분류, " +
		   "D.DEP_NAME AS 학과이름, " +
		   "J.CLA_NAME AS 교과목명, " +
		   "J.CLA_LEVEL AS 학년, " +
		   "J.CLA_GRADE AS 학점, " +
		   "P.PRO_NAME AS 교수명, " +
		   "J.CLA_WEEK AS 요일, " +
		   "J.CLA_OPEN AS 강의시작시간, " +
		   "J.CLA_CLOSE AS 강의종료시간, " +
		   "R.CLAROOM_NAME AS 강의실, " +
		   "COUNT(J.CLA_ID) AS 수강인원, " +
		   "J.CLA_MAXPEO AS 수강인원_MAX, " +
		   "J.CLA_ID AS 수강ID, " +
		   "TO_CHAR(J.CLA_END, 'YYYY') AS 종강일자 " +
		   "FROM JCLASS J " +
		   "JOIN MYCLASS M ON J.CLA_ID = M.CLA_ID " +
		   "JOIN DEPARTMENT D ON J.DEP_ID = D.DEP_ID " +
		   "JOIN PROFESSOR P ON J.PRO_ID = P.PRO_ID " +
		   "JOIN CLASSROOM R ON J.CLAROOM_ID = R.CLAROOM_ID " +
		   "WHERE ( " +
		   "    (D.DEP_NAME = ( " +
		   "        SELECT DEP_NAME " +
		   "        FROM STUDENT S " +
		   "        JOIN DEPARTMENT D ON S.DEP_ID = D.DEP_ID " +
		   "        WHERE S.STU_ID = #{stuId} " +
		   "    ) " +
		   "    AND J.CLA_LEVEL = #{Level} " +
		   "    AND #{variable} = '전공') " +
		   "    OR " +
		   "    (D.DEP_NAME <> ( " +
		   "        SELECT DEP_NAME " +
		   "        FROM STUDENT S " +
		   "        JOIN DEPARTMENT D ON S.DEP_ID = D.DEP_ID " +
		   "        WHERE S.STU_ID = #{stuId} " +
		   "    ) " +
		   "    AND J.CLA_LEVEL = #{Level} " +
		   "    AND #{variable} = '교양') " +
		   ") " +
		   "AND J.CLA_NAME LIKE '%' || #{claNameFilter} || '%' " +
		   "AND TO_CHAR(J.CLA_END, 'YYYY') = #{year} " +
		   "GROUP BY D.DEP_NAME, J.CLA_NAME, J.CLA_LEVEL, J.CLA_GRADE, P.PRO_NAME, " +
		   "J.CLA_WEEK, J.CLA_OPEN, J.CLA_CLOSE, D.DEP_ADDRESS, J.CLA_MAXPEO, R.CLAROOM_NAME, J.CLA_ID, J.CLA_END")
   @Results({
	   @Result(property = "classification", column = "분류"),
	   @Result(property = "dep_name", column = "학과이름"),
	   @Result(property = "cla_name", column = "교과목명"),
	   @Result(property = "cla_level", column = "학년"),
	   @Result(property = "cla_grade", column = "학점"),
	   @Result(property = "pro_name", column = "교수명"),
	   @Result(property = "cla_week", column = "요일"),
	   @Result(property = "cla_open", column = "강의시작시간"),
	   @Result(property = "cla_close", column = "강의종료시간"),
	   @Result(property = "claroom_name", column = "강의실"),
	   @Result(property = "enrolment", column = "수강인원"),
	   @Result(property = "enrolmentMax", column = "수강인원_MAX"),
	   @Result(property = "cla_id", column = "수강ID"),
	   @Result(property = "cla_end", column = "종강일자")})
   List<EnrolmentDto> getEnrolmentListLevel(@Param("stuId") String stuId, @Param("variable") String variable, @Param("claNameFilter") String claNameFilter,@Param("Level") int Level,@Param("year") String year);

   @Select("SELECT "
   		+ "    CASE "
   		+ "        WHEN J.CLA_MAXPEO > ( "
   		+ "            SELECT COUNT(*) "
   		+ "            FROM MYCLASS M "
   		+ "            JOIN JCLASS J ON J.CLA_ID = M.CLA_ID "
   		+ "            WHERE J.CLA_ID = #{claId} "
   		+ "        ) THEN 1 "
   		+ "        ELSE 0 "
   		+ "    END AS 상태 "
   		+ "    FROM JCLASS J WHERE CLA_ID = #{claId}")
   int getStatus(int claId);

   @Insert("INSERT INTO MYCLASS VALUES(myClass_se.nextval,#{stu_id},#{cla_id})")	
   void insertMyclass(@Param("stu_id") String stu_id,@Param("cla_id") int cla_id);

   @Delete("DELETE FROM MYCLASS WHERE stu_id = #{stu_id} AND cla_id = #{cla_id}")
   int deleteMyclass(@Param("stu_id") String stu_id,@Param("cla_id") int cla_id);

   @Select("SELECT CLA_ID FROM "
   		+ "MYCLASS M "
   		+ "JOIN STUDENT S ON S.STU_ID = M.STU_ID "
   		+ "WHERE S.STU_ID = #{stuId}")
   List<Integer> getclaIdList(String stuId);

   @Select("SELECT count(*) FROM MYCLASS M "
   		+ "JOIN STUDENT S ON S.STU_ID = M.STU_ID "
   		+ "JOIN JCLASS J ON J.CLA_ID = M.CLA_ID "
   		+ "JOIN CLASSCONFIRM C ON M.MYCLA_ID = C.MYCLA_ID "
   		+ "WHERE S.STU_ID = #{stu_id} AND M.CLA_ID = #{cla_id}")
   int getConfirmCheck(@Param("stu_id") String stuId,@Param("cla_id") int cla_id);

   @Select("SELECT MYCLA_ID FROM MYCLASS WHERE STU_ID = #{stu_id} AND CLA_ID = #{cla_id}")
   int selectMyclass(@Param("stu_id") String stuId,@Param("cla_id") int cla_id);

   @Delete("DELETE FROM MYGRADE WHERE MYCLA_ID = #{myclaId}")
   int deleteMygrade(int myclaId);


}