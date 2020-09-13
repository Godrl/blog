<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="../include/header.jsp"%>

	<section id="signup">
		<div class="container">
			<div class="row">
				<h3>Sign Up</h3>
				<div class="col-md-offset-1 col-md-10 col-sm-12">
					<form action="/member/signup" method="post">
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
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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
