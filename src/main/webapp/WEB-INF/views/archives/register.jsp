<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
							<form role="form" method="post" enctype="multipart/form-data" id="regist">
								<select name="boardCat">
									<option value="">Category</option>
									<option value="a_java">
										<c:out value="${boardVO.boardCat eq 'a_java'?'selected' :'' }" />
										Java
									</option>
									<option value="a_jsp">
										<c:out value="${boardVO.boardCat eq 'jsp'?'selected' :'' }" />
										Jsp
									</option>
								</select> <input type="text" class="form-control" placeholder="Title" name="title" required>
								<textarea name="content" rows="20" class="form-control" id="content" placeholder="Content" required="required"></textarea>
								<div id="fileGroup">
									<input type="file" id="file" onchange="attach(this.files)">
								</div>
								<div id="fileList"></div>
								<input type="text" name="writer" class="form-control" value="${loginVO.ID }" readonly="readonly"> 
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<div class="col-md-3 col-sm-4">
									<input name="submit" type="submit" class="form-control" value="Register">
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

<script type="text/javascript">
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});

	var fileCnt = 0;

	function attach(event) {

		var f = this.files[0];
		console.log("f = "+f);
		
		//var file = event.target.files;
		//console.log("file = "+file);
		
		
		
		var formData = new FormData();

		var str = "<label>" + (fileCnt + 1) + " - " + file[0] + "</label> <a>삭제</a><br>";
		$("#fileList").append(str);

		fileCnt++;

		formData.append("attach", file[0]);

		$.ajax({
			type : 'post',
			url : '/archives/attach',
			dataType : 'text',
			data : formData,
			processData : false,
			contentType : false,
			success : function(result) {
				console.log("result = " + result);
				fileCnt = 0;
			}
		});
	};

	$("#regist").submit(function(event) {
		event.preventDefault();

		var that = $(this);
		var str = "";

		alert("that = " + that);
	});
</script>

