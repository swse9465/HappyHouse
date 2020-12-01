package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.NoticeDto;

@Mapper
public interface NoticeMapper {
	void writeNotice(NoticeDto dto);
	List<NoticeDto> listNotice(int currentPage, int sizePerPage, String key, String word);
	NoticeDto getNotice(int no);
	void modifyNotice(NoticeDto dto);
	void deleteNotice(int no);
	int getTotalCount(String key, String word);
}
