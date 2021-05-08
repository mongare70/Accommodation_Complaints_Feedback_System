<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/navigation.jsp" %>
	
<div class="container-fluid bg">

     		<%@ include file="/admin/includes/db.jsp" %>

			<table class="table table-bordered table-hover">

			<tr>
				<td>User ID</td>
				<td>Staff Number/Registration Number </td>
				<td>Firstname</td>
				<td>Lastname</td>
				<td>Username</td>
				<td>Email</td>
				<td>User Role</td>
				<td>Hostel</td>
				<td>Block</td>
				<td>Room Number</td>
    		</tr>


			<%
			try{
			connection = DriverManager.getConnection(connectionUrl, userId, password);
			statement=connection.createStatement();
			String sql ="SELECT * FROM users WHERE user_id = "+request.getAttribute("userId");

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
		    	<td><%out.println(resultSet.getString("user_hostel")); %></td>
		    	<td><%out.println(resultSet.getString("user_block")); %></td>
		    	<td><%out.println(resultSet.getString("user_room_number")); %></td>
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