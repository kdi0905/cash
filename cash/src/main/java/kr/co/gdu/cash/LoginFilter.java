package kr.co.gdu.cash;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//필터 implements Filter추가
@WebFilter(urlPatterns = "/admin/*") //필터 가로체기
public class LoginFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
	HttpSession session=((HttpServletRequest)request).getSession();
	if(session.getAttribute("loginId")==null) {
		((HttpServletResponse)response).sendRedirect(((HttpServletRequest) request).getContextPath()+"/login");
		return;
	}
	chain.doFilter(request, response);
		
	}

}
