<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="elog.LoginDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//문자 인코딩
	request.setCharacterEncoding("UTF-8");

	// 사용자 정보 변수로 받기
	String uid = request.getParameter("uid");
	String pw = request.getParameter("pw");
	
	// DB 정보 불러오기
	String host = "jdbc:mysql://127.0.0.1:3306/exerciselog";
	String user = "Elog";
	String pass = "abc1234";
	
	// userDTO 불러오기
	List<LoginDTO> loginDTO = new ArrayList<>();
	
	try {
		// JDBC 불러오기
		Class.forName("com.mysql.cj.jdbc.Driver");
		// connetion
		Connection conn = DriverManager.getConnection(host, user, pass);
		// sql문
		PreparedStatement stmt = conn.prepareStatement("SELECT * FROM `user` WHERE `uid`=?");
		stmt.setString(1, uid);
		// sql 실행		
		ResultSet rs = stmt.executeQuery();
		// 결과 처리
		if (rs.next()) {
			LoginDTO dto = new LoginDTO();
			dto.setUid(rs.getString("uid"));
			dto.setPw(rs.getString("pass"));
			dto.setName(rs.getString("name"));
			loginDTO.add(dto);
		}
		// close
		conn.close();
		stmt.close();
		rs.close();
	
	}catch (Exception e) {
        e.printStackTrace();
	}
	
	// 아이디 확인
    if (!loginDTO.isEmpty()) {
        LoginDTO userDTO = loginDTO.get(0); // 첫 번째 객체 가져오기
        
        if (uid.equals(userDTO.getUid())) {
            // DB의 where `uid`=?의
            		
            if (pw.equals(userDTO.getPw())) {
            	// 로그인 성공 시
                session.setAttribute("userDTO", userDTO); // 세션에 사용자 정보 저장
                response.sendRedirect("../loginMain.jsp");
            } else {
                // 비밀번호가 일치하지 않을 때
                response.sendRedirect("./login.jsp?error=password");
            }
        } else {
            // 아이디가 일치하지 않을 때
            response.sendRedirect("./login.jsp?error=username");
        }
    } else {
        // 아이디가 존재하지 않을 때
        response.sendRedirect("./login.jsp?error=username");
    }
%>