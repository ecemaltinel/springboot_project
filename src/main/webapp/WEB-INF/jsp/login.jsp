<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <meta charset="UTF-8">
<title><spring:message code="login" /></title>
</head>
<body>
	<div class="outerDiv">
	<div class="myDiv">
	<h2><spring:message code="login" /></h2>

   <c:choose>

<c:when test="${param.language == 'tr'}">
	<a href="?language=en">English<img src="/img/eng.png" width="20" /></a>
</c:when>
<c:when test="${param.language == 'en'}">
	<a href="?language=tr">Türkçe<img src="/img/turkish.png" width="20" /></a>
</c:when>
<c:otherwise>
	<a href="?language=tr">Türkçe<img src="/img/turkish.png" width="20" /></a>

</c:otherwise>

   </c:choose>

	<p><spring:message code="enterPass" /></p>
	<form action="/login" method="post">
	<table>
		<tr>
			<td><spring:message code="username" /></td>
			<td><input type="text" name="username" /></td>
		</tr>
		<tr>
			<td><spring:message code="password" /></td>
			<td><input type="password" name="password" /></td>
		</tr>
	</table>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="submit" value=<spring:message code="login" /> />
	</form>
	<c:if test="${param.loginFailed == 'true'}"><p class="error"><spring:message code="invalid" /></p></c:if>
</div>
</div>
</body>
</html>