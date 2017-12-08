<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

 <header>
	<!-- NAVIGATION -->
	<div id="menu">
	    <nav class="navbar-wrapper navbar-default" role="navigation">
	        <div class="container">
	            <div id="navbar-scroll" class="collapse navbar-collapse navbar-backyard navbar-right">
	                <ul class="nav navbar-nav">
	                    <li><a href="${pagecontext.request.contextpath}/board/qna">Q&amp;A</a></li>
	                    <li><a href="${pagecontext.request.contextpath}/user/mypage">mypage</a></li>
	                    <li><a href="${pagecontext.request.contextpath}/user/join">join us</a></li>
	                    <li><a href="${pagecontext.request.contextpath}/login">login</a></li>
	                </ul>
	            </div>
	        </div>
	    </nav>
	</div>
	<div class="landing" style="background-image:url('/resources/images/bg.jpg');">
		<div class="container">
			<h1>DesignBinary</h1>
		</div> 
	</div>
	
</header>