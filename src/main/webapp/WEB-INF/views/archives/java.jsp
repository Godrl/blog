<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page session="false"%>

<%@ include file="../include/header.jsp"%>


<div class="navbar navbar-default navbar-static-top" role="navigation">
	<div class="container">

		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon icon-bar"></span> <span class="icon icon-bar"></span>
				<span class="icon icon-bar"></span>
			</button>
			<a href="/" class="navbar-brand">yona</a>
		</div>
		<div class="collapse navbar-collapse">
			<div id="menu">
				<ul class="nav navbar-nav navbar-right">
					<li class=""><a href="/">Home</a></li>
					<li class="active"><a href="/archives">Archives</a>
						<div class="dropdown-content">
							<ul id="category">
								<li class="active"><a href="java">Java</a></li>
								<li><a href="jsp">JSP</a></li>
							</ul>
						</div>
					</li>
					<sec:authorize access="isAnonymous()">
						<li class=""><a href="/member/signin">Login</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li>
							<a href="#">${username }<sec:authentication property="principal.username"/></a>
							<div class="dropdown-content">
								<ul id="category">
									<li><a href="#" onclick="document.getElementById('logout-form').submit();">logout</a></li>
								</ul>
							</div>		
   						</li>
   						<form id="logout-form" action="/logout" method="post">
							<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
						</form>							
					</sec:authorize>
				</ul>
			</div>
		</div>

	</div>
</div>
	
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
			<td>yona</td>
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

