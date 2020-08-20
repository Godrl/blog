<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="include/header.jsp"%>

<!-- Navigation section  -->

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
						<li class="active"><a href="/">Home</a></li>
						<li class=""><a href="/archives">Archives</a>
							<div class="dropdown-content">
								<ul id="category">
									<li><a href="archives/java">Java</a></li>
									<li><a href="archives/jsp">JSP</a></li>
								</ul>
							</div>
						</li>
						<sec:authorize access="isAnonymous()">
							<li class=""><a href="/member/signin">Login</a></li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
							<form id="logout-form" action="/logout" method="post">
								<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
							</form>
   							<p><sec:authentication property="principal.username"/>${username }님, 반갑습니다.</p>
						</sec:authorize>
					</ul>
				</div>
			</div>

		</div>
	</div>
	
<!-- Home Section -->
<section id="home" class="main-home parallax-section">
     <div class="overlay"></div>
     <div id="particles-js"></div>
     <div class="container">
          <div class="row">

               <div class="col-md-12 col-sm-12">
                    <h1>Hello! This is yona's project.</h1>
                    <h4>Responsive Blog HTML CSS Website Template</h4>
               </div>

          </div>
     </div>
</section>

<%@ include file="include/footer.jsp"%>
<script src="<c:url value="../resources/js/particles.min.js"/>"></script>
<script src="<c:url value="../resources/js/app.js"/>"/></script>