<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page session="false" %>

<%@ include file="include/header.jsp"%>

	<!-- Home Section -->
	
	<section id="home" class="main-about parallax-section">
	     <div class="overlay"></div>
	     <div class="container">
	          <div class="row">
	               <div class="col-md-12 col-sm-12">
	                    <h1>Archives</h1>
	               </div>
	
	          </div>
	     </div>
	</section>
	
	<!-- Blog Section -->
	
	<section id="blog-single-post">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-1 col-md-10 col-sm-12">
					<div class="blog-single-post-thumb">
						<div class="blog-post-title"></div>
						<div class="blog-post-format"></div>
						<div class="blog-post-des">
							<div class="blog-comment-form">
								<h3>New Archives</h3>
								<form role="form" method="post">
									<select name="boardCat">
										<option value="">
											Category
										</option>
										<option value="a_java">
											<c:out value="${boardVO.boardCat eq 'a_java'?'selected' :'' }"/>
											Java
										</option>
										<option value="a_jsp">
											<c:out value="${baordVO.boardCat eq 'a_jsp'?'selected' :'' }"/>
											Jsp
										</option>
									</select>
									<input type="text" class="form-control" placeholder="Title" name="title" required>
									<textarea name="content" rows="20" class="form-control" id="content" placeholder="Content" required="required"></textarea>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="col-md-3 col-sm-4">
										<input name="submit" type="submit" class="form-control" id="submit" value="New archives">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
<%@ include file="include/footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script src="<c:url value="resources/vendor/jquery/jquery.min.js"/>"></script>
	<script src="<c:url value="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

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
