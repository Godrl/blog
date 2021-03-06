<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="../include/header.jsp"%>

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
									<input type='hidden' name='boardCat' class="form-control" value="${boardVO.boardCat }"> 
									<input type="text" class="form-control" placeholder="Title" name="title" required="required" value="${boardVO.title }">
									<textarea name="content" rows="20" class="form-control" required="required">${boardVO.content }</textarea>
									<input type="text" name="writer" class="form-control" value="${boardVO.writer }" readonly="readonly">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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

