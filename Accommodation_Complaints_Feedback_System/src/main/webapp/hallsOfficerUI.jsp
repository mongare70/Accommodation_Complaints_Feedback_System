<%@ include file="/includes/header.jsp"%>
<div class="d-flex" id="wrapper">
		
            <!-- Sidebar-->
			<div class="border-end bg-white" id="sidebar-wrapper">
				<div class="sidebar-heading border-bottom bg-light">ACMS</div>
			    <div class="list-group list-group-flush">
			        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/hallsOfficerDashboard.jsp">Dashboard</a>
			        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/hallsOfficerUI.jsp">Approve/Reject Complaints</a>
			        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/hallsOfficerApprovedComplaints.jsp">Approved Complaints</a>
			        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/hallsOfficerRejectedComplaints.jsp">Rejected Complaints</a>
			    </div>
			</div>
            
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
            
            	<!-- Navbar -->
               	<%@ include file="/includes/navigation.jsp"%>
               
               	<%
					if (session.getAttribute("USER_ID") != null && session.getAttribute("USER_ROLE").equals("halls_officer")) {
				%>
               
                <!-- Page content-->
                <div class="container-fluid bg">
                	
                	<%@ include file="/admin/includes/db.jsp" %>
     				
     				<br>
     				
					<h1 style="text-align: center;">List of Pending Complaints</h1>
					<table class="table table-bordered table-hover">
		
					<tr>
						<td>Complaint Category</td>
						<td>Complaint Content</td>
						<td>Complaint Author: (ID)</td>
						<td>Complaint Status</td>
						<td>Hostel</td>
						<td>Block</td>
						<td>Room Number</td>
						<td>Created At:</td>
						<td>Approve</td>
						<td>Reject</td>
		    		</tr>
		
					<%
					try{
					connection = DriverManager.getConnection(connectionUrl, userId, password);
					statement=connection.createStatement();
					String sql ="SELECT * FROM complaints WHERE complaint_status = 'pending' ORDER BY complaint_id DESC";
		
					resultSet = statement.executeQuery(sql);
					while(resultSet.next()){
					%>
					<tr>
						<td><%out.println(resultSet.getString("complaint_category")); %></td>
				    	<td><%out.println(resultSet.getString("complaint_content")); %></td>
				    	<td><a href='user/<%out.println(resultSet.getString("complaint_author_id")); %>'><%out.println(resultSet.getString("complaint_author_id")); %></a></td>
				    	<td><%out.println(resultSet.getString("complaint_status")); %></td>
				    	<td><%out.println(resultSet.getString("complaint_hostel")); %></td>
				    	<td><%out.println(resultSet.getString("complaint_block")); %></td>
				    	<td><%out.println(resultSet.getString("complaint_room_number")); %></td>
				    	<td><%out.println(resultSet.getString("created_at")); %></td>
				    	<td><a href='hallsOfficerUI.jsp/approve/<%out.println(resultSet.getString("complaint_id")); %>/<%=session.getAttribute("USER_ID")%>/'>Approve</a></td>
				    	<td><a href='hallsOfficerUI.jsp/reject/<%out.println(resultSet.getString("complaint_id")); %>/<%=session.getAttribute("USER_ID")%>/'>Reject</a></td>
					</tr>
		
					<%
				    }
		
				    } catch (Exception e) {
				    e.printStackTrace();
				    }
					%>
					</table>
                	
                </div>
            </div>
        </div>
        
		<% } else { %>
			<h1>You need to login as Halls Officer first to access this page</h1>
		<% } %>
        
<%@ include file="/includes/footer.jsp"%>