package com.dto;

public class ManagerDTO {

	private String mId;
	private String mPw;
	
	public ManagerDTO() {
		super();
	}

	public ManagerDTO(String mId, String mPw) {
		super();
		this.mId = mId;
		this.mPw = mPw;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	@Override
	public String toString() {
		return "ManagerDTO [mId=" + mId + ", mPw=" + mPw + "]";
	}
	
}
