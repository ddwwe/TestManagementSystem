package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.ManagerDTO;
import com.exception.CommonException;

public class MemberService {

	// 관리자 로그인
	public ManagerDTO managerLogin(HashMap<String, String> map) throws CommonException {
		ManagerDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("managerLogin", map);
		} catch (Exception e) {
			throw new CommonException("관리자 로그인 실패");
		} finally {
			session.close();
		}
		return dto;
	}// end managerLogin
	
}
