<%@ page import="membership.MemberDTO" %>
<%@ page import="membership.MemberDAO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");

String mySQLDriver = application.getInitParameter("MySQLDriver");
String mySQLURL = application.getInitParameter("MySQLURL");
String mySQLId = application.getInitParameter("MySQLId");
String mySQLPwd = application.getInitParameter("MySQLPwd");

// 회원 테이블 DAO를 통해 회원정보 DTO 획득
MemberDAO dao = new MemberDAO(mySQLDriver, mySQLURL, mySQLId, mySQLPwd);
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
dao.close();

// 로그인 성공 여부에 따른 처리
if(memberDTO.getId() != null){
	// 로그인 성공
	session.setAttribute("UserId", userId);
	session.setAttribute("UserName", userId);
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	//response.sendRedirect("LoginForm.jsp");
} else {
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>