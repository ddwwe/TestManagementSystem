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
	
	//감독관 회원정보 수정
	public void updateMember(SupervisorDTO dto) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.update("updateMember", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원등록 실패");
		} finally {
			session.close();
		}
	}
	
}
