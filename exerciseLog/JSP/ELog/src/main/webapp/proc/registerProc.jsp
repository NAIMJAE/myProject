<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 문자 인코딩
	request.setCharacterEncoding("UTF-8");

	// 사용자 정보 변수로 받기
	String uid = request.getParameter("uid");
	String pw = request.getParameter("pw");
	String pwcheck = request.getParameter("passcheck");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String height = request.getParameter("height");
	
	// DB 정보 불러오기
	String host = "jdbc:mysql://127.0.0.1:3306/exerciselog";
	String user = "Elog";
	String pass = "abc1234";
	
	// 비밀번호 확인
	if (!pw.equals(pwcheck)) {
		response.sendRedirect("./register.jsp?pwcheckmissing");
	}else {
		// sql문 적용
		try {
			// JDBC 불러오기
			Class.forName("com.mysql.cj.jdbc.Driver");
			// connetion
			Connection conn = DriverManager.getConnection(host, user, pass);
			// sql문
			String sql = "INSERT INTO `User` VALUES (?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);
			psmt.setString(2, pw);
			psmt.setString(3, name);
			psmt.setString(4, birth);
			psmt.setString(5, height);
			// sql 실행		
			psmt.executeUpdate();
			// 결과 처리
			// close
			conn.close();
			psmt.close();
		
		}catch (Exception e) {
	        e.printStackTrace();
		}
		// 로그인 페이지로 이동
		response.sendRedirect("./login.jsp");
	}
%>
