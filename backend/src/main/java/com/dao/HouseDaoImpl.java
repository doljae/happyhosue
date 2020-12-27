package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mapper.HouseMapper;
import com.vo.*;

@Repository
public class HouseDaoImpl implements HouseDao {
	@Autowired
	HouseMapper mapper;

	@Override
	public List<SidoGugunCode> getSido() throws Exception {
		List<SidoGugunCode> list;
		list = mapper.getSido();
		return list;
	}

	@Override
	public List<SidoGugunCode> getGugunInSido(String sido) throws Exception {
		return mapper.getGugunInSido(sido);
	}

	@Override
	public List<HouseInfo> getDongInGugun(String gugun) throws Exception {
		return mapper.getDongInGugun(gugun);
	}

	@Override
	public List<HouseInfo> getAptInDong(String dong) throws Exception {
		return mapper.getAptInDong(dong);
	}

	@Override
	public List<HouseDeal> getDealInDong(String dongcode) throws Exception {
		return mapper.getDealInDong(dongcode);
	}

	@Override
	public List<HouseDeal> getDealInApt(String dongcode, String apt) throws Exception {
		return mapper.getDealInApt(dongcode, apt);
	}
	@Override
	public List<HouseInfo> getAptInBound(float swLat, float swLng, float neLat, float neLng) throws Exception {
		List data = mapper.getAptInBound(swLat, swLng, neLat, neLng);
		System.out.println(data.size());
		System.out.println(swLat+ " " + swLng + " " + neLat + " " + neLng);
		return data;
	}
}
