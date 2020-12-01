package com.ssafy.happyhouse.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.Position;
import com.ssafy.happyhouse.model.mapper.HouseMapper;
import com.ssafy.happyhouse.model.util.PageNavigation;

@Service
public class HouseServiceImpl implements HouseService{
	@Autowired
   private HouseMapper dao;

   @Override
   public List<HouseDeal> get_Deal(int currentPage, int sizePerPage, String key, String word) throws Exception{
	   currentPage = (currentPage-1) * sizePerPage; // 페이지 기준점 계산
	   List<HouseDeal> list = dao.getDeal(currentPage,sizePerPage,key, word);
	   for (HouseDeal h : list) {
		   switch (h.getType()) {
				case "1":
				case "3":
					h.setType("매매");
					break;
		
				default:
					h.setType("전월세");
					break;
		   }
	   }
	   return list;
   }
   
   @Override
   public HouseInfo get_Info(String dong, String AptName) throws Exception{
	   return dao.getInfo(dong, AptName);
   }
   
   @Override
   public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word) throws Exception{
	   PageNavigation pageNavigation = new PageNavigation();
		int naviSize = 10;
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = dao.getTotalCount(key, word);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount-1)/sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage<=naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount-1)/ naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
   }

	@Override
	public Position[] getPosition(List<HouseDeal> list) {
		HouseInfo temp = null;
		Position[] p = new Position[list.size()];
		int idx=0;
		for (HouseDeal h : list) {
			temp = dao.getInfo(h.getDong().trim(), h.getAptName());
			p[idx] = new Position();
			p[idx].setLat(temp.getLat());
			p[idx].setLng(temp.getLng());
			idx++;
		}
		return p;
	}
	   
}



