package com.stat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.PlaceDTO;
import com.dto.StatResultDTO;
import com.exception.CommonException;
import com.service.SelectService;

@WebServlet("/BonbooStatFormServlet")
public class BonbooStatFormServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SelectService service = new SelectService();
		String qClass = null;
		String tsNo = null;
		String tsTitle = null;
		String qNameChoice = null;
		String tsNoChoice = null;
		String bonboo = null;
		List<String> qCodeList = new ArrayList<>();			// 종목 리스트
		List<String> qNameList = new ArrayList<>();			// 종목이름 리스트
		List<PlaceDTO> gigwanList = new ArrayList<>();		// 본부 리스트
		
		bonboo = (String)request.getParameter("bonboo");
		qClass = (String) request.getParameter("qClassChoice");	// qClass 받음. 없으면 기사
		System.out.println(qClass);
		if(qClass == null)			qClass = "기사";
		if(qClass.equals("giNngSa"))	qClass = "기능사";
		if(qClass.equals("giSa"))	qClass = "기사";
		if(qClass.equals("giSulSa"))	qClass = "기술사";
		if(qClass.equals("giNngJang"))	qClass = "기능장";
		System.out.println(qClass);
		
		tsNoChoice = (String) request.getParameter("tsNoChoice");		// tsNo 앞부분 받음
		qNameChoice = (String) request.getParameter("qNameChoice");		// tsNo 뒷부분 받음
		System.out.println(tsNoChoice+qNameChoice);
		tsNo = tsNoChoice + qNameChoice;
		if(tsNoChoice == null && qNameChoice == null)	tsNo = "1603";	// 받아온게 없으면 1603
		System.out.println(tsNo);

		String title = "";
		String target = "";
		try {
			tsTitle = service.searchTsTitle(tsNo);			// 일정이름 불러오기
			qCodeList = service.qCodeSearch(qClass);		// qClass로 종목 받기
			gigwanList = service.selectGiGwan(bonboo);			// 본부 목록 받기
			qNameList = service.selectQualificationList(qClass);// 종목이름 불러오기
			for (String string : qNameList) {
				System.out.println(string);
			}
			target = "bonbooMainForm.jsp";
		} catch (CommonException e) {
			title = e.getMessage();
			String link = "MainStatFormServlet";
			target = "error.jsp";
			request.setAttribute("title", title);
			request.setAttribute("link", link);
		}
		int[][] mainAttendCountArr = new int[qCodeList.size()][gigwanList.size()];// 참석 카운트값 저장할 배열 만들기
		int[][] mainSubmitCountArr = new int[qCodeList.size()][gigwanList.size()];// 신청 카운트값 저장할 배열 만들기
		int[] mainAttendHSumArr = new int[qCodeList.size()];		// 참석 가로 합 배열
		int[] mainAttendVSumArr = new int[gigwanList.size()];		// 참석 세로 합 배열
		int[] mainSubmitHSumArr = new int[qCodeList.size()];		// 신청 가로 합 배열
		int[] mainSubmitVSumArr = new int[gigwanList.size()];		// 신청 세로 합 배열
		int mainAttendTotal=0, mainSubmitTotal=0;					// 참석총합, 신청총합
		HashMap<String, String> parameterMap = new HashMap<>();// 파라미터 해시맵
		StatResultDTO resultDTO = new StatResultDTO();
		parameterMap.put("tsNo", tsNo);	// 일정 넣기
		
		for (int i=0; i < qCodeList.size(); i++) {
			for (int j=0; j < gigwanList.size(); j++) {
				parameterMap.put("qCode", qCodeList.get(i));			// 종목 넣기
				parameterMap.put("placeNo", gigwanList.get(j).getPlaceNo()+"%");	// 본부숫자 넣기
				try {
					resultDTO = service.CountMain(parameterMap);	// 참석,신청 수 구하기
				} catch (CommonException e) {
					e.printStackTrace();
				}
				
				mainAttendCountArr[i][j] = resultDTO.getCountAttendStat();	// 참석 수
				mainSubmitCountArr[i][j] = resultDTO.getCountSumbitStat();	// 신청 수
				
				mainAttendHSumArr[i] += resultDTO.getCountAttendStat();	// 참석 수 가로합
				mainSubmitHSumArr[i] += resultDTO.getCountSumbitStat();	// 신청 수 가로합
			}
			mainAttendTotal += mainAttendHSumArr[i];	// 참석 수 총합
			mainSubmitTotal += mainSubmitHSumArr[i];	// 신청 수 총합
		}
		for (int j=0; j < gigwanList.size(); j++) {
			for (int i=0; i < qCodeList.size(); i++) {
				mainAttendVSumArr[j] += mainAttendCountArr[i][j];	// 참석 수 세로 합
				mainSubmitVSumArr[j] += mainSubmitCountArr[i][j];	// 신청 수 세로 합
			}
		}

		request.setAttribute("bonboo", bonboo);
		request.setAttribute("tsTitle", bonboo+" "+tsTitle);
		request.setAttribute("qNameList", qNameList);
		request.setAttribute("gigwanList", gigwanList);
		request.setAttribute("mainAttendCountArr", mainAttendCountArr);
		request.setAttribute("mainAttendCountArr", mainAttendCountArr);
		request.setAttribute("mainSubmitCountArr", mainSubmitCountArr);
		request.setAttribute("mainAttendHSumArr", mainAttendHSumArr);
		request.setAttribute("mainSubmitHSumArr", mainSubmitHSumArr);
		request.setAttribute("mainAttendTotal", mainAttendTotal);
		request.setAttribute("mainSubmitTotal", mainSubmitTotal);
		request.setAttribute("mainAttendVSumArr", mainAttendVSumArr);
		request.setAttribute("mainSubmitVSumArr", mainSubmitVSumArr);
		
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
