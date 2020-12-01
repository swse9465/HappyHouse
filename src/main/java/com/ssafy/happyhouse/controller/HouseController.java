package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.Position;
import com.ssafy.happyhouse.model.service.HouseService;

@Controller
public class HouseController {
	@Autowired
	private HouseService service;
	
	@RequestMapping("/getDeal") 
	public String getDeal(Model m, String key, String word, String pg, String spp) {
		int currentPage;
		if(pg != null)
			currentPage = Integer.parseInt(pg);
		else
			currentPage = 1;
		int sizePerPage = spp == null? 10 : Integer.parseInt(spp);
		if(key==null)
			key="";
		if(word==null)
			word="";
		
		try {
			List<HouseDeal> list  = service.get_Deal(currentPage, sizePerPage, key, word);
			m.addAttribute("dealInfo", list);
			m.addAttribute("position", service.getPosition(list));
			m.addAttribute("navigation", service.makePageNavigation(currentPage, sizePerPage, key, word));
			m.addAttribute("key", key);
			m.addAttribute("word", word);
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "거래정보를 가져오지 못했습니다..");
			return "error/error";
		}
		return "apt/dealinfo";
	}
	
	@RequestMapping("/getInfo")
	public String getInfo(Model m, @RequestParam("dong") String dong, @RequestParam("AptName") String AptName) {
		dong = dong.trim();
		System.out.println(dong+ " "+ AptName); // 잘넘어옴
		try {
			HouseInfo houseInfo = service.get_Info(dong, AptName);
			System.out.println(houseInfo);
			String img = "../../resources/img/" + houseInfo.getAptName()+".jpg";
			houseInfo.setImg(img);
			
			m.addAttribute("houseInfo", houseInfo);
			return "apt/houseinfo";
			
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "주택정보를 가져오지 못했습니다.");
			return "error/error";
		}
		
	}
	
}
