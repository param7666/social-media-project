package com.nt.interceptors;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class SessionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req,HttpServletResponse res, Object handler) throws Exception {
		
		// allow login and register page
		String uri=req.getRequestURI();
		if(uri.contains("login") || uri.contains("register")) {
			return true;
		}
		
		// check session for user
		HttpSession session=req.getSession(false);
		System.out.println(session);
		if(session!=null && session.getAttribute("user")!=null) {
			return true; // user logged in countinew
		}
		
		// no session redireect to login
		res.sendRedirect("/");
		return false;
	}
}
