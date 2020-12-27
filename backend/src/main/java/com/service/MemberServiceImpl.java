package com.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDao;
import com.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;

	@Override
	public void register(Member member) throws SQLException {
		dao.register(member);
	}

	@Override
	public List<Member> selectAll() throws SQLException {

		return dao.selectAll();
	}

	@Override
	public Member loginCheck(Member member) throws SQLException {
		return dao.loginCheck(member);
	}

	@Override
	public void update(Member member) {
		dao.update(member);

	}

	@Override
	public Member getProfile(Member member) {
		return dao.getProfile(member);
	}

}
