<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><spring:message code="title.student"/></title>
<script type="text/javascript">
	function addStudent() {
		var url = '<c:url value="/studentform"/>';
		window.location.href = url;
	} 
	function deleteStudent(id){
		if(confirm('Are you sure..! you want to delete this Student ?')){
		var url = '<c:url value="/delete"/>'+'/'+id;
		window.location.href = url;
		}
	}

	window.setTimeout(function() {
	    $(".alert").fadeTo(500, 0).slideUp(500, function(){
	        $(this).remove(); 
	    });
	}, 4000);
</script>
<script src="<c:url value='/jquery/jquery_3.3.1.min.js'/>"></script>
<link rel="stylesheet" type="text/css" 	href="<c:url value='/css/student.css'/>" />
<link rel="shortcut icon" type="image/png" href="<c:url value='/favicon/favicon.ico'/>"/>
</head>
<body>
<div class="heading"><h1 id="heading">Welcome to Student Application</h1></div>
<form>
<fieldset>
<legend><spring:message code="label.list.students"/></legend>
<div style="float: right;">
<button type="button" id="addBtn" onclick="addStudent()"><spring:message code="label.add"/></button> </div>
<br><br><br>
<c:if test="${not empty requestScope.message}">
	<span class="alert"><c:out value="${requestScope.message}"/></span>	
	</c:if>
<table id="students">
	<thead>
		<tr>
			<th><spring:message code="label.sn"/></th>
			<th><spring:message code="label.name"/></th>
			<th><spring:message code="label.address"/></th>
			<th><spring:message code="label.gender"/></th>
			<th><spring:message code="label.dob"/></th>
			<th><spring:message code="label.email"/></th>
			<th><spring:message code="label.mobile"/></th>
			<th><spring:message code="label.phone"/></th>
			<th><spring:message code="label.remove"/></th>
		</tr>
		</thead>
		<c:if test="${empty studentList}">
		<tr><td colspan="9"><spring:message code="label.no.records"/></td></tr>
		</c:if>
	<c:if test="${!empty studentList}">
	<c:forEach items="${studentList}" var="student" varStatus="index">
		<tr>
			<td width="4%"><c:out value="${index.count}" /></td>
			<td width="20%"><a href="<c:url value='/edit/${student.id}' />"><c:out value="${student.name}" /></a></td>
			<td width="20%"><c:out value="${student.address}" /></td>
			<td width="6%">
			<c:choose>
					<c:when test="${student.gender eq 'M'}">
					Male
					</c:when>
					<c:otherwise>
					Female
					</c:otherwise>
					</c:choose>
			</td>
			<td width="10%"><c:out value="${student.dob}" /></td>
			<td width="15%"><c:out value="${student.email}"/></td>
			<td width="10%"><c:out value="${student.mobile}"/></td>
			<td width="10%"><c:out value="${student.phone}"/></td>
			<td width="5%"><img src="<c:url value='/images/trash.png'/>" onclick="javascript:deleteStudent(${student.id})" 
			width="15px" height="15px" title="<spring:message code="label.remove"/>"/>
			</td>
		</tr>
	</c:forEach>
	</c:if>
	</tbody>
</table>
</fieldset>
</form>
</body>
</html>