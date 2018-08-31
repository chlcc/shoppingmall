<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style type="text/css">
/* USER PROFILE PAGE */
.card {
	margin-top: 20px;
	padding: 30px;
	background-color: rgba(214, 224, 226, 0.2);
	-webkit-border-top-left-radius: 5px;
	-moz-border-top-left-radius: 5px;
	border-top-left-radius: 5px;
	-webkit-border-top-right-radius: 5px;
	-moz-border-top-right-radius: 5px;
	border-top-right-radius: 5px;
	-webkit-box-sizing: border-box; 
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.card.hovercard {
	position: relative;
	padding-top: 0;
	overflow: hidden;
	text-align: center;
	background-color: #fff;
	background-color: rgba(255, 255, 255, 1);
}

.card.hovercard .card-background {
	height: 130px;
}

.card-background img {
	-webkit-filter: blur(25px);
	-moz-filter: blur(25px);
	-o-filter: blur(25px);
	-ms-filter: blur(25px);
	filter: blur(25px);
	margin-left: -100px;
	margin-top: -200px;
	min-width: 130%;
}

.card.hovercard .useravatar {
	position: absolute;
	top: 15px;
	left: 0;
	right: 0;
}

.card.hovercard .useravatar img {
	width: 100px;
	height: 100px;
	max-width: 100px;
	max-height: 100px;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
	border: 5px solid rgba(255, 255, 255, 0.5);
}

.card.hovercard .card-info {
	position: absolute;
	bottom: 14px;
	left: 0;
	right: 0;
}

.card.hovercard .card-info .card-title {
	padding: 0 5px;
	font-size: 20px;
	line-height: 1;
	color: #262626;
	background-color: rgba(255, 255, 255, 0.1);
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
}

.card.hovercard .card-info {
	overflow: hidden;
	font-size: 12px;
	line-height: 20px;
	color: #737373;
	text-overflow: ellipsis;
}

.card.hovercard .bottom {
	padding: 0 20px;
	margin-bottom: 17px;
}

.btn-pref .btn {
	-webkit-border-radius: 0 !important;
}

.btn-group button {
	height: 60px;
}

@import url(http://fonts.googleapis.com/css?family=Lato:400,700);

body {
	font-family: 'Lato', 'sans-serif';
}

.profile {
/* 	min-height: 355px; */
	display: inline-block;
}

figcaption.ratings {
	margin-top: 20px;
}

figcaption.ratings a {
	color: #f1c40f;
	font-size: 11px;
}

figcaption.ratings a:hover {
	color: #f39c12;
	text-decoration: none;
}

.divider {
	border-top: 1px solid rgba(0, 0, 0, 0.1);
}

.emphasis {
	border-top: 4px solid transparent;
}

.emphasis:hover {
	border-top: 4px solid #1abc9c;
}

.emphasis h2 {
	margin-bottom: 0;
}

span.tags {
	background: #1abc9c;
	border-radius: 2px;
	color: #f5f5f5;
	font-weight: bold;
	padding: 2px 4px;
}

.dropdown-menu {
	background-color: #34495e;
	box-shadow: none;
	-webkit-box-shadow: none;
	width: 250px;
	margin-left: -125px;
	left: 50%;
}

.dropdown-menu .divider {
	background: none;
}

.dropdown-menu>li>a {
	color: #f5f5f5;
}

.dropup .dropdown-menu {
	margin-bottom: 10px;
}

.dropup .dropdown-menu:before {
	content: "";
	border-top: 10px solid #34495e;
	border-right: 10px solid transparent;
	border-left: 10px solid transparent;
	position: absolute;
	bottom: -10px;
	left: 50%;
	margin-left: -10px;
	z-index: 10;
}
</style>


<tags:layout>
	<div class="container">
		<div class="col-lg-6 col-sm-6" style="width: 100%;">
			<div class="card hovercard">
				<div class="card-background">
					<img class="card-bkimg" alt=""
						src="/resources/images/unknown_user.png">
					<!-- http://lorempixel.com/850/280/people/9/ -->
				</div>
				<div class="useravatar">
					<img alt="" src="/resources/images/unknown_user.png">
				</div>
				<div class="card-info">
					<span class="card-title" style="font-family: bold;">${user.userId}(${user.grade})</span>

				</div>
			</div>
			<div class="btn-pref btn-group btn-group-justified btn-group-lg"
				role="group" aria-label="...">
				<div class="btn-group" role="group">
					<a href="#tab1" class="btn btn-primary btn-lg active" role="button"
						aria-pressed="true" data-toggle="tab"> <i
						class="fa fa-address-card" aria-hidden="true"></i>
					</a>
				</div>
				<div class="btn-group" role="group">
					<a href="#tab2" class="btn btn-primary btn-lg active" role="button"
						aria-pressed="true" data-toggle="tab"> <i
						class="fa fa-shopping-cart" aria-hidden="true"></i>
					</a>
				</div>
				<div class="btn-group" role="group">
					<a href="#tab3" class="btn btn-primary btn-lg active" role="button"
						aria-pressed="true" data-toggle="tab"> <i
						class="fa fa-list-alt" aria-hidden="true"></i>
					</a>
				</div>
			</div>

			<div class="well">
				<div class="tab-content">
					<div class="tab-pane fade in active" id="tab1">
						<div class="container">
							<div class="row">
								<div class="col-md-offset-2 col-md-8 col-lg-6" style="margin-left: 10%; width: 70%;" >
									<div class="well profile">
										<div class="col-sm-12"> 
											<div class="col-xs-12 col-sm-8">
												<h2>${user.userName}</h2> 
												<p>
													<strong>Phone: </strong> ${user.phone}
												</p>
												<p>
													<strong>Email:</strong> ${user.email}
												</p>
												<p>
													<strong>Adderss:</strong> ${user.address}
												</p>
												<p>
													<strong>Address_Detail:</strong> ${user.address_detailed}
												</p>
												<p>
													<strong>Grade:</strong> ${user.grade}
												</p>
											</div>
											<div class="col-xs-12 col-sm-4 text-center">
												<figure>
													<img
														alt="" class="img-circle img-responsive">
													<figcaption class="ratings">
														<button class="btn btn-warning btn-block" id="userModBtn"> 
															<span class="fa fa-plus-circle"></span> MODIFY 
														</button>
													</figcaption>
												</figure>
											</div>
										</div>
										<div class="col-xs-12 divider text-center">
											<div class="col-xs-12 col-sm-4 emphasis">
												<h2>
													<strong> ${user.point} </strong>
												</h2>
												<p>
													<small>Point</small> 
												</p>
												<button class="btn btn-success btn-block" id="userPointBtn">
													<span class="fa fa-plus-circle"></span> POINT 
												</button>
											</div>
											<div class="col-xs-12 col-sm-4 emphasis">
												<h2>
													<strong>0</strong>
												</h2>
												<p>
													<small>Coupon</small>
												</p>
												<button class="btn btn-info btn-block" id="userCouponBtn">
													<span class="fa fa-user"></span> COUPON
												</button>
											</div>
											<div class="col-xs-12 col-sm-4 emphasis">
												<h2>
													<strong>0</strong>
												</h2>
												<p>
													<small>Following</small>
												</p>
												<button class="btn btn-info btn-block">
													<span class="fa fa-user"></span> ACCOUNT
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade in" id="tab2">
						<div class="row">
							<div class="col-xs-8" style="width: 100%;">
								<div class="panel panel-info">
									<div class="panel-heading">
										<div class="panel-title">
											<div class="row">
												<div class="col-xs-6">
													<h5>
														<span class="glyphicon glyphicon-shopping-cart"></span>
														Shopping Cart
													</h5>
												</div>
											</div> 
										</div>
									</div>
									<div class="panel-body">
										<c:forEach items="${cartList}" var="cart">
									 	<hr>
											<div class="row">
											<div class="col-xs-2">
												<img class="img-responsive" src="${cart.goods.imageUrl}" style="width: 100px;height: 150px;">
											</div>
											<div class="col-xs-4">
												<h4 class="product-name">
													<strong>${cart.goods.name}</strong>
												</h4>
												<h4>
													<small>${cart.goods.description}</small>
												</h4> 
											</div> 
											<div class="col-xs-6">
												<div class="col-xs-6 text-right">
													<h6>
														<strong class="price">${cart.goods.price}원<span class="text-muted">&nbsp;&nbsp;&nbsp;X</span></strong>
													</h6>
												</div> 
												<div class="col-xs-4">
													<input type="number" class="form-control input-sm count" value="${cart.count}" 
													max="${cart.goods.goodsInfo.count}" min="1" onchange="calculatePrice()">
												</div>
												<div class="col-xs-2">
													<button type="button" class="btn btn-link btn-xs">
														<span class="glyphicon glyphicon-trash"> </span>
													</button>
												</div>
											</div>
										</div>
										<hr>
										</c:forEach>
									</div>
									<div class="panel-footer">
										<div class="row text-center">
											<div class="col-xs-9">
												<h4 class="text-right">
													Total <strong id="cartTotalPrice">0</strong>
												</h4>
											</div>
											<div class="col-xs-3">
												<button type="button" class="btn btn-success btn-block">
													Checkout</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade in" id="tab3">
						<div class="row">
							<div class="col-xs-8" style="width: 100%;">
								<div class="panel panel-info">
									<div class="panel-heading">
										<div class="panel-title">
											<div class="row">
												<div class="col-xs-6">
													<h5>
														<span class="glyphicon glyphicon-shopping-cart"></span>Order
														List
													</h5>
												</div>
											</div>
										</div>
									</div>
									<div class="panel-body">
										<div class="row">
											<div class="col-xs-2">
												<img class="img-responsive" src="http://placehold.it/100x70">
											</div>
											<div class="col-xs-4">
												<h4 class="product-name">
													<strong>Product name</strong>
												</h4>
												<h4>
													<small>Product description</small>
												</h4>
											</div>
											<div class="col-xs-6">
												<div class="col-xs-6 text-right">
													<h6>
														<strong>25.00 <span class="text-muted">x</span></strong>
													</h6>
												</div>
												<div class="col-xs-4">
													<input type="text" class="form-control input-sm" value="1">
												</div>
												<div class="col-xs-2">
													<button type="button" class="btn btn-link btn-xs">
														<span class="glyphicon glyphicon-trash"> </span>
													</button>
												</div>
											</div>
										</div>
										<hr>
										<div class="row">
											<div class="col-xs-2">
												<img class="img-responsive" src="http://placehold.it/100x70">
											</div>
											<div class="col-xs-4">
												<h4 class="product-name">
													<strong>Product name</strong>
												</h4>
												<h4>
													<small>Product description</small>
												</h4>
											</div>
											<div class="col-xs-6">
												<div class="col-xs-6 text-right">
													<h6>
														<strong>25.00 <span class="text-muted">x</span></strong>
													</h6>
												</div>
												<div class="col-xs-4">
													<input type="text" class="form-control input-sm" value="1">
												</div>
												<div class="col-xs-2">
													<button type="button" class="btn btn-link btn-xs">
														<span class="glyphicon glyphicon-trash"> </span>
													</button>
												</div>
											</div>
										</div>
										<hr>
									</div>
									<div class="panel-footer">
										<div class="row text-center">
											<div class="col-xs-9">
												<h4 class="text-right">
													Total <strong id="totalPrice">0</strong>
												</h4>
											</div>
											<div class="col-xs-3">
												<button type="button" class="btn btn-success btn-block">
													Checkout</button>
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

	</div>
	
	
<div class="modal fade" id="userModModal" tabindex="-1" role="dialog" aria-labelledby="deleteCheckModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
      	<h4 class="modal-title">${user.userId}님의 정보수정</h4>
      	<hr> 
      	<form id="userInfoForm">
      		<input type="hidden" name="userId" value="${user.userId}">
      		<input type="hidden" name="userName" value="${user.userName}"> 
	      	<p> 
				<strong>Phone: </strong> <input name="phone" type="text" class="form-control" value="${user.phone}">
			</p> 
			<p>
				<strong>Email:</strong> <input name="email" type="text" class="form-control" value="${user.email}">
			</p>
			<p>
				<strong>Adderss:</strong> <input name="address" type="text" id="address" class="form-control" placeholder="${user.address} (Click Me!!)" onClick="goPopup();" readonly="readonly">
				<strong>Address_Detail:</strong> <input name="address_detailed" type="text" id="address_detailed" class="form-control" value="${user.address_detailed}">
			</p>
			<p>
				<strong>Password Confirm:</strong> <input type="password"  name="password" class="form-control">
			</p>
		</form> 
		<div id="errors"></div>
		
      </div> 
      <div class="modal-footer"> 
        <button type="button" class="btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="userModSubmit" class="btn-primary">OK</button> 
      </div> 
    </div>
  </div>
</div>

<div class="modal fade" id="userPointList" tabindex="-1" role="dialog" aria-labelledby="deleteCheckModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
      	<h4 class="modal-title">${user.userId}님의 포인트 내역</h4>
      	<hr> 
      	
      	미구현
		<div id="errors"></div> 
		
      </div> 
      <div class="modal-footer"> 
        <button type="button" class="btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn-primary">OK</button> 
      </div> 
    </div>
  </div>
</div>

<div class="modal fade" id="userCouponList" tabindex="-1" role="dialog" aria-labelledby="deleteCheckModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
      	<h4 class="modal-title">${user.userId}님의 쿠폰 내역</h4>
      	<hr> 
      	
      	미구현
		<div id="errors"></div> 
		
      </div> 
      <div class="modal-footer"> 
        <button type="button" class="btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn-primary">OK</button> 
      </div> 
    </div>
  </div>
</div>


<script id="errorTemplate" type="text/x-handlebars-template">

	<div>
		<ul>
		{{#fieldError}}
			<li>{{.}}</li>
		{{/fieldError}}
		</ul>	
	</div>

	</script>
	
	<script type="text/javascript">
	
		console.log(parseInt(uncomma($(".price")[1].innerHTML))); 
			
		$(document).ready(function () {
			calculatePrice();
			
		});
	
		function calculatePrice() {
			var $price = $(".price");
			var $count = $(".count");
			
			var totalPrice = 0;
			
			$price.each(function(index, element) {
				totalPrice += parseInt(uncomma(this.innerHTML)) * parseInt($count[index].value); 
			});
			
			$("#cartTotalPrice").text(comma(totalPrice) + "원");
		} 
		
		function comma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
		
		function uncomma(str) {
		    str = String(str); 
		    return str.replace(/[^\d]+/g, '');
		}
		
		$("#userModBtn").click(function () {
			$("#userModModal").modal('show');  
		});
		
		
		$("#userPointBtn").click(function() {
			$("#userPointList").modal('show');
		});
		
		$("#userCouponBtn").click(function() {
			$("#userCouponList").modal('show');
		});
		
		$("#userModSubmit").click(function () {
			
			var userData = $("#userInfoForm").serializeObject();
			
			if(userData.address.length == 0)
				userData.address = "${user.address}"; 
			
			console.log(userData);
			
				$.ajax({
					url : "${pageContext.request.contextPath}/user/modify",
					method : "put",  
					dataType : "json",
					contentType : 'application/json;charset=utf8',
					data : JSON.stringify(userData),
					success : function (data) {  
						var fieldError = data.fieldError;
					  	if(!(Object.keys(fieldError).length === 0)) { 
							$("#errors").text("");
							var errorTemplate = $("#errorTemplate").html();
							var template = Handlebars.compile(errorTemplate);
							var html = template(data);
							$("#errors").append(html);
							return;
					  	} 
					  	if(data.reason != null) {
					  		alert(data.reason);	
					  	}
					  	if(data.result == "success") {
					  		$("#userModModal").modal('hide');
					  		location.href = "${pageContext.request.contextPath}/user/mypage";
					  	}
					},error : function (data) {
						console.log(data);
					}
				});
 
		}); 
		
		 

		
		
	</script>
	
	 
	
	<script language="javascript">
		
	
	
		function goPopup(){
			var pop = window.open("/jusoPopup","pop","width=570,height=500, scrollbars=yes, resizable=yes"); 
		}
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
			$("#address").val(roadAddrPart1);
			$("#address_detailed").val(addrDetail);
		}
		
	</script>
</tags:layout>