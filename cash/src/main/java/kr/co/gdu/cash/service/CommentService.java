package kr.co.gdu.cash.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CommentMapper;
import kr.co.gdu.cash.vo.Comment;

@Service
@Transactional
public class CommentService {
	@Autowired CommentMapper commentRestMapper;
	
	public int insertComment(Comment comment){
		return commentRestMapper.insertComment(comment);
	}
	
	public Comment getComment(int noticeId) {
		return commentRestMapper.selectComment(noticeId);
	}
}
