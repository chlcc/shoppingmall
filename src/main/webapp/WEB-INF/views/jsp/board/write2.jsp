<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
    
<tags:layout>
  <!-- /.intro section -->
        <div id="intro">
            <div class="container">
            	QnA
            	
	              <form id="boardForm" action="/board" method="POST">
		              <table class="table table-striped table-hover">
		              <thead>
		              <tr>
		              	<th width="10%;"> 
		              		<label for="category">category</label>
		              	</th>
		              	<td>
		              		<select id="cate"></select>
		          	 	</td>
		              </tr>
		               <tr>
		              	<th width="10%;"> 
		              		<label for="title">title</label>
		              	</th>
		              	<td>
		              		<input type="text" name="title" class="form-control"/>
		          	 	</td>
		              </tr>
		              <tr>
		              	<th width="10%;"> 
		              		<label for="username">name</label>
		              	</th>
		              	<td>
		              		<input type="text" name="username" class="form-control"/>
		          	 	</td>
		              </tr>
		              <tr>
		              	<th width="10%;"> 
		              		<label for="password">password</label>
		              	</th>
		              	<td>
		              		<input type="password" name="password" class="form-control"/>
		          	 	</td>
		              </tr>
		              </thead>
					  <tbody>
					  	<tr>
					  		<td colspan="2">
					  			<textarea id="smartEditor" rows="20"  class="form-control"> </textarea> 
					  		</td> 
					  	</tr>
					   
					  </tbody>              
		           	
		              </table>
		              <button type="submit" class="btn-default" style="font-weight: bold;">Submittt</button>
	              </form>
              </div>	
         </div>
		 <hr>
		 <div class="text-center">
		 
		 </div>         
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> 
	<script src="/resources/js/jquery.serializeObject.min.js"></script>
	<script type="text/javascript">
	$("#boardForm").submit(function (e) {
		e.preventDefault();
 		var content = $(this).serializeObject();
 		
 		console.log(content);
 		
		$.ajax({
			url:'/board',
			method : 'post',
			contentType : 'application/json;charset=utf-8',
			data : JSON.stringify(content) , 
			dataType: 'json',
			success : function (data) {
				
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