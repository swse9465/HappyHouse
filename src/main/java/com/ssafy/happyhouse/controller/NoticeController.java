package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.dto.NoticeDto;
import com.ssafy.happyhouse.model.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	NoticeService service;
	
	@RequestMapping("/moveWriteNotice") // 작성페이지로 이동
	public String moveWriteNotice() {
		return "notice/write";
	}
	
	@RequestMapping("/writeNotice") // 글 작성 수행
	public String writeNotice(NoticeDto dto, Model m) {
		
		if(dto != null) {
			try {
				service.writeNotice(dto);
			} catch (Exception e) {
				e.printStackTrace();
				m.addAttribute("msg", "글작성중 문제가 발생했습니다.");
				return "error/error";
			}
		}else {
			m.addAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
			return "error/error";
		}
		
		return "notice/writesuccess";
	}
	
	@RequestMapping("/deleteNotice") // 글 삭제
	public String deleteNotice(int noticeno, Model m) {
		try {
			service.deleteNotice(noticeno);
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "글삭제 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
		
		return "redirect:/listNotice";
	}
	
	@RequestMapping("/modifyNotice") // 글 수정 
	public String modifyNotice(NoticeDto dto, Model m) {
		try {
			service.modifyNotice(dto);
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "글 수정 중 문제가 발생했습니다.");
			return "error/error";
		}
		
		return "redirect:/listNotice";
	}
	
	@RequestMapping("/moveModifyNotice") // 수정페이지로 이동
	public String moveModifyNotice(int noticeno, Model m) {
		try {
			m.addAttribute("notice", service.getNotice(noticeno));
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "글수정 페이지로 이동 중 문제가 발생했습니다.");
			return "error/error";
		}
		
		return "notice/modify";
	}
	
	@RequestMapping("/listNotice") // 글 목록
	public String listNotice(Model m, String key, String word, String pg, String spp) {
		int currentPage;
		if(pg != null)
			currentPage = Integer.parseInt(pg);
		else
			currentPage = 1;
		int sizePerPage = spp == null? 10 : Integer.parseInt(spp);
		
		if(key==null) key="";
		if(word==null) word="";
		
		try {
			m.addAttribute("notices", service.listNotice(currentPage, sizePerPage, key, word));
			m.addAttribute("navigation", service.makePageNavigation(currentPage, sizePerPage, key, word));
			m.addAttribute("key", key);
			m.addAttribute("word", word);
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
		
		return "notice/list";
	}
	
	@RequestMapping("/readNotice")
	public String readNotice(Model m, int noticeno) {
		
		try {
			m.addAttribute("notice", service.getNotice(noticeno));
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "글을 읽어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
		
		return "notice/read";
	}
	
	@RequestMapping("/qna")
	public String moveQna() {
		return "qna/qna";
	}
	
}
