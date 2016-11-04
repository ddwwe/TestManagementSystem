package com.refresh;

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

import com.dto.StatTableDTO;
import com.exception.CommonException;
import com.service.SelectService;

@WebServlet("/MainRefreshServlet")
public class MainRefreshServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SelectService service = new SelectService();
		List<String> giNngSaqCodeList = new ArrayList<>();		// 기능사 코드 불러오기
		List<String> giSaqCodeList = new ArrayList<>();			// 기사 코드 불러오기
		List<String> giSulSaqCodeList = new ArrayList<>();		// 기술사 코드 불러오기
		List<String> giNngJangqCodeList = new ArrayList<>();	// 기능장 코드 불러오기
		
		List<String> s_CodeList = new ArrayList<>();			// 시험실 코드 불러오기
		
		List<String> giNngSaTsNoList = new ArrayList<>();		// 기능사 일정 불러오기
		List<String> giSaTsNoList = new ArrayList<>();			// 기사 일정 불러오기
		List<String> giSulSaTsNoList = new ArrayList<>();		// 기술사 일정 불러오기
		List<String> giNngJangTsNoList = new ArrayList<>();		// 기능장 일정 불러오기
		
		HashMap<String, String> searchMap = new HashMap<>();	// 인원수 찾을 맵
		int CountAttendStat, CountSubmitStat;
		
			try {
				
				giNngSaqCodeList = service.qCodeSearch("기능사");		// 기능사 qCode 넣기
				giSaqCodeList = service.qCodeSearch("기사");			// 기사 qCode 넣기
				giSulSaqCodeList = service.qCodeSearch("기술사");		// 기술사 qCode 넣기
				giNngJangqCodeList = service.qCodeSearch("기능장");	// 기능장 qCode 넣기
				
				s_CodeList = service.s_CodeSearch();				// 모든 s_Code 넣기
				
				giNngSaTsNoList = service.tsNoSearch("__1_");		// 기능사 tsNo 넣기
				giSaTsNoList = service.tsNoSearch("__0_");			// 기사 tsNo 넣기
				giSulSaTsNoList = service.tsNoSearch("__2_");		// 기술사 tsNo 넣기
				giNngJangTsNoList = service.tsNoSearch("__3_");		// 기능장 tsNo 넣기
				
				for (String tsNo : giNngSaTsNoList) {
					for (String qCode : giNngSaqCodeList) {
						for (String s_Code : s_CodeList) {
							searchMap.put("qCode", qCode);
							searchMap.put("s_Code", s_Code);
							searchMap.put("tsNo", tsNo);
							
							CountAttendStat = service.searchAttend(searchMap);
							CountSubmitStat = service.searchSubmit(searchMap);
							
							service.updateCount(new StatTableDTO(qCode, s_Code, tsNo, CountAttendStat, CountSubmitStat));
						}
					}
				}
					
				for (String tsNo : giSaTsNoList) {
					for (String qCode : giSaqCodeList) {
						for (String s_Code : s_CodeList) {
							searchMap.put("qCode", qCode);
							searchMap.put("s_Code", s_Code);
							searchMap.put("tsNo", tsNo);
							
							CountAttendStat = service.searchAttend(searchMap);
							CountSubmitStat = service.searchSubmit(searchMap);
							
							service.updateCount(new StatTableDTO(qCode, s_Code, tsNo, CountAttendStat, CountSubmitStat));
						}
					}
				}
				
				for (String tsNo : giSulSaTsNoList) {
					for (String qCode : giSulSaqCodeList) {
						for (String s_Code : s_CodeList) {
							searchMap.put("qCode", qCode);
							searchMap.put("s_Code", s_Code);
							searchMap.put("tsNo", tsNo);
							
							CountAttendStat = service.searchAttend(searchMap);
							CountSubmitStat = service.searchSubmit(searchMap);
							
							service.updateCount(new StatTableDTO(qCode, s_Code, tsNo, CountAttendStat, CountSubmitStat));
						}
					}
				}
				
				for (String tsNo : giNngJangTsNoList) {
					for (String qCode : giNngJangqCodeList) {
						for (String s_Code : s_CodeList) {
							searchMap.put("qCode", qCode);
							searchMap.put("s_Code", s_Code);
							searchMap.put("tsNo", tsNo);
							
							CountAttendStat = service.searchAttend(searchMap);
							CountSubmitStat = service.searchSubmit(searchMap);
							
							service.updateCount(new StatTableDTO(qCode, s_Code, tsNo, CountAttendStat, CountSubmitStat));
						}
					}
				}
				
				
			} catch (CommonException e) {
				e.printStackTrace();
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
