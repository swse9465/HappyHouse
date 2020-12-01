package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.UserDto;
import com.ssafy.happyhouse.model.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper mapper;
	

	@Override
	public UserDto info(String userid) throws Exception {
		if (userid == null) {
			throw new Exception();
		}
		return mapper.info(userid);
	}

	
	@Override
	public int check(UserDto dto) {
		
		return mapper.check(dto);
	}
	
	@Override
	public UserDto login(UserDto dto) {
		return mapper.login(dto);	
	}

	@Override
	public void join(UserDto dto) throws SQLException {
		if(dto.getUserid() == null || dto.getUserpwd() == null || dto.getUsername() == null) {
			return;
		}
		mapper.join(dto);
	}


	@Override
	public void withdrawal(String userid) {
		mapper.withdrawal(userid);
	}



	@Override
	public void modify(UserDto dto) {
		mapper.modify(dto);
	}

	@Override
	public List<String> sendId(String username, String phone) {
		System.out.println("Impl ----");
		System.out.println("username : " + username);
		System.out.println("phone :" + phone);
		System.out.println("result : " + mapper.sendId(username, phone));
		return mapper.sendId(username, phone);
	}
	
	@Override
	public String sendPwd(String userid, String email) {
		return mapper.sendPwd(userid, email);
	}
	

}
