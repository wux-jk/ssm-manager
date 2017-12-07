package com.zihexin.user.constant.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PramFilter implements Filter{

	//初始化
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	//执行的时候调用
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {




		//通过强转获取session
		/*HttpServletRequest httpRequest=(HttpServletRequest) request;
		HttpServletResponse httpResponse =(HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		String loginUrl = httpRequest.getContextPath() + "index.jsp";
		String url = httpRequest.getRequestURI();
		String path = url.substring(url.lastIndexOf("/"));
		if (path.indexOf(".action") != -1 && session.getAttribute("LOGIN_SUCCESS") == null){

			if (httpRequest.getHeader("x-requested-with") != null && httpRequest.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")){

				httpResponse.addHeader("sessionstatus", "timeOut");
				httpResponse.addHeader("loginPath", loginUrl);
				chain.doFilter(request, response);// 不可少，否则请求会出错
			}else {


 			String str = "<script language='javascript'>alert('会话过期,请重新登录');"
                        + "window.top.location.href='"
                        + loginUrl
                        + "';</script>";

				response.setContentType("text/html;charset=UTF-8");// 解决中文乱码
				try {
					PrintWriter writer = response.getWriter();
					writer.write(str);
					writer.flush();
					writer.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		}else {
			chain.doFilter(request, response);
		}*/
	/*	System.out.println(httpRequest.getSession().getId());
		System.out.println("初始化过滤器");*/
		//调用这个方法向下执行
		chain.doFilter(request, response);
	}

	//销毁
	@Override
	public void destroy() {
		
	}

}
