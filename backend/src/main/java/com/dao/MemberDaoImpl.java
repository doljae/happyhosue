package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mapper.MemberMapper;
import com.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	MemberMapper mapper;

	@Override
	public void register(Member member) {
		mapper.register(member);
	}

	@Override
	public List<Member> selectAll() {
		return mapper.selectAll();
	}

	@Override
	public Member loginCheck(Member member) throws SQLException {
		return mapper.loginCheck(member);
	}

	@Override
	public void update(Member member) {
		mapper.update(member);

	}

	@Override
	public Member getProfile(Member member) {
		return mapper.getProfile(member);
	}

}
