<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>


<link rel="stylesheet" type="text/css"
	href="/resources/daumOpenEditor/css/editor.css" charset="utf-8" />
<script type="text/javascript" charset="utf-8"
	src="/resources/daumOpenEditor/js/editor_loader.js"></script>
	
	
	<style>
		#dragArea {
			width: 100%;
			height: 150px;
			background: #eee;
			font-size: 20px;
			border-radius: 10px;
			text-align: center;
			line-height: 150px;
		}	
		
	
	</style>
	
<tags:layout>
	<!-- /.intro section -->
	<div id="intro">
		<div class="container">
			GOODS
 
			<form:form commandName="goodsForm" enctype="multipart/form-data">
				<table class="table">
						<tr> 
							<td width="10%">Category : </td> 
							<td colspan="4">  
								<form:select path="category" cssClass="form-control">
									<form:option value="livingroom">living room</form:option>
									<form:option value="kitchen">kitchen</form:option>
									<form:option value="kids">kids</form:option>
									<form:option value="acc">acc</form:option>  
								</form:select>   
							</td> 
						</tr>  
						<tr>
							<td width="13%">Goods name : </td>  
							<td colspan="4">   
								<form:input path="name" cssClass="form-control"/> 
							</td>
						</tr>
						<tr>
							<td width="13%">Goods image : </td>  
							<td colspan="4">   
								<div id="dragArea">
									첨부할 이미지를 영역으로 드래그 해주세요 400x600
								</div>
							</td>
						</tr>
						
						<tbody id="goodsInfoArea">						  
							<tr id="goodsInfo">  
								<td width="10%">Color : </td> 
								<td ><input type="text" class="color form-control"/></td> 
								<td >Count : </td>  
								<td><input type="number" class="count form-control" /></td>  
								<!-- <td width="8%"><a href="#" id="plus"><img src="/resources/images/plus.png" style="width: 30px;"></a><a href="#" id="minus"><img src="/resources/images/minus.png" style="width: 30px;"></a> --> 
								</td>   
							</tr>   
						</tbody>       
						<tr>
							<td width="13%">price : </td>  
							<td colspan="5">   
								<form:input path="price" cssClass="form-control" onkeyup="inputNumberFormat(this)"/> 
							</td>
						</tr>
					<tr>   
						<td colspan="5"><jsp:include
								page="/WEB-INF/views/jsp/openAPI/daum/editor_frame.jsp"></jsp:include>
						</td>
					</tr>
				</table>
				
				<div id="errors">
                </div>
				<input type="button" id="formBtn" class="btn-default"
					style="font-weight: bold;" value="Submit"></input>
				<input type="hidden" id="filename">
				<input type="hidden" id="imageUrl"> 
				<div id="errors"></div>
			</form:form>
		</div>
		<textarea id="daumTextEdit" style="display: none;"></textarea>
	</div>
	<hr>
	<div class="text-center"></div>


	<form id="filenameForm"></form>


	<link rel=stylesheet type=text/css
		href="/resources/daumOpenEditor/css/editor.css" charset=utf-8 />
		
	<link rel=stylesheet type=text/css
		href="/resources/css/jquery.fs.stepper.css" charset=utf-8 />
		
	<script type=text/javascript charset=utf-8
		src="/resources/daumOpenEditor/js/editor_loader.js"></script>
		
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	
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
	
		$("#plus").click(function () { 
			$("#goodsInfoArea").append($("#goodsInfo").clone(true));
			var sdf = 1;
		});      
		    
		$("#minus").click(function () {    
			$(this).parents('tr').remove();
		});
		 
		$("input#price").keydown(function (x) { 
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}); 
	       
		function comma(str) {
		    str = String(str);
		    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
		function uncomma(str) {
		    str = String(str); 
		    return str.replace(/[^\d]+/g, '');
		}
		function inputNumberFormat(obj) {
		    obj.value = comma(uncomma(obj.value));
		}
		
		$("#dragArea").on("dragenter", function (e) {
			e.preventDefault();
			e.stopPropagation();
			
		});
		$("#dragArea").on("dragover", function (e) {
			e.preventDefault();
			e.stopPropagation();
			$(this).css("background","#bbb");
			
		});
		$("#dragArea").on("dragleave", function (e) {
			e.preventDefault();
			e.stopPropagation();
			$(this).css("background","#eee");
			
		});
		$("#dragArea").on("drop", function (e) {
			e.preventDefault();
			e.stopPropagation();
			
			var file = e.originalEvent.dataTransfer.files[0];
			$(this).text(file.name);
			var category = $("#category option:selected").val();
			var formData = new FormData();
			formData.append("uploadFile" ,file);
			console.log(category);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/file/singleUploadImageAjax/" + category,
				type : 'post' ,
				data : formData,
				dataType :'json',
				processData : false,
				contentType : false,
				success : function (data) {
					$("#filename").val(data.param.fileName);
					$("#imageUrl").val(data.param.url);  
				},
				error : function(data) {
					console.log(data)
				}
			});
		});
		
		
		$("#formBtn").click(function(e) { 
			Editor.save();  

			var textData = $("#daumTextEdit").val();  
			var content = $("#goodsForm").serializeObject();  
			content.content = textData; 

			var color = [];
			var count = [];
			content.filenames = [];
			content.filenames[0] = $("#filename").val();
			content.imageUrl = $("#imageUrl").val();
			
			$("input.color").each(function(i, value) {
				color[i] = $(this).val(); 
			});
			
			$("input.count").each(function(i, value) {
				count[i] = $(this).val(); 
			}); 
			  
			var goodsInfo = {};
			
			for(var i = 0; i<color.length; i++) {
				goodsInfo[color[i]] = count[i];
			}
			
			content.goodsInfo = goodsInfo;
			//content.price = parseInt($("#price").val().replaceAll(",",""));
			content.price = $("#price").val();
			console.log(content);
			 
		   	$.ajax({ 
				url : '${pageContext.request.contextPath}/admin/goods',
				method : 'post',
				contentType : 'application/json;charset=utf-8',
				data : JSON.stringify(content),
				success : function(data) {
					if(!(Object.keys(data.fieldError).length === 0)) {
			 			$("#errors").text("");
						var errorTemplate = $("#errorTemplate").html();
						var template = Handlebars.compile(errorTemplate);
						var html = template(data);
						$("#errors").append(html);
					}else {
					 	location.href = "${pageContext.request.contextPath}/admin/dashboard";
					}
				},
				error : function(error) {
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
			form: 'goodsForm'+"", /* 등록하기 위한 Form 이름 */ 
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