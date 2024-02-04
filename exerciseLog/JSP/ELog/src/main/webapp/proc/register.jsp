<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ELog::register</title>
	<link rel="stylesheet" href="../CSS/style.css">
</head>
<body>
	<div id="wrap">
		<header class="head">
			<h3>안녕하세요 ELOG입니다.</h3>
		</header>
		<main class="main">
			<section class="registerpage">
				<form action="./registerProc.jsp">
					<table>
						<tr>
							<td>아이디</td>
							<td>
								<input type="text" name="uid" placeholder="영문, 숫자 조합 15자 이하" maxlength="15" required>
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td>
								<input type="password" name="pw" placeholder="영문, 숫자 조합 15자 이하" maxlength="15" required>
							</td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td>
								<input type="password" name="passcheck" placeholder="비밀번호를 한 번 더 입력" maxlength="15" required>
							</td>
						</tr>
						<tr>
							<td>이름</td>
							<td>
								<input type="text" name="name" maxlength="10" required>
							</td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td>
								<input type="date" name="birth" value="1996-01-01" maxlength="10" required>
							</td>
						</tr>
						<tr>
							<td>신장</td>
							<td>
								<input type="text" name="height" maxlength="3" required>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="회원가입">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<a href="./login.jsp">취소</a>
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