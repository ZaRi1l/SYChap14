<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import = "java.sql.DriverManager" %>
    <%@ page import = "java.sql.Connection" %>
    <%@ page import = "java.sql.PreparedStatement" %>
    <%@ page import = "java.sql.SQLException" %>
    
<%
request.setCharacterEncoding("utf-8");

String memberID = request.getParameter("memberID");
String password = request.getParameter("password");
String name = request.getParameter("name");
String email = request.getParameter("email");


Class.forName("oracle.jdbc.driver.OracleDriver");

Connection conn = null;
PreparedStatement pstmt = null;

try {
	String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbUser = "jspexam";
	String dbPass = "jsppw";
	
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	pstmt = conn.prepareStatement(
			"INSERT INTO MEMBER VALUES(?, ?, ?, ?)");
	pstmt.setString(1, memberID);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, email);
	
	pstmt.executeUpdate();
} finally {
	if (pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
	if (conn != null) try {conn.close();} catch (SQLException ex) {}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삽입</title>
</head>
<body>
MEMBER 테이블에 새로운 레코드를 삽입했습니다
</body>
</html>