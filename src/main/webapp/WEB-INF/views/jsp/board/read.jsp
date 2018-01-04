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
<link rel="stylesheet" type="text/css" href="/resources/daumOpenEditor/css/editor.css" charset="utf-8" />
<script type="text/javascript" charset="utf-8" src="/resources/daumOpenEditor/js/editor_loader.js"></script>

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
						<td colspan="2" height="300px" id="content" class="well well-lg">${board.content}</td>
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
			
  <div class="row">
        <div class="comment-tabs">
            <ul class="nav nav-tabs" role="tablist">
                <li class="active"><a href="#comments-logout" role="tab" data-toggle="tab"><h4 class="reviews text-capitalize">Comments</h4></a></li>
            </ul>             
            <div class="tab-content">
                <div class="tab-pane active">                
                    <ul class="media-list" id="replyUl">
                    </ul> 
                </div>
            </div>
        </div>
  </div>
			<table>
				<tbody>
				</tbody>
				
				<sec:authorize access="isAnonymous()">
					<tr>
						<td>Reply기능은 <a href="/login">로그인</a>을해야합니다</td>					
					</tr>
				</sec:authorize>
				
				<sec:authorize access="hasRole('ROLE_USER')">
					<div class="row">
		       			<div class="comment-tabs">
							<div class="tab-content">
								<div class="tab-pane active">  
									<ul class="media-list">
						 				<li class="media"> 
						                <a class="pull-left" href="#">
						                <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/dancounsell/128.jpg" alt="profile">
						                </a>
							                <div class="media-body">
								                <div class="well well-lg">
								                <h4 class="media-heading reviews">${user.userId}</h4>
								                <p class="media-comment" > 
								               	 <textarea class="form-control" id="replyContent" rows="5"></textarea>
								                </p>
								                <a class="btn btn-success btn-circle text-uppercase" id="replyBtn" data-toggle="collapse"><span class="glyphicon glyphicon-comment"></span> submit</a>
								                </div>              
							                </div>
						                </li>      
					                </ul>
				                </div>
			                </div>
		                </div>
	                </div>
				</sec:authorize>
			</table>   
			<textarea id="daumTextEdit" style="display: none;">
			${board.content}
			</textarea>
			
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
<c:if test="${user.userId}">
	라라랄랄
