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
	
	// 과목이름 불러오기*
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

		// s_bonboo대로 기관이름 가져오기*
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
		
		// qCode 불러오기*
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
		
		// s_Code 불러오기*
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

		// tsNo 불러오기*
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

		// 참석인원 구하기*
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

		// 신청인원 구하기*
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

		// 통계테이블에 인원수 넣기*
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

		// 본부 숫자, 이름 불러오기*
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

		// 메인 통계 값 불러오기*
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
		
		// 일정이름 불러오기*
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

		// 학교이름 불러오기*
		public List<PlaceDTO> selectName(HashMap<String, String> map) throws CommonException {
			List<PlaceDTO> GiGwanList = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				GiGwanList = session.selectList("selectName", map);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("학교이름 불러오기 실패");
			} finally {
				session.close();
			}
			return GiGwanList;
		}// end selectName

		// 시험실 이름 불러오기*
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

		// 맵으로 sCode 찾기*
		public String searchScodeByMap(HashMap<String, String> map) throws CommonException {
			String sCode = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				sCode = session.selectOne("searchScodeByMap", map);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("맵으로 sCode 불러오기 실패");
			} finally {
				session.close();
			}
			return sCode;
		}// end searchScodeByMap

		// sCode+tsNo로 학생정보 찾기*
		public List<HashMap<String, String>> searchStudentDataByScode(String sCodeTsNo) throws CommonException {
			List<HashMap<String, String>> list = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				list = session.selectList("searchStudentDataByScode", sCodeTsNo);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("sCode+tsNo로 학생정보 불러오기 실패");
			} finally {
				session.close();
			}
			return list;
		}// end searchStudentDataByScode

		// sCode와 tsNo로 감독관 정보 찾기*
		public List<HashMap<String, String>> searchSupervisorDataByScode(HashMap<String, String> map) throws CommonException {
			List<HashMap<String, String>> list = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				list = session.selectList("searchSupervisorDataByScode", map);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonException("sCode+tsNo로 감독관정보 불러오기 실패");
			} finally {
				session.close();
			}
			return list;
		}// end searchStudentDataByScode
		
}
