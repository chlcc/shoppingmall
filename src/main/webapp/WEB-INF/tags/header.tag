<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <header>
	<!-- NAVIGATION -->
	<div id="menu">
	    <nav class="navbar-wrapper navbar-default" role="navigation">  
	        <div class="container"> 
	        	<sec:authorize access="hasRole('ROLE_ADMIN')">
	            	<h3 style="display: inline-block; margin-top: 10px;">ADMIN</h3>
	        	</sec:authorize>  
	            <div id="navbar-scroll" class="collapse navbar-collapse navbar-backyard navbar-right"> 
	                <ul class="nav navbar-nav">
	                    <li><a href="${pagecontext.request.contextpath}/board/list/1">Q&amp;A</a></li>
	                    
	                    <sec:authorize access="hasRole('ROLE_USER')">
	                   		<li><a href="${pagecontext.request.contextpath}/user/mypage/tab1">mypage</a></li>
	                   		<li><a href="${pagecontext.request.contextpath}/logout">logout</a></li>
	                    </sec:authorize> 
               			<sec:authorize access="isAnonymous()">
		                    <li><a href="${pagecontext.request.contextpath}/join">join us</a></li>
		                    <li><a href="${pagecontext.request.contextpath}/login">login</a></li>
	                    </sec:authorize>
	                    <sec:authorize access="hasRole('ROLE_ADMIN')">
	                    	<li><a href="${pagecontext.request.contextpath}/admin/dashboard">admin</a>
		                    <li><a href="${pagecontext.request.contextpath}/user/mypage/tab1">mypage</a></li>
	                    	<li><a href="${pagecontext.request.contextpath}/logout">logout</a></li>
	                    </sec:authorize>
	                </ul>
	            </div>
	        </div>
	    </nav>
	</div>
	<div class="landing" style="background-image:url('/resources/images/bg.jpg');">
		<div class="container">
			<a href="/index">
				<h1 style="display: inline-block;">DesignBinary</h1>
			</a>
		</div> 
	</div>
	
</header>