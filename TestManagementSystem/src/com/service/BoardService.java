package com.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.ErrataDTO;
import com.dto.PageDTO;
import com.dto.SchoolDTO;

public class BoardService {

	//페이지
		public PageDTO page(int curPage){
			PageDTO pdto = new PageDTO();
			List<ErrataDTO> list = null;
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
			   //new RowBounds(시작, 갯수))
			int count = pdto.getPerPage();	
			int skip = (curPage-1)*count;
	        list = session.selectList("list", null, new RowBounds(skip, count));
				
	        for (ErrataDTO errataDTO : list) {
				errataDTO.setSchoolDTO(selectSchoolDTO(errataDTO.getSsId()));
			}
			}finally {
				session.close();
			}
			
			//3가지 저장
			pdto.setList(list);
			pdto.setCurPage(curPage);
			pdto.setTotalRecord(totalCount());
			return pdto;
		}//end list()
		
		//전체 레코드 갯수
		public int totalCount(){
			int count = 0;
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
			 count = session.selectOne("totalCount");
			}finally {
				session.close();
			}
			return count;
		}//end totalCount

		// ssId에 맞는 schoolDTO 얻기
		public SchoolDTO selectSchoolDTO(String ssId){
			SchoolDTO dto = null;
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
				dto = session.selectOne("selectSchoolDTO", ssId);
			}finally {
				session.close();
			}
			return dto;
		}//end totalCount
		
		//페이지 공지사항만
		public PageDTO pageNotice(int curPage){
			PageDTO pdto = new PageDTO();
			List<ErrataDTO> list = null;
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
			   //new RowBounds(시작, 갯수))
			int count = pdto.getPerPage();	
			int skip = (curPage-1)*count;
	        list = session.selectList("listNotice", null, new RowBounds(skip, count));
				
	        for (ErrataDTO errataDTO : list) {
				errataDTO.setSchoolDTO(selectSchoolDTO(errataDTO.getSsId()));
			}
			}finally {
				session.close();
			}
			
			//3가지 저장
			pdto.setList(list);
			pdto.setCurPage(curPage);
			pdto.setTotalRecord(totalCountNotice());
			return pdto;
		}//end pageNotice()
		
		//전체 레코드 갯수
		public int totalCountNotice(){
			int count = 0;
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
			 count = session.selectOne("totalCountNotice");
			}finally {
				session.close();
			}
			return count;
		}//end totalCountNotice
		
		// 글쓰기
		public void write(ErrataDTO dto){
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
			 int n = session.insert("write", dto);
			 session.commit();
			}finally {
				session.close();
			}
		}//end write
		
		// bNo에 맞는 errataDTO 얻기
		public ErrataDTO selectErrataDTO(int bNo){
			ErrataDTO dto = null;
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
				dto = session.selectOne("selectErrataDTO", bNo);
			}finally {
				session.close();
			}
			return dto;
		}//end totalCount
		
		// Board 업데이트 하기
		public void updateErrata(ErrataDTO dto){
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
				session.update("updateErrata", dto);
				session.commit();
			}
			finally {
				session.close();
			}
		}//end totalCount
		
		// Board 삭제하기
		public void deleteErrata(int bNo){
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
				session.delete("deleteErrata", bNo);
				session.commit();
			}
			finally {
				session.close();
			}
		}//end deleteErrata
}