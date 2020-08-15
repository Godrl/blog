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
		<h3>Sign Up</h3>
		<div class="col-md-offset-1 col-md-10 col-sm-12">
			<form action="/signup" method="post">
				<div>
					<input type="text" name="ID" placeholder="ID"/>
				</div>
				<div>
					<input type="text" name="Email" placeholder="EMAIL"/>
				</div>
				<div>
					<input type="password" name="Password" placeholder="PASSWORD"/>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="col-md-3 col-sm-4">
						<input name="submit" type="submit" class="form-control" id="submit" value="Sign Up">
				</div>
			</form>
		</div>
		<span>
			<c:if test="${not empty errormsg}">
				<p><font color="red"> ${errormsg }</font></p>
			</c:if>
		</span>
	</div>
</section>

<%@ include file="../include/footer.jsp"%>