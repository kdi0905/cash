package kr.co.gdu.cash.restmapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberRestMapper {
	public String selectMemberId(String memberId);
	public String selectMemberName(String memberName);
}
