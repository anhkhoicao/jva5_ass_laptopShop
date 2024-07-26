<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="product-detail">
    <h1>${product.name}</h1>
    <img src="/assets/images/${product.image}" alt="${product.name}">
    <p>${product.description}</p>
    <p>Price: <fmt:formatNumber type="number" value="${product.price}" /> VND</p>
    <p>Brand: ${product.brand}</p>
    <p>Color: ${product.color}</p>
    <p>Available Quantity: ${product.quantity}</p>
    <p>Type: <c:choose>
            <c:when test="${product.type}">Gaming</c:when>
            <c:otherwise>Văn phòng</c:otherwise>
        </c:choose>
    </p>
</div>
</body>
</html>