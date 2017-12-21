<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
    

  <style>
  .pagination>li>a {
	cursor: pointer;
}
  
  </style>
    
<tags:layout>
  <!-- /.intro section -->
        <div id="intro">
            <div class="container">
                   <table class="table table-striped table-hover">
                   <thead>
                    	<tr>
                    		<th width="5%;">No</th>
                    		<th width="70%;">Title</th>
                    		<th width="10%">Author</th>
                    		<th width="10%">Date</th>
                    		<th width="5%">View</th>
                    	</tr>
                   	</thead>
                   	<tbody id="notice">
                   	</tbody>
                   	<tbody id="list">
                   	</tbody>
                   </table>
			  <a href="/board/write" class="btn-default">Write</a>
              </div>	
         </div>
		 <hr>
		 <div class="text-center">
		 	<ul class="pagination" id="pagination">
		 	</ul>
		 </div>         
	
	<script src="//code.jquery.com/jquery.min.js"></script> 
	<script src="/resources/js/handlebars-v4.0.11.js"></script>
	<script id="listTemplate" type="text/x-handlebars-template">
		{{#each list}}
			<tr>
				<td>{{bno}}</td>
				<td><a href="/board/{{bno}}">{{title}}</a></td>
				<td>{{username}}</td>
				<td>{{create_at}}</td>
				<td>{{viewCnt}}</td>
			</tr>
		{{/each}}
	</script>
	
	
	<script id="pageTemplate" type="text/x-handlebars-template">
		{{#pageList}}
			<li><a style="cursor" onclick="getList({{page}})">{{page}}</a></li>
		{{/pageList}}
	</script>
	
	<script type="text/javascript">
	
	function getList(page) {
		$("#list").text("");
		$("#pagination").text("");
		$.ajax({
			url : "${pageContext.request.contextPath}/board/list/" + page,
			method : 'get',
			contentType : 'json',
			success : function (data) {
				if(data != null){
					
					var listTemplate = $("#listTemplate").html();
					var template = Handlebars.compile(listTemplate);
					var html = template(data);
					$("#list").append(html);
					
					var pageTemplate = $("#pageTemplate").html(); 
					var pagenation = getPageNavigation(data);
			 	 	var template = Handlebars.compile(pageTemplate);
					var html = template(pagenation);
					$("#pagination").append(html); 
				}
			}			
		});
		
	}
/* 	
	function getPageNavigation(data) {
		
		var startPage = data.pageNavigation.startPage;
		var endPage = data.pageNavigation.endPage;
		var pageList = new Array();
		
		for(var i = 0 ; i < endPage ; i++) {
			pageList[i] = startPage++;
		}  
		return pageList;
	} */
	
	function getPageNavigation(data) {
		
		var startPage = data.pageNavigation.startPage;
		var endPage = data.pageNavigation.endPage;
		var pageObj = new Object();
		var pageList = new Array();
		for(var i = 0 ; i < endPage ; i++) {
			pageList[i] = {'page' : startPage++};
		}  
		
		pageObj.pageList = pageList;
		return pageObj;
	}
	
	$(document).ready(function () {
		
		getList(1);
		
	});
	
	</script>


</tags:layout>