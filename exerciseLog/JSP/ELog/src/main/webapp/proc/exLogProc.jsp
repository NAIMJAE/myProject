<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="elog.ExLogDTO" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // 문자 인코딩
    request.setCharacterEncoding("UTF-8");

    // 사용자 정보 변수로 받기
    String uid = request.getParameter("uid");
    String date = request.getParameter("date");

    // 배열의 길이는 5로 가정하고, 사용자가 입력한 운동 수에 따라 동적으로 크기를 조절할 수 있습니다.
    int exerciseCount = 5;
    List<ExLogDTO> logList = new ArrayList<>();

    for (int i = 1; i <= exerciseCount; i++) {
        // 각 운동 기록에 대한 값들
        String exercise = request.getParameter("exercise" + i);
        int set1Weight = Integer.parseInt(request.getParameter("1setWeight" + i));
        int set1Count = Integer.parseInt(request.getParameter("1setCount" + i));
        int set2Weight = Integer.parseInt(request.getParameter("2setWeight" + i));
        int set2Count = Integer.parseInt(request.getParameter("2setCount" + i));
        int set3Weight = Integer.parseInt(request.getParameter("3setWeight" + i));
        int set3Count = Integer.parseInt(request.getParameter("3setCount" + i));

        // ExLogDTO 객체 생성 및 값 설정
        ExLogDTO logDTO = new ExLogDTO();
        logDTO.setUid(uid);
        logDTO.setDate(date);
        logDTO.setExNum("ex" + i);
        logDTO.setExercise(exercise);
        logDTO.setSet1Weight(set1Weight);
        logDTO.setSet1Count(set1Count);
        logDTO.setSet2Weight(set2Weight);
        logDTO.setSet2Count(set2Count);
        logDTO.setSet3Weight(set3Weight);
        logDTO.setSet3Count(set3Count);

        // List에 객체 추가
        logList.add(logDTO);
    }

    try {
        // JDBC 불러오기
        Class.forName("com.mysql.cj.jdbc.Driver");
        // connetion
        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/exerciselog", "Elog", "abc1234");
        // sql문
        String sql = "INSERT INTO `custlog` VALUES (?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement psmt = conn.prepareStatement(sql);

        // List 순회하면서 데이터 삽입
        for (ExLogDTO logDTO : logList) {
            psmt.setString(1, logDTO.getUid());
            psmt.setString(2, logDTO.getDate());
            psmt.setString(3, logDTO.getExNum());
            psmt.setString(4, logDTO.getExercise());
            psmt.setInt(5, logDTO.getSet1Weight());
            psmt.setInt(6, logDTO.getSet1Count());
            psmt.setInt(7, logDTO.getSet2Weight());
            psmt.setInt(8, logDTO.getSet2Count());
            psmt.setInt(9, logDTO.getSet3Weight());
            psmt.setInt(10, logDTO.getSet3Count());
            // sql 실행
            psmt.executeUpdate();
        }

        // close
        conn.close();
        psmt.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    // 로그인메인 페이지로 이동
    response.sendRedirect("../loginMain.jsp");
%>
