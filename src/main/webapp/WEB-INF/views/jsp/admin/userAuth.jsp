<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	float: left;
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

	<div class="container-fluid container" style="margin-bottom: 100px;">
		<div class="container">
			<div class="row">
				<br>
				<br> 
				<div class="col-md-12">
					<div class="table-responsive">
						<table id="mytable" class="table table-bordred table-striped">
							<thead>
								<tr>
									<!-- <th><input type="checkbox" id="checkall" /></th> -->
									<th>id</th>
									<th>name</th>
									<th>phone</th>
									<th>email</th>
									<th>auth</th>
									<th>enable</th>
									<th>create</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList}" var="user">
									<tr>
										<!-- <td><input type="checkbox" class="checkthis" /></td> -->
										<td>${user.userId}</td>
										<td>${user.userName }</td>
										<td>${user.phone }</td>
										<td>${user.email }</td> 
										<td>
										<select class="form-control userAuth" onchange="updateUserAuth(this.value, '${user.userId}')"> 
											<option value="ROLE_USER">USER</option>
											<c:if test="${user.authority == 'ROLE_ADMIN'}">
												<option selected="selected" value="ROLE_ADMIN">ADMIN</option>
											</c:if>
											<option value="ROLE_ADMIN">ADMIN</option>
										</select></td>
										<td>${user.enabled}</td>
										<td><fmt:formatDate value="${user.create_at}"  pattern="YY/MM/dd" /></td>
									</tr> 
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="clearfix"></div>
	</div>
</tags:layout> 

<script type="text/javascript"> 

	var userList = []; 
	<c:forEach items="${userList}" var="user">
		userList.push ({
			userId : "${user.userId}" ,
			role : "${user.authority}" 
		});
	</c:forEach>

	
	console.log(userList);
	
	
	
	
	function updateUserAuth(role,userId) {
		var param = {};
		param = {
				userId : userId,
				role : role
		};
		
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/userAuth",
			method : "put",
			data : JSON.stringify(param),
			contentType:"application/json;charset='utf8'" ,
			success: function(data) {
				if(data.result == "success"){
					alert("변경되었습니다.");
				}
			},
			error : function (data) {
				console.log(data);
			}
		});
		
		
	}
	
</script>
<!--

//-->
</script>

