<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
								<li class=""><a href="java">Java</a></li>
								<li><a href="jsp">JSP</a></li>
							</ul>
						</div>
					</li>
					<sec:authorize access="isAnonymous()">
						<li class="active"><a href="/member/signin">Login</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<form id="logout-form" action="/logout" method="post">
							<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
						</form>
   						<p><sec:authentication property="principal.username"/>${username }님.</p>
						<a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
					</sec:authorize>
				</ul>
			</div>
		</div>

	</div>
</div>

<section id="signup">
	<div class="container">
		<div class="row">
			<h3>Sign Up</h3>
			<div class="col-md-offset-1 col-md-10 col-sm-12">
				<form action="/signup" method="post">
					<div>
						<label for="id"><b>ID</b></label>
						<input type="text" class="form-control" name="ID" placeholder="ID" required/>
					</div>
					<div>
						<label for="email"><b>Email</b></label>
						<input type="email" class="form-control" name="Email" placeholder="EMAIL" required/>
					</div>
					<div>
						<label for="psw"><b>Password</b></label>
						<input type="password" class="form-control" id="pw1" name="Password" placeholder="PASSWORD" required/>
					</div>
					<div>
						<label for="psw-repeat"><b>Repeat Password</b></label>
						<input type="password" class="form-control" id="pw2" name="Confirm Password" placeholder="CONFIRM PASSWORD" required/>
						<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
						<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="col-md-3 col-sm-4">
						<input name="submit" type="submit" class="form-control" id="submit" value="Sign Up">
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jsp"%>

<script type="text/javascript">
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#pw1").val();
			var pwd2 = $("#pw2").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});
</script>
