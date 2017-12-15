<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
    
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
		              		<label for="username">name</label>
		              	</th>
		              	<td>
		              		<!-- <input type="text" name="username" class="form-control"/> -->
		              		<form:input path="username" cssClass="form-control"/>
		          	 	</td>
		              </tr>
		              <tr>
		              		<form:errors path="username" cssClass="form-control"/>
		              </tr>
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
		          	  </tr>
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
		              <button type="submit" class="btn-default" style="font-weight: bold;">Submittt</button>
		              <div id="errors">
		              </div>
	              </form:form>
              </div>	
         </div>
		 <hr>
		 <div class="text-center">
		 
		 </div>         
	
	<
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> 
	
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
	$("#boardForm").submit(function (e) {
		e.preventDefault();
 		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
 		var content = $(this).serializeObject();
 		
		$.ajax({
			url:'/board',
			method : 'post',
			contentType : 'application/json;charset=utf-8',
			data : JSON.stringify(content) , 
			type : 'json',
			success : function (data) {
			 	if(data.fieldError != null) {
			 			$("#errors").text("");
						var errorTemplate = $("#errorTemplate").html();
						var template = Handlebars.compile(errorTemplate);
						var html = template(data);
						$("#errors").append(html);
				}  
			 	location.href = "${pageContext.request.contextPath}/board/list";
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
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				oEditors.getById["smartEditor"].exec("PASTE_HTML", [ "" ]);
			},
			fCreator : "createSEditor2"
		});
		//네이버 에디터 작성 데이터 전송하기 
		$("#submitModifyBoardBtn").click(function() {
		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
		});
	</script>

</tags:layout>