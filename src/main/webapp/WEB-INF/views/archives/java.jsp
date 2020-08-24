<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="../include/header.jsp"%>
	
<section id='blog-single-post'>
	<select name="searchType">
		<option value="n"
			<c:out value="${search.searchType == null ? 'selected' : '' }"/>>
			---
		</option>
		<option value="t"
			<c:out value="${search.searchType eq 't' ? 'selected' : '' }"/>>
			Title
		</option>
		<option value="c"
			<c:out value="${search.searchType eq 'c' ? 'selected' : '' }"/>>
			Content
		</option>
		<option value="tc"
			<c:out value="${search.searchType eq 'tc' ? 'selected' : '' }"/>>
			Title or Content
		</option>
	</select> 
	<input type="text" name="keyword" id="keywordInput" value="${search.keyword }">
	<button id="searchBtn">Search</button>
</section>

<table class="table table-boardered">
	<tr>
		<td style="wirdth: 10px">no</td>
		<td>Title</td>
		<td>Writer</td>
		<td>Regdate</td>
		<td style="width: 40px">View</td>
	</tr>

	<c:forEach items="${list }" var="boardVO">
		<tr>
			<td>${boardVO.boardno}</td>
			<td><a href="/archives/readboard${pageutil.makeQuery(pageutil.cri.page) }&boardno=${boardVO.boardno}&boardCat=${boardVO.boardCat}">${boardVO.title} [${boardVO.replynum }]</a></td>
			<td>${boardVO.writer }</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate }" /></td>
			<td><span class="badge bg-red">${boardVO.boardview }</span></td>
		</tr>
	</c:forEach>
</table>

<div class="text-center">
	<ul class="pagination">
		<c:if test="${pageutil.prev }">
			<li><a href="java${pageutil.makeQuery(pageutil.startPage - 1) }">&laquo;</a></li>
		</c:if>

		<c:forEach begin="${pageutil.startPage }" end="${pageutil.endPage }" var="idx">
			<li
				<c:out value="${pageutil.cri.page == idx?'class = active ' : '' }"/>>
				<a href="java${pageutil.makeQuery(idx) }">${idx }</a>
			</li>
		</c:forEach>

		<c:if test="${pageutil.next && pageutil.endPage > 0}">
			<li><a href="java${pageutil.makeQuery(pageutil.endPage + 1) }">&raquo;</a></li>
		</c:if>
	</ul>
</div>

<sec:authorize access="isAnonymous()">
   <section id="blog-single-post">
		<div class="container">
			<div class="row">
				<div class="blog-comment-form">
					<div class="col-md-3 col-sm-4">
						<input name="submit" type="submit" class="form-control" id="submit" value="로그인 후 글을 작성해주세요.">
					</div>
				</div>
			</div>
		</div>
	</section>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
	<section id="blog-single-post">
		<div class="container">
			<div class="row">
				<div class="blog-comment-form">
					<div class="col-md-3 col-sm-4">
						<input name="submit" type="submit" class="form-control" id="submit" value="New Archives">
					</div>
				</div>
			</div>
		</div>
	</section>
</sec:authorize>

<%@ include file="../include/footer.jsp"%>
<script>
	$(document).ready(function() {

		$("#submit").on("click", function() {
			location.href = "register";
		});

		$("#searchBtn").on("click",function(event) {
			location.href = "java"
							+ '${pageutil.makeSearch(1)}'
							+ "&searchType="
							+ $("select option:selected").val()
							+ "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
		});										
		
	});
</script>
<script>
	var result = '${msg}';

	if (result == 'register') {
		alert("글이 등록되었습니다.");
	}

	if (result == 'fail') {
		alert("올바르지 않은 형식입니다.");
	}

	if (result == 'modify') {
		alert("글이 수정되었습니다.");
	}

	if (result == 'remove') {
		alert("글이 삭제되었습니다.");
	}
</script>

