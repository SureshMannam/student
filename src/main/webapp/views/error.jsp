<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<c:set var="today" value="<%=new Date()%>" />
<!DOCTYPE html>
<html>
<body>
<head>
<title>Error</title>
<link rel="shortcut icon" type="image/png"
	href="<c:url value='/favicon/favicon.ico'/>" />
<style type="text/css">
.heading {
	background-color: aquamarine;
	width: 100%;
	padding: 10px;
	margin-top: -8px;
	margin-right: -15px;
	margin-bottom: 3px;
	margin-left: -10px;
	text-align: center;
}

.gobackLink {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="heading">
		<h1 id="heading">Welcome to Student Application</h1>
	</div>
	<hr />
	<div>
		<div id="gobackLink" style="text-align: center;">
			<h3>
				<a href='<c:url value='/'/>'>Go Back to Home</a>
			</h3>
			<h5>
				<fmt:formatDate value="${today}" pattern="dd/MM/yyyy HH:mm:ss" />
			</h5>
			<h6>
				<strong>Sorry..! Some thing went wrong.<br> Please
					contact system Administrator.
				</strong>
			</h6>
		</div>
	</div>

</body>
</html>