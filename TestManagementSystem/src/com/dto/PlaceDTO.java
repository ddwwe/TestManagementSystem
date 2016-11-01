package com.dto;

public class PlaceDTO {

	private String placeNo;
	private String s_Place;
	
	public PlaceDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PlaceDTO(String placeNo, String s_Place) {
		super();
		this.placeNo = placeNo;
		this.s_Place = s_Place;
	}
	public String getPlaceNo() {
		return placeNo;
	}
	public void setPlaceNo(String placeNo) {
		this.placeNo = placeNo;
	}
	public String getS_Place() {
		return s_Place;
	}
	public void setS_Place(String s_Place) {
		this.s_Place = s_Place;
	}
	@Override
	public String toString() {
		return "PlaceDTO [placeNo=" + placeNo + ", s_Place=" + s_Place + "]";
	}
	
}
