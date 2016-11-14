package com.dto;

public class SupervisorDTO {

	private String ssId;
	private String sPw;
	private String sName;
	private String sGroup;
	private String sPhone;
	private String sPost;
	private String sAddr1;
	private String sAddr2;
	private String sBirth;
	private String sPath;
	private SchoolDTO schoolDTO;
	
	public SupervisorDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getSsId() {
		return ssId;
	}

	public void setSsId(String ssId) {
		this.ssId = ssId;
	}

	public String getsPw() {
		return sPw;
	}

	public void setsPw(String sPw) {
		this.sPw = sPw;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsGroup() {
		return sGroup;
	}

	public void setsGroup(String sGroup) {
		this.sGroup = sGroup;
	}

	public String getsPhone() {
		return sPhone;
	}

	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	public String getsPost() {
		return sPost;
	}

	public void setsPost(String sPost) {
		this.sPost = sPost;
	}

	public String getsAddr1() {
		return sAddr1;
	}

	public void setsAddr1(String sAddr1) {
		this.sAddr1 = sAddr1;
	}

	public String getsAddr2() {
		return sAddr2;
	}

	public void setsAddr2(String sAddr2) {
		this.sAddr2 = sAddr2;
	}

	public String getsBirth() {
		return sBirth;
	}

	public void setsBirth(String sBirth) {
		this.sBirth = sBirth;
	}

	public String getsPath() {
		return sPath;
	}

	public void setsPath(String sPath) {
		this.sPath = sPath;
	}

	public SchoolDTO getSchoolDTO() {
		return schoolDTO;
	}

	public void setSchoolDTO(SchoolDTO schoolDTO) {
		this.schoolDTO = schoolDTO;
	}

	@Override
	public String toString() {
		return "SupervisorDTO [ssId=" + ssId + ", sPw=" + sPw + ", sName=" + sName + ", sGroup=" + sGroup + ", sPhone="
				+ sPhone + ", sPost=" + sPost + ", sAddr1=" + sAddr1 + ", sAddr2=" + sAddr2 + ", sBirth=" + sBirth
				+ ", sPath=" + sPath + ", schoolDTO=" + schoolDTO + "]";
	}
	
}
