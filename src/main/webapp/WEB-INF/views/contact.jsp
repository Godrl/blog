<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<title>Contact</title>
<!--

Template 2085 Neuron

http://www.tooplate.com/view/2085-neuron

-->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Lora|Merriweather:300,400" rel="stylesheet">

</head>
<body>

	<%@ include file="include/header.jsp"%>

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
				<ul class="nav navbar-nav navbar-right">
					<li class=""><a href="/">Home</a></li>
					<li class=""><a href="/archives">Archives</a></li>
					<li class=""><a href="/daily">Daily</a></li>
					<li class="active"><a href="/contact">Contact</a></li>
				</ul>
			</div>

		</div>
	</div>
	<!-- Home Section -->

	<section id="home" class="main-contact parallax-section">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">

				<div class="col-md-12 col-sm-12">
					<h1>Contact Me</h1>
				</div>

			</div>
		</div>
	</section>

	<!-- Contact Section -->

	<section id="contact">
		<div class="container">
			<div class="row">

				<div class="col-md-offset-1 col-md-10 col-sm-12">
					<h2>Say hello..</h2>
					<p>신입 개발자입니다. 많은것을 시도하고 배우며 계속 성장중입니다. 메일로 연락해주세요!</p>

					<form action="mailSend" method="post">
						<div class="col-md-4 col-sm-4">
							<input name="name" type="text" class="form-control" id="name" placeholder="Name">
						</div>
						<div class="col-md-4 col-sm-4">
							<input name="email" type="email" class="form-control" id="email" placeholder="Email">
						</div>
						<div class="col-md-12 col-sm-12">
							<textarea name="message" rows="6" class="form-control" id="message" placeholder="Message"></textarea>
						</div>
						<div class="col-md-3 col-sm-6">
							<input name="submit" type="submit" class="form-control" id="submit" value="Send">
						</div>
					</form>
				</div>

			</div>
		</div>
	</section>

	<%@ include file="include/footer.jsp"%>

	<!-- Back top -->
	<a href="#back-top" class="go-top"><i class="fa fa-angle-up"></i></a>

	<!-- SCRIPTS -->

	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.parallax.js"></script>
	<script src="resources/js/custom.js"></script>

</body>
</html>