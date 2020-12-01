package com.ssafy.happyhouse.controller;


import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.model.dto.UserDto;
import com.ssafy.happyhouse.model.service.UserService;



@Controller
public class UserController {
	private static final long serialVersionUID = 1L;

	@Autowired
	private UserService service;

	@GetMapping(value = "/")
	public ModelAndView home() {
		return new ModelAndView("user/login");
	}
	
	@GetMapping(value = "/index")
	public ModelAndView home1() {
		return new ModelAndView("user/login");
	}
	
	@GetMapping(value = "/login")
	public ModelAndView login() {
		return new ModelAndView("user/login");
	}
	
	@GetMapping(value = "/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("user/login");
	}

	@PostMapping(value = "/login")
	public ModelAndView login(UserDto dto, HttpSession session) {
		if (service.check(dto) != 1) {
			return new ModelAndView("user/login");
		}
		dto = service.login(dto);
		session.setAttribute("userinfo", dto);
//		return new ModelAndView("/apt/dealinfo");
		return new ModelAndView("user/login");
	}
	
	@PostMapping(value = "/mvjoin")
	public String mvjoin() {
		System.out.println("mvjoin");
		
		return "redirect:/mvjoinre";
	}
	
	@GetMapping(value = "/mvjoinre")
	public String mvjoinredirect() {
		return "user/join";
	}

	
	@PostMapping(value = "/join")
	public String join(UserDto dto, Model m) {
		try {
			service.join(dto);
			return "user/joinsuccess";
		} catch (SQLException e) {
			e.printStackTrace();
			m.addAttribute("msg", "회원가입 오류입니다");
			return "/error/error";
		}
	}
	
	@GetMapping(value ="/info")
	public String info(UserDto dto, Model m, HttpSession session) {
		try {
			dto = (UserDto) session.getAttribute("userinfo");
			m.addAttribute("userinfo", dto);
			return "/user/userinfo";
		} catch (Exception e) {
			e.printStackTrace();
			return "/apt/dealinfo";
		}
	}
	
	@PostMapping(value = "/modify")
	public String modify(UserDto dto, HttpSession session, Model m) {
 		service.modify(dto);
 		session.setAttribute("userinfo", dto);
 		m.addAttribute("userinfo", dto);
		return "user/login";
	}
	
	@PostMapping(value = "/withdrawal")
	public String withdrwal(UserDto dto, HttpSession session) {
		service.withdrawal(dto.getUserid());
		session.invalidate();
		return "user/login";
	}
	
	@PostMapping(value = "/retry")
	public String finduserRetry(@RequestParam(value="retryid", required=false, defaultValue = "") String id,
								@RequestParam(value="retrypwd", required=false, defaultValue = "") String pwd,
								Model m) {
		String url = null;
		if(!"".equals(id)) {
			url = id;
		} else if (!"".equals(pwd)) {
			url = pwd;
		}
		System.out.println("controller.retry");	
		System.out.println("findfail : " +url);
		m.addAttribute("findfail", url);
		return "user/finduser";
	}
	
	@PostMapping(value = "/mvfinduser")
	public String mvfinduser() {
		System.out.println("mvfinduser");	
		return "redirect:/mvfinduserre";
	}
	
	@GetMapping(value = "/mvfinduserre")
	public String mvfinduserre() {
		return "user/finduser";
	}
	
	@PostMapping(value = "/mvfindpwd")
	public String mvfindpwd() {
		System.out.println("mvfindpwd");
		
		return "redirect:/mvfindpwdre";
	}
	
	@GetMapping(value = "/mvfindpwdre")
	public String mvfindpwdre() {
		return "user/findpwd";
	}
	@PostMapping(value = "/mvfindid")
	public String mvfindid() {
		System.out.println("mvfindid");
		
		return "redirect:/mvfindidre";
	}
	
	@GetMapping(value = "/mvfindidre")
	public String mvfindidre() {
		return "user/findid";
	}
	
	@PostMapping(value = "/findpwd")
	public String findpwd(UserDto dto, Model m) {
		System.out.println(dto.toString());
		String userid = dto.getUserid();
		String email = dto.getEmail();
		String userpwd ;
		String msg;
		try {
			userpwd = service.sendPwd(userid, email);
			if(userpwd == null) {
				msg = "찾으시는 회원의 정보가 없습니다.<br>"
						+ " 아이디와 이메일을 다시 확인해주세요";
				m.addAttribute("findfail", "pwd");
				
			} else {
				msg = "회원님의 비밀번호는 " +"<br>"
						+"'" + userpwd + "'" +"<br>"
						+"입니다 .";
				
			}
		} catch (Exception e) {
			msg = "비밀번호 조회에 실패했습니다.";
			m.addAttribute("findfail", "pwd");
			m.addAttribute("error", "error");
			e.printStackTrace();
		}
		m.addAttribute("msg", msg);

		return "user/finduserfinish";
	}

	@PostMapping(value = "/findid")
	public String findid(UserDto dto, Model m) {
		System.out.println(dto.toString());
		String username = dto.getUsername();
		String phone = dto.getPhone();
		List<String> userid;
		String msg;
		try {
			userid = service.sendId(username, phone);
			if(userid.size() == 0) {
				msg = "찾으시는 회원 정보가 존재하지않습니다. <br>"
						+ "이름과 전화번호를 다시 확인해주세요";
				m.addAttribute("findfail", "id");
			}else {
				msg = "회원님의 명의로 등록된 아이디들입니다.";
				m.addAttribute("idresults", userid);
			}
		} catch (Exception e) {
			msg = "아이디 조회에 실패했습니다.";
			m.addAttribute("findfail", "id");
			m.addAttribute("error", "error");
			e.printStackTrace();
		}
		m.addAttribute("msg", msg);
		return "user/finduserfinish";
	}
	
}
