
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
</head>
<body onload="changeSelect()">

<div class="section-title">
	
	<div>
		<form action="/product/find">
			<div class="col-4">
				<div class="input-group">
					<input name="name" class="form-control" type="text" placeholder="Nhập tên đèn">
					<button class="btn btn-dark">Tìm kiếm</button>
				</div>
			</div>
		</form>
	</div>
</div>

		<form action="/product/deleteList" method="get">

			<div class="card">
				<div class="card-header">
					<div class="row d-flex justify-content-between">
						<div class="col-3 fs-5">Sản phẩm</div>
						<div class="col-7">
							<div class="row">
								<div class="col-10">
								
								</div>
								<div class="col-2">
								
								</div>
							</div>
						</div>
						<div class="col-2">
							<button type="button" class="btn btn-secondary"
								data-toggle="modal" data-target="#delete">X�A</button>
							<a class="btn btn-dark" href="/admin/add">TH�M </a>
							<!-- Modal -->
							<div class="modal fade" id="delete" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Lưu ý</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">Bạn có muốn xóa hết sản phẩm không</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-danger">Yes</button>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="card-body">
					<table class="table table-hover m-0 p-0">
						<thead>
							<th><input type="checkbox" name="chkAll" value="true"
								id="chkAll" onchange="selectAll()"></th>
							<th>Name</th>
							<th>Created Date</th>
							<th>Origin</th>		
							<th>Brand</th>
							<th></th>
							<th>Quantity</th>
							<th>Price</th>
							<th colspan="2">Activity</th>
						</thead>
						<tbody>
							<c:forEach items="${listLamp }" var="l">
								<tr>
									<td><input type="checkbox" name="chk" value="${l.id_lamp }">
									</td>
									<td>${l.name }</td>
									<td><fmt:formatDate value="${l.createdDate }"
											pattern="dd-MM-yyyy" /></td>
									<td>${l.origin }</td>
									<td>${l.brand }</td>
									<td>${l.color }</td>
									<td>${l.quantity }</td>
									<td><fmt:formatNumber pattern="###,### vnđ">${l.price }</fmt:formatNumber></td>
									<td><a class="btn btn-warning"
										href="/admin/update"> <i class="fa-solid fa-pen"></i>
									</a></td>
									<td>
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-danger"
											data-toggle="modal" data-target="#exampleModal${l.id_lamp }">
											Xóa</button> <!-- Modal -->
										<div class="modal fade" id="exampleModal${l.id_lamp }"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Warning</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">Bạn có chắc muốn sản phẩm
														không ???</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
														<a class="btn btn-danger" href="/product/delete?id=${l.id_lamp }">
															Yes </a>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			<div class="card-footer">
					<div class="d-flex justify-content-center">
						<a class="btn btn-primary me-1" href="/product/first"
							${currentPage==0?'disabled':'' }> <span
							class="fas fa-backward"></span>
						</a> <a class="btn btn-primary me-1" href="/product/prev"
							${currentPage==0?'disabled':'' }> <span
							class="fas fa-backward-step"></span>
						</a>
						<h3>${currentPage+1 }</h3>
						<a class="btn btn-primary me-1" href="/product/next"
							${currentPage==maxPage?'disabled':'' }> <span
							class="fas fa-forward-step"></span>
						</a> <a class="btn btn-primary" href="/product/last"
							${currentPage==maxPage?'disabled':'' }> <span
							class="fas fa-forward"></span>
						</a>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	

<!-- script -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="szha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9z/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
	<script src="/assets/js/jquery-1.11.0.min.js"></script>
	<script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="/assets/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/templatemo.js"></script>
	<script src="/assets/js/custom.js"></script>
<script type="text/javascript">
	function changeSelect() {
		var select = document.getElementById("origin").value;
		var link = document.getElementById("search");
		switch (select) {
		case "all ":
			link.href = "/lamp/all";
			break;
		s
	case "China":
		link.href = "/lamp/China";
		break;
	case "Europe":
		link.href = "/lamp/Europe";
		break;
	case "VietNam":
		link.href = "/lamp/VietNam";
		break;
	case "Other":
		link.href = "/lamp/Other";
		break;
	}
}
function selectAll() {
	var chkAll = document.getElementById("chkAll");
	var chk = document.getElementsByName("chk");
	if (chkAll.checked == true) {
		for (var i = 0; i < chk.length; i++) {
			chk[i].checked = true;
		}
	} else {
		for (var i = 0; i < chk.length; i++) {
			chk[i].checked = false;
		}
	}
}
</script>
</body>
</html>