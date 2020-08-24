<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="../include/header.jsp"%>

	<!-- Home Section -->
	<section id="home" class="main-single-post parallax-section">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
	
				<div class="col-md-12 col-sm-12">
					<h1>Register Board</h1>
				</div>
	
			</div>
		</div>
	</section>
	
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
								<h3>New board</h3>
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
											<c:out value="${boardVO.boardCat eq 'jsp'?'selected' :'' }"/>
											Jsp
										</option>
									</select>
									<input type="text" class="form-control" placeholder="Title" name="title" required>
									<textarea name="content" rows="20" class="form-control" id="content" placeholder="Content" required="required"></textarea>
									<input type="text" name="writer" class="form-control" value="${loginVO.ID }" readonly="readonly">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="col-md-3 col-sm-4">
										<input name="submit" type="submit" class="form-control" id="submit" value="Register">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<%@ include file="../include/footer.jsp"%>

