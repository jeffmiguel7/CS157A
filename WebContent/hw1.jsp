<%@ page import="java.sql.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>JDBC Connection example</title>
		<link href="<c:url value='/style.css' />" rel="stylesheet" />
	</head>
	<body>
		<h1>HW1 3-TIER</h1>
			<table class="t1">
				<tr>
					<td class="t2">TITLE</td>
					<td class="t2">AUTHOR</td>
					<td class="t2">NO. OF PAGES &nbsp;</td>
				</tr>
				<%
					try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a","root","jeffspass#7.7.7");
							Statement stmt=con.createStatement();
							ResultSet rs=stmt.executeQuery("select * from books");
							while(rs.next()){
				%>
						    <tr>
							    <td class="list"><%=rs.getString(1) %> &nbsp;</td>
							    <td class="list"><%=rs.getString(2) %> &nbsp;</td>
							    <td><%=rs.getString(3) %></td>
							</tr>
					  <%}%>
			</table>
		    		<%
					    rs.close();
					    stmt.close();
					    con.close();
						} catch(Exception e) {
							out.println("SQLException caught: " + e.getMessage()); 
						}
					%>	
	</body>
</html>