</c:if>


	<script id="errorTemplate" type="text/x-handlebars-template">

	<div>
		<ul>
		{{#fieldError}}
			<li>{{.}}</li>
		{{/fieldError}}
		</ul>	
	</div>

	</script>
	<script id="replyTemplate" type="text/x-handlebars-template">

 	 {{#replyList}} 
	 <li class="media">
     <a class="pull-left" href="#">
     <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/dancounsell/128.jpg" alt="profile">
     </a>
     <div class="media-body">
    	<div class="well well-lg">
     		<h4 class="media-heading reviews">{{userId}}</h4>
     		<ul class="media-date reviews list-inline">
     		<li class="dd">22</li>
    		<li class="mm">09</li>
     		<li class="aaaa">2014</li>
    		</ul>
   			<p class="media-comment" data-rno="{{rno}}"> 
   	 			{{content}}
    		</p>
			<div data-rno="{{rno}}">
     		<a class="btn btn-info btn-circle text-uppercase" data-toggle="collapse"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>like</a>
			{{#isAuth}} 
			<a class="btn btn-success btn-circle text-uppercase" data-toggle="collapse" onclick="modReply({{rno}})"><i class="fa fa-pencil" aria-hidden="true"></i></span>modify</a>
		    <a class="btn btn-warning btn-circle text-uppercase" data-toggle="collapse" onclick="delReply({{rno}});"><i class="fa fa-trash-o" aria-hidden="true"></i></span>delete</a>
			{{/isAuth}}
			</div>  
     		</div> 
     	</div> 
     </li>     
 	 {{/replyList}} 
	</script> 

	<script type="text/javascript">
		  
		function modReply(rno) { 
			 
			var content = $(".media-comment[data-rno='"+rno+"']").text().trim();
			$(".media-comment[data-rno='"+rno+"']").text("");
			$(".media-comment[data-rno='"+rno+"']").append("<textarea class='form-control' data-rno='"+rno+"' rows='5'>" + content + "</textarea>");
			$("div[data-rno='"+rno+"']").text("");
			$("div[data-rno='"+rno+"']").append("<a class='btn btn-success btn-circle text-uppercase' data-toggle='collapse' onclick='modReplySubmit("+rno+")'><span class='glyphicon glyphicon-comment'></span>submit</a>");
			
		}	
		 
		function modReplySubmit (rno) {
			
			var content = $("textarea[data-rno='"+rno+"']").val();
			
			var data = {  
					rno : rno,
					userId : '${user.userId}',
					content : content
			}
			console.log(data); 
			 
			$.ajax({
				url : "${pageContext.request.contextPath}/reply/" + rno,
				method : "put",  
				dataType : "json",
				contentType : 'application/json;charset=utf8',
				data : JSON.stringify(data),
				success : function (data) {
					var fieldError = data.fieldError;
					if(data.fieldError !== undefined) {
						data.fieldError.forEach(function (value) {
							alert(value);
						}); 
						return;
					} 
					replyList();
					
				},error : function (data) {
					console.log(data);
				}
			});
		 
		}

		
		
		function delReply(rno) {
			$.ajax({
				url : "${pageContext.request.contextPath}/reply/" + rno,
				method : "delete",  
				dataType : "json",				 
				success : function (data) {
					replyList();
				},error : function (data) {
					console.log(data);
				}
			});
		}	
	
	
	
		Handlebars.registerHelper("isAuth",function (options) {
			 
			var userId = this.userId;
			var result = false;
			
		 	$.ajax({
				url : "${pageContext.request.contextPath}/getCurrentUser",
				method : "get",  
				async : false,
				dataType : "json",				 
				success : function (data) {
					if(!(Object.keys(data).length === 0) && data.user.userId == userId){
						result = true;
					} 
				},error : function (data) {
					console.log(data);
				}
			});
		 	if(result) {
		 		return options.fn(this);
		 	}else {
		 		return options.inverse(this);
		 	}
		});
	 
	
		$(document).ready(function () {
			 
			replyList();
			
		});
		
		 
		
		function modify(bno) {
			Editor.save();
			var userId = '${board.userId}';
			var category = '${board.category}';
			var data = {
					userId : userId,
					title : $("#titleInput").val(),
					content : $("#daumTextEdit").val(),
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
	
		$("#modBtn").click(function () {
			var title = "<input type='text' id='titleInput' class='form-control' value='${board.title}'/>"
			$("#title").text("");
			$("#title").append(title);
			

			$("#content").text("");
			$.ajax({
				type:'get',
				url:'/resources/daumOpenEditor/editor_frame.jsp',
				success : function (content) {
					$("#content").append(content);
					setConfig();
				},error : function () {
					console.log("에러")
				}
			});
			
			loadContent('${fileList}');
			
			
			$("#delBtn").attr("hidden" , true);
			$("#modBtn").attr("hidden" , true);
			$("#btnList").append("<input type='button' onclick='modify(${board.bno})' class='btn-default' style='font-weight: bold;' value='OK'></input>");
		});
		
		$("#delBtn").click(function () {
			$("#deleteCheckModal").modal('show');
		});
		
		
		$("#replyBtn").click(function () {
			var content = $("#replyContent").val();
			
			var data = {
					userId : '${user.userId}',
					content : content
			}
			console.log(data);
			 $.ajax({
				url : "${pageContext.request.contextPath}/reply/${board.bno}", 
				method : 'post',
				data : JSON.stringify(data),
				contentType : 'application/json;charset=utf-8',
				success : function (data) {
					var fieldError = data.fieldError;
					if(data.fieldError !== undefined) {
						data.fieldError.forEach(function (value) {
							alert(value);
						}); 
						return;
					} 
				  	replyList();
				} , 
				error : function (data) {
					console.log(data);
				}
			});
		});
		
		function replyList() {
			
			$.ajax({
				url : "${pageContext.request.contextPath}/reply/${board.bno}", 
				method : 'get',
				success : function (data) {
					$("#replyUl").text(""); 
					var replyTemplate = $("#replyTemplate").html();
					var template = Handlebars.compile(replyTemplate);
					var html = template(data);
					$("#replyUl").append(html);
				} , 
				error : function (data) {
					console.log(data); 
				}
			});
		}
		
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

		$("#listBtn").click(function () {
			history.back();
		});
		
		
	</script>
	
	<script type="text/javascript">
	
	function setConfig(){
		var config = { 
			txHost: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */ 
			txPath: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */ 
			txService: 'sample', /* 수정필요없음. */ 
			txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */ 
			initializedId: "", /* 대부분의 경우에 빈문자열 */ 
			wrapper: "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */ 
			form: 'boardForm', /* 등록하기 위한 Form 이름 */ 
			txIconPath: "/resources/daumOpenEditor/images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */ 
			txDecoPath: "/resources/daumOpenEditor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */ 
			canvas: { 
				styles: { 
					color: "#123456", /* 기본 글자색 */ 
					fontFamily: "굴림", /* 기본 글자체 */ 
					fontSize: "10pt", /* 기본 글자크기 */
					backgroundColor: "#fff", /*기본 배경색 */
					lineHeight: "1.5", /*기본 줄간격 */
					padding: "8px" /* 위지윅 영역의 여백 */ 
				}, 
				showGuideArea: false 
				}, 
				events: { 
					preventUnload: false
					}, 
					sidebar: { 
						capacity: {
				            maximum: 2097152
				        },
						attachbox: { 
							show: true, confirmForDeleteAll: true 
						},
						attacher:{
							image:{ 
								features:{
									left:250,top:65,width:400,height:190,scrollbars:0
									},
								popPageUrl:'${pageContext.request.contextPath}/imagePopup' 
							}
						}
							
					},
					size: { 
						contentWidth: 1000 /* 지정된 본문영역의 넓이가 있을 경우에 설정 */ 
						},
					};
		EditorJSLoader.ready(function(Editor) { 
			editor = new Editor(config); 
			}); 
	}
	
	function loadContent() {
		
		$.ajax({
			url:'${pageContext.request.contextPath}/file/getFileList',
			type : 'get',
			data : { bno : '${board.bno}'},
			dataType : 'json', 
			success : function (data) {
				
				
				var fileList = data.fileList;
				
				var attachments = {};
				attachments['image'] = [];
				  
			 	for(var i = 0; i < fileList.length; i++) {
			 		attachments['image'].push({
						'attacher': 'image',
						'data': { 
							'imageurl': fileList[i].url,
							'filename': fileList[i].fileName, 
							'filesize': fileList[i].fileSize, 
							'originalurl': fileList[i].originalUrl, 
							'thumburl': fileList[i].originalUrl
						}
					});
			 		Editor.modify({
						"attachments": function () { /* 저장된 첨부가 있을 경우 배열로 넘김, 위의 부분을 수정하고 아래 부분은 수정없이 사용 */
							var allattachments = [];
							for (var i in attachments) {
								allattachments = allattachments.concat(attachments[i]);
							}
							return allattachments;
						}(),
						"content": document.getElementById("daumTextEdit") /* 내용 문자열, 주어진 필드(textarea) 엘리먼트 */
					});
				}  
				
				
			}, 
		});
	}

    function validForm(editor) {
        var validator = new Trex.Validator();
        var content = editor.getContent();
        if (!validator.exists(content)) {
            alert('내용을 입력하세요');
            return false;
        }
        return true;
    }
    
	function setForm(editor) {
		var content = editor.getContent();
		$("#daumTextEdit").val(content)
		return false;
	}

	</script>
	
	
</tags:layout>