<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title><spring:message code="titleList" /></title>
</head>
<body>
	<div class="myDiv">
	<h2><spring:message code="titleH2" /></h2>
 
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
		   	
	<p></p>
	<c:choose>
		<c:when test="${fn:length(products) > 0}">	
			
			<table>
				<tr>
					<th></th>
					<th></th>
					<th><spring:message code="productId" /></th>
					<th><spring:message code="productName" /></th>
					<th><spring:message code="productPrice" /></th>
					<th><spring:message code="productionDate" /></th>
					<th><spring:message code="availability" /></th>


					<th></th>
				</tr>
				<c:forEach items="${products}" var="product">
					<tr>
						<td><a href="/product/delete/${product.id}"><img src="/img/delete.png" width="20" /></a></td>
						<td><a href="/product/update/${product.id}/X"><img src="/img/edit.png" width="20" /></a></td>
						<td>${product.id}</td>
						<td>${product.productName}</td>
						<td>${product.salesPrice}</td>
						<td>${product.productionDate}</td>
						<td>${product.availability}</td>
					
						<td><a href="/product/${product.id}"><spring:message code="moreLbl" /></a></td>
					</tr>
				</c:forEach>
			</table>
	
		</c:when>
		<c:otherwise>
			<p><spring:message code="noData" /></p>
		</c:otherwise>
	</c:choose>
	<p style="color:darkblue"><spring:message code="showList" /> | <a href="/addproduct.html"><spring:message code="addNew" /></a></p>

</div>
</body>
</html>