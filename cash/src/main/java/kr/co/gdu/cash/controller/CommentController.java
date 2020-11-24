package kr.co.gdu.cash.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.gdu.cash.service.CommentService;
import kr.co.gdu.cash.vo.Comment;

@Controller
public class CommentController {
	@Autowired CommentService commentService;
	
	@GetMapping("/admin/insertComment")
	public String insertCommentbyNoticeId(Comment comment) {
		 commentService.insertComment(comment);
		 return "redirect:/admin/noticeOne/"+comment.getNoticeId();
	}
	
}
