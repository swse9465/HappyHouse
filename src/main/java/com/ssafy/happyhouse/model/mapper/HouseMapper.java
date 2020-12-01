package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;

@Mapper
public interface HouseMapper {
	int getTotalCount(String key, String word);
	HouseInfo getInfo(String dong, String aptName);
	List<HouseDeal> getDeal(int currentPage, int sizePerPage, String key, String word);
}
