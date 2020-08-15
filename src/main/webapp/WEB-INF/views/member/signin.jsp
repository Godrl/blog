<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<style>
.navbar-collapse {
	position: relative;
}

#menu a {
	display: inline-block;
	position: relative;
}

li {
	padding: 13px 15px 0 15px;
}

#category {
	visibility: hidden;
	position: relative;
}

.navbar-right>li:hover #category {
	visibility: visible;
}
</style>

<%@ include file="../include/header.jsp"%>

<div class="navbar navbar-default navbar-static-top" role="navigation">
	<div class="container">

		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
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
				</ul>
			</div>
		</div>

	</div>
</div>

<section id="contact">
	<div class="container">
		<h3>Login</h3>
		<div class="col-md-offset-1 col-md-10 col-sm-12">
			<form action="/login" method="post">
				<div class="col-md-4 col-sm-4">
					<input type="text" class="form-control" placeholder="ID" name="userid" value="${userid }" required>
				</div>
				<div class="col-md-4 col-sm-4">
					<input type="password" class="form-control" placeholder="Password" name="userpw" value="${userpw }" required>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="col-md-3 col-sm-6">
					<input name="submit" type="submit" class="form-control" id="submit" value="Sign in">
				</div>
			</form>
			<div class="col-md-3 col-sm-6">
				<input name="submit" type="submit" class="form-control" id="signup" value="Sign up">
			</div>
		</div>
		<span>
			<c:if test="${not empty errormsg}">
				<p><font color="red"> ${errormsg }</font></p>
			</c:if>
		</span>
	</div>
</section>

<script>
	$(document).ready(function() {

		$("#signup").on("click", function() {
			location.href = "signup";
		});
	});
</script>

<%@ include file="../include/footer.jsp"%>