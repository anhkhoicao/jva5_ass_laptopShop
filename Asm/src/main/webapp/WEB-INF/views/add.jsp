<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
a.disabled {
	pointer-events: none;
	background-color: gray;
}
</style>

	<div class="container">
		<div class="row mt-4">
			<div class="col-8 d-flex justify-content-center">
				<form action="/product/new" method="post">
					<div class="card">
						<h5 class="card-header">Add new Product</h5>
						<div class="card-body">
							<div class="mt-2">
								<label>Name</label> <input type="text" name="name"
									class="form-control" required="required">
							</div>
							<div class="mt-2">
								<label>Image</label> 
								<input type="file" name="img"
									class="form-control" required="required">
							</div>
							<div class="mt-2">
								<div class="row">
									<div class="col-4">
										<label>Origin</label> <select class="form-select" name="origin">
											<c:forEach items="${origin }" var="l">
												<option value="${l }">${l }</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-4">
										<label>Brand</label> <select class="form-select" name="brand">
											<c:forEach items="${brand }" var="b">
												<option value="${b }">${b }</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-4">
										<label>Color</label> <input type="text" name="color"
											class="form-control" required="required">
									</div>
								</div>
							</div>
							<div class="mt-2">
								<div class="row">
									<div class="col-6">
										<label>Quantity</label> <input type="number" name="quantity"
											class="form-control" required="required" value="0" min="0">
									</div>
									<div class="col-6">
										<label>Price</label>
										<div class="input-group">
											<input type="number" name="price"
											class="form-control" required="required" value="0" min="0">
										<span class="input-group-text">vnđ</span>
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
						<div class="card-footer">
						<div>
							<button class="btn btn-success">Thêm </button>
							<button type="reset" class="btn btn-secondary">Reset</button>
						</div>
					</div>
					
				</form>
			</div>
			</div>
			</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
