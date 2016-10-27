package com.refresh;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;

import com.exception.CommonException;
import com.service.SelectService;

@WebServlet("/ContextStartServlet")
public class ContextStartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String tsNo = "1608";	// 시험일정번호
		String tsTitle = null;
		ServletContext ctx = getServletContext();
		HttpSession session = request.getSession();
		SelectService service = new SelectService();
		List<String> giSaList = null;
		session.setAttribute("tsNo", tsNo);
		
		/* 매니저 메인 전국 현황 매니저 메인 전국 현황 매니저 메인 전국 현황 매니저 메인 전국 현황 매니저 메인 전국 현황 매니저 메인 전국 현황 매니저 메인 전국 현황 */
		
		TableType allGiSaTableType = new TableType();
		List<String> bonbooList = null;
		
		try {
			tsTitle = service.selectTsTitleBytsNo(tsNo);
			bonbooList = service.selectBonBoo();		// 모든 본부 리스트 가져옴
			giSaList = service.selectQualificationList("기사");// 기사에 해당되는 모든 종목 가져옴(가나다순)
		} catch (CommonException e) {
			e.printStackTrace();
		}	
		int [][] allGiSaArr = new int[giSaList.size()][bonbooList.size()];	// 기사 시험 신청 수 저장 할 배열
		int [][] yesallGiSaArr = new int[giSaList.size()][bonbooList.size()];	// 기사 시험 출석 수 저장 할 배열
		
		Map<String, String> allGiSaPeopleMap = new HashMap<>();
		
		int [] allGiSaHSumArr = new int[giSaList.size()];			// 기사 가로 신청 합 배열
		int [] yesallGiSaHSumArr = new int[giSaList.size()];		// 기사 가로 출석 합 배열
		int [] allGiSaVSumArr = new int[bonbooList.size()];		// 기사 세로 신청 합 배열
		int [] yesallGiSaVSumArr = new int[bonbooList.size()];		// 기사 세로 출석 합 배열
		int allGiSaTotal=0;						// 기사 신청 합
		int yesallGiSaTotal=0;						// 기사 출석 합
		
		
		try {
			
			for(int i=0; i < giSaList.size(); i++)		// 기사 사람 수 구하기
			{
				for(int j=0; j < bonbooList.size(); j++)
				{
					allGiSaPeopleMap.put("qName", giSaList.get(i));	// 종목이름
					allGiSaPeopleMap.put("S_BONBOO", bonbooList.get(j));	// 본부이름
					allGiSaPeopleMap.put("tsNo", tsNo);	// 일정
					allGiSaArr[i][j] =  service.selectSubmitPeople(allGiSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
					yesallGiSaArr[i][j] = service.selectYesPeople(allGiSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
					allGiSaHSumArr[i] += allGiSaArr[i][j];				// 기사 신청 가로합 더하기
					yesallGiSaHSumArr[i] += yesallGiSaArr[i][j];			// 기사 출석 가로합 더하기
				}
				allGiSaTotal += allGiSaHSumArr[i];					// 기사 신청 총합 더하기
				yesallGiSaTotal += yesallGiSaHSumArr[i];				// 기사 출석 총합 더하기
			}
			for(int j=0; j < bonbooList.size(); j++)		// 기사 세로 신청/출석 합 구하기
			{
				for(int i=0; i < giSaList.size(); i++)		
				{
					allGiSaVSumArr[j] += allGiSaArr[i][j];				// 기사 신청 세로합 더하기
					yesallGiSaVSumArr[j] += yesallGiSaArr[i][j];			// 기사 출석 세로합 더하기
				}
			}
			
		} catch (CommonException e) {
			e.printStackTrace();
		}
		
		
		allGiSaTableType.setArr(allGiSaArr);
		allGiSaTableType.setYesArr(yesallGiSaArr);
		allGiSaTableType.sethSum(allGiSaHSumArr);
		allGiSaTableType.setYesHSum(yesallGiSaHSumArr);
		allGiSaTableType.setvSum(allGiSaVSumArr);
		allGiSaTableType.setYesVSum(yesallGiSaVSumArr);
		allGiSaTableType.setTotal(allGiSaTotal);
		allGiSaTableType.setYesTotal(yesallGiSaTotal);
		
		
		session.setAttribute("bonboo", bonbooList);
		session.setAttribute("allGiSaTableType", allGiSaTableType);
		session.setAttribute("giSaList", giSaList);
		session.setAttribute("tsTitle", tsTitle);
		
		/* 매니저 메인 전국 현황 매니저 메인 전국 현황 매니저 메인 전국 현황 매니저 메인 전국 현황 매니저 메인 전국 현황 매니저 메인 전국 현황 매니저 메인 전국 현황 */
		
		/* 서울지역본부 현황 서울지역본부 현황 서울지역본부 현황 서울지역본부 현황 서울지역본부 현황 서울지역본부 현황 서울지역본부 현황 서울지역본부 현황 서울지역본부 현황*/
		
		TableType seoulGiSaTableType = new TableType();
		List<String> seoulList = null;
		try {
			tsTitle = service.selectTsTitleBytsNo(tsNo);
			seoulList = service.selectGiGwan("서울지역본부");		// 서울의 기관 리스트 가져옴
		} catch (CommonException e) {
			e.printStackTrace();
		}
		int [][] seoulGiSaArr = new int[giSaList.size()][seoulList.size()];	// 기사 시험 신청 수 저장 할 배열
		int [][] yesseoulGiSaArr = new int[giSaList.size()][seoulList.size()];	// 기사 시험 출석 수 저장 할 배열
		
		Map<String, String> seoulGiSaPeopleMap = new HashMap<>();
		
		int [] seoulGiSaHSumArr = new int[giSaList.size()];			// 기사 가로 신청 합 배열
		int [] yesseoulGiSaHSumArr = new int[giSaList.size()];		// 기사 가로 출석 합 배열
		int [] seoulGiSaVSumArr = new int[seoulList.size()];		// 기사 세로 신청 합 배열
		int [] yesseoulGiSaVSumArr = new int[seoulList.size()];		// 기사 세로 출석 합 배열
		int seoulGiSaTotal=0;						// 기사 신청 합
		int yesseoulGiSaTotal=0;					// 기사 출석 합
		
		
		try {
			
			for(int i=0; i < giSaList.size(); i++)		// 기사 사람 수 구하기
			{
				for(int j=0; j < seoulList.size(); j++)
				{
					seoulGiSaPeopleMap.put("qName", giSaList.get(i));	// 종목이름
					seoulGiSaPeopleMap.put("S_BONBOO", "서울지역본부");	// 본부이름
					seoulGiSaPeopleMap.put("S_GIGWAN", seoulList.get(j));	// 기관이름
					seoulGiSaPeopleMap.put("tsNo", tsNo);	// 일정
					seoulGiSaArr[i][j] =  service.selectGigwanSubmitPeople(seoulGiSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
					yesseoulGiSaArr[i][j] = service.selectGigwanYesPeople(seoulGiSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
					seoulGiSaHSumArr[i] += seoulGiSaArr[i][j];				// 기사 신청 가로합 더하기
					yesseoulGiSaHSumArr[i] += yesseoulGiSaArr[i][j];			// 기사 출석 가로합 더하기
				}
				seoulGiSaTotal += seoulGiSaHSumArr[i];					// 기사 신청 총합 더하기
				yesseoulGiSaTotal += yesseoulGiSaHSumArr[i];				// 기사 출석 총합 더하기
			}
			for(int j=0; j < seoulList.size(); j++)		// 기사 세로 신청/출석 합 구하기
			{
				for(int i=0; i < giSaList.size(); i++)		
				{
					seoulGiSaVSumArr[j] += seoulGiSaArr[i][j];				// 기사 신청 세로합 더하기
					yesseoulGiSaVSumArr[j] += yesseoulGiSaArr[i][j];			// 기사 출석 세로합 더하기
				}
			}
			
		} catch (CommonException e) {
			e.printStackTrace();
		}
		
		
		seoulGiSaTableType.setArr(seoulGiSaArr);
		seoulGiSaTableType.setYesArr(yesseoulGiSaArr);
		seoulGiSaTableType.sethSum(seoulGiSaHSumArr);
		seoulGiSaTableType.setYesHSum(yesseoulGiSaHSumArr);
		seoulGiSaTableType.setvSum(seoulGiSaVSumArr);
		seoulGiSaTableType.setYesVSum(yesseoulGiSaVSumArr);
		seoulGiSaTableType.setTotal(seoulGiSaTotal);
		seoulGiSaTableType.setYesTotal(yesseoulGiSaTotal);
		
		
		session.setAttribute("seoul", seoulList);
		session.setAttribute("seoulGiSaTableType", seoulGiSaTableType);
		
		/* 서울지역본부 현황 서울지역본부 현황 서울지역본부 현황 서울지역본부 현황 서울지역본부 현황 서울지역본부 현황 서울지역본부 현황 서울지역본부 현황 서울지역본부 현황*/

		/* 부산지역본부 현황 부산지역본부 현황 부산지역본부 현황 부산지역본부 현황 부산지역본부 현황 부산지역본부 현황 부산지역본부 현황 부산지역본부 현황 부산지역본부 현황*/
		
		TableType busanGiSaTableType = new TableType();
		List<String> busanList = null;
		try {
			tsTitle = service.selectTsTitleBytsNo(tsNo);
			busanList = service.selectGiGwan("부산지역본부");		// 부산의 기관 리스트 가져옴
		} catch (CommonException e) {
			e.printStackTrace();
		}
		int [][] busanGiSaArr = new int[giSaList.size()][busanList.size()];	// 기사 시험 신청 수 저장 할 배열
		int [][] yesbusanGiSaArr = new int[giSaList.size()][busanList.size()];	// 기사 시험 출석 수 저장 할 배열
		
		Map<String, String> busanGiSaPeopleMap = new HashMap<>();
		
		int [] busanGiSaHSumArr = new int[giSaList.size()];			// 기사 가로 신청 합 배열
		int [] yesbusanGiSaHSumArr = new int[giSaList.size()];		// 기사 가로 출석 합 배열
		int [] busanGiSaVSumArr = new int[busanList.size()];		// 기사 세로 신청 합 배열
		int [] yesbusanGiSaVSumArr = new int[busanList.size()];		// 기사 세로 출석 합 배열
		int busanGiSaTotal=0;						// 기사 신청 합
		int yesbusanGiSaTotal=0;					// 기사 출석 합
		
		
		try {
			
			for(int i=0; i < giSaList.size(); i++)		// 기사 사람 수 구하기
			{
				for(int j=0; j < busanList.size(); j++)
				{
					busanGiSaPeopleMap.put("qName", giSaList.get(i));	// 종목이름
					busanGiSaPeopleMap.put("S_BONBOO", "부산지역본부");	// 본부이름
					busanGiSaPeopleMap.put("S_GIGWAN", busanList.get(j));	// 기관이름
					busanGiSaPeopleMap.put("tsNo", tsNo);	// 일정
					busanGiSaArr[i][j] =  service.selectGigwanSubmitPeople(busanGiSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
					yesbusanGiSaArr[i][j] = service.selectGigwanYesPeople(busanGiSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
					busanGiSaHSumArr[i] += busanGiSaArr[i][j];				// 기사 신청 가로합 더하기
					yesbusanGiSaHSumArr[i] += yesbusanGiSaArr[i][j];			// 기사 출석 가로합 더하기
				}
				busanGiSaTotal += busanGiSaHSumArr[i];					// 기사 신청 총합 더하기
				yesbusanGiSaTotal += yesbusanGiSaHSumArr[i];				// 기사 출석 총합 더하기
			}
			for(int j=0; j < busanList.size(); j++)		// 기사 세로 신청/출석 합 구하기
			{
				for(int i=0; i < giSaList.size(); i++)		
				{
					busanGiSaVSumArr[j] += busanGiSaArr[i][j];				// 기사 신청 세로합 더하기
					yesbusanGiSaVSumArr[j] += yesbusanGiSaArr[i][j];			// 기사 출석 세로합 더하기
				}
			}
			
		} catch (CommonException e) {
			e.printStackTrace();
		}
		
		
		busanGiSaTableType.setArr(busanGiSaArr);
		busanGiSaTableType.setYesArr(yesbusanGiSaArr);
		busanGiSaTableType.sethSum(busanGiSaHSumArr);
		busanGiSaTableType.setYesHSum(yesbusanGiSaHSumArr);
		busanGiSaTableType.setvSum(busanGiSaVSumArr);
		busanGiSaTableType.setYesVSum(yesbusanGiSaVSumArr);
		busanGiSaTableType.setTotal(busanGiSaTotal);
		busanGiSaTableType.setYesTotal(yesbusanGiSaTotal);
		
		
		session.setAttribute("busan", busanList);
		session.setAttribute("busanGiSaTableType", busanGiSaTableType);
		
		/* 부산지역본부 현황 부산지역본부 현황 부산지역본부 현황 부산지역본부 현황 부산지역본부 현황 부산지역본부 현황 부산지역본부 현황 부산지역본부 현황 부산지역본부 현황*/

		/* 대구지역본부 현황 대구지역본부 현황 대구지역본부 현황 대구지역본부 현황 대구지역본부 현황 대구지역본부 현황 대구지역본부 현황 대구지역본부 현황 대구지역본부 현황*/
		
		TableType daeguGiSaTableType = new TableType();
		List<String> daeguList = null;
		try {
			tsTitle = service.selectTsTitleBytsNo(tsNo);
			daeguList = service.selectGiGwan("대구지역본부");		// 대구의 기관 리스트 가져옴
		} catch (CommonException e) {
			e.printStackTrace();
		}
		int [][] daeguGiSaArr = new int[giSaList.size()][daeguList.size()];	// 기사 시험 신청 수 저장 할 배열
		int [][] yesdaeguGiSaArr = new int[giSaList.size()][daeguList.size()];	// 기사 시험 출석 수 저장 할 배열
		
		Map<String, String> daeguGiSaPeopleMap = new HashMap<>();
		
		int [] daeguGiSaHSumArr = new int[giSaList.size()];			// 기사 가로 신청 합 배열
		int [] yesdaeguGiSaHSumArr = new int[giSaList.size()];		// 기사 가로 출석 합 배열
		int [] daeguGiSaVSumArr = new int[daeguList.size()];		// 기사 세로 신청 합 배열
		int [] yesdaeguGiSaVSumArr = new int[daeguList.size()];		// 기사 세로 출석 합 배열
		int daeguGiSaTotal=0;						// 기사 신청 합
		int yesdaeguGiSaTotal=0;					// 기사 출석 합
		
		
		try {
			
			for(int i=0; i < giSaList.size(); i++)		// 기사 사람 수 구하기
			{
				for(int j=0; j < daeguList.size(); j++)
				{
					daeguGiSaPeopleMap.put("qName", giSaList.get(i));	// 종목이름
					daeguGiSaPeopleMap.put("S_BONBOO", "대구지역본부");	// 본부이름
					daeguGiSaPeopleMap.put("S_GIGWAN", daeguList.get(j));	// 기관이름
					daeguGiSaPeopleMap.put("tsNo", tsNo);	// 일정
					daeguGiSaArr[i][j] =  service.selectGigwanSubmitPeople(daeguGiSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
					yesdaeguGiSaArr[i][j] = service.selectGigwanYesPeople(daeguGiSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
					daeguGiSaHSumArr[i] += daeguGiSaArr[i][j];				// 기사 신청 가로합 더하기
					yesdaeguGiSaHSumArr[i] += yesdaeguGiSaArr[i][j];			// 기사 출석 가로합 더하기
				}
				daeguGiSaTotal += daeguGiSaHSumArr[i];					// 기사 신청 총합 더하기
				yesdaeguGiSaTotal += yesdaeguGiSaHSumArr[i];				// 기사 출석 총합 더하기
			}
			for(int j=0; j < daeguList.size(); j++)		// 기사 세로 신청/출석 합 구하기
			{
				for(int i=0; i < giSaList.size(); i++)		
				{
					daeguGiSaVSumArr[j] += daeguGiSaArr[i][j];				// 기사 신청 세로합 더하기
					yesdaeguGiSaVSumArr[j] += yesdaeguGiSaArr[i][j];			// 기사 출석 세로합 더하기
				}
			}
			
		} catch (CommonException e) {
			e.printStackTrace();
		}
		
		
		daeguGiSaTableType.setArr(daeguGiSaArr);
		daeguGiSaTableType.setYesArr(yesdaeguGiSaArr);
		daeguGiSaTableType.sethSum(daeguGiSaHSumArr);
		daeguGiSaTableType.setYesHSum(yesdaeguGiSaHSumArr);
		daeguGiSaTableType.setvSum(daeguGiSaVSumArr);
		daeguGiSaTableType.setYesVSum(yesdaeguGiSaVSumArr);
		daeguGiSaTableType.setTotal(daeguGiSaTotal);
		daeguGiSaTableType.setYesTotal(yesdaeguGiSaTotal);
		
		
		session.setAttribute("daegu", daeguList);
		session.setAttribute("daeguGiSaTableType", daeguGiSaTableType);
		
		/* 대구지역본부 현황 대구지역본부 현황 대구지역본부 현황 대구지역본부 현황 대구지역본부 현황 대구지역본부 현황 대구지역본부 현황 대구지역본부 현황 대구지역본부 현황*/

/* 광주지역본부 현황 광주지역본부 현황 광주지역본부 현황 광주지역본부 현황 광주지역본부 현황 광주지역본부 현황 광주지역본부 현황 광주지역본부 현황 광주지역본부 현황*/
		
		TableType gwangjuGiSaTableType = new TableType();
		List<String> gwangjuList = null;
		try {
			tsTitle = service.selectTsTitleBytsNo(tsNo);
			gwangjuList = service.selectGiGwan("광주지역본부");		// 광주의 기관 리스트 가져옴
		} catch (CommonException e) {
			e.printStackTrace();
		}
		int [][] gwangjuGiSaArr = new int[giSaList.size()][gwangjuList.size()];	// 기사 시험 신청 수 저장 할 배열
		int [][] yesgwangjuGiSaArr = new int[giSaList.size()][gwangjuList.size()];	// 기사 시험 출석 수 저장 할 배열
		
		Map<String, String> gwangjuGiSaPeopleMap = new HashMap<>();
		
		int [] gwangjuGiSaHSumArr = new int[giSaList.size()];			// 기사 가로 신청 합 배열
		int [] yesgwangjuGiSaHSumArr = new int[giSaList.size()];		// 기사 가로 출석 합 배열
		int [] gwangjuGiSaVSumArr = new int[gwangjuList.size()];		// 기사 세로 신청 합 배열
		int [] yesgwangjuGiSaVSumArr = new int[gwangjuList.size()];		// 기사 세로 출석 합 배열
		int gwangjuGiSaTotal=0;						// 기사 신청 합
		int yesgwangjuGiSaTotal=0;					// 기사 출석 합
		
		
		try {
			
			for(int i=0; i < giSaList.size(); i++)		// 기사 사람 수 구하기
			{
				for(int j=0; j < gwangjuList.size(); j++)
				{
					gwangjuGiSaPeopleMap.put("qName", giSaList.get(i));	// 종목이름
					gwangjuGiSaPeopleMap.put("S_BONBOO", "광주지역본부");	// 본부이름
					gwangjuGiSaPeopleMap.put("S_GIGWAN", gwangjuList.get(j));	// 기관이름
					gwangjuGiSaPeopleMap.put("tsNo", tsNo);	// 일정
					gwangjuGiSaArr[i][j] =  service.selectGigwanSubmitPeople(gwangjuGiSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
					yesgwangjuGiSaArr[i][j] = service.selectGigwanYesPeople(gwangjuGiSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
					gwangjuGiSaHSumArr[i] += gwangjuGiSaArr[i][j];				// 기사 신청 가로합 더하기
					yesgwangjuGiSaHSumArr[i] += yesgwangjuGiSaArr[i][j];			// 기사 출석 가로합 더하기
				}
				gwangjuGiSaTotal += gwangjuGiSaHSumArr[i];					// 기사 신청 총합 더하기
				yesgwangjuGiSaTotal += yesgwangjuGiSaHSumArr[i];				// 기사 출석 총합 더하기
			}
			for(int j=0; j < gwangjuList.size(); j++)		// 기사 세로 신청/출석 합 구하기
			{
				for(int i=0; i < giSaList.size(); i++)		
				{
					gwangjuGiSaVSumArr[j] += gwangjuGiSaArr[i][j];				// 기사 신청 세로합 더하기
					yesgwangjuGiSaVSumArr[j] += yesgwangjuGiSaArr[i][j];			// 기사 출석 세로합 더하기
				}
			}
			
		} catch (CommonException e) {
			e.printStackTrace();
		}
		
		
		gwangjuGiSaTableType.setArr(gwangjuGiSaArr);
		gwangjuGiSaTableType.setYesArr(yesgwangjuGiSaArr);
		gwangjuGiSaTableType.sethSum(gwangjuGiSaHSumArr);
		gwangjuGiSaTableType.setYesHSum(yesgwangjuGiSaHSumArr);
		gwangjuGiSaTableType.setvSum(gwangjuGiSaVSumArr);
		gwangjuGiSaTableType.setYesVSum(yesgwangjuGiSaVSumArr);
		gwangjuGiSaTableType.setTotal(gwangjuGiSaTotal);
		gwangjuGiSaTableType.setYesTotal(yesgwangjuGiSaTotal);
		
		
		session.setAttribute("gwangju", gwangjuList);
		session.setAttribute("gwangjuGiSaTableType", gwangjuGiSaTableType);
		
		/* 광주지역본부 현황 광주지역본부 현황 광주지역본부 현황 광주지역본부 현황 광주지역본부 현황 광주지역본부 현황 광주지역본부 현황 광주지역본부 현황 광주지역본부 현황*/

/* 대전지역본부 현황 대전지역본부 현황 대전지역본부 현황 대전지역본부 현황 대전지역본부 현황 대전지역본부 현황 대전지역본부 현황 대전지역본부 현황 대전지역본부 현황*/
		
		TableType daejeonGiSaTableType = new TableType();
		List<String> daejeonList = null;
		try {
			tsTitle = service.selectTsTitleBytsNo(tsNo);
			daejeonList = service.selectGiGwan("대전지역본부");		// 대전의 기관 리스트 가져옴
		} catch (CommonException e) {
			e.printStackTrace();
		}
		int [][] daejeonGiSaArr = new int[giSaList.size()][daejeonList.size()];	// 기사 시험 신청 수 저장 할 배열
		int [][] yesdaejeonGiSaArr = new int[giSaList.size()][daejeonList.size()];	// 기사 시험 출석 수 저장 할 배열
		
		Map<String, String> daejeonGiSaPeopleMap = new HashMap<>();
		
		int [] daejeonGiSaHSumArr = new int[giSaList.size()];			// 기사 가로 신청 합 배열
		int [] yesdaejeonGiSaHSumArr = new int[giSaList.size()];		// 기사 가로 출석 합 배열
		int [] daejeonGiSaVSumArr = new int[daejeonList.size()];		// 기사 세로 신청 합 배열
		int [] yesdaejeonGiSaVSumArr = new int[daejeonList.size()];		// 기사 세로 출석 합 배열
		int daejeonGiSaTotal=0;						// 기사 신청 합
		int yesdaejeonGiSaTotal=0;					// 기사 출석 합
		
		
		try {
			
			for(int i=0; i < giSaList.size(); i++)		// 기사 사람 수 구하기
			{
				for(int j=0; j < daejeonList.size(); j++)
				{
					daejeonGiSaPeopleMap.put("qName", giSaList.get(i));	// 종목이름
					daejeonGiSaPeopleMap.put("S_BONBOO", "대전지역본부");	// 본부이름
					daejeonGiSaPeopleMap.put("S_GIGWAN", daejeonList.get(j));	// 기관이름
					daejeonGiSaPeopleMap.put("tsNo", tsNo);	// 일정
					daejeonGiSaArr[i][j] =  service.selectGigwanSubmitPeople(daejeonGiSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
					yesdaejeonGiSaArr[i][j] = service.selectGigwanYesPeople(daejeonGiSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
					daejeonGiSaHSumArr[i] += daejeonGiSaArr[i][j];				// 기사 신청 가로합 더하기
					yesdaejeonGiSaHSumArr[i] += yesdaejeonGiSaArr[i][j];			// 기사 출석 가로합 더하기
				}
				daejeonGiSaTotal += daejeonGiSaHSumArr[i];					// 기사 신청 총합 더하기
				yesdaejeonGiSaTotal += yesdaejeonGiSaHSumArr[i];				// 기사 출석 총합 더하기
			}
			for(int j=0; j < daejeonList.size(); j++)		// 기사 세로 신청/출석 합 구하기
			{
				for(int i=0; i < giSaList.size(); i++)		
				{
					daejeonGiSaVSumArr[j] += daejeonGiSaArr[i][j];				// 기사 신청 세로합 더하기
					yesdaejeonGiSaVSumArr[j] += yesdaejeonGiSaArr[i][j];			// 기사 출석 세로합 더하기
				}
			}
			
		} catch (CommonException e) {
			e.printStackTrace();
		}
		
		
		daejeonGiSaTableType.setArr(daejeonGiSaArr);
		daejeonGiSaTableType.setYesArr(yesdaejeonGiSaArr);
		daejeonGiSaTableType.sethSum(daejeonGiSaHSumArr);
		daejeonGiSaTableType.setYesHSum(yesdaejeonGiSaHSumArr);
		daejeonGiSaTableType.setvSum(daejeonGiSaVSumArr);
		daejeonGiSaTableType.setYesVSum(yesdaejeonGiSaVSumArr);
		daejeonGiSaTableType.setTotal(daejeonGiSaTotal);
		daejeonGiSaTableType.setYesTotal(yesdaejeonGiSaTotal);
		
		
		session.setAttribute("daejeon", daejeonList);
		session.setAttribute("daejeonGiSaTableType", daejeonGiSaTableType);
		
		/* 대전지역본부 현황 대전지역본부 현황 대전지역본부 현황 대전지역본부 현황 대전지역본부 현황 대전지역본부 현황 대전지역본부 현황 대전지역본부 현황 대전지역본부 현황*/

/* 제주지역본부 현황 제주지역본부 현황 제주지역본부 현황 제주지역본부 현황 제주지역본부 현황 제주지역본부 현황 제주지역본부 현황 제주지역본부 현황 제주지역본부 현황*/
		
		TableType jejuGiSaTableType = new TableType();
		List<String> jejuList = null;
		try {
			tsTitle = service.selectTsTitleBytsNo(tsNo);
			jejuList = service.selectGiGwan("제주지역본부");		// 제주의 기관 리스트 가져옴
		} catch (CommonException e) {
			e.printStackTrace();
		}
		int [][] jejuGiSaArr = new int[giSaList.size()][jejuList.size()];	// 기사 시험 신청 수 저장 할 배열
		int [][] yesjejuGiSaArr = new int[giSaList.size()][jejuList.size()];	// 기사 시험 출석 수 저장 할 배열
		
		Map<String, String> jejuGiSaPeopleMap = new HashMap<>();
		
		int [] jejuGiSaHSumArr = new int[giSaList.size()];			// 기사 가로 신청 합 배열
		int [] yesjejuGiSaHSumArr = new int[giSaList.size()];		// 기사 가로 출석 합 배열
		int [] jejuGiSaVSumArr = new int[jejuList.size()];		// 기사 세로 신청 합 배열
		int [] yesjejuGiSaVSumArr = new int[jejuList.size()];		// 기사 세로 출석 합 배열
		int jejuGiSaTotal=0;						// 기사 신청 합
		int yesjejuGiSaTotal=0;					// 기사 출석 합
		
		
		try {
			
			for(int i=0; i < giSaList.size(); i++)		// 기사 사람 수 구하기
			{
				for(int j=0; j < jejuList.size(); j++)
				{
					jejuGiSaPeopleMap.put("qName", giSaList.get(i));	// 종목이름
					jejuGiSaPeopleMap.put("S_BONBOO", "제주지역본부");	// 본부이름
					jejuGiSaPeopleMap.put("S_GIGWAN", jejuList.get(j));	// 기관이름
					jejuGiSaPeopleMap.put("tsNo", tsNo);	// 일정
					jejuGiSaArr[i][j] =  service.selectGigwanSubmitPeople(jejuGiSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
					yesjejuGiSaArr[i][j] = service.selectGigwanYesPeople(jejuGiSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
					jejuGiSaHSumArr[i] += jejuGiSaArr[i][j];				// 기사 신청 가로합 더하기
					yesjejuGiSaHSumArr[i] += yesjejuGiSaArr[i][j];			// 기사 출석 가로합 더하기
				}
				jejuGiSaTotal += jejuGiSaHSumArr[i];					// 기사 신청 총합 더하기
				yesjejuGiSaTotal += yesjejuGiSaHSumArr[i];				// 기사 출석 총합 더하기
			}
			for(int j=0; j < jejuList.size(); j++)		// 기사 세로 신청/출석 합 구하기
			{
				for(int i=0; i < giSaList.size(); i++)		
				{
					jejuGiSaVSumArr[j] += jejuGiSaArr[i][j];				// 기사 신청 세로합 더하기
					yesjejuGiSaVSumArr[j] += yesjejuGiSaArr[i][j];			// 기사 출석 세로합 더하기
				}
			}
			
		} catch (CommonException e) {
			e.printStackTrace();
		}
		
		
		jejuGiSaTableType.setArr(jejuGiSaArr);
		jejuGiSaTableType.setYesArr(yesjejuGiSaArr);
		jejuGiSaTableType.sethSum(jejuGiSaHSumArr);
		jejuGiSaTableType.setYesHSum(yesjejuGiSaHSumArr);
		jejuGiSaTableType.setvSum(jejuGiSaVSumArr);
		jejuGiSaTableType.setYesVSum(yesjejuGiSaVSumArr);
		jejuGiSaTableType.setTotal(jejuGiSaTotal);
		jejuGiSaTableType.setYesTotal(yesjejuGiSaTotal);
		
		
		session.setAttribute("jeju", jejuList);
		session.setAttribute("jejuGiSaTableType", jejuGiSaTableType);
		
		/* 제주지역본부 현황 제주지역본부 현황 제주지역본부 현황 제주지역본부 현황 제주지역본부 현황 제주지역본부 현황 제주지역본부 현황 제주지역본부 현황 제주지역본부 현황*/

/* 인천지사 현황 인천지사 현황 인천지사 현황 인천지사 현황 인천지사 현황 인천지사 현황 인천지사 현황 인천지사 현황 인천지사 현황*/
		
		TableType incheonGiSaTableType = new TableType();
		List<String> incheonList = null;
		try {
			tsTitle = service.selectTsTitleBytsNo(tsNo);
			incheonList = service.selectGiGwan("인천지사");		// 제주의 기관 리스트 가져옴
		} catch (CommonException e) {
			e.printStackTrace();
		}
		int [][] incheonGiSaArr = new int[giSaList.size()][incheonList.size()];	// 기사 시험 신청 수 저장 할 배열
		int [][] yesincheonGiSaArr = new int[giSaList.size()][incheonList.size()];	// 기사 시험 출석 수 저장 할 배열
		
		Map<String, String> incheonGiSaPeopleMap = new HashMap<>();
		
		int [] incheonGiSaHSumArr = new int[giSaList.size()];			// 기사 가로 신청 합 배열
		int [] yesincheonGiSaHSumArr = new int[giSaList.size()];		// 기사 가로 출석 합 배열
		int [] incheonGiSaVSumArr = new int[incheonList.size()];		// 기사 세로 신청 합 배열
		int [] yesincheonGiSaVSumArr = new int[incheonList.size()];		// 기사 세로 출석 합 배열
		int incheonGiSaTotal=0;						// 기사 신청 합
		int yesincheonGiSaTotal=0;					// 기사 출석 합
		
		
		try {
			
			for(int i=0; i < giSaList.size(); i++)		// 기사 사람 수 구하기
			{
				for(int j=0; j < incheonList.size(); j++)
				{
					incheonGiSaPeopleMap.put("qName", giSaList.get(i));	// 종목이름
					incheonGiSaPeopleMap.put("S_BONBOO", "인천지사");	// 본부이름
					incheonGiSaPeopleMap.put("S_GIGWAN", incheonList.get(j));	// 기관이름
					incheonGiSaPeopleMap.put("tsNo", tsNo);	// 일정
					incheonGiSaArr[i][j] =  service.selectGigwanSubmitPeople(incheonGiSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
					yesincheonGiSaArr[i][j] = service.selectGigwanYesPeople(incheonGiSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
					incheonGiSaHSumArr[i] += incheonGiSaArr[i][j];				// 기사 신청 가로합 더하기
					yesincheonGiSaHSumArr[i] += yesincheonGiSaArr[i][j];			// 기사 출석 가로합 더하기
				}
				incheonGiSaTotal += incheonGiSaHSumArr[i];					// 기사 신청 총합 더하기
				yesincheonGiSaTotal += yesincheonGiSaHSumArr[i];				// 기사 출석 총합 더하기
			}
			for(int j=0; j < incheonList.size(); j++)		// 기사 세로 신청/출석 합 구하기
			{
				for(int i=0; i < giSaList.size(); i++)		
				{
					incheonGiSaVSumArr[j] += incheonGiSaArr[i][j];				// 기사 신청 세로합 더하기
					yesincheonGiSaVSumArr[j] += yesincheonGiSaArr[i][j];			// 기사 출석 세로합 더하기
				}
			}
			
		} catch (CommonException e) {
			e.printStackTrace();
		}
		
		
		incheonGiSaTableType.setArr(incheonGiSaArr);
		incheonGiSaTableType.setYesArr(yesincheonGiSaArr);
		incheonGiSaTableType.sethSum(incheonGiSaHSumArr);
		incheonGiSaTableType.setYesHSum(yesincheonGiSaHSumArr);
		incheonGiSaTableType.setvSum(incheonGiSaVSumArr);
		incheonGiSaTableType.setYesVSum(yesincheonGiSaVSumArr);
		incheonGiSaTableType.setTotal(incheonGiSaTotal);
		incheonGiSaTableType.setYesTotal(yesincheonGiSaTotal);
		
		
		session.setAttribute("incheon", incheonList);
		session.setAttribute("incheonGiSaTableType", incheonGiSaTableType);
		
		/* 인천지사 현황 인천지사 현황 인천지사 현황 인천지사 현황 인천지사 현황 인천지사 현황 인천지사 현황 인천지사 현황 인천지사 현황*/

/* 울산지사 현황 울산지사 현황 울산지사 현황 울산지사 현황 울산지사 현황 울산지사 현황 울산지사 현황 울산지사 현황 울산지사 현황*/
		
		TableType ulsanGiSaTableType = new TableType();
		List<String> ulsanList = null;
		try {
			tsTitle = service.selectTsTitleBytsNo(tsNo);
			ulsanList = service.selectGiGwan("울산지사");		// 제주의 기관 리스트 가져옴
		} catch (CommonException e) {
			e.printStackTrace();
		}
		int [][] ulsanGiSaArr = new int[giSaList.size()][ulsanList.size()];	// 기사 시험 신청 수 저장 할 배열
		int [][] yesulsanGiSaArr = new int[giSaList.size()][ulsanList.size()];	// 기사 시험 출석 수 저장 할 배열
		
		Map<String, String> ulsanGiSaPeopleMap = new HashMap<>();
		
		int [] ulsanGiSaHSumArr = new int[giSaList.size()];			// 기사 가로 신청 합 배열
		int [] yesulsanGiSaHSumArr = new int[giSaList.size()];		// 기사 가로 출석 합 배열
		int [] ulsanGiSaVSumArr = new int[ulsanList.size()];		// 기사 세로 신청 합 배열
		int [] yesulsanGiSaVSumArr = new int[ulsanList.size()];		// 기사 세로 출석 합 배열
		int ulsanGiSaTotal=0;						// 기사 신청 합
		int yesulsanGiSaTotal=0;					// 기사 출석 합
		
		
		try {
			
			for(int i=0; i < giSaList.size(); i++)		// 기사 사람 수 구하기
			{
				for(int j=0; j < ulsanList.size(); j++)
				{
					ulsanGiSaPeopleMap.put("qName", giSaList.get(i));	// 종목이름
					ulsanGiSaPeopleMap.put("S_BONBOO", "울산지사");	// 본부이름
					ulsanGiSaPeopleMap.put("S_GIGWAN", ulsanList.get(j));	// 기관이름
					ulsanGiSaPeopleMap.put("tsNo", tsNo);	// 일정
					ulsanGiSaArr[i][j] =  service.selectGigwanSubmitPeople(ulsanGiSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
					yesulsanGiSaArr[i][j] = service.selectGigwanYesPeople(ulsanGiSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
					ulsanGiSaHSumArr[i] += ulsanGiSaArr[i][j];				// 기사 신청 가로합 더하기
					yesulsanGiSaHSumArr[i] += yesulsanGiSaArr[i][j];			// 기사 출석 가로합 더하기
				}
				ulsanGiSaTotal += ulsanGiSaHSumArr[i];					// 기사 신청 총합 더하기
				yesulsanGiSaTotal += yesulsanGiSaHSumArr[i];				// 기사 출석 총합 더하기
			}
			for(int j=0; j < ulsanList.size(); j++)		// 기사 세로 신청/출석 합 구하기
			{
				for(int i=0; i < giSaList.size(); i++)		
				{
					ulsanGiSaVSumArr[j] += ulsanGiSaArr[i][j];				// 기사 신청 세로합 더하기
					yesulsanGiSaVSumArr[j] += yesulsanGiSaArr[i][j];			// 기사 출석 세로합 더하기
				}
			}
			
		} catch (CommonException e) {
			e.printStackTrace();
		}
		
		
		ulsanGiSaTableType.setArr(ulsanGiSaArr);
		ulsanGiSaTableType.setYesArr(yesulsanGiSaArr);
		ulsanGiSaTableType.sethSum(ulsanGiSaHSumArr);
		ulsanGiSaTableType.setYesHSum(yesulsanGiSaHSumArr);
		ulsanGiSaTableType.setvSum(ulsanGiSaVSumArr);
		ulsanGiSaTableType.setYesVSum(yesulsanGiSaVSumArr);
		ulsanGiSaTableType.setTotal(ulsanGiSaTotal);
		ulsanGiSaTableType.setYesTotal(yesulsanGiSaTotal);
		
		
		session.setAttribute("ulsan", ulsanList);
		session.setAttribute("ulsanGiSaTableType", ulsanGiSaTableType);
		
		/* 울산지사 현황 울산지사 현황 울산지사 현황 울산지사 현황 울산지사 현황 울산지사 현황 울산지사 현황 울산지사 현황 울산지사 현황*/

/* 경기지사 현황 경기지사 현황 경기지사 현황 경기지사 현황 경기지사 현황 경기지사 현황 경기지사 현황 경기지사 현황 경기지사 현황*/
		
		TableType gyeonggiGiSaTableType = new TableType();
		List<String> gyeonggiList = null;
		try {
			tsTitle = service.selectTsTitleBytsNo(tsNo);
			gyeonggiList = service.selectGiGwan("경기지사");		// 제주의 기관 리스트 가져옴
		} catch (CommonException e) {
			e.printStackTrace();
		}
		int [][] gyeonggiGiSaArr = new int[giSaList.size()][gyeonggiList.size()];	// 기사 시험 신청 수 저장 할 배열
		int [][] yesgyeonggiGiSaArr = new int[giSaList.size()][gyeonggiList.size()];	// 기사 시험 출석 수 저장 할 배열
		
		Map<String, String> gyeonggiGiSaPeopleMap = new HashMap<>();
		
		int [] gyeonggiGiSaHSumArr = new int[giSaList.size()];			// 기사 가로 신청 합 배열
		int [] yesgyeonggiGiSaHSumArr = new int[giSaList.size()];		// 기사 가로 출석 합 배열
		int [] gyeonggiGiSaVSumArr = new int[gyeonggiList.size()];		// 기사 세로 신청 합 배열
		int [] yesgyeonggiGiSaVSumArr = new int[gyeonggiList.size()];		// 기사 세로 출석 합 배열
		int gyeonggiGiSaTotal=0;						// 기사 신청 합
		int yesgyeonggiGiSaTotal=0;					// 기사 출석 합
		
		
		try {
			
			for(int i=0; i < giSaList.size(); i++)		// 기사 사람 수 구하기
			{
				for(int j=0; j < gyeonggiList.size(); j++)
				{
					gyeonggiGiSaPeopleMap.put("qName", giSaList.get(i));	// 종목이름
					gyeonggiGiSaPeopleMap.put("S_BONBOO", "경기지사");	// 본부이름
					gyeonggiGiSaPeopleMap.put("S_GIGWAN", gyeonggiList.get(j));	// 기관이름
					gyeonggiGiSaPeopleMap.put("tsNo", tsNo);	// 일정
					gyeonggiGiSaArr[i][j] =  service.selectGigwanSubmitPeople(gyeonggiGiSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
					yesgyeonggiGiSaArr[i][j] = service.selectGigwanYesPeople(gyeonggiGiSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
					gyeonggiGiSaHSumArr[i] += gyeonggiGiSaArr[i][j];				// 기사 신청 가로합 더하기
					yesgyeonggiGiSaHSumArr[i] += yesgyeonggiGiSaArr[i][j];			// 기사 출석 가로합 더하기
				}
				gyeonggiGiSaTotal += gyeonggiGiSaHSumArr[i];					// 기사 신청 총합 더하기
				yesgyeonggiGiSaTotal += yesgyeonggiGiSaHSumArr[i];				// 기사 출석 총합 더하기
			}
			for(int j=0; j < gyeonggiList.size(); j++)		// 기사 세로 신청/출석 합 구하기
			{
				for(int i=0; i < giSaList.size(); i++)		
				{
					gyeonggiGiSaVSumArr[j] += gyeonggiGiSaArr[i][j];				// 기사 신청 세로합 더하기
					yesgyeonggiGiSaVSumArr[j] += yesgyeonggiGiSaArr[i][j];			// 기사 출석 세로합 더하기
				}
			}
			
		} catch (CommonException e) {
			e.printStackTrace();
		}
		
		
		gyeonggiGiSaTableType.setArr(gyeonggiGiSaArr);
		gyeonggiGiSaTableType.setYesArr(yesgyeonggiGiSaArr);
		gyeonggiGiSaTableType.sethSum(gyeonggiGiSaHSumArr);
		gyeonggiGiSaTableType.setYesHSum(yesgyeonggiGiSaHSumArr);
		gyeonggiGiSaTableType.setvSum(gyeonggiGiSaVSumArr);
		gyeonggiGiSaTableType.setYesVSum(yesgyeonggiGiSaVSumArr);
		gyeonggiGiSaTableType.setTotal(gyeonggiGiSaTotal);
		gyeonggiGiSaTableType.setYesTotal(yesgyeonggiGiSaTotal);
		
		
		session.setAttribute("gyeonggi", gyeonggiList);
		session.setAttribute("gyeonggiGiSaTableType", gyeonggiGiSaTableType);
		
		/* 경기지사 현황 경기지사 현황 경기지사 현황 경기지사 현황 경기지사 현황 경기지사 현황 경기지사 현황 경기지사 현황 경기지사 현황*/

/* 충남지사 현황 충남지사 현황 충남지사 현황 충남지사 현황 충남지사 현황 충남지사 현황 충남지사 현황 충남지사 현황 충남지사 현황*/
		
		TableType chungnamGiSaTableType = new TableType();
		List<String> chungnamList = null;
		try {
			tsTitle = service.selectTsTitleBytsNo(tsNo);
			chungnamList = service.selectGiGwan("충남지사");		// 제주의 기관 리스트 가져옴
		} catch (CommonException e) {
			e.printStackTrace();
		}
		int [][] chungnamGiSaArr = new int[giSaList.size()][chungnamList.size()];	// 기사 시험 신청 수 저장 할 배열
		int [][] yeschungnamGiSaArr = new int[giSaList.size()][chungnamList.size()];	// 기사 시험 출석 수 저장 할 배열
		
		Map<String, String> chungnamGiSaPeopleMap = new HashMap<>();
		
		int [] chungnamGiSaHSumArr = new int[giSaList.size()];			// 기사 가로 신청 합 배열
		int [] yeschungnamGiSaHSumArr = new int[giSaList.size()];		// 기사 가로 출석 합 배열
		int [] chungnamGiSaVSumArr = new int[chungnamList.size()];		// 기사 세로 신청 합 배열
		int [] yeschungnamGiSaVSumArr = new int[chungnamList.size()];		// 기사 세로 출석 합 배열
		int chungnamGiSaTotal=0;						// 기사 신청 합
		int yeschungnamGiSaTotal=0;					// 기사 출석 합
		
		
		try {
			
			for(int i=0; i < giSaList.size(); i++)		// 기사 사람 수 구하기
			{
				for(int j=0; j < chungnamList.size(); j++)
				{
					chungnamGiSaPeopleMap.put("qName", giSaList.get(i));	// 종목이름
					chungnamGiSaPeopleMap.put("S_BONBOO", "충남지사");	// 본부이름
					chungnamGiSaPeopleMap.put("S_GIGWAN", chungnamList.get(j));	// 기관이름
					chungnamGiSaPeopleMap.put("tsNo", tsNo);	// 일정
					chungnamGiSaArr[i][j] =  service.selectGigwanSubmitPeople(chungnamGiSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
					yeschungnamGiSaArr[i][j] = service.selectGigwanYesPeople(chungnamGiSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
					chungnamGiSaHSumArr[i] += chungnamGiSaArr[i][j];				// 기사 신청 가로합 더하기
					yeschungnamGiSaHSumArr[i] += yeschungnamGiSaArr[i][j];			// 기사 출석 가로합 더하기
				}
				chungnamGiSaTotal += chungnamGiSaHSumArr[i];					// 기사 신청 총합 더하기
				yeschungnamGiSaTotal += yeschungnamGiSaHSumArr[i];				// 기사 출석 총합 더하기
			}
			for(int j=0; j < chungnamList.size(); j++)		// 기사 세로 신청/출석 합 구하기
			{
				for(int i=0; i < giSaList.size(); i++)		
				{
					chungnamGiSaVSumArr[j] += chungnamGiSaArr[i][j];				// 기사 신청 세로합 더하기
					yeschungnamGiSaVSumArr[j] += yeschungnamGiSaArr[i][j];			// 기사 출석 세로합 더하기
				}
			}
			
		} catch (CommonException e) {
			e.printStackTrace();
		}
		
		
		chungnamGiSaTableType.setArr(chungnamGiSaArr);
		chungnamGiSaTableType.setYesArr(yeschungnamGiSaArr);
		chungnamGiSaTableType.sethSum(chungnamGiSaHSumArr);
		chungnamGiSaTableType.setYesHSum(yeschungnamGiSaHSumArr);
		chungnamGiSaTableType.setvSum(chungnamGiSaVSumArr);
		chungnamGiSaTableType.setYesVSum(yeschungnamGiSaVSumArr);
		chungnamGiSaTableType.setTotal(chungnamGiSaTotal);
		chungnamGiSaTableType.setYesTotal(yeschungnamGiSaTotal);
		
		
		session.setAttribute("chungnam", chungnamList);
		session.setAttribute("chungnamGiSaTableType", chungnamGiSaTableType);
		
		/* 충남지사 현황 충남지사 현황 충남지사 현황 충남지사 현황 충남지사 현황 충남지사 현황 충남지사 현황 충남지사 현황 충남지사 현황*/

/* 충북지사 현황 충북지사 현황 충북지사 현황 충북지사 현황 충북지사 현황 충북지사 현황 충북지사 현황 충북지사 현황 충북지사 현황*/
		
		TableType chungbukGiSaTableType = new TableType();
		List<String> chungbukList = null;
		try {
			tsTitle = service.selectTsTitleBytsNo(tsNo);
			chungbukList = service.selectGiGwan("충북지사");		// 제주의 기관 리스트 가져옴
		} catch (CommonException e) {
			e.printStackTrace();
		}
		int [][] chungbukGiSaArr = new int[giSaList.size()][chungbukList.size()];	// 기사 시험 신청 수 저장 할 배열
		int [][] yeschungbukGiSaArr = new int[giSaList.size()][chungbukList.size()];	// 기사 시험 출석 수 저장 할 배열
		
		Map<String, String> chungbukGiSaPeopleMap = new HashMap<>();
		
		int [] chungbukGiSaHSumArr = new int[giSaList.size()];			// 기사 가로 신청 합 배열
		int [] yeschungbukGiSaHSumArr = new int[giSaList.size()];		// 기사 가로 출석 합 배열
		int [] chungbukGiSaVSumArr = new int[chungbukList.size()];		// 기사 세로 신청 합 배열
		int [] yeschungbukGiSaVSumArr = new int[chungbukList.size()];		// 기사 세로 출석 합 배열
		int chungbukGiSaTotal=0;						// 기사 신청 합
		int yeschungbukGiSaTotal=0;					// 기사 출석 합
		
		
		try {
			
			for(int i=0; i < giSaList.size(); i++)		// 기사 사람 수 구하기
			{
				for(int j=0; j < chungbukList.size(); j++)
				{
					chungbukGiSaPeopleMap.put("qName", giSaList.get(i));	// 종목이름
					chungbukGiSaPeopleMap.put("S_BONBOO", "충북지사");	// 본부이름
					chungbukGiSaPeopleMap.put("S_GIGWAN", chungbukList.get(j));	// 기관이름
					chungbukGiSaPeopleMap.put("tsNo", tsNo);	// 일정
					chungbukGiSaArr[i][j] =  service.selectGigwanSubmitPeople(chungbukGiSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
					yeschungbukGiSaArr[i][j] = service.selectGigwanYesPeople(chungbukGiSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
					chungbukGiSaHSumArr[i] += chungbukGiSaArr[i][j];				// 기사 신청 가로합 더하기
					yeschungbukGiSaHSumArr[i] += yeschungbukGiSaArr[i][j];			// 기사 출석 가로합 더하기
				}
				chungbukGiSaTotal += chungbukGiSaHSumArr[i];					// 기사 신청 총합 더하기
				yeschungbukGiSaTotal += yeschungbukGiSaHSumArr[i];				// 기사 출석 총합 더하기
			}
			for(int j=0; j < chungbukList.size(); j++)		// 기사 세로 신청/출석 합 구하기
			{
				for(int i=0; i < giSaList.size(); i++)		
				{
					chungbukGiSaVSumArr[j] += chungbukGiSaArr[i][j];				// 기사 신청 세로합 더하기
					yeschungbukGiSaVSumArr[j] += yeschungbukGiSaArr[i][j];			// 기사 출석 세로합 더하기
				}
			}
			
		} catch (CommonException e) {
			e.printStackTrace();
		}
		
		
		chungbukGiSaTableType.setArr(chungbukGiSaArr);
		chungbukGiSaTableType.setYesArr(yeschungbukGiSaArr);
		chungbukGiSaTableType.sethSum(chungbukGiSaHSumArr);
		chungbukGiSaTableType.setYesHSum(yeschungbukGiSaHSumArr);
		chungbukGiSaTableType.setvSum(chungbukGiSaVSumArr);
		chungbukGiSaTableType.setYesVSum(yeschungbukGiSaVSumArr);
		chungbukGiSaTableType.setTotal(chungbukGiSaTotal);
		chungbukGiSaTableType.setYesTotal(yeschungbukGiSaTotal);
		
		
		session.setAttribute("chungbuk", chungbukList);
		session.setAttribute("chungbukGiSaTableType", chungbukGiSaTableType);
		
		/* 충북지사 현황 충북지사 현황 충북지사 현황 충북지사 현황 충북지사 현황 충북지사 현황 충북지사 현황 충북지사 현황 충북지사 현황*/
		
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
