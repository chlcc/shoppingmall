<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>


<script src="/resources/js/swiper.min.js"></script>
<style>

.swiper-container {
    width: 100%;  
    height: 800px; 
}
.swiper-slide img{
position: absolute; top:0; left: 0;
width: 100%; 
height: 100%;
}

</style>


<tags:layout>
        <!-- /.intro section --> 
        <div class="swiper-container">
		    <!-- Additional required wrapper -->
		    <div class="swiper-wrapper">
		        <!-- Slides -->
		        <div class="swiper-slide"><img src="/resources/images/back1.jpg"></div>
		        <div class="swiper-slide"><img src="/resources/images/back2.jpg"></div> 
		        <div class="swiper-slide"><img src="/resources/images/back3.jpg"></div> 
		    </div>
		    <!-- If we need pagination -->
		    <div class="swiper-pagination"></div>
		  
		    <!-- If we need navigation buttons -->
		    <div class="swiper-button-prev"></div>
		    <div class="swiper-button-next"></div> 
		</div>		  
        <div id="intro">
            <div class="container">
                <div class="row">
				</div>
            </div>
        </div>
        
        
  <script type="text/javascript">
	  var mySwiper = new Swiper ('.swiper-container', {
	    // Optional parameters
	    direction: 'horizontal',
	    loop: true,
	
	    // If we need pagination
	    pagination: {
	      el: '.swiper-pagination',
	    },
	
	    // Navigation arrows
	    navigation: {
	      nextEl: '.swiper-button-next',
	      prevEl: '.swiper-button-prev',
	    },
	    
	    autoplay: {
	        delay: 3000
	      },
	  })
  </script>
</tags:layout>