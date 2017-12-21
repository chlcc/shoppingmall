<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

   <style>
	form tr td{
		font-size: 15px;
	}
    </style>
    

<tags:layout>
	<!-- /.intro section -->
	<div id="intro">
		<div class="container">
			QnA
			<form:form commandName="boardForm">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th width="10%;"><label for="category">category</label></th>
						<td>${board.category}</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<th width="10%;"><label for="title">title</label></th>
						<td id="title">${board.title}</td>
					</tr>
					<tr>

					</tr>
					<tr>
						<th width="10%;"><label for="username">id</label></th>
						<td>${board.userId}</td>
					</tr>
					<tr>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2" height="300px" id="content">${board.content}</td>
					</tr>
				</tbody>
				<tfoot>
				<tr>
					<td id="btnList" colspan="2">
						<input type="button" class="btn-default" id="listBtn" style="font-weight: bold;" value="List"></input>
						<c:if test="${user != null && user.userId eq board.userId}">
							<input type="button" id="modBtn" class="btn-default" style="font-weight: bold;" value="Modify"></input>
							<input type="button" id="delBtn" class="btn-default" style="font-weight: bold;" value="Delete"></input>
						</c:if>			
					</td> 
				</tr>
				</tfoot>
			</table>
		 	<div id="errors">
            </div>
			</form:form>
			
			<hr>
			<table>
		 		<tr>
					<th> reply</th>
				</tr>
				<tbody>
				</tbody>
				
				<sec:authorize access="isAnonymous()">
					<tr>
						<td>Reply기능은 <a href="/login">로그인</a>을해야합니다</td>					
					</tr>
				</sec:authorize>
				
				<sec:authorize access="hasRole('ROLE_USER')">
				<tr style="border-radius:15px; border: 1px solid #eee; padding: 15px;" >
					<td width="10%">
						${user.userId}
					</td>
					<td width="80%">
						<textarea rows="5" class="form-control"></textarea>
					</td>
					<td>
						<input type="button" class="btn-default" value="submit">
					</td>
				</tr>
				</sec:authorize>
			</table>  
			
		</div>
	</div>
	
	
	<hr>
	<div class="text-center">
	</div>
	
	
<div class="modal fade" id="deleteCheckModal" tabindex="-1" role="dialog" aria-labelledby="deleteCheckModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
      	<h5 class="modal-title">정말 삭제하시겠습니까?</h5>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn-default" data-dismiss="modal">Close</button>
        <button type="button" onclick="setInvisibleBoard(${board.bno})" class="btn-primary">OK</button>
      </div>
    </div>
  </div>
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
		$("#modBtn").click(function () {
			
			var title = "<input type='text' id='titleInput' class='form-control' value='${board.title}'/>"
			$("#title").text("");
			$("#title").append(title);
			var content = "<textarea id='smartEditor' rows='20' class='form-control'>${board.content}</textarea>";
			$("#content").text("");
			$("#content").append(content);
			createTextEditer();
			
			$("#delBtn").attr("hidden" , true);
			$("#modBtn").attr("hidden" , true);
			$("#btnList").append("<input type='button' onclick='modify(${board.bno})' class='btn-default' style='font-weight: bold;' value='OK'></input>");
		});
		
		$("#delBtn").click(function () {
			$("#deleteCheckModal").modal('show');
		});
		
		
		function setInvisibleBoard(bno) {
			$("#deleteCheckModal").modal('hide');
			$.ajax({
				url : "${pageContext.request.contextPath}/board/" + bno,
				method : 'delete',
				success : function (data) {
					location.href = "${pageContext.request.contextPath}/board/list/1";
				} , 
				error : function (data) {
					console.log(data);
				}
			});
		}
		
		function modify(bno) {
			oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
			
			var userId = '${board.userId}';
			var category = '${board.category}';
			
			
			var data = {
					userId : userId,
					title : $("#titleInput").val(),
					content : $("#smartEditor").val(),
					category : category
			};
			$.ajax({
				url : "${pageContext.request.contextPath}/board/" + bno,
				method : 'put',
				data : JSON.stringify(data),
				contentType : 'application/json;charset=utf-8',
				success : function (data) {
				  	if(data.fieldError != null) {
						$("#errors").text("");
						var errorTemplate = $("#errorTemplate").html();
						var template = Handlebars.compile(errorTemplate);
						var html = template(data);
						$("#errors").append(html);
						return;
				  	}
					if(data.result != null && data.result == "success") {
						location.href = "${pageContext.request.contextPath}/board/" + bno
					}
				} , 
				error : function (data) {
					console.log(data);
				}
			});
			
		}		
		
		$("#listBtn").click(function () {
			history.back();
		});
		
	</script>
	
	
	<script type="text/javascript" src="/resources/SE2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript">
		var oEditors = [];
		
		function createTextEditer() {
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
		}
	</script>
	
</tags:layout>