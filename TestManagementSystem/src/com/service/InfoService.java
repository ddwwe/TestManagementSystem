package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.SupervisorDTO;

public class InfoService {

	BoardService service = new BoardService();
	
	public List<SupervisorDTO> searchAllSupervisor() {
		SqlSession session = MySqlSessionFactory.getSession();
		List<SupervisorDTO> list = null;
		try{
			list = session.selectList("searchAllSupervisor");
			
			for (SupervisorDTO supervisorDTO : list) {
				supervisorDTO.setSchoolDTO(service.selectSchoolDTO(supervisorDTO.getSsId()));
			}
		}
		finally {
			session.close();
		}
		return list;
	}

	public List<SupervisorDTO> searchSupervisorBySCode(String sCode) {
		SqlSession session = MySqlSessionFactory.getSession();
		List<SupervisorDTO> list = null;
		try{
			list = session.selectList("searchSupervisorBySCode", sCode);
			
			for (SupervisorDTO supervisorDTO : list) {
				supervisorDTO.setSchoolDTO(service.selectSchoolDTO(supervisorDTO.getSsId()));
			}
		}
		finally {
			session.close();
		}
		return list;
	}
		
		
}
