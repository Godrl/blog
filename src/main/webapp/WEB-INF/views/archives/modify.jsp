<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<style>
	.navbar-collapse{
		position : relative;
	}
	#menu a{
		display : inline-block;
		position : relative;
	}
   	li {
		padding: 13px 15px 0 15px;
   	}
   	#category{
    	visibility : hidden;
    	position : relative;
    }
   	.navbar-right > li:hover #category{
   		visibility : visible;
   	}
   	
</style>

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
									<li><a href="java">Java</a></li>
									<li><a href="jsp">JSP</a></li>
								</ul>
							</div>
						</li>
						<li class=""><a href="/daily"></a></li>
					</ul>
				</div>
			</div>

	</div>
</div>


<!-- Blog Single Post Section -->

<section id="blog-single-post">
	<div class="container">
		<div class="row">

			<div class="col-md-offset-1 col-md-10 col-sm-12">
				<div class="blog-single-post-thumb">
					<div class="blog-post-title"></div>
					<div class="blog-post-format"></div>
					<div class="blog-post-des">
						<div class="blog-comment-form">
							<h3>Modify</h3>
							<form role="form" action="modify" method="post">
								<input type="hidden" name="page" value="${search.page }"> 
								<input type="hidden" name="perPageNum" value="${search.perPageNum }">
								<input type="hidden" name="searchType" value="${search.searchType }">
								<input type="hidden" name="keyword" value="${search.keyword }">
								<input type="hidden" name="boardno" class="form-control" value="${boardVO.boardno }" readonly="readonly">
								<input type='hidden' name='boardCat' class="form-control" value="${boardVO.boardCat}"> 
								<input type="text" class="form-control" placeholder="Title" name="title" required="required" value='${boardVO.title}'>
								<textarea name="content" rows="20" class="form-control" required="required">${boardVO.content}</textarea>
								<input type="text" name="writer" class="form-control" value="yona" readonly="readonly">
								
								<div class="col-md-3 col-sm-4">
									<button type="submit" class="btn btn-modify">수정</button>
									<button type="submit" class="btn btn-cancle">취소</button>
								</div>
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
 	
	$(document).ready(function() {

		var cat = "${boardVO.boardCat}";
		var link = cat.substring(2,7);
		
		var formObj = $("form[role='form']");

		console.log(formObj);

		
		$(".btn-modify").on("click", function() {
			formObj.submit();
		});
		
		$(".btn-cancle").on("click", function() {
			location.href = "/archives/"+link+"?page=${search.page}&perPageNum=${searh.perPageNum}" 
							+ "&searchType=${search.searchType}&keyword=${search.keyword}";
		});
	});
</script>

<%@ include file="../include/footer.jsp"%>

