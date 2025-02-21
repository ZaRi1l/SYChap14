<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.DriverManager" %>
    <%@ page import = "java.sql.Connection" %>
    <%@ page import = "java.sql.Statement" %>
    <%@ page import = "java.sql.ResultSet" %>
    <%@ page import = "java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>

MEMEBER 테이블의 내용
<table width="100%" border = "1">
<tr>
<td>이름</td><td>아이디</td><td>이메일</td>
</tr>
<%
// jdbc 드라이버 로딩
Class.forName("oracle.jdbc.driver.OracleDriver");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
	String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbUser = "jspexam";
	String dbPass = "jsppw";
	
	String query = "select * from MEMBER order by MEMBERID";
	
	//2. 데베 커넥션 생성
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	stmt = conn.createStatement();
	
	rs = stmt.executeQuery(query);
	
	while(rs.next()) {
		%>
		<tr>
		<td><%= rs.getString("NAME") %></td>
		<td><%= rs.getString("MEMBERID") %></td>
		<td><%= rs.getString("EMAIL") %></td>
		</tr>
		<%
	}
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try {rs.close();} catch (SQLException ex) {}
	if (stmt != null) try {stmt.close();} catch (SQLException ex) {}
	
	if (conn != null) try {conn.close();} catch (SQLException ex) {}
}
%>
</table>

</body>
</html>