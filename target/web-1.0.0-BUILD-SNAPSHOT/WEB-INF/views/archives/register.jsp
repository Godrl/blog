<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

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
    ul {
    	list-style:none;
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
<!-- Home Section -->

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

