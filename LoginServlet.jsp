package com.kenneth.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher;
		dispatcher = request.getRequestDispatcher("member/login.jsp");
		dispatcher.forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // post 방식의 한글설정
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter(); // 웹페이지 출력 처리 
		
		String url = "member/login.jsp";
		// DB 연동 후 수정 
		String id = "";
		String pwd = "";
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		out.print("아이디: "+userId);
		out.print("<br>");
		out.print("비밀번호: "+userPwd);
		
		if(id.equals(userId) && pwd.equals(userPwd)) {
			url="main.jsp";
		} else {
			url="member/login.jsp";
		}
		
		RequestDispatcher dispatcher;
		dispatcher = request.getRequestDispatcher("url");
		dispatcher.forward(request,response);
	}

}
