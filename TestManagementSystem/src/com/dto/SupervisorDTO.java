package com.dto;

public class SupervisorDTO {

	private String sid;
	private String spw;
	private String sname;
	private String sgroup;
	private String sphone;
	private String spost;
	private String saddr1;
	private String saddr2;
	private String sbirth;
	private String spath;
	private String scareers;

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSpw() {
		return spw;
	}

	public void setSpw(String spw) {
		this.spw = spw;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSgroup() {
		return sgroup;
	}

	public void setSgroup(String sgroup) {
		this.sgroup = sgroup;
	}

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public String getSpost() {
		return spost;
	}

	public void setSpost(String spost) {
		this.spost = spost;
	}

	public String getSaddr1() {
		return saddr1;
	}

	public void setSaddr1(String saddr1) {
		this.saddr1 = saddr1;
	}

	public String getSaddr2() {
		return saddr2;
	}

	public void setSaddr2(String saddr2) {
		this.saddr2 = saddr2;
	}

	public String getSbirth() {
		return sbirth;
	}

	public void setSbirth(String sbirth) {
		this.sbirth = sbirth;
	}

	public String getSpath() {
		return spath;
	}

	public void setSpath(String spath) {
		this.spath = spath;
	}

	public String getScareers() {
		return scareers;
	}

	public void setScareers(String scareers) {
		this.scareers = scareers;
	}

	@Override
	public String toString() {
		return "SupervisorDTO [sid=" + sid + ", spw=" + spw + ", sname=" + sname + ", sgroup=" + sgroup + ", sphone="
				+ sphone + ", spost=" + spost + ", saddr1=" + saddr1 + ", saddr2=" + saddr2 + ", sbirth=" + sbirth
				+ ", spath=" + spath + ", scareers=" + scareers + "]";
	}

	public SupervisorDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SupervisorDTO(String sid, String spw, String sname, String sgroup, String sphone, String spost,
			String saddr1, String saddr2, String sbirth, String spath, String scareers) {
		super();
		this.sid = sid;
		this.spw = spw;
		this.sname = sname;
		this.sgroup = sgroup;
		this.sphone = sphone;
		this.spost = spost;
		this.saddr1 = saddr1;
		this.saddr2 = saddr2;
		this.sbirth = sbirth;
		this.spath = spath;
		this.scareers = scareers;
	}

}
