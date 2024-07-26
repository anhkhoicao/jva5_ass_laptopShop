<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lab4</title>
    <!-- css bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- css của tôi -->
    <link rel="stylesheet" href="/css/style1.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
</head>

<body>
    <!-- header -->
    <header class="sticky-top">
        <nav class="navbar navbar-expand-lg navbar-light bg-white">
            <div class="container" style="min-height: 8vh;">
                <a class="navbar-brand" href="/products">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <div id="tag-cart" class="">
                        <a class="btn btn-outline-dark" href="/cart/view">
                            <i class="fa-solid fa-cart-shopping"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">${cartQuantity}</span>
                            | <fmt:formatNumber type="number" value="${cartAmount}" /> VNĐ
                        </a>
                    </div>
                </div>
            </div>
        </nav>
    </header>

    <!-- container -->
    <div class="container">
        <div class="row pt-5">
            <div class="d-flex align-items-center justify-content-between border-bottom border-3 border-dark px-0 mb-3">
                <h2 class="fw-bold"><i class="fa-brands fa-accusoft me-3"></i>Product Cart</h2>
            </div>
        </div>
        <div class="row" id="listCart">
            <table class="table">
                <thead class="table-dark">
                    <tr>
                        <th scope="col" style="width: 5%;">ID</th>
                        <th scope="col" style="width: 30%;">Name</th>
                        <th scope="col" style="width: 20%;">Price</th>
                        <th scope="col" style="width: 15%;">Quantity</th>
                        <th scope="col" style="width: 20%;">Amount</th>
                        <th scope="col" style="width: 10%;"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="prod" items="${cart}" varStatus="loop">
					<tr class="">
						<td>${prod.value.id}</td>
						<td>
							<img class="img-fluid me-2" alt="" src="/assets/images/${prod.value.image}" style="height: 40px">
							${prod.value.name}
						</td>
						<td><fmt:formatNumber type = "number" value = "${prod.value.price}"/> VND</td>
                        <td><input type="number" class="w-75 m-auto quantityProd" name="quantity" onblur="loadDataCart('${prod.value.id}',${loop.index})" value="${prod.value.quantity}"></td>
                        <td><fmt:formatNumber type = "number" value = "${prod.value.price * prod.value.quantity}"/> VND</td>
                        <td><a class="btn btn-danger" href="/cart/remove/${prod.value.id}">Remove</a></td>
                   	</tr>
					</c:forEach>
                </tbody>
            </table>
            <div class="d-flex justify-content-between pt-2 border-top border-dark border-3">
	            <div>
	                <a href="/products" class="btn btn-primary">Go Menu Product</a>
	                <a href="/cart/clear" class="btn btn-danger ms-3">Clear All</a>
	            </div>
	            <div>
	            	<span class="fw-bold fs-5">Tổng tiền: </span>
	            	<span class="fs-5"><fmt:formatNumber type = "number" value = "${amount}"/> VND</span>
	            </div>
            </div>
        </div>
    </div>

    <!-- modal -->
	<c:if test="${sessionScope.username == null}">
		<%@include file="/WEB-INF/views/login.jsp" %>

	</c:if>
	
    <!-- javascript bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	function loadDataCart(id, index) {
		var value = $('.quantityProd').eq(index).val();
		$.ajax({
			type: 'POST',
			url: '/cart/update/'+id+'?quantity='+value,
			success: function(data){
				 $('#listCart').html($(data).find('#listCart').children());
				 $('#tag-cart').html($(data).find('#tag-cart').children());
			}
		})
	}
	</script>
</body>

</html>
