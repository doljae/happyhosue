package com.dao;

import java.sql.SQLException;
import java.util.List;

import com.vo.Member;

public interface MemberDao {

	public void register(Member member);

	public List<Member> selectAll();

	public Member loginCheck(Member member) throws SQLException;

	public Member getProfile(Member member);

	public void update(Member member);
}
