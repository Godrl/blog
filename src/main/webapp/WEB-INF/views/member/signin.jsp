<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

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
					<li class=""><a href="/archives">Archives</a>
						<div class="dropdown-content">
							<ul id="category">
								<li class=""><a href="/archives/java">Java</a></li>
								<li><a href="/archives/jsp">JSP</a></li>
							</ul>
						</div>
					</li>
					<sec:authorize access="isAnonymous()">
						<li class="active"><a href="/member/signin">Login</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
	   						<p><sec:authentication property="principal.username"/>${username }님.</p>
	   						<a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
							<form id="logout-form" action="/logout" method="post">
								<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
							</form>
					</sec:authorize>
				</ul>
			</div>
		</div>

	</div>
</div>

<section id="signin">
	<div class="container">
		<div class="row">
			<h3>Login</h3>
			<div class="col-md-offset-1 col-md-10 col-sm-12">
				<form action="/login" method="post">
					<div>
						<input type="text" class="form-control" placeholder="ID" name="userid" value="${userid }" required/>
					</div>
					<div>
						<input type="password" class="form-control" placeholder="Password" name="userpw" value="${userpw }" required/>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="col-md-3 col-sm-4">
						<input name="submit" type="submit" class="form-control" id="submit" value="Sign in">
					</div>
				</form>
				<div class="col-md-3 col-sm-4">
					<input name="submit" type="submit" class="form-control" id="signup" value="Sign up">
				</div>
				<div>
					<c:if test="${not empty errormsg}">
						<p><font color="red"> ${errormsg }</font></p>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jsp"%>

<script>
	$(document).ready(function() {

		$("#signup").on("click", function() {
			location.href = "signup";
		});
	});
</script>