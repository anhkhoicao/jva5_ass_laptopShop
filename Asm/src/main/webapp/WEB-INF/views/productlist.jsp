<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <title>Document</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/templatemo-hexashop.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl-carousel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.css">
<!-- css bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- css of me -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
	
</head>
    <body>
    
    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
    
    
    <!-- ***** Header Area Start ***** -->
   <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="/products" class="logo">
                        <img src="assets/images/logo.png">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
                        <li class="scroll-to-section"><a href="/products/type?type=true">Gaming</a></li>
                        <li class="scroll-to-section"><a href="/products/type?type=false">Standard</a></li>

                        <li class="scroll-to-section"><a href="#accessory">Accessory</a></li>
                        <li class="submenu">
                            <a href="javascript:;">Pages</a>
                            <ul>
                                <li><a href="about">About Us</a></li>
                                <li><a href="products">Products</a></li>
                                <li><a href="single-product">Single Product</a></li>
                                <li><a href="contact">Contact Us</a></li>
                            </ul>
                        </li>
                        <li class="submenu"><a href="javascript:;">Features</a>
                            <ul>
                                <li><a href="#">Features Page 1</a></li>
                                <li><a href="#">Features Page 2</a></li>
                                <li><a href="#">Features Page 3</a></li>
                                <li><a rel="nofollow" href="https://templatemo.com/page/4" target="_blank">Template Page 4</a></li>
                            </ul>
                        </li>
                        <li class="scroll-to-section"><a href="#explore">Explore</a></li>
                        <li class="scroll-to-section"><a href="/cart/view" id="tag-cart">Cart</a></li>
                        <li class="submenu">
                            <a href="javascript:;">Account</a>
                            <ul>
                                <li><a href="" data-bs-toggle="modal" data-bs-target="#loginModal">Login</a></li>
                                <li><a href="/account/logout">Register</a></li>
                                <li><a href="/account/logout">Logout</a></li>
                            </ul>
                        </li>
                    </ul>        
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ***** Header Area End ***** -->

<!-- ***** Main Banner Area Start ***** -->
<div class="main-banner" id="top">

</div>
<!-- ***** Main Banner Area End ***** -->

<!-- ***** Gaming Area Starts ***** -->
<div class="container mt-5">
    <div class="container mt-3">
        <div class="row">
            <div class="col-md-6">
                <select id="productType" class="form-select">
                    <option value="all">All Products</option>
    				<option value="true">Gaming</option>
    				<option value="false">Standard</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row" id='listProd'>
        <c:forEach items="${products}" var="prod">
            <div class="col-sm-12 col-md-6 col-lg-3 mb-4">
                <div class="card h-100">
                    <div class="card-header bg-primary text-center text-white">
                        <span class="fw-bold">${prod.name}</span>
                    </div>
                    <img src="/assets/images/${prod.image}" class="card-img-top" alt="${prod.name}">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="badge bg-primary">Remain ${prod.quantity}</span>
                            <span class="text-danger fw-bold"><fmt:formatNumber type="number" value="${prod.price}" /> VND</span>
                        </div>
                    </div><div class="card-footer d-flex justify-content-between bg-transparent border-0">
                        <button class="btn btn-dark" onclick="addProduct('${prod.id}')">Add to cart</button>
                        <a href="/product/${prod.id}" class="btn btn-outline-dark">Detail</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- ***** Gaming Area Ends ***** -->

