package com.dto;

public class SlipDTO {

	private String eNo;
	private int qCode;
	private String eId;
	
	public SlipDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SlipDTO(String eNo, int qCode, String eId) {
		super();
		this.eNo = eNo;
		this.qCode = qCode;
		this.eId = eId;
	}

	public String geteNo() {
		return eNo;
	}

	public void seteNo(String eNo) {
		this.eNo = eNo;
	}

	public int getqCode() {
		return qCode;
	}

	public void setqCode(int qCode) {
		this.qCode = qCode;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	@Override
	public String toString() {
		return "SlipDTO [eNo=" + eNo + ", qCode=" + qCode + ", eId=" + eId + "]";
	}
}
