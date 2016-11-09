package com.dto;

public class PersonalDataDTO {

	private String ppNo;
	private String pType;
	private String pCategory = "";
	private String pSeat;
	private String pAttendance = "";
	private String pNote = "";
	
	public PersonalDataDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PersonalDataDTO(String ppNo, String pType, String pCategory, String pSeat, String pAttendance,
			String pNote) {
		super();
		this.ppNo = ppNo;
		this.pType = pType;
		this.pCategory = pCategory;
		this.pSeat = pSeat;
		this.pAttendance = pAttendance;
		this.pNote = pNote;
	}

	public String getPpNo() {
		return ppNo;
	}

	public void setPpNo(String ppNo) {
		this.ppNo = ppNo;
	}

	public String getpType() {
		return pType;
	}

	public void setpType(String pType) {
		this.pType = pType;
	}

	public String getpCategory() {
		return pCategory;
	}

	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}

	public String getpSeat() {
		return pSeat;
	}

	public void setpSeat(String pSeat) {
		this.pSeat = pSeat;
	}

	public String getpAttendance() {
		return pAttendance;
	}

	public void setpAttendance(String pAttendance) {
		this.pAttendance = pAttendance;
	}

	public String getpNote() {
		return pNote;
	}

	public void setpNote(String pNote) {
		this.pNote = pNote;
	}

	@Override
	public String toString() {
		return "PersonalDataDTO [ppNo=" + ppNo + ", pType=" + pType + ", pCategory=" + pCategory + ", pSeat=" + pSeat
				+ ", pAttendance=" + pAttendance + ", pNote=" + pNote + "]";
	}
	
}
