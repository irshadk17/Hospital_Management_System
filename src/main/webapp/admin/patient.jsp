<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appoinment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppoinmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Patient Comment</p>
				<table class="table">
							<thead>
								<tr>
									<th class="col">Full Name</th>
									<th class="col">Gender</th>
									<th class="col">Age</th>
									<th class="col">Appoinment</th>
									<th class="col">Email</th>
									<th class="col">Mob NO</th>
									<th class="col">Diseases</th>
									<th class="col">Doctor Name</th> 
									<th class="col">Address</th>	
									<th class="col">Status</th>
									
								</tr>
							</thead>
							<tbody>
							
							<%
							AppoinmentDao dao=new AppoinmentDao(DBConnect.getconn());
							DoctorDao dao2=new DoctorDao(DBConnect.getconn());
							List<Appoinment> list=dao.getAllApoinment();
							for(Appoinment ap:list){
							Doctor d =dao2.getDoctorById(ap.getDoctorId());
							%>
								<tr>
								<td><%=ap.getFullName() %></td>
								<td><%=ap.getGender() %></td>
								<td><%=ap.getAge() %></td>
								<td><%=ap.getAppoinDate()%></td>
								<td><%=ap.getEmail() %></td>
								<td><%=ap.getPhNo() %></td>
								<td><%=ap.getDiseases() %></td>
								<td><%=d.getFullName() %></td>
								<td><%=ap.getAddress() %></td>
								<td><%=ap.getStatus() %></td>
								</tr>
							<%}
							%>
								<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								</tr>
							</tbody>
						</table>

			</div>
		</div>
	</div>
</body>
</html>