
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
	<link href="/css/style.css" rel="stylesheet" type="text/css" />
<meta charset="ISO-8859-1">
<title><spring:message code="titlePV" /></title>
</head>
<body>
<div class="myDiv">
	<h1>${product.productName }</h1>
	
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
		   
	<javatime:format value="${product.productionDate}" pattern="dd-MM-yyyy" var="formattedProductionDate"/>
	
	<table>
		<tr>
			<td><spring:message code="productName"/></td>
			<td>${product.productName}</td>
		</tr>
		<tr>
			<td><spring:message code="productionDate" /></td>
			<td>${formattedProductionDate}</td>
		</tr>
		
	</table>


	<h3><b><spring:message code="accessories" /></b></h3>
	<c:choose>
		<c:when test="${fn:length(product.accessories) > 0}">
			
			<table>
			    <th></th>
				<th><spring:message code="accName" /></th>
		        <th><spring:message code="guaranteeP" /></th>
				<c:forEach items="${product.accessories}" var="naccessory">
					
					<tr>
						<td><a href ="/product/accessory/delete/${product.id}/${naccessory.id}"><img src="/img/delete.png" width="20" /></a></td>
						<td>${naccessory.accessoryName}</td>
						<td>${naccessory.guarantee}</td>
						
					</tr>
				</c:forEach>
			</table>
		
		</c:when>
		<c:otherwise>
			<b><spring:message code="noAcc" /></b>
		</c:otherwise>
	</c:choose>
	<h3><spring:message code="newAcc" /></h3>
	<form:form method="post" action="/product/accessory/add" modelAttribute="accessory"> 
	<table>
		<th><spring:message code="accName" /></th>
		<th><spring:message code="guaranteeP" /></th>
		<tr>
			<td>
				<form:input path="accessoryName"/><br/><form:errors path="accessoryName" cssClass="error"/>

			</td>
			<td>
				<form:input path="guarantee"/><br/><form:errors path="guarantee" cssClass="error"/>

			</td>
		</tr>
	</table>
		<form:hidden path="product.id" value="${product.id}"/><br/>
		<input type="submit" value=<spring:message code="addAccButton" /> /><br/>
		
	</form:form>
	
	<p><a href="/list.html"><spring:message code="showList" /></a> | <a href="/addproduct.html"><spring:message code="addNew" /></a></p>
</div>
</body>
</html>