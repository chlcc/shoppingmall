<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.pagination>li>a {
	cursor: pointer;
}

#list tr td {
	font-size: 15px;
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
					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.bno}</td>
							<td><a href="/board/${list.bno}">${list.title}</a></td>
							<td>${list.userId}</td>
							<td><fmt:formatDate value="${list.create_at}"
									pattern="YY/MM/dd" /></td>
							<td>${list.viewCnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="/board/write" class="btn-default">Write</a>
		</div>
	</div>
	<hr>
	<div class="text-center">
		<ul class="pagination" id="pagination">
			<c:if test="${pageNavigation.startPage != 1}">
				<li><a href="/board/list/${pageNavigation.startPage - 1}">&lt;</a></li>
			</c:if>
			<c:forEach var="pageNum" begin="${pageNavigation.startPage}" end="${pageNavigation.endPage}">
				<li><a href="/board/list/${pageNum}">${pageNum}</a></li>
			</c:forEach>
			<c:if test="${pageNavigation.endPage <  pageNavigation.totalPage}">
				<li><a href="/board/list/${pageNavigation.endPage + 1}">&gt;</a></li>
			</c:if>
		</ul>
	</div>

	<!-- TODO 비공개글 처리 -->
	<!-- Modal -->
	<div class="modal fade" id="passwordInputModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">비공개 글입니다.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input id="passwordInput" class="form-control"
						placeholder="Password를 입력해주세요" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn-default" data-dismiss="modal">Close</button>
					<button type="button" id="passwordBtn" class="btn-primary">OK</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		
	</script>

</tags:layout>