<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title><spring:message code="updateInfo" /></title>
</head>
<body>
	<div class="myDiv">
	<h2><spring:message code="updateInfo" /></h2>

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
		
	<p><spring:message code="succesfullyUpdated" /> </p>
	
	<p style="color:darkblue"><a href = "/list.html"><spring:message code="showList" /></a> </p>
</div>
</body>
</html>