package com.dto;

public class StatTableDTO {

	private String qCode;
	private String s_Code;
	private String tsNo;
	private int CountAttendStat;
	private int CountSubmitStat;
	
	public StatTableDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public StatTableDTO(String qCode, String s_Code, String tsNo, int countAttendStat, int countSubmitStat) {
		super();
		this.qCode = qCode;
		this.s_Code = s_Code;
		this.tsNo = tsNo;
		CountAttendStat = countAttendStat;
		CountSubmitStat = countSubmitStat;
	}

	public String getqCode() {
		return qCode;
	}

	public void setqCode(String qCode) {
		this.qCode = qCode;
	}

	public String getS_Code() {
		return s_Code;
	}

	public void setS_Code(String s_Code) {
		this.s_Code = s_Code;
	}

	public String getTsNo() {
		return tsNo;
	}

	public void setTsNo(String tsNo) {
		this.tsNo = tsNo;
	}

	public int getCountAttendStat() {
		return CountAttendStat;
	}

	public void setCountAttendStat(int countAttendStat) {
		CountAttendStat = countAttendStat;
	}

	public int getCountSubmitStat() {
		return CountSubmitStat;
	}

	public void setCountSubmitStat(int countSubmitStat) {
		CountSubmitStat = countSubmitStat;
	}

	@Override
	public String toString() {
		return "StatTableDTO [qCode=" + qCode + ", s_Code=" + s_Code + ", tsNo=" + tsNo + ", CountAttendStat="
				+ CountAttendStat + ", CountSubmitStat=" + CountSubmitStat + "]";
	}
	
	
}
