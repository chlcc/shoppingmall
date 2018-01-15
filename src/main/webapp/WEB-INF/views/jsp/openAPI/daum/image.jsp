<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<head>
<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/daumOpenEditor/css/popup.css"/>
<script type="text/javascript" charset="utf-8" src="/resources/daumOpenEditor/js/popup.js"></script>
<style type="text/css">

/* css */
.header {
	background-image: none;
	background-color: #027dfc;
}
/* 파일첨부(.file) */
.file {
	display: inline-block;
	margin-top: 8px;
	overflow: hidden;
}

.file .file-text {
	display: inline-block;
	padding: 6px 10px 8px 10px;
	border: 1px solid #c7c7c7;
	width: 179px;
	font-size: 14px;
	color: #8a8a8a;
	float: left;
}

.file .file-text:FOCUS {
	border-color: #54c4e5;
	outline: 0;
	-webkit-box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.075), 0px 0px 8px
		rgba(102, 175, 233, 0.6);
	box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.075), 0px 0px 8px
		rgba(102, 175, 233, 0.6);
}

.file .file-btn {
	margin-left: 2px;
	padding: 6px 8px 4px 8px;
	height: 20px;
	line-height: 20px;
	font-size: 12px;
	font-weight: bold;
	background-color: #fff;
	border: 1px solid #989898;
	color: #989898;
	cursor: pointer;
	float: left;
}

.file .file-btn:HOVER {
	background-color: #edfbff;
	border: 1px solid #009bc8;
	color: #009bc8;
}

</style>
</head>

<script type="text/javascript">
	// <![CDATA[

	function done(jsonObj) {
		
		if (typeof (execAttach) == 'undefined') { //Virtual Function
			return;
		} 
		
		var _mockdata = {
			'imageurl' : jsonObj.fileInfo.url,
			'filename' : jsonObj.fileInfo.fileName,
			'filesize' : jsonObj.fileInfo.fileSize,
			'imagealign' : 'L',
			'originalurl' : jsonObj.fileInfo.originalurl,
			'thumburl' : jsonObj.fileInfo.url
		};
		
		execAttach(_mockdata);
		closeWindow();
	}


	function initUploader() {
		var _opener = PopupUtil.getOpener();
		if (!_opener) {
			alert('잘못된 경로로 접근하셨습니다.');
			return;
		}

		var _attacher = getAttacher('image', _opener);
		registerAction(_attacher);
	}
	// ]]>
</script>


<body onload="initUploader();">
	<div class="wrapper">
		<div class="header">
			<h1>사진 첨부</h1>
		</div>
		<div class="body">
			<dl class="alert">
				<dt>&nbsp;1MB이하 (JPG,GIF,PNG,BMP)</dt>
				<dd>
					<form id="daumImageForm" encType="multipart/form-data" method="post" action="">
						<!-- 파일첨부 -->
						<div class="file">
							<input disabled class="file-text"> 
							<label class="file-btn" for="uploadInputBox">사진첨부</label>
							<input id="uploadInputBox" type="file" name="fileData" />
						</div>
					</form>
				</dd>
			</dl>
		</div>
		<div class="footer">
			<p>
				<a href="#" onclick="closeWindow();" title="닫기" class="close">닫기</a>
			</p>
			<ul>
				<li class="submit"><a href="#" id="submitBtn" title="등록"
					class="btnlink">등록</a></li>
				<li class="cancel"><a href="#" onclick="closeWindow();"
					title="취소" class="btnlink">취소</a></li>
			</ul>
		</div>
	</div>
	
	<script type="text/javascript">
	
	
	$(document).ready(function () {
	
		$("#submitBtn").click(function () {
			
			var formData = new FormData($("#daumImageForm")[0]);
			
		 	$.ajax({
				url : "${pageContext.request.contextPath}/file/singleUploadImageAjax",
				type : 'post' ,
				data : formData,
				dataType :'json',
				processData : false,
				contentType : false,
				success : function (jsonObj) {
					if(jsonObj.result != null) {
						alert(jsonObj.result);
					}else {
						
						$(opener.document).find("#filenameForm").append("<input type='hidden' class='filename' value='"+ jsonObj.fileInfo.fileName+"'>");
						done(jsonObj);
					}
					
				},
				error : function(data) {
					console.log(data)
				}
				
			});
		});
	});
	</script>
	
</body>
</html>