package kr.co.gdu.cash.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import kr.co.gdu.cash.service.CommentService;
import kr.co.gdu.cash.vo.Comment;

@Controller
public class CommentController {
	@Autowired private CommentService commentService;
	
	@GetMapping("/admin/insertComment")
	public String insertCommentbyNoticeId(Comment comment, HttpServletRequest request) {
		HttpSession session=((HttpServletRequest)request).getSession();
		comment.setMemberId((String)session.getAttribute("loginId"));
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
