package com.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.ErrataDTO;
import com.dto.PageDTO;
import com.dto.SchoolDTO;
import com.exception.CommonException;

public class BoardService {

	//페이지
		public PageDTO page(int curPage) throws CommonException{
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
	        for (ErrataDTO errataDTO : list) {
				errataDTO.setqName(selectQName(errataDTO.getqCode()));
			}
			} catch (Exception e) {
				throw new CommonException("페이지 불러오기 실패");
			}
			finally {
				session.close();
			}
			
			//3가지 저장
			pdto.setList(list);
			pdto.setCurPage(curPage);
			pdto.setTotalRecord(totalCount());
			return pdto;
		}//end list()
		
		// qCode로 qName 찾기
		public String selectQName(String qCode) throws CommonException {
			String qName = null;
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
				qName = session.selectOne("selectQName", qCode);
			} catch (Exception e) {
				throw new CommonException("종목 이름 불러오기 실패");
			}finally {
				session.close();
			}
			return qName;
		}//end selectQName

		//전체 레코드 갯수
		public int totalCount() throws CommonException{
			int count = 0;
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
			 count = session.selectOne("totalCount");
			} catch (Exception e) {
				throw new CommonException("글 수 불러오기 실패");
			}finally {
				session.close();
			}
			return count;
		}//end totalCount

		// ssId에 맞는 schoolDTO 얻기
		public SchoolDTO selectSchoolDTO(String ssId) throws CommonException{
			SchoolDTO dto = null;
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
				dto = session.selectOne("selectSchoolDTO", ssId);
			} catch (Exception e) {
				throw new CommonException("학교 정보 불러오기 실패");
			}finally {
				session.close();
			}
			return dto;
		}//end selectSchoolDTO
		
		//페이지 공지사항만
		public PageDTO pageNotice(int curPage) throws CommonException{
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
			} catch (Exception e) {
				throw new CommonException("공지사항 불러오기 실패");
			}finally {
				session.close();
			}
			
			//3가지 저장
			pdto.setList(list);
			pdto.setCurPage(curPage);
			pdto.setTotalRecord(totalCountNotice());
			return pdto;
		}//end pageNotice()
		
		//공지 레코드 갯수
		public int totalCountNotice() throws CommonException{
			int count = 0;
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
			 count = session.selectOne("totalCountNotice");
			} catch (Exception e) {
				throw new CommonException("공지사항 수 불러오기 실패");
			}finally {
				session.close();
			}
			return count;
		}//end totalCountNotice
		
		// 글쓰기
		public void write(ErrataDTO dto) throws CommonException{
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
			 int n = session.insert("write", dto);
			 session.commit();
			} catch (Exception e) {
				throw new CommonException("글쓰기에 실패했습니다 잘못 입력한게 없는지 확인해주세요");
			}finally {
				session.close();
			}
		}//end write
		
		// bNo에 맞는 errataDTO 얻기
		public ErrataDTO selectErrataDTO(int bNo) throws CommonException{
			ErrataDTO dto = null;
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
				dto = session.selectOne("selectErrataDTO", bNo);
			} catch (Exception e) {
				throw new CommonException("글 불러오기 실패");
			}finally {
				session.close();
			}
			return dto;
		}//end totalCount
		
		// Board 업데이트 하기
		public void updateErrata(ErrataDTO dto) throws CommonException{
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
				session.update("updateErrata", dto);
				session.commit();
			} catch (Exception e) {
				throw new CommonException("글 수정 실패");
			}
			finally {
				session.close();
			}
		}//end totalCount
		
		// Board 삭제하기
		public void deleteErrata(int bNo) throws CommonException{
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
				session.delete("deleteErrata", bNo);
				session.commit();
			} catch (Exception e) {
				throw new CommonException("글 삭제 실패");
			}
			finally {
				session.close();
			}
		}//end deleteErrata

		// qName으로  qCode찾기
		public String selectQCode(String qName) throws CommonException {
			String qCode = null;
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
				qCode = session.selectOne("selectQCode", qName);
			} catch (Exception e) {
				throw new CommonException("종목번호 찾기 실패");
			}finally {
				session.close();
			}
			return qCode;
		}//end selectQName
			
}
