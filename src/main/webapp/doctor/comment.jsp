<%@page import="com.entity.Appoinment"%>
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
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Patient Comment</p>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						AppoinmentDao dao=new AppoinmentDao(DBConnect.getconn());
						Appoinment ap=dao.getAllApoinmentById(id);
						%>
						<form class="row" action="../updateStatus" method="post">
							<div class="col-md-6">
								<label>Patient Name</label> <input required type="text"
									class="form-control" readonly value="<%=ap.getFullName()%>">
							</div>
							<div class="col-md-6">
								<label>Age</label> <input required type="text"
									class="form-control" readonly value="<%=ap.getAge()%>">
							</div>
							<div class="col-md-6">
								<label>Mob No</label> <input required type="text"
									class="form-control" readonly value="<%=ap.getPhNo()%>">
							</div>
							<div class="col-md-6">
								<label>Diseases</label> <input required type="text"
									class="form-control" readonly value="<%=ap.getDiseases()%>">
							</div>

							<div class="col-md-12">
								<br> <label>Comment</label>
								<textarea class="form-control" required name="comm" rows="3"
									cols=""></textarea>
							</div>
							<input type="hidden" name="id" value="<%=ap.getId()%>"><input
								type="hidden" name="did" value="<%=ap.getDoctorId()%>">

							<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
						</form>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>