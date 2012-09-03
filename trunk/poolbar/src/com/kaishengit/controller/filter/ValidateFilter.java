package com.kaishengit.controller.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaishengit.pojo.Account;

public class ValidateFilter extends AbstractFilter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;

		String uri1 = request.getRequestURI();
		String uri2 = uri1.substring(uri1.lastIndexOf("/") + 1);

		if ("".equals(uri2)||"home".equals(uri2) || "login".equals(uri2)|| uri1.contains("static/")) {
			
			chain.doFilter(request, response);
		} else {
			HttpSession session = request.getSession();
			Account account = (Account) session.getAttribute("account");
			if(account == null){
				String error = "ÇëÏÈµÇÂ¼";
				response.sendRedirect("home?errormsg=" + error);
			} else {
				chain.doFilter(request, response);
			}
		}
	}
}
