<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<tags:layout>
        <div id="intro">
            <div class="container">
                <div class="row">
                    <!-- /.intro content -->
                    <div class="col-md-6">
                           <div class="landing-text wow fadeInLeft">
                                <p>Backyard is a modern and customizable landing page template designed to increase conversion of your product. Backyard is flexible to suit any kind of your business. Try now and join with our happy customers!</p>
                            </div>	
                            <div class="landing-text wow fadeInLeft">
                                <p>Backyard is a modern and customizable landing page template designed to increase conversion of your product. Backyard is flexible to suit any kind of your business. Try now and join with our happy customers!</p>
                            </div>						
                    </div>
                      <div class="col-md-6 intro-pic">
                        <h1 >
                            DesignBinary
                        </h1>
                        
                        <form:form commandName="loginForm" cssClass="news-letter mailchimp">
                        	<form:input path="userId" cssClass="form-control" placeholder="Your ID..."/>
                        	<form:password path="password" cssClass="form-control" placeholder="Your Password..."/>
                        	<br>
                        	<form:errors path="password" cssClass="form-control"></form:errors>
                        	<button type="submit" class="btn-primary" style="font-weight: bold">Login</button>
                            <a href="/join" class="btn-default">Sign Up</a>
                        </form:form>
                        
                    </div>	
                </div>			  
            </div>
        </div>
</tags:layout>