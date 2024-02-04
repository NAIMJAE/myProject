<%@page import="java.util.ArrayList"%>
<%@page import="elog.ExLogDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="elog.LoginDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 세션 기록으로 사용자 불러오기
	LoginDTO loginDTO = (LoginDTO) session.getAttribute("userDTO");
	String uid = loginDTO.getUid();
	String name = loginDTO.getName();
	
	// DB 정보 불러오기
	String host = "jdbc:mysql://127.0.0.1:3306/exerciselog";
	String user = "Elog";
	String pass = "abc1234";
	
	// exLogDTO 불러오기
	List<ExLogDTO> exLogDTO = new ArrayList<>();
	
	// 운동 기록 DB에서 정보 불러오기
	try {
		// JDBC 불러오기
		Class.forName("com.mysql.cj.jdbc.Driver");
		// connetion
		Connection conn = DriverManager.getConnection(host, user, pass);
		// sql문
		PreparedStatement stmt = conn.prepareStatement("SELECT * FROM `custlog` where `uid`=? order by `date`");
		stmt.setString(1, uid);
		// sql 실행		
		ResultSet rs = stmt.executeQuery();
		// 결과 처리
		while (rs.next()) {
			ExLogDTO dto = new ExLogDTO();
			dto.setUid(rs.getString("uid"));
			dto.setDate(rs.getString("date"));
			dto.setExNum(rs.getString("exNum"));
			dto.setExercise(rs.getString("exercise"));
			dto.setSet1Weight(rs.getInt("1setWeight"));
			dto.setSet1Count(rs.getInt("1setCount"));
			dto.setSet2Weight(rs.getInt("2setWeight"));
			dto.setSet2Count(rs.getInt("2setCount"));
			dto.setSet3Weight(rs.getInt("3setWeight"));
			dto.setSet3Count(rs.getInt("3setCount"));
			exLogDTO.add(dto);
		}
		// close
		conn.close();
		stmt.close();
		rs.close();
	
	}catch (Exception e) {
        e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ELOG::main</title>
	<link rel="stylesheet" href="./CSS/style.css">
</head>
<body>
	<div id="wrap">
		<header class="head">
			<h3>안녕하세요 ELOG입니다.로그인성공</h3>
		</header>
		<main class="main">
			<section class="logmain_logbtn">
				<a href="./proc/exLog.jsp">운동 기록하기</a>
			</section>
			<section class="logmain_log">
				<h4>나의 운동 일지</h4>
				<table border="0">
					<tr>
						<td rowspan="2">날짜</td>
						<td rowspan="2">운동명</td>
						<td colspan="2">1set</td>
						<td colspan="2">2set</td>
						<td colspan="2">3set</td>
					</tr>
					<tr>
						<td>무게</td>
						<td>횟수</td>
						<td>무게</td>
						<td>횟수</td>
						<td>무게</td>
						<td>횟수</td>
					</tr>
					 <%
                        String currentDate = null;
                        for (ExLogDTO log : exLogDTO) {
                            // 현재 날짜가 이전 날짜와 같은지 확인
                            boolean sameDate = currentDate != null && currentDate.equals(log.getDate());
                    %>
                        <tr>
                            <%-- 날짜가 이전과 같은 경우 rowspan을 적용하지 않음 --%>
                            <% if (!sameDate) { %>
                                <td rowspan="<%= exLogDTO.stream().filter(e -> e.getDate().equals(log.getDate())).toArray().length %>"><%= log.getDate() %></td>
                            <% } %>
                            <td><%= log.getExercise() %></td>
                            <td><%= log.getSet1Weight() %></td>
                            <td><%= log.getSet1Count() %></td>
                            <td><%= log.getSet2Weight() %></td>
                            <td><%= log.getSet2Count() %></td>
                            <td><%= log.getSet3Weight() %></td>
                            <td><%= log.getSet3Count() %></td>
                        </tr>
                    <%
                            // 현재 날짜를 업데이트
                            currentDate = log.getDate();
                        }
                    %>
				</table>
			</section>
			
		</main>
	</div>
</body>
</html>