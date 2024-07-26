
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
				<form action="/product/update?id=${l.id_lamp }" method="post">
					<div class="card">
						<h5 class="card-header">Update product</h5>
						<div class="card-body">
							<div class="mt-2">
								<label>Name</label> <input type="text" name="name"
									class="form-control" value="${l.name }" required="required">
							</div>
							<div class="mt-2">
								<label>Image</label> 
								<input type="file" name="img"
									class="form-control" value="${l.img } required="required">
							</div>
							<div class="mt-2">
								<div class="row">
									<div class="col-4">
										<label>Origin</label> <select class="form-select" name="origin">
											<c:forEach items="${origin }" var="o">
												<option value="${o }" ${o==l.origin?'selected':'' }>${o }</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-4">
										<label>Size</label> <select class="form-select" name="size">
											<c:forEach items="${brand }" var="b">
												<option value="${b }" ${b==l.brand?'selected':'' }>${b }</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-4">
										<label>Color</label> <input type="text" name="color"
											class="form-control" required="required" value="${l.color }">
									</div>
								</div>
							</div>
							<div class="mt-2">
								<div class="row">
									<div class="col-6">
										<label>Quantity</label> <input type="number" name="quantity"
											class="form-control" value="${l.quantity }" min="0">
									</div>
									<div class="col-6">
										<label>Price</label>
										<div class="input-group">
											<input type="number" name="price" min="0"
												class="form-control" value="${l.price }"> <span
												class="input-group-text">vnđ</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<div>
							<button class="btn btn-success">Sửa</button>
							<button type="reset" class="btn btn-secondary">Reset</button>
						</div>
					</div>
					
				</form>
			</div><footer class="bg-dark" id="tempaltemo_footer">
	
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
