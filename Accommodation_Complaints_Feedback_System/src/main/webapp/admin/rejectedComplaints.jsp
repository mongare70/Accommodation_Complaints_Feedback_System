<%@ include file="/admin/includes/admin_header.jsp" %>
<%@ include file="/admin/includes/admin_navigation.jsp" %>
	
<div class="container-fluid bg">

     		<%@ include file="/admin/includes/db.jsp" %>

			<table class="table table-bordered table-hover">

			<tr>
				<td>Complaint ID</td>
				<td>Complaint Category</td>
				<td>Complaint Content</td>
				<td>Complaint Author: (ID)</td>
				<td>Complaint Status</td>
				<td>Hostel</td>
				<td>Block</td>
				<td>Room Number</td>
				<td>Complaint Rejected By: (ID)</td>
				<td>Created At:</td>
				<td>Delete</td>
    		</tr>


			<%
			try{
			connection = DriverManager.getConnection(connectionUrl, userId, password);
			statement=connection.createStatement();
			String sql ="SELECT * FROM complaints WHERE complaint_status = 'rejected' ORDER BY complaint_id DESC";

			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
			<tr>
				<td><%out.println(resultSet.getString("complaint_id")); %></td>
				<td><%out.println(resultSet.getString("complaint_category")); %></td>
		    	<td><%out.println(resultSet.getString("complaint_content")); %></td>
		    	<td><%out.println(resultSet.getString("complaint_author_id")); %></td>
		    	<td><%out.println(resultSet.getString("complaint_status")); %></td>
		    	<td><%out.println(resultSet.getString("complaint_hostel")); %></td>
		    	<td><%out.println(resultSet.getString("complaint_block")); %></td>
		    	<td><%out.println(resultSet.getString("complaint_room_number")); %></td>
		    	<td><%out.println(resultSet.getString("complaint_approved_or_rejected_by")); %></td>
		    	<td><%out.println(resultSet.getString("created_at")); %></td>
		    	<td><a href='complaints.jsp/delete/<%out.println(resultSet.getString("complaint_id")); %>'>Delete</a></td>
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