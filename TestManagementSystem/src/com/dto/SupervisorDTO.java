package com.dto;

public class SupervisorDTO {

	private String supervisorno;
	private String supervisorname;
	private String supervisorpass;
	private String placeno;

	@Override
	public String toString() {
		return "SupervisorDTO [supervisorno=" + supervisorno + ", supervisorname=" + supervisorname
				+ ", supervisorpass=" + supervisorpass + ", placeno=" + placeno + "]";
	}

	public SupervisorDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SupervisorDTO(String supervisorno, String supervisorname, String supervisorpass, String placeno) {
		super();
		this.supervisorno = supervisorno;
		this.supervisorname = supervisorname;
		this.supervisorpass = supervisorpass;
		this.placeno = placeno;
	}

	public String getSupervisorno() {
		return supervisorno;
	}

	public void setSupervisorno(String supervisorno) {
		this.supervisorno = supervisorno;
	}

	public String getSupervisorname() {
		return supervisorname;
	}

	public void setSupervisorname(String supervisorname) {
		this.supervisorname = supervisorname;
	}

	public String getSupervisorpass() {
		return supervisorpass;
	}

	public void setSupervisorpass(String supervisorpass) {
		this.supervisorpass = supervisorpass;
	}

	public String getPlaceno() {
		return placeno;
	}

	public void setPlaceno(String placeno) {
		this.placeno = placeno;
	}
}
