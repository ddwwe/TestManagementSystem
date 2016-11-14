package com.dto;

public class SchoolDTO {

	private String s_code;
	private String s_bonboo;
	private String s_gigwan;
	private String s_name;
	private String s_room;
	
	public SchoolDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getS_code() {
		return s_code;
	}

	public void setS_code(String s_code) {
		this.s_code = s_code;
	}

	public String getS_bonboo() {
		return s_bonboo;
	}

	public void setS_bonboo(String s_bonboo) {
		this.s_bonboo = s_bonboo;
	}

	public String getS_gigwan() {
		return s_gigwan;
	}

	public void setS_gigwan(String s_gigwan) {
		this.s_gigwan = s_gigwan;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_room() {
		return s_room;
	}

	public void setS_room(String s_room) {
		this.s_room = s_room;
	}

	@Override
	public String toString() {
		return "SchoolDTO [s_code=" + s_code + ", s_bonboo=" + s_bonboo + ", s_gigwan=" + s_gigwan + ", s_name="
				+ s_name + ", s_room=" + s_room + "]";
	}
	
}
