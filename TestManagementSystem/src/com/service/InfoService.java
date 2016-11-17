package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.SupervisorDTO;
import com.exception.CommonException;

public class InfoService {

	BoardService service = new BoardService();
	
	public List<SupervisorDTO> searchAllSupervisor() throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		List<SupervisorDTO> list = null;
		try{
			list = session.selectList("searchAllSupervisor");
			
			for (SupervisorDTO supervisorDTO : list) {
				supervisorDTO.setSchoolDTO(service.selectSchoolDTO(supervisorDTO.getSsId()));
			}
		} catch (Exception e) {
			throw new CommonException("모든 관리자 불러오기 실패");
		}
		finally {
			session.close();
		}
		return list;
	}

	public List<SupervisorDTO> searchSupervisorBySCode(String sCode) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		List<SupervisorDTO> list = null;
		try{
			list = session.selectList("searchSupervisorBySCode", sCode);
			
			for (SupervisorDTO supervisorDTO : list) {
				supervisorDTO.setSchoolDTO(service.selectSchoolDTO(supervisorDTO.getSsId()));
			}
		} catch (Exception e) {
			throw new CommonException("선택한 장소의 관리자 불러오기 실패");
		}
		finally {
			session.close();
		}
		return list;
	}
		
		
}
