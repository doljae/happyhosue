package com.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.service.MemberService;
import com.service.SecurityService;
import com.vo.Member;

@CrossOrigin
@RestController
public class MemberController {
	@Autowired
	MemberService service;
	@Autowired
	SecurityService securityService;

	@GetMapping(value = "/register")
	public List<Member> selectAll() throws SQLException {
		return service.selectAll();
	}

	@PostMapping(value = "/register")
	public Map register(@RequestBody Member member) throws SQLException {
		service.register(member);
		Map<String, String> map = new HashMap();
		map.put("result", "추가성공");
		return map;
	}

	@PostMapping(value = "/loginCheck")
	public Map loginCheck(@RequestBody Member member) throws SQLException {
		System.out.println(member);
		Member resultMember = service.loginCheck(member);
		Map<String, String> map = new HashMap();
		System.out.println(resultMember);
		if (resultMember != null) {
			String token = securityService.createToken(resultMember.getId(), (60 * 1000 * 60));
			map.put("result", "로그인성공");
			map.put("auth-token", token);
			map.put("user-id", resultMember.getId());
			map.put("user-name", resultMember.getLastName() + resultMember.getFirstName());
		} else {
			map.put("result", "로그인실패");
		}
		return map;
	}

	@PostMapping(value = "/profile")
	public Member profile(@RequestBody Member member) throws SQLException {
		Member resultMember = service.getProfile(member);
		resultMember.setPw(null);
		System.out.println(resultMember);
		return resultMember;
	}

	@PutMapping(value = "/update")
	public void update(@RequestBody Member member) throws SQLException {
		System.out.println(member);
		service.update(member);
	}

}
