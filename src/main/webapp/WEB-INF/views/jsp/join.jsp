<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<tags:layout>
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
	                        <form:form commandName="userInfoForm" action="/join" method="post" cssClass="news-letter mailchimp">
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
	                        			<small><form:password path="password" placeholder="Your Password..." cssClass="form-control" size="100px;"/></small>
	                        			
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
	                        			<label for="address" ><i class="fa fa-address-card-o" aria-hidden="true"> : </i></label> 
	                        		</td>
	                        		<td>
	                        			<form:input path="address" placeholder="Your address... Click Me!" cssClass="form-control" size="100px;" onClick="goPopup();" readonly="true"/>
	                        			
	                        		</td>
	                        	</tr>
	                        	<tr>
	                        		<td colspan="2">
	                        			<form:errors path="address"></form:errors>
	                        		</td>
	                        	</tr>
	                        	<tr>
	                        		<td>
	                        			<label for="address_detailed"><i class="fa fa-address-card-o" aria-hidden="true"> : </i></label> 
	                        		</td>
	                        		<td>
	                        			<form:input path="address_detailed" placeholder="Your address_detailed..." cssClass="form-control" size="100px;"/>
	                        			
	                        		</td>
	                        	</tr>
	                        	<tr>
	                        		<td colspan="2">
	                        			<form:errors path="address_detailed"></form:errors>
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
	                        			<form:input path="email" placeholder="sup2is@example.co.kr" cssClass="form-control" size="100px;"/>
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

	
