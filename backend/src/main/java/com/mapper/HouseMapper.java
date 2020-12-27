package com.mapper;

import java.util.List;

import com.vo.HouseDeal;
import com.vo.HouseInfo;
import com.vo.SidoGugunCode;

public interface HouseMapper {
	List<SidoGugunCode> getSido() throws Exception;
	List<SidoGugunCode> getGugunInSido(String sido) throws Exception;
	List<HouseInfo> getDongInGugun(String gugun) throws Exception;
	List<HouseInfo> getAptInDong(String dong) throws Exception;
	
	// 동 별 실거래가 정보
	List<HouseDeal> getDealInDong(String dongcode) throws Exception;
	// 아파트 별 실거리가 정보
	List<HouseDeal> getDealInApt(String dongcode, String apt) throws Exception;
	
	List<HouseInfo> getAptInBound(float swLat, float swLng, float neLat, float neLng) throws Exception;
}
