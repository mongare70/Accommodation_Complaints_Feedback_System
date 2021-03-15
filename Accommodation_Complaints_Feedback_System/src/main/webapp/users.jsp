<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/navigation.jsp" %>
	
<div class="container-fluid bg">
	<button type="button" class="btn btn-primary btn-lg" onClick="window.location.href='/custodianUI.jsp'">Back</button>
    <br>
    <button type="button" class="btn btn-success btn-block" onClick="window.location.href='/reports.jsp'">Click Here To Go To <%=session.getAttribute("USER_FIRSTNAME")%>'s Reports</button>
    <br>
     		<%@page import="java.sql.DriverManager"%>
			<%@page import="java.sql.ResultSet"%>
			<%@page import="java.sql.Statement"%>
			<%@page import="java.sql.Connection"%>

			<%

			String driverName = "com.mysql.cj.jdbc.Driver";
			String connectionUrl = "jdbc:mysql://localhost:3306/accommodation_complaints_feedback_system";
			String userId = "root";
			String password = "";

			try {
			Class.forName(driverName);
			}catch (ClassNotFoundException e) {
			e.printStackTrace();
			}

			Connection connection = null;
			Statement statement = null;
			ResultSet resultSet = null;
			%>

			<table class="table table-bordered table-hover">

			<tr>
				<td>User ID</td>
				<td>Staff Number/Registration Number </td>
				<td>Firstname</td>
				<td>Lastname</td>
				<td>Username</td>
				<td>Email</td>
				<td>User Role</td>
				<td>User Status</td>
				<td>Report Student</td>
    		</tr>


			<%
			try{
			connection = DriverManager.getConnection(connectionUrl, userId, password);
			statement=connection.createStatement();
			String sql ="SELECT * FROM users WHERE user_role = 'student' ORDER BY user_id DESC";

			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
			<tr>
				<td><%out.println(resultSet.getString("user_id")); %></td>
				<td><%out.println(resultSet.getString("user_number")); %></td>
		    	<td><%out.println(resultSet.getString("user_firstname")); %></td>
		    	<td><%out.println(resultSet.getString("user_lastname")); %></td>
		    	<td><%out.println(resultSet.getString("username")); %></td>
		    	<td><%out.println(resultSet.getString("user_email")); %></td>
		    	<td><%out.println(resultSet.getString("user_role")); %></td>
		    	<td><%out.println(resultSet.getString("user_status")); %></td>
		    	<td><a href='users.jsp/report/<%out.println(resultSet.getString("user_id")); %>'>Report</a></td>
			</tr>

			<%
		    }

		    } catch (Exception e) {
		    e.printStackTrace();
		    }
			%>
			</table>
</div>


<%@ include file="/includes/footer.jsp" %>