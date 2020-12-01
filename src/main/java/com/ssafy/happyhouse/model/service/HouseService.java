package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.Position;
import com.ssafy.happyhouse.model.util.PageNavigation;

public interface HouseService {
	
	public List<HouseDeal> get_Deal(int currentPage, int sizePerPage, String key, String word) throws Exception;
	public HouseInfo get_Info(String dong, String AptName) throws Exception;
	public PageNavigation makePageNavigation(int pg, int sizePerPage, String key, String word) throws Exception;
	public Position[] getPosition(List<HouseDeal> list);
}
