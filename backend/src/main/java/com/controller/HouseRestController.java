package com.controller;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.compiler.ast.Keyword;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.service.HouseService;
import com.vo.HouseDeal;
import com.vo.HouseInfo;
import com.vo.SidoGugunCode;

@RestController
@CrossOrigin
public class HouseRestController {
	@Autowired
	HouseService service;
	
	@GetMapping("/map/sido")
	public List getSido() throws Exception
	{
		List<SidoGugunCode> list = null;
		try {
			list = service.getSido();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping("/map/gugun/{sido}")
	public List getGugun(@PathVariable String sido, HttpServletResponse response) throws IOException
	{
		List<SidoGugunCode> list = null;
		try {
			list = service.getGugunInSido(sido);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping("/map/dong/{gugun}")
	public List getDong(@PathVariable String gugun) throws IOException
	{
		List<HouseInfo> list = null;
		try {
			list = service.getDongInGugun(gugun);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping("/map/apt/{dong}")
	public List getApt(@PathVariable String dong) throws IOException
	{
		List<HouseInfo> list = null;
		try {
			list = service.getAptInDong(dong);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping("/map/deal/dong/{dong}")
	public List getDealInDong(@PathVariable String dong) throws IOException
	{
		List<HouseDeal> list = null;
		try {
			list = service.getDealInDong(dong);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping("/house/deal/dongcode/{dongcode}/aptname/{apt}")
	public List getDealInApt(@PathVariable String dongcode,
							@PathVariable String apt) throws IOException
	{
		List<HouseDeal> list = null;
		try {
			list = service.getDealInApt(dongcode, apt);
			System.out.println(list.size());
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping("/house/info/swLat/{swLat}/swLng/{swLng}/neLat/{neLat}/neLng/{neLng}")
	public List getInfoInBound(@PathVariable float swLat, @PathVariable float swLng,
								@PathVariable float neLat, @PathVariable float neLng) throws Exception{
		try {
			List<HouseInfo> data = service.getAptInBound(swLat, swLng, neLat, neLng);
			System.out.println(data.size());
			return data;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@GetMapping("/map/keyword/{keyword}")
	public String getPlaceByKeyword(@PathVariable String keyword) throws Exception
	{
		URL url = new URL("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=" + keyword + "&inputtype=textquery&fields=formatted_address,geometry&key=AIzaSyCoCKddu6mtYaf4MJGtUwKVU_Uu7s9_gwM");

		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET"); 
		//con.setRequestProperty("User-Agent"); 
		int responseCode = con.getResponseCode();
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = in.readLine()) != null)
		{
			response.append(inputLine);
		}
		in.close(); 
		System.out.println("HTTP 응답 코드 : " + responseCode);
		System.out.println("HTTP body : " + response.toString());

		return response.toString();
	}
}
