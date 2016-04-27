package com.sist.map;
import java.io.*;
import com.google.code.geocoder.*;
import com.google.code.geocoder.model.*;

public class AddtoXY {

	public double[] geoCoding(String location) {

		if (location == null)  

		return null;

				       

		Geocoder geocoder = new Geocoder();

		// setAddress : 변환하려는 주소 (경기도 성남시 분당구 등)

		// setLanguate : 인코딩 설정

		GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setAddress(location).setLanguage("ko").getGeocoderRequest();
		GeocodeResponse geocoderResponse;




		try {

		geocoderResponse = geocoder.geocode(geocoderRequest);

		if (geocoderResponse.getStatus() == GeocoderStatus.OK & !geocoderResponse.getResults().isEmpty()) {




		GeocoderResult geocoderResult=geocoderResponse.getResults().iterator().next();

		LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation();

						  

		double[] coords = new double[2];

		coords[0] = latitudeLongitude.getLat().doubleValue();

		coords[1] = latitudeLongitude.getLng().doubleValue();

		return coords;

		}

		} catch (IOException ex) {

		ex.printStackTrace();

		}

		return null;

		}

	
}
