package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.UserDto;


@Mapper
public interface UserMapper {

	public void join(UserDto dto);

	public int check(UserDto dto);
	
	public UserDto login(UserDto dto);
	
	public UserDto info(String userid);
	
	public void modify(UserDto dto);
	
	public void withdrawal(String userid);
	
	public String sendPwd(String userid, String email);
	
	public List<String> sendId(String username, String phone);
}
