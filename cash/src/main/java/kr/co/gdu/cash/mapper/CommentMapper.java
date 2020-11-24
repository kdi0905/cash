package kr.co.gdu.cash.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Comment;

@Mapper
public interface CommentMapper {
	public int insertComment(Comment comment);
	public Comment selectComment(int noticeId);
	
}
