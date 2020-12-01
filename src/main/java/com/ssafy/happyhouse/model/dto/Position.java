package com.ssafy.happyhouse.model.dto;

public class Position {
	private double lat, lng;
	public Position() {}
	public Position(double lat, double lng) {
		this.lat = lat;
		this.lng = lng;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	@Override
	public String toString() {
		return "Position [lat=" + lat + ", lng=" + lng + "]";
	}
	
	
}
