
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<meta charset="ISO-8859-1">
<title><spring:message code="titlePAP" /></title>
</head>
<body>
	<div class="myDiv">
	<h1><spring:message code="h1PAP" /></h1>
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
		   
	<p><spring:message code="FillFormPAP" /></p>
	<form:form method = "post" action="/product/add" modelAttribute = "product">
	
		<table>
			<tr>
				<td><spring:message code="productName" /></td>
				<td><form:input path="productName" /></td>
				<td><form:errors path="productName" cssClass="error" /></td>
			</tr>
			<tr>
				<td><spring:message code="salesPrice" /></td>
				<td><form:input path="salesPrice" /></td>
				<td><form:errors path="salesPrice" cssClass="error"/></td>
			</tr>
			<tr>
				<td><spring:message code="productionDate" /></td>
				<td><form:input path="productionDate" /></td>
				<td><form:errors path="productionDate" cssClass="error" /></td>
			</tr>
			<tr>
				<td><spring:message code="availability" /></td>
				<td><form:input path="availability" /></td>
				<td><form:errors path="availability" cssClass="error" /></td>
			</tr>
			
			
			<tr>
				<td colspan="3"><input type="submit" value= <spring:message code="addProdB" /> /></td>
			</tr>
		</table>
	
      	
      
	</form:form>
	<p style="color:darkblue"><a href = "/list.html"><spring:message code="showList" /></a> |<spring:message code="addNew" /></p>
</div>
</body>
</html>