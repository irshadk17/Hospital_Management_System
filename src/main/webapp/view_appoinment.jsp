<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appoinment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppoinmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}


</style>
</head>
<body>
	<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	<%@include file="component/navbar.jsp"%>
	
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center text-success fw-bold">Appointment
							List</p>
						<table class="table">
							<thead>
								<tr>
									<th class="col">Full Name</th>
									<th class="col">Gender</th>
									<th class="col">Age</th>
									<th class="col">Appoint Date</th>
									<th class="col">Diseases</th>
									<th class="col">Doctor Name</th>
									<th class="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("userObj");
								AppoinmentDao dao = new AppoinmentDao(DBConnect.getconn());
								DoctorDao dao2 = new DoctorDao(DBConnect.getconn());
								List<Appoinment> list = dao.getAllApoinmentByLoginUser(user.getId());
								for (Appoinment ap : list) {
									Doctor d = dao2.getDoctorById(ap.getDoctorId());
								%>
								<tr>
									<td><%=ap.getFullName()%></td>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=d.getFullName()%></td>
									<td>
										<%
										if ("Pending".equals(ap.getStatus())) {
										%> <a href="#"
										class="btn btn-sm btn-warning">Pending</a> <%
 } else {
 %> <%=ap.getStatus()%>

										<%
										}
										%>
									</td>

								</tr>

								<%
								}
								%>


							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-3 p-3">
				<img alt="" src="img/Doctor.jpg" height=500px>
			</div>
		</div>
	</div>

</body>
</html>