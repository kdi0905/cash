package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Comment;

@Mapper
public interface CommentMapper {
	public int insertComment(Comment comment);
	public List<Map<String,Object>> selectComment(int noticeId);
	public int deleteCommentOne(int commentId);
	public int deleteCommentAll(int noticeId);
	
}
