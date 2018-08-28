<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>


<script src="/resources/js/swiper.min.js"></script>
<style>

.swiper-container {
    width: 100%;  
    height: 600px;
}

.title-arch {
	text-align: center;
	margin: 50px 0;
	font-size: 22px;
	letter-spacing: 2px;
	text-transform: uppercase;
}
.project {
	width: 100%;
	height: 400px; 
	background-size: cover;
	background-position: center;
	padding: 0 !important;
	float:left; 
}  

.project-hover {
	width: 100%;
	height: 100%;
	color: #fff;
	opacity: 0;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
	background-color: rgba(211, 211, 211, 0.7); 
	padding: 40% 30px !important;
	margin-right: 2px;
	top: -100%;
	position: relative;
}
 
.project-hover hr {
	height: 30px;
	width: 0;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
	background-color: rgba(255, 255, 255, 1);
	border: 0;
}

.project-hover a {
	color: rgba(255, 255, 255, 1);
	padding: 2px 22px;
	line-height: 40px;
	border: 2px solid rgba(255, 255, 255, 1);
	-webkit-transition: all 0.5s ease-in-out;
	-moz-transition: all 0.5s ease-in-out;
	-o-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
}

.project-hover a:hover {
	border-color: rgba(51, 51, 51, 1);
	color: rgba(51, 51, 51, 1);
	background-color: #FFF;
}

.project:hover .project-hover {
	opacity: 1;
}

.project:hover .project-hover hr {
	width: 100%;
	height: 5px;
} 
.col-lg-3 {
	margin: 2px;
	width: 23%;  
}  


</style>


<tags:layout>
        <div id="intro">
            <div class="container">
                <div class="row">
	                <div class="container-fluid container" >
						<div class="title-arch">
						Our Project
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pulvinar ex pulvinar est laoreet ullamcorper.</p>
						</div>
						<c:forEach items="${goodsList}" var="goods">
							<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 project wow animated animated4 fadeInLeft"
							 style="width: 24%; background-image: ${goods.imageUrl}">
							 <img src="${goods.imageUrl}" style="width:100%; height:100%;">
						        <div class="project-hover">
						        	<h2>${goods.name}</h2> 
						            <hr />
						            <p>${goods.price}￦</p>
						            <a href="${pageContext.request.contextPath}/shop/detail/${goods.gno}">Show Detail</a> 
						        </div>
						    </div>
					    </c:forEach>
				    </div>
				</div>
            </div>
        </div>
        
</tags:layout>