package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.NoticeDto;
import com.ssafy.happyhouse.model.mapper.NoticeMapper;
import com.ssafy.happyhouse.model.util.PageNavigation;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeMapper dao;
	
	@Override
	public void writeNotice(NoticeDto noticeDto) throws Exception {
		if(noticeDto.getSubject() == null || noticeDto.getContent() == null) {
			throw new Exception();
		}
		dao.writeNotice(noticeDto);
	}

	@Override
	public List<NoticeDto> listNotice(int currentPage, int sizePerPage, String key, String word) throws Exception {
		key = key == null ? "" : key;
		word = word == null ? "" : word;
		currentPage = (currentPage-1) * sizePerPage; // 페이지 기준점 계산
		 
		 
		return dao.listNotice(currentPage,sizePerPage, key, word);
	}

	@Override
	public NoticeDto getNotice(int noticeno) throws Exception {
		return dao.getNotice(noticeno);
	}

	@Override
	public void modifyNotice(NoticeDto noticeDto) throws Exception {
		dao.modifyNotice(noticeDto);
	}

	@Override
	public void deleteNotice(int noticeno) throws Exception {
		dao.deleteNotice(noticeno);
	}

	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word) {
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

}
