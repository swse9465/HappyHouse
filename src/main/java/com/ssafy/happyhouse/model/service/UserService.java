package com.ssafy.happyhouse.model.service;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.UserDto;

public interface UserService {
	
	public UserDto login(UserDto dto);
	
	public void join(UserDto dto) throws SQLException;

	public void modify(UserDto dto);

	public void withdrawal(String userid);

	public UserDto info(String userid) throws Exception;

	public String sendPwd(String userid, String email);
	
	public List<String> sendId(String username, String phone);
	
	public int check(UserDto dto);
}