<!-- ***** Explore Area Starts ***** -->
<section class="section" id="explore">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="left-content">
                    <h2>Explore Our Products</h2>
                    <span>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span>
                    <div class="quote">
                        <i class="fa fa-quote-left"></i><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <div class="main-border-button">
                        <a href="#">Discover More</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="right-content">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="item">
                                <div class="thumb">
                                    <img src="assets/images/explore-item-01.jpg" alt="">
                                    <div class="hover-effect">
                                        <div class="inner-content">
                                            <a href="product-details.html"><h4>Gaming</h4></a>
                                            <span>Best Gear For Gamers</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="item">
                                <div class="thumb">
                                    <img src="assets/images/explore-item-02.jpg" alt="">
                                    <div class="hover-effect">
                                        <div class="inner-content">
                                            <a href="product-details.html"><h4>Standard</h4></a>
                                            <span>Best Laptops for Daily Use</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="item">
                                <div class="thumb"><img src="assets/images/explore-item-03.jpg" alt="">
                                    <div class="hover-effect">
                                        <div class="inner-content">
                                            <a href="product-details.html"><h4>Accessory</h4></a>
                                            <span>Best Accessories for Your Devices</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="item">
                                <div class="thumb">
                                    <img src="assets/images/explore-item-04.jpg" alt="">
                                    <div class="hover-effect">
                                        <div class="inner-content">
                                            <a href="product-details.html"><h4>Accessory</h4></a>
                                            <span>Best Accessories for Your Devices</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="item">
                                <div class="thumb">
                                    <img src="assets/images/explore-item-05.jpg" alt="">
                                    <div class="hover-effect">
                                        <div class="inner-content">
                                            <a href="product-details.html"><h4>Accessories</h4></a>
                                            <span>Best Trend Accessories</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ***** Explore Area Ends ***** -->
    <!-- ***** Social Area Ends ***** -->

    <!-- ***** Subscribe Area Starts ***** -->
    <div class="subscribe">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="section-heading">
                        <h2>By Subscribing To Our Newsletter You Can Get 30% Off</h2>
                        <span>Details to details is what makes Hexashop different from the other themes.</span>
                    </div>
                    <form id="subscribe" action="" method="get">
                        <div class="row">
                          <div class="col-lg-5">
                            <fieldset><input name="name" type="text" id="name" placeholder="Your Name" required="">
                            </fieldset>
                          </div>
                          <div class="col-lg-5">
                            <fieldset>
                              <input name="email" type="text" id="email" pattern="[^ @]*@[^ @]*" placeholder="Your Email Address" required="">
                            </fieldset>
                          </div>
                          <div class="col-lg-2">
                            <fieldset>
                              <button type="submit" id="form-submit" class="main-dark-button"><i class="fa fa-paper-plane"></i></button>
                            </fieldset>
                          </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-4">
                    <div class="row">
                        <div class="col-6">
                            <ul>
                                <li>Store Location:<br><span>Sunny Isles Beach, FL 33160, United States</span></li>
                                <li>Phone:<br><span>010-020-0340</span></li>
                                <li>Office Location:<br><span>North Miami Beach</span></li>
                            </ul>
                        </div>
                        <div class="col-6">
                            <ul>
                                <li>Work Hours:<br><span>07:30 AM - 9:30 PM Daily</span></li>
                                <li>Email:<br><span>info@company.com</span></li>
                                <li>Social Media:<br><span><a href="#">Facebook</a>, <a href="#">Instagram</a>, <a href="#">Behance</a>, <a href="#">Linkedin</a></span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Subscribe Area Ends ***** -->
    
    <!-- ***** Footer Start ***** -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="first-item">
                        <div class="logo">
                            <img src="assets/images/white-logo.png" alt="hexashop ecommerce templatemo">
                        </div>
                        <ul>
                            <li><a href="#">16501 Collins Ave, Sunny Isles Beach, FL 33160, United States</a></li>
                            <li><a href="#">hexashop@company.com</a></li>
                            <li><a href="#">010-020-0340</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <h4>Shopping &amp; Categories</h4>
                    <ul>
                        <li><a href="#">Men’s Shopping</a></li>
                        <li><a href="#">Women’s Shopping</a></li>/-strong/-heart:>:o:-((:-h<li><a href="#">Kid's Shopping</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h4>Useful Links</h4>
                    <ul>
                        <li><a href="#">Homepage</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Help</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h4>Help &amp; Information</h4>
                    <ul>
                        <li><a href="#">Help</a></li>
                        <li><a href="#">FAQ's</a></li>
                        <li><a href="#">Shipping</a></li>
                        <li><a href="#">Tracking ID</a></li>
                    </ul>
                </div>
                <div class="col-lg-12">
                    <div class="under-footer">
                        <p>Copyright © 2022 HexaShop Co., Ltd. All Rights Reserved. 
                        
                        <br>Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a></p>
                        <ul>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-behance"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    

    <!-- jQuery -->
    <script src="assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/accordions.js"></script>
    <script src="assets/js/datepicker.js"></script>
    <script src="assets/js/scrollreveal.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/imgfix.min.js"></script> 
    <script src="assets/js/slick.js"></script> 
    <script src="assets/js/lightbox.js"></script> 
    <script src="assets/js/isotope.js"></script> 
    
    <!-- Global Init -->
    <script src="assets/js/custom.js"></script>

    <script>

        $(function() {
            var selectedClass = "";
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });/-strong/-heart:>:o:-((:-h});

    </script>
    
    <!-- modal -->
	<c:if test="${sessionScope.username == null}">
		<%@include file="/WEB-INF/views/modal/login_modal.jsp" %>
	</c:if>
	
    <!-- javascript bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	function addProduct(id){
	    $.ajax({
	        type: 'GET',
	        url: '/cart/add/' + id,
	        success: function(data){
	            try {
	                // Replace the product list and cart tag content
	                $('#listProd').html($(data).find('#listProd').html());
	                $('#tag-cart').html($(data).find('#tag-cart').html());
	            } catch (error) {
	                console.error("Error updating HTML content: ", error);
	            }
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.error("AJAX request failed: ", textStatus, errorThrown);
	        }
	    });
	}

	</script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#productType').change(function() {
            var selectedType = $(this).val();
            if (selectedType === 'all') {
                window.location.href = '/products';
            } else {
                window.location.href = '/products/filter?type=' + selectedType;
            }
        });
    });
</script>


  </body>
</html>
</body>
</html>