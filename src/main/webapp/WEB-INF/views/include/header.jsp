<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="_csrf" id="_csrf" content="${_csrf.token}" /> 
<meta name="_csrf_header" id="_csrf_header" content="${_csrf.headerName}" />


<title>yona HTML CSS Template</title>

<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/font-awesome.min.css">

</head>

<script src="<c:url value="../resources/js/jquery.js"/>"></script>

<!-- Main css -->
<link rel="stylesheet" href="../resources/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Lora|Merriweather:300,400" rel="stylesheet">

<body>
	<!-- PRE LOADER -->

	<div class="preloader">
		<div class="sk-spinner sk-spinner-wordpress">
			<span class="sk-inner-circle"></span>
		</div>
	</div>
	
	
<!-- Navigation section  -->

<div class="navbar navbar-default navbar-static-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon icon-bar"></span> <span class="icon icon-bar"></span>
				<span class="icon icon-bar"></span>
			</button>
			<a href="/" class="navbar-brand">Dev</a>
		</div>
		<div class="collapse navbar-collapse">
			<div id="menu">
				<ul class="nav navbar-nav navbar-right">
					<li class=""><a href="/">Home</a></li>
					<li class=""><a href="/archives">Archives</a>
						<div class="dropdown-content">
							<ul id="category">
								<li><a href="/archives/java">Java</a></li>
								<li><a href="/archives/jsp">JSP</a></li>
							</ul>
						</div>
					</li>
					<sec:authorize access="isAnonymous()">
						<li class=""><a href="/member/signin">Login</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
   						<li>
   							<a href="#">${username }<sec:authentication property="principal.username"/></a>
   							<div class="dropdown-content">
								<ul id="category">
   									<li><a href="#" onclick="document.getElementById('logout-form').submit();">logout</a></li>
   								</ul>
   							</div>		
   						</li>
   						<form id="logout-form" action="/logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						</form>							
					</sec:authorize>
				</ul>
			</div>
		</div>
	</div>
</div>
