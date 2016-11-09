package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.PlaceDTO;
import com.dto.StatResultDTO;
import com.dto.StatTableDTO;
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
		public List<PlaceDTO> selectGiGwan(String s_bonboo) throws CommonException {
			List<PlaceDTO> GiGwanList = null;
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
		
		// qCode 불러오기
		public List<String> qCodeSearch(String qClass) throws CommonException {
			List<String> list = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				list = session.selectList("qCodeSearch", qClass);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("qCode 검색 실패");
			} finally {
				session.close();
			}
			return list;
		}// end qCodeSearch
		
		// s_Code 불러오기
		public List<String> s_CodeSearch() throws CommonException {
			List<String> list = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				list = session.selectList("s_CodeSearch");
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("s_Code 검색 실패");
			} finally {
				session.close();
			}
			return list;
		}// end s_CodeSearch

		// tsNo 불러오기
		public List<String> tsNoSearch(String tsNo) throws CommonException {
			List<String> list = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				list = session.selectList("tsNoSearch", tsNo);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("tsNo 검색 실패");
			} finally {
				session.close();
			}
			return list;
		}// end tsNoSearch

		// 참석인원 구하기
		public int searchAttend(HashMap<String, String> searchMap) throws CommonException {
			int attend=0;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				attend = session.selectOne("searchAttend", searchMap);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("attend 검색 실패");
			} finally {
				session.close();
			}
			return attend;
		}// end searchAttend

		// 신청인원 구하기
		public int searchSubmit(HashMap<String, String> searchMap) throws CommonException {
			int submit=0;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				submit = session.selectOne("searchSubmit", searchMap);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("submit 검색 실패");
			} finally {
				session.close();
			}
			return submit;
		}// end searchSubmit

		// 통계테이블에 인원수 넣기
		public void updateCount(StatTableDTO dto) throws CommonException {
			
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				int n = session.update("updateCount", dto);
				session.commit();

			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("통계테이블 등록 실패");
			} finally {
				session.close();
			}

		}// end insertCount

		// 본부 숫자, 이름 불러오기
		public List<PlaceDTO> selectBonBoo() throws CommonException {
			List<PlaceDTO> bonbooNoList = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				bonbooNoList = session.selectList("selectBonBooNo");
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("본부 숫자 불러오기 실패");
			} finally {
				session.close();
			}
			return bonbooNoList;
		}// end selectBonBooNo

		// 메인 통계 값 불러오기
		public StatResultDTO CountMain(HashMap<String, String> parameterMap) throws CommonException {
			StatResultDTO resultDTO = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				resultDTO = session.selectOne("CountMain", parameterMap);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("기관이름 불러오기 실패");
			} finally {
				session.close();
			}
			return resultDTO;
		}// end CountMain
		
		// 일정이름 불러오기
		public String searchTsTitle(String tsNo) throws CommonException {
			String tsTitle = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				tsTitle = session.selectOne("searchTsTitle", tsNo);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("일정이름 불러오기 실패");
			} finally {
				session.close();
			}
			return tsTitle;
		}// end CountMain

		public List<PlaceDTO> selectName(HashMap<String, String> map) throws CommonException {
			List<PlaceDTO> GiGwanList = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				GiGwanList = session.selectList("selectName", map);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("기관이름 불러오기 실패");
			} finally {
				session.close();
			}
			return GiGwanList;
		}// end selectName

		public List<PlaceDTO> selectRoom(HashMap<String, String> map) throws CommonException {
			List<PlaceDTO> GiGwanList = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				GiGwanList = session.selectList("selectRoom", map);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("기관이름 불러오기 실패");
			} finally {
				session.close();
			}
			return GiGwanList;
		}// end selectRoom
		
}
