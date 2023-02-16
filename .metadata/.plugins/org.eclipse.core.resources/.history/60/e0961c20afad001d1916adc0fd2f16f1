package edu.pnu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/myservlet05")
public class MyServlet05 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("MyServlet05-service");
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<div style=\"width:100%; height:100%; display: flex; justify-content: center; align-items: center;\">");
		out.println("<table border=1 style=\"border-collapse: collapse; width: 400px; text-align: center;\">");
		out.println("<tr><th>번호</th><th>나라</th><th>수도</th><th>인구</th></tr>");
		out.println("<tr><td>1</td><td>대한민국</td><td>서울</td><td>1000만</td></tr>");
		out.println("<tr><td>2</td><td>미국</td><td>워싱턴</td><td>70만</td></tr>");
		out.println("<tr><td>3</td><td>일본</td><td>도쿄</td><td>1400만</td></tr>");
		out.println("<tr><td>4</td><td>중국</td><td>베이징</td><td>2100만</td></tr>");
		out.println("</table></div>");
		out.close();
		super.service(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("MyServlet05-doGet");
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<div style=\"width:100%; height:100%; display: flex; justify-content: center; align-items: center;\">");
		out.println("<table border=1 style=\"border-collapse: collapse; width: 400px; text-align: center;\">");
		out.println("<tr><th>번호</th><th>나라</th><th>수도</th><th>인구</th></tr>");
		out.println("<tr><td>1</td><td>대한민국</td><td>서울</td><td>1000만</td></tr>");
		out.println("<tr><td>2</td><td>미국</td><td>워싱턴</td><td>70만</td></tr>");
		out.println("<tr><td>3</td><td>일본</td><td>도쿄</td><td>1400만</td></tr>");
		out.println("<tr><td>4</td><td>중국</td><td>베이징</td><td>2100만</td></tr>");
		out.println("</table></div>");
		out.close();
	}
}
