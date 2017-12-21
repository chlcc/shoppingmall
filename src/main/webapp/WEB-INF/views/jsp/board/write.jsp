<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
    
    <style>
	form{
		font-size: 15px;
	}
    </style>
    
<tags:layout>
  <!-- /.intro section -->
        <div id="intro">
            <div class="container">
            	QnA
            	
	              <form:form commandName="boardForm" action="/board" method="POST">
		              <table class="table table-striped table-hover">
		              <thead>
		              <tr>
		              	<th width="10%;"> 
		              		<label for="category">category</label>
		              	</th>
		              	<td>
		              		<form:select path="category" cssClass="form-control">
		              			<form:option value="del">delivery</form:option>
		              		</form:select>
		          	 	</td>
		              </tr>
		               <tr>
		              		<form:errors path="category" cssClass="form-control"/>
		              </tr>
		               <tr>
		              	<th width="10%;"> 
		              		<label for="title">title</label>
		              	</th>
		              	<td>
		              		<!-- <input type="text" name="title" class="form-control"/> -->
		              		<form:input path="title" cssClass="form-control"/>
		          	 	</td>
		              </tr>
		               <tr>
		              		<form:errors path="title" cssClass="form-control"/>
		              </tr>
		              <tr>
		              	<th width="10%;"> 
		              		<label for="userId">name</label>
		              	</th>
		              	<td>
							<form:input path="userId" value="${user.userId}" cssClass="form-control" readonly="true"/>
		          	 	</td>
		              </tr>
		              <tr>
		              		<form:errors path="userId" cssClass="form-control"/>
		              </tr>
		              
		       <%--        
		              <tr>
		              	<th width="10%;"> 
		              		<label for="password">password</label>
		              	</th>
		              	<td>
		              		<form:input path="password" cssClass="form-control"/>
		          	 	</td>
		              </tr>
		              <tr>
			              <td>
			              		<form:errors path="password" cssClass="form-control"/>
			          	  </td>
		          	  </tr> --%>
		          	  
		          	  
		              </thead>
					  <tbody>
					  	<tr>
					  		<td colspan="2">
					  			<!--<textarea id="smartEditor" rows="20"  class="form-control"> </textarea> -->
					  			<form:textarea path="content" id="smartEditor" rows="20" cssClass="form-control"/>
					  		</td> 
					  	</tr>
					    <tr>
		              		<form:errors path="content" cssClass="form-control"/>
		              </tr>
					  
					  </tbody>              
		              
		              </table>
	                	<input type="button" id="formBtn" class="btn-default" style="font-weight: bold;" value="Submit"></input>
		              <div id="errors">
		              </div>
	              </form:form>
              </div>	
         </div>
		 <hr>
		 <div class="text-center">
		 
		 </div>         
	
	
	<script id="errorTemplate" type="text/x-handlebars-template">

	<div>
		<ul>
		{{#fieldError}}
			<li>{{.}}</li>
		{{/fieldError}}
		</ul>	
	</div>

	</script>


	<script type="text/javascript">
	
	$("#formBtn").click( function () {
		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
		var content = $("#boardForm").serializeObject();
		console.log(content);
		
		$.ajax({
			url:'${pageContext.request.contextPath}/board',
			method : 'post',
			contentType : 'application/json;charset=utf-8',
			data : JSON.stringify(content) , 
			success : function (data) {
			  	if(data.fieldError != null) {
		 			$("#errors").text("");
					var errorTemplate = $("#errorTemplate").html();
					var template = Handlebars.compile(errorTemplate);
					var html = template(data);
					$("#errors").append(html);
					return;
				}else {
				 	location.href = "${pageContext.request.contextPath}/board/list/1";
				}
			},
			error : function (error) {
				console.log(error);
			}
			 
		}); 
	});
	
	</script>
	
	<script type="text/javascript" src="/resources/SE2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "smartEditor",
			sSkinURI : "/resources/SE2/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true,
				bUseVerticalResizer : true,
				bUseModeChanger : true,
				fOnBeforeUnload : function() {}
			},
			fOnAppLoad : function() {
				oEditors.getById["smartEditor"].exec("PASTE_HTML", [ "" ]);
			},
			fCreator : "createSEditor2"
		});
	</script>

</tags:layout>