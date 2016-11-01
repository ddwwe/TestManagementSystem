package com.dto;

public class StatResultDTO {

	int countAttendStat;
	int countSumbitStat;
	
	public StatResultDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StatResultDTO(int countAttendStat, int countSumbitStat) {
		super();
		this.countAttendStat = countAttendStat;
		this.countSumbitStat = countSumbitStat;
	}

	public int getCountAttendStat() {
		return countAttendStat;
	}

	public void setCountAttendStat(int countAttendStat) {
		this.countAttendStat = countAttendStat;
	}

	public int getCountSumbitStat() {
		return countSumbitStat;
	}

	public void setCountSumbitStat(int countSumbitStat) {
		this.countSumbitStat = countSumbitStat;
	}

	@Override
	public String toString() {
		return "StatResultDTO [countAttendStat=" + countAttendStat + ", countSumbitStat=" + countSumbitStat + "]";
	}
	
}
