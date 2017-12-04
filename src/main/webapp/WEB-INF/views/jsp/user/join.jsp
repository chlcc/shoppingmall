<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<html>
    <head>

        <title>DesignBinary</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <tags:css></tags:css>
    </head>

    <body>
    
    	<tags:header></tags:header>
    	<tags:nav></tags:nav>
     <!-- /.intro section -->
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
                            Join
                        </h1>
                        
                        <table>
	                        <form:form commandName="userInfoForm" action="join" method="post" cssClass="news-letter mailchimp">
	                        	<tr>
	                        		<td width="40px;">
	                        			<label for="userId"><i class="fa fa-user" aria-hidden="true"> : </i></label> 
	                        		</td>
	                        		<td>
	                        			<form:input path="userId" placeholder="Your ID..." cssClass="form-control" size="100px;"/>
	                        		</td>
	                        	</tr>
	                        	
	                        	<tr>
	                        		<td colspan="2">
	                        			<form:errors path="userId"></form:errors>
	                        		</td>
	                        	</tr>
	                        	
	                        	<tr>
	                        		<td>
	                        			<label for="password"><i class="fa fa-unlock-alt" aria-hidden="true"> : </i></label> 
	                        		</td>
	                        		<td>
	                        			<form:password path="password" placeholder="Your Password..." cssClass="form-control" size="100px;"/>
	                        			
	                        		</td>
	                        	</tr>
	                        	
	                        	<tr>
	                        		<td colspan="2">
	                        			<form:errors path="password"></form:errors>
	                        		</td>
	                        	</tr>
	                        	
	                       		<tr>
	                        		<td>
	                        			<label for="userName"><i class="fa fa-address-card-o" aria-hidden="true"> : </i></label> 
	                        		</td>
	                        		<td>
	                        			<form:input path="userName" placeholder="Your Name..." cssClass="form-control" size="100px;"/>
	                        			
	                        		</td>
	                        	</tr>
	                        	<tr>
	                        		<td colspan="2">
	                        			<form:errors path="userName"></form:errors>
	                        		</td>
	                        	</tr>
	                        	
	                        	<tr>
	                        		<td>
	                        			<label for="phone"><i class="fa fa-phone" aria-hidden="true"> : </i></label> 
	                        		</td>
	                        		<td>
	                        			<form:input path="phone" placeholder="No '-'" cssClass="form-control" size="100px;"/>
	                        		</td>
	                        	</tr>
	                        	
                        		<tr>
	                        		<td colspan="2">
	                        			<form:errors path="phone"></form:errors>
	                        		</td>
	                        	</tr>
	                        	<tr>
	                        		<td>
	                        			<label for="email"><i class="fa fa-envelope" aria-hidden="true"> : </i></label> 
	                        		</td>
	                        		<td>
	                        			<form:input path="email" placeholder="sup2is@exmaple.co.kr" cssClass="form-control" size="100px;"/>
	                        		</td>
	                        	</tr>
                        		<tr>
	                        		<td colspan="2">
	                        			<form:errors path="email"></form:errors>
	                        		</td>
	                        	</tr>
	                        	<tr >
	                        		<td colspan="2">
	                        		 <button type="submit" class="btn-primary" style="font-weight: bold">Join Us</button>
                          			 <a href="/login" class="btn-default">Sign In</a>
	                        		</td>
	                        	</tr>
	            				
	            				
	            				
	                        </form:form>
                        </table>
                        
                        
                    </div>	
                </div>			  
            </div>
        </div>

    	<tags:footer></tags:footer>
	
		<div>
			<tags:script></tags:script>
		</div>
    </body>
</html>