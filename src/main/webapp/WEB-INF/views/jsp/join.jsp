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
                            DesignBinary
                        </h1>
                        <form class="news-letter mailchimp" action="http://moxdesign.us10.list-manage.com/subscribe/post" role="form" method="POST">
                            <input type="hidden" name="u" value="503bdae81fde8612ff4944435">
                            <input type="hidden" name="id" value="bfdba52708">
                            <input style="margin-bottom: 5px" class="form-control" type="text" name="MERGE0" placeholder="Your ID..." required>
                            <input class="form-control" type="password" name="MERGE0" placeholder="Your Password..." required>
                            <button type="submit" class="btn-primary" style="font-weight: bold">Login</button>
                            <a href="/join" class="btn-default">Sign Up</a>
                        </form>
                        
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