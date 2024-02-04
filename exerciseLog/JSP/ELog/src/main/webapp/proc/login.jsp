<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ELOG::login</title>
	<link rel="stylesheet" href="../CSS/style.css">
</head>
<body>
	<div id="wrap">
		<header class="head">
			<h3>안녕하세요 ELOG입니다.</h3>
		</header>
		<main class="main">
			<section class="loginpage">
				<form action="./loginProc.jsp">
					<table>
						<tr>
							<td>로그인</td>
							<td>
								<input type="text" name="uid" placeholder="아이디">
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td>
								<input type="password" name="pw" placeholder="비밀번호">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="로그인">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<a href="./register.jsp">회원가입</a>
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