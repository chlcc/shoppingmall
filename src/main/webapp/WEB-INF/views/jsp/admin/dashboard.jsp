<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<style>
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
	background-image: url(/resources/images/back3.jpg);
	background-size: cover;
	background-position: center;
	padding: 0 !important;
	float:left; 
}  

.project-2 { 
	background-image: url(/resources/images/back1.jpg);
}  
 
.project-3 { 
	background-image: url(/resources/images/back2.jpg);
}

.project-4 {
	background-image: url(/resources/images/back4.jpg);
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
 

<link rel="stylesheet" type="text/css"
	href="/resources/daumOpenEditor/css/editor.css" charset="utf-8" />
<script type="text/javascript" charset="utf-8"
	src="/resources/daumOpenEditor/js/editor_loader.js"></script>
<tags:layout>
 
	<div class="container-fluid container" >
		<div class="title-arch">
		Our Project
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pulvinar ex pulvinar est laoreet ullamcorper.</p>
		</div>

		<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 project wow animated animated4 fadeInLeft" style="width: 24%">
	        <div class="project-hover">
	        	<h2>사용자 권한 관리 페이지</h2> 
	            
	            <hr />
	            <p>사용자들의 권한을 관리하는 페이지입니다.</p>
	            <a href="${pageContext.request.contextPath}/admin/userAuth">Go</a> 
	        </div>
	    </div> 
		<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 project project-2 wow animated animated3 fadeInLeft"  style="width: 24%">
	    	<div class="project-hover"> 
	        	<h2>상품 등록 페이지</h2>
	            <hr />
	            <p>준비된 상품을 카테고리별로 등록할 수 있는 페이지입니다.</p> 
	            <a href="${pageContext.request.contextPath}/admin/add_goods">Go</a>  
	        </div>
	    </div>
		<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 project project-3 wow animated animated2 fadeInLeft"  style="width: 24%">
	    	<div class="project-hover">
	        	<h2>통계 페이지</h2>
	            <hr />
	            <p>오늘 매출, 저번달 매출 등 통계를 나타내주는 페이지입니다.</p>
	            <a href="${pageContext.request.contextPath}/admin/statistics">Go</a> 
	        </div> 
	    </div> 
		<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 project project-4 wow animated animated2 fadeInLeft"  style="width: 24%">
	    	<div class="project-hover">
	        	<h2>통계 페이지</h2>
	            <hr />
	            <p>오늘 매출, 저번달 매출 등 통계를 나타내주는 페이지입니다. 
	            (현재 준비중)</p>
	            <a href="#">See Project</a> 
	        </div>
	    </div> 
	    <div class="clearfix"></div>
	</div>
</tags:layout>