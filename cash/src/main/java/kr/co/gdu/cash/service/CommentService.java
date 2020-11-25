package kr.co.gdu.cash.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CommentMapper;
import kr.co.gdu.cash.vo.Comment;

@Service
@Transactional
public class CommentService {
	@Autowired CommentMapper commentMapper;
	
	public int insertComment(Comment comment){
		return commentMapper.insertComment(comment);
	}
	
	public List<Map<String,Object>> getComment(int noticeId) {
		return commentMapper.selectComment(noticeId);
	}
	public int deleteCommentOne(int commentId) {
		return commentMapper.deleteCommentOne(commentId);
	}
}
