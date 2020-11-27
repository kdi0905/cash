package kr.co.gdu.cash.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.MemberMapper;
import kr.co.gdu.cash.vo.Member;

@Service
@Transactional
public class MemberService {
	@Autowired private MemberMapper memberMapper;
	public int addMember(Member member){
		return memberMapper.insertMember(member);
	}
	
	public Member getMemberById(Member paramMember) {
	
		Member member = memberMapper.selectMemberById(paramMember.getMemberId());
		/*if(member == null) {
			return null;
		}else if(member.getPw().equals(pw)!=true) {
			return null;
		}else {
			return member;
		}*/
		if(member!=null && member.getMemberPw().equals(paramMember.getMemberPw())==true) {
			return member;
		}
		return null;
	}
	
	public Member getMemberName(String memberId) {
		return memberMapper.selectMemberById(memberId);
	}
}
