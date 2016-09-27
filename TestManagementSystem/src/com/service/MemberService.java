package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.StudentDTO;
import com.dto.SupervisorDTO;
import com.exception.CommonException;

public class MemberService {

	// 회원로그인
	public StudentDTO login(HashMap<String, String> map) throws CommonException {
		StudentDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("StudentLogin", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("로그인 실패");
		} finally {
			session.close();
		}
		return dto;
	}// end addMember
	
	// 감독관 로그인
	public SupervisorDTO superlogin(HashMap<String, String> map) throws CommonException {
		SupervisorDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("SupervisorLogin", map);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("로그인 실패");
		} finally {
			session.close();
		}
		return dto;
	}// end addMember
}
