<%@page import="elog.ExLogDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="elog.LoginDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//세션 기록으로 사용자 불러오기
	LoginDTO loginDTO = (LoginDTO) session.getAttribute("userDTO");
	
	//null 체크를 통해 예외 방지
	String uid = "";
	String name = "";
	
	if (loginDTO != null) {
		 uid = loginDTO.getUid();
		 name = loginDTO.getName();
	} else {
	 // 세션에서 사용자 정보를 가져오지 못한 경우에 대한 처리 또는 로깅
	 response.sendRedirect("../exceptionPage.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ELOG::log</title>
	<link rel="stylesheet" href="../CSS/style.css">
</head>
<body>
	<div id="wrap">
		<header class="head">
			<h3>안녕하세요 ELOG입니다.</h3>
		</header>
		<main class="main">
			<section class="exLogPage">
				<form action="./exLogProc.jsp?uid=<%= uid%>" method="post">
					<table>
						<tr>
							<td colspan="7">
							<%= name%>님의 <input type="date" name="date"> 운동 기록
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="exercise" placeholder="운동명">
							</td>
							<td>
								<input type="number" name="1setWeight" placeholder="1set 무게">
							</td>
							<td>
								<input type="number" name="1setCount" placeholder="1set 횟수">
							</td>
							<td>
								<input type="number" name="2setWeight" placeholder="2set 무게">
							</td>
							<td>
								<input type="number" name="2setCount" placeholder="2set 횟수">
							</td>
							<td>
								<input type="number" name="3setWeight" placeholder="2set 무게">
							</td>
							<td>
								<input type="number" name="3setCount" placeholder="2set 횟수">
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="exercise" placeholder="운동명">
							</td>
							<td>
								<input type="number" name="1setWeight" placeholder="1set 무게">
							</td>
							<td>
								<input type="number" name="1setCount" placeholder="1set 횟수">
							</td>
							<td>
								<input type="number" name="2setWeight" placeholder="2set 무게">
							</td>
							<td>
								<input type="number" name="2setCount" placeholder="2set 횟수">
							</td>
							<td>
								<input type="number" name="3setWeight" placeholder="2set 무게">
							</td>
							<td>
								<input type="number" name="3setCount" placeholder="2set 횟수">
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="exercise" placeholder="운동명">
							</td>
							<td>
								<input type="number" name="1setWeight" placeholder="1set 무게">
							</td>
							<td>
								<input type="number" name="1setCount" placeholder="1set 횟수">
							</td>
							<td>
								<input type="number" name="2setWeight" placeholder="2set 무게">
							</td>
							<td>
								<input type="number" name="2setCount" placeholder="2set 횟수">
							</td>
							<td>
								<input type="number" name="3setWeight" placeholder="2set 무게">
							</td>
							<td>
								<input type="number" name="3setCount" placeholder="2set 횟수">
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="exercise" placeholder="운동명">
							</td>
							<td>
								<input type="number" name="1setWeight" placeholder="1set 무게">
							</td>
							<td>
								<input type="number" name="1setCount" placeholder="1set 횟수">
							</td>
							<td>
								<input type="number" name="2setWeight" placeholder="2set 무게">
							</td>
							<td>
								<input type="number" name="2setCount" placeholder="2set 횟수">
							</td>
							<td>
								<input type="number" name="3setWeight" placeholder="2set 무게">
							</td>
							<td>
								<input type="number" name="3setCount" placeholder="2set 횟수">
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="exercise" placeholder="운동명">
							</td>
							<td>
								<input type="number" name="1setWeight" placeholder="1set 무게">
							</td>
							<td>
								<input type="number" name="1setCount" placeholder="1set 횟수">
							</td>
							<td>
								<input type="number" name="2setWeight" placeholder="2set 무게">
							</td>
							<td>
								<input type="number" name="2setCount" placeholder="2set 횟수">
							</td>
							<td>
								<input type="number" name="3setWeight" placeholder="2set 무게">
							</td>
							<td>
								<input type="number" name="3setCount" placeholder="2set 횟수">
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<input type="submit" value="저장 하기">
							</td>
							<td colspan="3">
								<a href="../loginMain.jsp">취 소</a>
							</td>
						</tr>
					</table>
				</form>
			</section>
		</main>
		<footer>
			<section class="footer">
				개발 연습 페이지
			</section>
		</footer>
	</div>
</body>
</html>