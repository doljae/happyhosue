package com.mapper;

import java.util.List;

import com.vo.Member;

public interface MemberMapper {

	public void register(Member member);

	public List<Member> selectAll();

	public Member loginCheck(Member member);
	
	public Member getProfile(Member member);

	public void update(Member member);

}
