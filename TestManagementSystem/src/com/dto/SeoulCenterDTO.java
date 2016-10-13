package com.dto;

public class SeoulCenterDTO {

	private int aaa;
	private int bbb;
	private int ccc;
	private int ddd;
	private int eee;

	public int getAaa() {
		return aaa;
	}

	public int getBbb() {
		return bbb;
	}

	public void setBbb(int bbb) {
		this.bbb = bbb;
	}

	public int getCcc() {
		return ccc;
	}

	public void setCcc(int ccc) {
		this.ccc = ccc;
	}

	public int getDdd() {
		return ddd;
	}

	public void setDdd(int ddd) {
		this.ddd = ddd;
	}

	public int getEee() {
		return eee;
	}

	public void setEee(int eee) {
		this.eee = eee;
	}

	public void setAaa(int aaa) {
		this.aaa = aaa;
	}

	public SeoulCenterDTO(int aaa, int bbb, int ccc, int ddd, int eee) {
		super();
		this.aaa = aaa;
		this.bbb = bbb;
		this.ccc = ccc;
		this.ddd = ddd;
		this.eee = eee;
	}

	@Override
	public String toString() {
		return "SeoulCenterDTO [aaa=" + aaa + ", bbb=" + bbb + ", ccc=" + ccc + ", ddd=" + ddd + ", eee=" + eee + "]";
	}

	public SeoulCenterDTO() {
		super();
	}

}
