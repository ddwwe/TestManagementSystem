package com.dto;

public class StudentDTO {

	private String eId;
	private String ePw;
	private String eName;
	private String eBirth;
	private String eEmail;
	private String ePhone;
	private String ePost;
	private String eAddr1;
	private String eAddr2;
	private String ePath;
	
	public StudentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StudentDTO(String eId, String ePw, String eName, String eBirth, String eEmail, String ePhone, String ePost,
			String eAddr1, String eAddr2, String ePath) {
		super();
		this.eId = eId;
		this.ePw = ePw;
		this.eName = eName;
		this.eBirth = eBirth;
		this.eEmail = eEmail;
		this.ePhone = ePhone;
		this.ePost = ePost;
		this.eAddr1 = eAddr1;
		this.eAddr2 = eAddr2;
		this.ePath = ePath;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public String getePw() {
		return ePw;
	}

	public void setePw(String ePw) {
		this.ePw = ePw;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String geteBirth() {
		return eBirth;
	}

	public void seteBirth(String eBirth) {
		this.eBirth = eBirth;
	}

	public String geteEmail() {
		return eEmail;
	}

	public void seteEmail(String eEmail) {
		this.eEmail = eEmail;
	}

	public String getePhone() {
		return ePhone;
	}

	public void setePhone(String ePhone) {
		this.ePhone = ePhone;
	}

	public String getePost() {
		return ePost;
	}

	public void setePost(String ePost) {
		this.ePost = ePost;
	}

	public String geteAddr1() {
		return eAddr1;
	}

	public void seteAddr1(String eAddr1) {
		this.eAddr1 = eAddr1;
	}

	public String geteAddr2() {
		return eAddr2;
	}

	public void seteAddr2(String eAddr2) {
		this.eAddr2 = eAddr2;
	}

	public String getePath() {
		return ePath;
	}

	public void setePath(String ePath) {
		this.ePath = ePath;
	}

	@Override
	public String toString() {
		return "StudentDTO [eId=" + eId + ", ePw=" + ePw + ", eName=" + eName + ", eBirth=" + eBirth + ", eEmail="
				+ eEmail + ", ePhone=" + ePhone + ", ePost=" + ePost + ", eAddr1=" + eAddr1 + ", eAddr2=" + eAddr2
				+ ", ePath=" + ePath + "]";
	}
	
}
