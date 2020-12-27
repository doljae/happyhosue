package com.controller;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.service.SecurityService;

@CrossOrigin
@RestController
public class SecurityController {
	@Autowired
	private SecurityService securityService;

	@GetMapping("/gen/token")
	public Map<String, Object> genToken(@RequestParam(value = "subject") String subject) {
		String token = securityService.createToken(subject, (60 * 1000 * 60));
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("result", token);
		return map;
	}

	@ResponseBody
	@GetMapping("/get/subject")
	public Map<String, Object> getSubject(@RequestParam("token") String token) {
		String subject = securityService.getSubject(token);
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("result", subject);
		return map;
	}
}