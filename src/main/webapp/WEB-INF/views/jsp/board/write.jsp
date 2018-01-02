<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
    
    <style>
	form{
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
					  			<jsp:include page="/WEB-INF/views/jsp/openAPI/daum/editor_frame.jsp"></jsp:include>
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
			<textarea id="daumTextEdit" style="display: none;"></textarea>              
         </div>
		 <hr> 
		 <div class="text-center">
		 
		 </div>         
		 
		 
 	<form id="filenameForm">
 	
	</form>
	
	<script id="errorTemplate" type="text/x-handlebars-template">

	<div>
		<ul>
		{{#fieldError}}
			<li>{{.}}</li>
		{{/fieldError}}
		</ul>	
	</div>

	</script>

	<link rel=stylesheet type=text/css href="/resources/daumOpenEditor/css/editor.css" charset=utf-8 />
	<script type=text/javascript charset=utf-8 src="/resources/daumOpenEditor/js/editor_loader.js"></script>
	<script type="text/javascript">
		
			$("#formBtn").click( function (e) {
				
				Editor.save();
				
				var textData = $("#daumTextEdit").val();
				var content = $("#boardForm").serializeObject();
				content.content = textData;
				
				var filenames = [];
				
				$("input[class=filename]").each(function(i , value){
					filenames[i] = value.getAttribute('value');
				});
				content.filenames = filenames;
		 		
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
	
	<script type="text/javascript">
	
		var config = { 
			txHost: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */ 
			txPath: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */ 
			txService: 'sample', /* 수정필요없음. */ 
			txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */ 
			initializedId: "", /* 대부분의 경우에 빈문자열 */ 
			wrapper: "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */ 
			form: 'boardForm'+"", /* 등록하기 위한 Form 이름 */ 
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
									left:250,top:65,width:400,height:210,scrollbars:0
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