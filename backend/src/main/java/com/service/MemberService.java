package com.service;

import java.sql.SQLException;
import java.util.List;

import com.vo.Member;

public interface MemberService {
	public List<Member> selectAll() throws SQLException;

	public void register(Member member) throws SQLException;

	public Member loginCheck(Member member) throws SQLException;

	public Member getProfile(Member member);

	public void update(Member member);
}
