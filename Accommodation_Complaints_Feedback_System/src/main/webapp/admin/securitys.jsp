<%@ include file="/admin/includes/admin_header.jsp" %>
<%@ include file="/admin/includes/admin_navigation.jsp" %>
	
<div class="container-fluid bg">

     		<%@ include file="/admin/includes/db.jsp" %>

			<table class="table table-bordered table-hover">

			<tr>
				<td>User ID</td>
				<td>Staff Number</td>
				<td>Firstname</td>
				<td>Lastname</td>
				<td>Username</td>
				<td>Email</td>
				<td>User Role</td>
				<td>Created At</td>
				<td>Delete</td>
    		</tr>


			<%
			try{
			connection = DriverManager.getConnection(connectionUrl, userId, password);
			statement=connection.createStatement();
			String sql ="SELECT * FROM users WHERE user_role = 'security' ORDER BY user_id DESC";

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
		    	<td><%out.println(resultSet.getString("created_at")); %></td>
		    	<td><a href='users.jsp/delete/<%out.println(resultSet.getString("user_id")); %>'>Delete</a></td>
			</tr>

			<%
		    }

		    } catch (Exception e) {
		    e.printStackTrace();
		    }
			%>
			</table>
</div>


<%@ include file="/admin/includes/admin_footer.jsp" %>