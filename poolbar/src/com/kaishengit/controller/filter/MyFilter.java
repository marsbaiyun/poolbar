package com.kaishengit.controller.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class MyFilter extends AbstractFilter {

	private String encoding = "utf-8";
	
	/**
	 * ���web.xml��coding����
	 */
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

		String temp = filterConfig.getInitParameter("encoding");
		if (temp != null && !temp.equals("")) {
			encoding = temp;
		}
	}
	
	/**
	 * ���ַ�����תΪ  web.xml�����õģ�
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding(encoding);
		chain.doFilter(request, response);
	}

}
