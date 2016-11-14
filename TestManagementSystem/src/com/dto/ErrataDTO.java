package com.dto;

public class ErrataDTO {

	private int bNo;
	private String bType;
	private String qCode;
	private String ssId;
	private String bContent;
	private String bDate;
	private SchoolDTO schoolDTO;
	private String qName;
	
	public ErrataDTO() {
		super();
		// TODO Auto-generated constructor stub
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

	public String getqCode() {
		return qCode;
	}

	public void setqCode(String qCode) {
		this.qCode = qCode;
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

	public String getqName() {
		return qName;
	}

	public void setqName(String qName) {
		this.qName = qName;
	}

	@Override
	public String toString() {
		return "ErrataDTO [bNo=" + bNo + ", bType=" + bType + ", qCode=" + qCode + ", ssId=" + ssId + ", bContent="
				+ bContent + ", bDate=" + bDate + ", schoolDTO=" + schoolDTO + ", qName=" + qName + "]";
	}
	
}
