package kr.co.gdu.cash.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import kr.co.gdu.cash.mapper.CommentMapper;
import kr.co.gdu.cash.service.CommentService;
import kr.co.gdu.cash.vo.Comment;

@Controller
public class CommentController {
	@Autowired private CommentService commentService;
	
	@GetMapping("/admin/insertComment")
	public String insertCommentbyNoticeId(Comment comment) {
		 commentService.insertComment(comment);
		 return "redirect:/admin/noticeOne/"+comment.getNoticeId();
	}
	
	@GetMapping("/admin/deleteComment/{noticeId}/{commentId}")
	public String deleteCommentOne(
			@PathVariable(name="noticeId")int noticeId,
			@PathVariable(name="commentId")int commentId) {
		commentService.deleteCommentOne(commentId);
		return "redirect:/admin/noticeOne/"+noticeId;
	}
	
	
	
}
