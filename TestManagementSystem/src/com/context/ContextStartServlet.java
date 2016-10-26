package com.context;

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

import com.exception.CommonException;
import com.service.SelectService;

@WebServlet("/ContextStartServlet")
public class ContextStartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext ctx = getServletContext();
		SelectService service = new SelectService();
		TableType giNngSaTableType = new TableType();
		TableType giSaTableType = new TableType();
		TableType giSulSaTableType = new TableType();
		TableType giNngJangTableType = new TableType();
		List<TableType> tableTypeList = new ArrayList<>();
		
		for(int y=15; y < 17; y++)
		{
			String yy = String.valueOf(y);
			List<String> bonbooList = null;
			List<String> giSaList = null;
			List<String> giNngSaList = null;
			List<String> giSulSaList = null;
			List<String> giNngJangList = null;
			try {
				bonbooList = service.selectBonBoo();		// 모든 본부 리스트 가져옴
				giSaList = service.selectQualificationList("기사");// 기사에 해당되는 모든 종목 가져옴(가나다순)
				giNngSaList = service.selectQualificationList("기능사");// 기능사에 해당되는 모든 종목 가져옴(가나다순)
				giSulSaList = service.selectQualificationList("기술사");// 기술사에 해당되는 모든 종목 가져옴(가나다순)
				giNngJangList = service.selectQualificationList("기능장");// 기술사에 해당되는 모든 종목 가져옴(가나다순)
			} catch (CommonException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}						
			
			int [][] giNngSaArr = new int[giNngSaList.size()][bonbooList.size()];	// 기능사 시험 신청 수 저장 할 배열
			int [][] yesGiNngSaArr = new int[giNngSaList.size()][bonbooList.size()];	// 기능사 시험 출석 수 저장 할 배열
			
			int [][] giSaArr = new int[giSaList.size()][bonbooList.size()];	// 기사 시험 신청 수 저장 할 배열
			int [][] yesGiSaArr = new int[giSaList.size()][bonbooList.size()];	// 기사 시험 출석 수 저장 할 배열
			
			int [][] giSulSaArr = new int[giSulSaList.size()][bonbooList.size()];	// 기술사 시험 신청 수 저장 할 배열
			int [][] yesGiSulSaArr = new int[giSulSaList.size()][bonbooList.size()];	// 기술사 시험 출석 수 저장 할 배열
			
			int [][] giNngJangArr = new int[giNngJangList.size()][bonbooList.size()];	// 기능장 시험 신청 수 저장 할 배열
			int [][] yesGiNngJangArr = new int[giNngJangList.size()][bonbooList.size()];	// 기능장 시험 출석 수 저장 할 배열
			
			Map<String, String> giSaPeopleMap = new HashMap<>();
			Map<String, String> giNngSaPeopleMap = new HashMap<>();
			Map<String, String> giSulSaPeopleMap = new HashMap<>();
			Map<String, String> giNngJangPeopleMap = new HashMap<>();

			int [] giNngSaHSumArr = new int[giNngSaList.size()];	// 기능사 가로 신청 합 배열
			int [] yesGiNngSaHSumArr = new int[giNngSaList.size()];	// 기능사 가로 출석 합 배열
			int [] giNngSaVSumArr = new int[bonbooList.size()];		// 기능사 세로 신청 합 배열
			int [] yesGiNngSaVSumArr = new int[bonbooList.size()];	// 기능사 세로 출석 합 배열
			int giNngSaTotal=0;							// 기능사 신청 합
			int yesGiNngSaTotal=0;						// 기능사 출석 합
			
			int [] giSaHSumArr = new int[giSaList.size()];			// 기사 가로 신청 합 배열
			int [] yesGiSaHSumArr = new int[giSaList.size()];		// 기사 가로 출석 합 배열
			int [] giSaVSumArr = new int[bonbooList.size()];		// 기사 세로 신청 합 배열
			int [] yesGiSaVSumArr = new int[bonbooList.size()];		// 기사 세로 출석 합 배열
			int giSaTotal=0;						// 기사 신청 합
			int yesGiSaTotal=0;						// 기사 출석 합
			
			int [] giSulSaHSumArr = new int[giSulSaList.size()];	// 기술사 가로 신청 합 배열
			int [] yesGiSulSaHSumArr = new int[giSulSaList.size()];	// 기술사 가로 출석 합 배열
			int [] giSulSaVSumArr = new int[bonbooList.size()];		// 기술사 세로 신청 합 배열
			int [] yesGiSulSaVSumArr = new int[bonbooList.size()];	// 기술사 세로 출석 합 배열
			int giSulSaTotal=0;							// 기술사 신청 합
			int yesGiSulSaTotal=0;						// 기술사 출석 합
			
			int [] giNngJangHSumArr = new int[giNngJangList.size()];	// 기능장 가로 신청 합 배열
			int [] yesGiNngJangHSumArr = new int[giNngJangList.size()];	// 기능장 가로 출석 합 배열
			int [] giNngJangVSumArr = new int[bonbooList.size()];		// 기능장 세로 신청 합 배열
			int [] yesGiNngJangVSumArr = new int[bonbooList.size()];	// 기능장 세로 출석 합 배열
			int giNngJangTotal=0;						// 기능장 신청 합
			int yesGiNngJangTotal=0;					// 기능장 출석 합
			
			try {
				
				for(int i=0; i < giNngSaList.size(); i++)		// 기능사 사람 수 구하기
				{
					for(int j=0; j < bonbooList.size(); j++)
					{
						giNngSaPeopleMap.put("qName", giNngSaList.get(i));		// 종목이름
						giNngSaPeopleMap.put("S_BONBOO", bonbooList.get(j));	// 본부이름
						giNngSaPeopleMap.put("tsYear", yy);						// 일정년도
						giNngSaArr[i][j] =  service.selectSubmitPeople(giNngSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
						yesGiNngSaArr[i][j] = service.selectYesPeople(giNngSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
						giNngSaHSumArr[i] += giNngSaArr[i][j];				// 기능사 신청 가로합 더하기
						yesGiNngSaHSumArr[i] += yesGiNngSaArr[i][j];		// 기능사 출석 가로합 더하기
					}
					giNngSaTotal += giNngSaHSumArr[i];					// 기능사 신청 총합 더하기
					yesGiNngSaTotal += yesGiNngSaHSumArr[i];			// 기능사 출석 총합 더하기
				}
				for(int j=0; j < bonbooList.size(); j++)		// 기능사 세로 신청/출석 합 구하기
				{
					for(int i=0; i < giNngSaList.size(); i++)		
					{
						giNngSaVSumArr[j] += giNngSaArr[i][j];				// 기능사 신청 세로합 더하기
						yesGiNngSaVSumArr[j] += yesGiNngSaArr[i][j];		// 기능사 출석 세로합 더하기
					}
				}
				
				
				for(int i=0; i < giSaList.size(); i++)		// 기사 사람 수 구하기
				{
					for(int j=0; j < bonbooList.size(); j++)
					{
						giSaPeopleMap.put("qName", giSaList.get(i));	// 종목이름
						giSaPeopleMap.put("S_BONBOO", bonbooList.get(j));	// 본부이름
						giSaPeopleMap.put("tsYear", yy);	// 일정년도
						giSaArr[i][j] =  service.selectSubmitPeople(giSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
						yesGiSaArr[i][j] = service.selectYesPeople(giSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
						giSaHSumArr[i] += giSaArr[i][j];				// 기사 신청 가로합 더하기
						yesGiSaHSumArr[i] += yesGiSaArr[i][j];			// 기사 출석 가로합 더하기
					}
					giSaTotal += giSaHSumArr[i];					// 기사 신청 총합 더하기
					yesGiSaTotal += yesGiSaHSumArr[i];				// 기사 출석 총합 더하기
				}
				for(int j=0; j < bonbooList.size(); j++)		// 기사 세로 신청/출석 합 구하기
				{
					for(int i=0; i < giSaList.size(); i++)		
					{
						giSaVSumArr[j] += giSaArr[i][j];				// 기사 신청 세로합 더하기
						yesGiSaVSumArr[j] += yesGiSaArr[i][j];			// 기사 출석 세로합 더하기
					}
				}
				
				
				for(int i=0; i < giSulSaList.size(); i++)		// 기술사 사람 수 구하기
				{
					for(int j=0; j < bonbooList.size(); j++)
					{
						giSulSaPeopleMap.put("qName", giSulSaList.get(i));	// 종목이름
						giSulSaPeopleMap.put("S_BONBOO", bonbooList.get(j));	// 본부이름
						giSulSaPeopleMap.put("tsYear", yy);	// 일정년도
						giSulSaArr[i][j] =  service.selectSubmitPeople(giSulSaPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
						yesGiSulSaArr[i][j] = service.selectYesPeople(giSulSaPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
						giSulSaHSumArr[i] += giSulSaArr[i][j];					// 기술사 신청 가로합 더하기
						yesGiSulSaHSumArr[i] += yesGiSulSaArr[i][j];			// 기술사 출석 가로합 더하기
					}
					giSulSaTotal += giSulSaHSumArr[i];						// 기술사 신청 총합 더하기
					yesGiSulSaTotal += yesGiSulSaHSumArr[i];				// 기술사 출석 총합 더하기
				}
				for(int j=0; j < bonbooList.size(); j++)		// 기술사 세로 신청/출석 합 구하기
				{
					for(int i=0; i < giSulSaList.size(); i++)		
					{
						giSulSaVSumArr[j] += giSulSaArr[i][j];					// 기술사 신청 세로합 더하기
						yesGiSulSaVSumArr[j] += yesGiSulSaArr[i][j];			// 기술사 출석 세로합 더하기
					}
				}
				
				
				for(int i=0; i < giNngJangList.size(); i++)		// 기능장 사람 수 구하기
				{
					for(int j=0; j < bonbooList.size(); j++)
					{
						giNngJangPeopleMap.put("qName", giNngJangList.get(i));	// 종목이름
						giNngJangPeopleMap.put("S_BONBOO", bonbooList.get(j));	// 본부이름
						giNngJangPeopleMap.put("tsYear", yy);	// 일정년도
						giNngJangArr[i][j] =  service.selectSubmitPeople(giNngJangPeopleMap);	// 종목과 본부이름으로 시험 신청 수 구함
						yesGiNngJangArr[i][j] = service.selectYesPeople(giNngJangPeopleMap);	// 종목과 본부이름으로 참석한 사람 구함
						giNngJangHSumArr[i] += giNngJangArr[i][j];				// 기능장 신청 가로합 더하기
						yesGiNngJangHSumArr[i] += yesGiNngJangArr[i][j];		// 기능장 출석 가로합 더하기
					}
					giNngJangTotal += giNngJangHSumArr[i];					// 기능장 신청 총합 더하기
					yesGiNngJangTotal += yesGiNngJangHSumArr[i];			// 기능장 출석 총합 더하기
				}
				for(int j=0; j < bonbooList.size(); j++)		// 기능장 세로 신청/출석 합 구하기
				{
					for(int i=0; i < giNngJangList.size(); i++)		
					{
						giNngJangVSumArr[j] += giNngJangArr[i][j];				// 기능장 신청 세로합 더하기
						yesGiNngJangVSumArr[j] += yesGiNngJangArr[i][j];		// 기능장 출석 세로합 더하기
					}
				}
				
			} catch (CommonException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			giNngSaTableType.setArr(giNngSaArr);
			giNngSaTableType.setYesArr(yesGiNngSaArr);
			giNngSaTableType.sethSum(giNngSaHSumArr);
			giNngSaTableType.setYesHSum(yesGiNngSaHSumArr);
			giNngSaTableType.setvSum(giNngSaVSumArr);
			giNngSaTableType.setYesVSum(yesGiNngSaVSumArr);
			giNngSaTableType.setTotal(giNngSaTotal);
			giNngSaTableType.setYesTotal(yesGiNngSaTotal);
			
			giSaTableType.setArr(giSaArr);
			giSaTableType.setYesArr(yesGiSaArr);
			giSaTableType.sethSum(giSaHSumArr);
			giSaTableType.setYesHSum(yesGiSaHSumArr);
			giSaTableType.setvSum(giSaVSumArr);
			giSaTableType.setYesVSum(yesGiSaVSumArr);
			giSaTableType.setTotal(giSaTotal);
			giSaTableType.setYesTotal(yesGiSaTotal);
			
			giSulSaTableType.setArr(giSulSaArr);
			giSulSaTableType.setYesArr(yesGiSulSaArr);
			giSulSaTableType.sethSum(giSulSaHSumArr);
			giSulSaTableType.setYesHSum(yesGiSulSaHSumArr);
			giSulSaTableType.setvSum(giSulSaVSumArr);
			giSulSaTableType.setYesVSum(yesGiSulSaVSumArr);
			giSulSaTableType.setTotal(giSulSaTotal);
			giSulSaTableType.setYesTotal(yesGiSulSaTotal);
			
			giNngJangTableType.setArr(giNngJangArr);
			giNngJangTableType.setYesArr(yesGiNngJangArr);
			giNngJangTableType.sethSum(giNngJangHSumArr);
			giNngJangTableType.setYesHSum(yesGiNngJangHSumArr);
			giNngJangTableType.setvSum(giNngJangVSumArr);
			giNngJangTableType.setYesVSum(yesGiNngJangVSumArr);
			giNngJangTableType.setTotal(giNngJangTotal);
			giNngJangTableType.setYesTotal(yesGiNngJangTotal);
			
			tableTypeList.add(giNngSaTableType);
			tableTypeList.add(giSaTableType);
			tableTypeList.add(giSulSaTableType);
			tableTypeList.add(giNngJangTableType);
			
			ctx.setAttribute("bonboo", bonbooList);
			ctx.setAttribute(yy, tableTypeList);
			ctx.setAttribute(yy+"giSaList", giSaList);
			ctx.setAttribute(yy+"giNngSaList", giNngSaList);
			ctx.setAttribute(yy+"giSulSaList", giSulSaList);
			ctx.setAttribute(yy+"giNngJangList", giNngJangList);
			
		}
		ctx.setAttribute("yearSelect", "16");
		
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
