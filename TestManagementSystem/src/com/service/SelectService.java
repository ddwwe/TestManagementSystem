package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.exception.CommonException;

public class SelectService {

	// 일정이름 불러오기(HashMap<년도,등급>)
	public List<String> selectTestSchedule(HashMap<String, String> map) throws CommonException {
		List<String> strList = null;
		map.put("yy", map.get("yy") + "%");
		map.put("tsClass", "%" + map.get("tsClass") + "%");
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			strList = session.selectList("selectTestSchedule", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("일정 이름 불러오기 실패");
		} finally {
			session.close();
		}
		return strList;
	}// end selectTestSchedule
	
	// 본부 이름 불러오기
		public List<String> selectBonBoo() throws CommonException {
			List<String> bonbooList = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				bonbooList = session.selectList("selectBonBoo");
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("본부 이름 불러오기 실패");
			} finally {
				session.close();
			}
			return bonbooList;
		}// end selectTestSchedule
	
	// 과목이름 불러오기
	public List<String> selectQualificationList(String qClass) throws CommonException {
		List<String> strList = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			strList = session.selectList("selectQualificationList", qClass);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("종목 이름 불러오기 실패");
		} finally {
			session.close();
		}
		return strList;
	}// end selectQualificationList
		
	// 1종목-1본부 접수한 인원 수 불러오기
	public int selectSubmitPeople(Map map) throws CommonException {
		int submitNum = 0;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			submitNum = session.selectOne("selectSubmitPeople", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("1종목-1본부 접수한 인원 수 불러오기 실패");
		} finally {
			session.close();
		}
		return submitNum;
	}// end selectSubmitPeople
	
	// 1종목-1본부 참석한 인원 수 불러오기
		public int selectYesPeople(Map map) throws CommonException {
			int submitNum = 0;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				submitNum = session.selectOne("selectYesPeople", map);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("1종목-1본부 참석한 인원 수 불러오기 실패");
			} finally {
				session.close();
			}
			return submitNum;
		}// end selectYesPeople

	// 시험 번호로 시험 이름 불러오기
		public String selectTsTitleBytsNo(String tsNo) throws CommonException {
			String tsTitle = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				tsTitle = session.selectOne("selectTsTitleBytsNo", tsNo);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("시험 이름 불러오기 실패");
			} finally {
				session.close();
			}
			return tsTitle;
		}// end selectTsTitleBytsNo

		// s_bonboo대로 기관이름 가져오기
		public List<String> selectGiGwan(String s_bonboo) throws CommonException {
			List<String> GiGwanList = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				GiGwanList = session.selectList("selectGiGwan", s_bonboo);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("기관이름 불러오기 실패");
			} finally {
				session.close();
			}
			return GiGwanList;
		}// end selectGiGwan
		
		// 1종목-1기관 접수한 인원 수 불러오기
		public int selectGigwanSubmitPeople(Map map) throws CommonException {
			int submitNum = 0;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				submitNum = session.selectOne("selectGigwanSubmitPeople", map);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("1종목-1본부 접수한 인원 수 불러오기 실패");
			} finally {
				session.close();
			}
			return submitNum;
		}// end selectSubmitPeople
		
		// 1종목-1기관 참석한 인원 수 불러오기
		public int selectGigwanYesPeople(Map map) throws CommonException {
			int submitNum = 0;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				submitNum = session.selectOne("selectGigwanYesPeople", map);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("1종목-1본부 참석한 인원 수 불러오기 실패");
			} finally {
				session.close();
			}
			return submitNum;
		}// end selectYesPeople
}
