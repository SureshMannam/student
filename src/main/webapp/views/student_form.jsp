<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url value='/save' var="saveURL"/>
<!DOCTYPE html>
<html>
<head>
<script src="<c:url value='/jquery/jquery_3.3.1.min.js'/>"></script>
<script src="<c:url value='/jquery-ui-1.12.1/jquery-ui.min.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/jquery-ui-1.12.1/jquery-ui.min.css'/>">
<link rel="stylesheet" type="text/css" 	href="<c:url value='/css/student.css'/>" />
<link rel="shortcut icon" type="image/png" href="<c:url value='/favicon/favicon.ico'/>"/>
<meta charset="ISO-8859-1">
<title>Student Add</title>
<script type="text/javascript">
	function goBackToHome() {
		var url = '/studentlist';
		window.location.href = url;
	}
	$(document).ready(function(){
		  $("#studentform").submit(function(){
		  });
		});
	$(document).ready(function(){
		$('input').focus(
			    function(){
			        $(this).css('border-radius','8px solid');
			    });
		});

</script>
<script type="text/javascript">

$(function () {
    $("#mobile").keypress(function (e) {
        var keyCode = e.keyCode || e.which;

        $("#mobileFormatError").html("");

      	//Regex for allowing onlu numerics.
        var regex = /^[0-9]+$/;

        //Validate TextBox value against the Regex.
        var isValid = regex.test(String.fromCharCode(keyCode));
        if (!isValid) {
            $("#mobileFormatError").html("Only Numbers allowed.");
        }

        return isValid;
    });
});

$(function () {
    $("#phone").keypress(function (e) {
        var keyCode = e.keyCode || e.which;

        $("#phoneFormatError").html("");

        //Regex for allowing onlu numerics.
        var regex = /^[0-9]+$/;

        //Validate TextBox value against the Regex.
        var isValid = regex.test(String.fromCharCode(keyCode));
        if (!isValid) {
            $("#phoneFormatError").html("Only Numbers allowed.");
        }

        return isValid;
    });
});

</script>
<script>
	$(function() {
		$('#datepicker').datepicker({
			dateFormat:'dd/mm/yy',
			yearRange: "-100:+10",
			changeMonth: true,
			changeYear: true
		});
	});
</script>
</head>
<body>
<div class="heading"><h1 id="heading">Welcome to Student Application</h1></div>
	<form:form id="studentform" action="${saveURL}" modelAttribute="student" method="post">
	<form:hidden path="id"/>
	<fieldset>
	<legend>
	<spring:message code="label.student.form"/>
	</legend>
		<table id="student">
			<tr>
				<td class="fieldname"><form:label path="name"><spring:message code="label.name" />
				<span class="mandatory">*</span></form:label></td>
				<td><form:input path="name" /></td>
				<td><form:errors path="name" cssClass="error"/></td>
			</tr>
			<tr>
				<td class="fieldname"><form:label path="address"><spring:message code="label.address" /></form:label></td>
				<td><form:input path="address" /></td>
				<td><form:errors path="address" cssClass="error"/></td>
			</tr>
			<tr>
				<td class="fieldname"><form:label path="gender"><spring:message code="label.gender" /></form:label></td>
				<td><form:radiobutton path="gender" value="M" /><spring:message code="label.male" /> &nbsp; 
					<form:radiobutton path="gender" value="F" /><spring:message code="label.female" /></td>
			</tr>
			<tr>
				<td class="fieldname"><form:label path="dob"><spring:message code="label.dob" /></form:label></td>
				<td><form:input path="dob" id="datepicker" readonly="true"/></td>
				<td><form:errors path="dob" cssClass="error"/>
				<span id="dateFormatError" style="color: red"></span></td>
			</tr>
			<tr>
				<td class="fieldname"><form:label path="email"><spring:message code="label.email" /></form:label></td>
				<td><form:input path="email" /></td>
				<td><form:errors path="email" cssClass="error"/></td>
			</tr>
			<tr>
				<td class="fieldname"><form:label path="mobile"><spring:message code="label.mobile" /></form:label></td>
				<td><form:input path="mobile" id="mobile"/></td>
				<td><form:errors path="mobile" cssClass="error"/>
				<span id="mobileFormatError" style="color: red"></span>
				</td>
			</tr>
			<tr>
				<td class="fieldname"><form:label path="phone"><spring:message code="label.phone" /></form:label></td>
				<td><form:input path="phone" id="phone"/></td>
				<td><form:errors path="phone" cssClass="error"/>
				<span id="phoneFormatError" style="color: red"></span></td>
			</tr>
			<tr>
				<td colspan="2" align="center" id="buttons"><br>
				<c:if test="${!empty id}">
						<input type="submit" id="updateBtn"
							value="<spring:message code="label.update"/>"/>
					</c:if> <c:if test="${empty id}">
						<input type="submit" id="saveBtn"
							value="<spring:message code="label.save"/>" />
					</c:if>&nbsp;
					<input type="button" id="backBtn" value="<spring:message code="label.goback"/>" onclick="javascript:goBackToHome()" /><br>
					</td>
			</tr>
		</table>
		</fieldset>
	</form:form>
</body>
</html>