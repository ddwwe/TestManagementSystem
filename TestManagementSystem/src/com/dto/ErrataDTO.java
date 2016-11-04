package com.dto;

public class ErrataDTO {

	private int bNo;
	private String bType;
	private String ssId;
	private String bContent;
	private String bDate;
	private SchoolDTO schoolDTO;
	
	public ErrataDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ErrataDTO(int bNo, String bType, String ssId, String bContent, String bDate, SchoolDTO schoolDTO) {
		super();
		this.bNo = bNo;
		this.bType = bType;
		this.ssId = ssId;
		this.bContent = bContent;
		this.bDate = bDate;
		this.schoolDTO = schoolDTO;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	public String getSsId() {
		return ssId;
	}

	public void setSsId(String ssId) {
		this.ssId = ssId;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbDate() {
		return bDate;
	}

	public void setbDate(String bDate) {
		this.bDate = bDate;
	}

	public SchoolDTO getSchoolDTO() {
		return schoolDTO;
	}

	public void setSchoolDTO(SchoolDTO schoolDTO) {
		this.schoolDTO = schoolDTO;
	}

	@Override
	public String toString() {
		return "ErrataDTO [bNo=" + bNo + ", bType=" + bType + ", ssId=" + ssId + ", bContent=" + bContent + ", bDate="
				+ bDate + ", schoolDTO=" + schoolDTO + "]";
	}
	
}
