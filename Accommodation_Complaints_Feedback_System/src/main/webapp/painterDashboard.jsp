<%@ include file="/includes/header.jsp"%>
<div class="d-flex" id="wrapper">
		
            <!-- Sidebar-->
			<div class="border-end bg-white" id="sidebar-wrapper">
				<div class="sidebar-heading border-bottom bg-light">ACMS</div>
			    <div class="list-group list-group-flush">
			      <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/painterDashboard.jsp">Dashboard</a>
			      <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/painterUI.jsp">Painter Workspace</a>
			      <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/painterDoneComplaints.jsp">Done Complaints</a>
			    </div>
			</div>
            
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
            
            	<!-- Navbar -->
               	<%@ include file="/includes/navigation.jsp"%>
               
               	<%
					if (session.getAttribute("USER_ID") != null && session.getAttribute("USER_ROLE").equals("painter")) {
				%>
               
                <!-- Page content-->
                <div class="container-fluid bg">
                	<br>
                	<!-- Page Heading -->
	                <div class="row">
	                    <div class="col-lg-12">
	                        <h1 class="page-header">
	                            Welcome
	                            <small><%=session.getAttribute("USER_FIRSTNAME")%></small>
	                            
	                        </h1>
	                        
	                    </div>
	                </div>
	                <!-- /.row -->	
                	
                </div>
            </div>
        </div>
        
		<% } else { %>
			<h1>You need to login as Painter first to access this page</h1>
		<% } %>
        
<%@ include file="/includes/footer.jsp"%>