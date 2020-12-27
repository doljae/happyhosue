package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HouseDao;
import com.vo.*;

@Service
public class HouseServiceImpl implements HouseService {
	@Autowired
	HouseDao dao;
		
	@Override
	public List<SidoGugunCode> getSido() throws Exception {
		return dao.getSido();
	}

	@Override
	public List<SidoGugunCode> getGugunInSido(String sido) throws Exception {
		return dao.getGugunInSido(sido);
	}

	@Override
	public List<HouseInfo> getDongInGugun(String gugun) throws Exception {
		return dao.getDongInGugun(gugun);
	}

	@Override
	public List<HouseInfo> getAptInDong(String dong) throws Exception {
		return dao.getAptInDong(dong);
	}

	@Override
	public List<HouseDeal> getDealInDong(String dongcode) throws Exception {
		return dao.getDealInDong(dongcode);
	}
	
	@Override
	public List<HouseDeal> getDealInApt(String dongcode, String apt) throws Exception {
		return dao.getDealInApt(dongcode, apt);
	}
	
	@Override
	public List<HouseInfo> getAptInBound(float swLat, float swLng, float neLat, float neLng) throws Exception {
		return dao.getAptInBound(swLat, swLng, neLat, neLng);
	}
}
