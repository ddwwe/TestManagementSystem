package com.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.ManagerDTO;
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
	
	// 관리자 로그인
	public ManagerDTO managerLogin(HashMap<String, String> map) throws CommonException {
		ManagerDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("managerLogin", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("관리자 로그인 실패");
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

	// 수험생 회원가입
	public void addMember(StudentDTO dto) throws CommonException {

		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.insert("addMember", dto);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원등록 실패");
		} finally {
			session.close();
		}
		
	}

	// 수험생 마이페이지
	public StudentDTO mypage(String eId) throws CommonException {

		StudentDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("mypage", eId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("mypage 실패");
		} finally {
			session.close();
		}
		return dto;
	}
	
	// 수험생 삭제
	public void deleteStudent(String eId) throws CommonException {
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				int n = session.delete("deleteMember", eId);
				session.commit();

			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("회원삭제 실패");
			} finally {
				session.close();
			}
	}

	// 수험생 정보 갱신
	public void updateMember(StudentDTO dto) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.update("updateMember", dto);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원수정 실패");
		} finally {
			session.close();
		}
	}
	
}
