package kr.co.jonggak.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import kr.co.jonggak.beans.UserBean;

public interface UserDao {

	@Insert("insert into student "
			+ "VALUES (#{user_id}, #{user_pw}, #{user_name}, '970307-1009710', '010-1111-1110', '서울시 강북구 삼각산동', 'test012@gmail.com', 1, 'P20231023', 1, To_date('23-03','YY-MM'), To_date('26-02','YY-MM'), 1, 2, '재학'")
	void addUserInfoS(UserBean joinUserBean);

	@Insert("insert into professor (user_idx, user_name, user_id, user_pw) "
			+ "values (user_seq.nextval, #{user_name}, #{user_id}, #{user_pw})")
	void addUserInfoP(UserBean joinUserBean);

	@Select("select stu_id as user_id " + "from student " + "where stu_id=#{user_id} and stu_pw=#{user_pw}")
	UserBean getLoginUserInfoS(UserBean tempLoginUserBean);

	@Select("select pro_id as user_id " + "from professor " + "where pro_id=#{user_id} and pro_pw=#{user_pw}")
	UserBean getLoginUserInfoP(UserBean tempLoginUserBean);

	@Select("select a_id as user_id " + "from jadmin " + "where a_id=#{user_id} and a_pw=#{user_pw}")
	UserBean getLoginUserInfoA(UserBean tempLoginUserBean);

	@Select("SELECT pro_name " + "FROM professor " + "WHERE pro_id=#{user_id}")
	String getLoginName(String user_id);

	@Select("SELECT D.DEP_NAME AS 분류, S.STU_NAME 학생이름, S.STU_LEVEL 학년, S.STU_SEMESTER 학기 "
			+ "FROM DEPARTMENT D "
			+ "JOIN STUDENT S ON D.DEP_ID = S.DEP_ID "
			+ "WHERE S.STU_ID = #{stu_id}")
	@Results({ @Result(property = "major", column = "분류"), 
				@Result(property = "user_name", column = "학생이름"),
				@Result(property = "level", column = "학년"), 
				@Result(property = "semester", column = "학기") })
	UserBean getInfoS(String stu_id);

	@Select("SELECT D.DEP_NAME FROM DEPARTMENT D " + "JOIN PROFESSOR P ON D.DEP_ID = P.DEP_ID "
			+ "WHERE P.PRO_ID = #{pro_id}")
	String getMajorP(String pro_id);

}