<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
								<form role="form" method="post" enctype="mutipart/form-data">
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
									<button type="button" onclick="addFile()">파일 추가</button>
									<div id="fileGroup">
										<div>
											<input type="file" name="file" id="attach">	<button type="button" name="fileDel">삭제</button>
										</div>
									</div>
									<div id="fileList"></div>
									<input type="text" name="writer" class="form-control" value="${loginVO.ID }" readonly="readonly">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="col-md-3 col-sm-4">
										<input name="submit" type="submit" class="form-control" id="regist" value="Register">
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
	
	var count = 0;
		
	function addFile(){
		if( count > 4){
			alert("최대 파일업로드 개수는 5개입니다");
			return false;
		}
		
		var str = "<div> <input type='file' name='file'> <button type='button' name='fileDel'>삭제</button> </div>"
		$("#fileGroup").append(str);
		$("button[name='fileDel']").on("click",function(event){
			event.preventDefault();
			deleteFile($(this));
		})
		
		count++;
		
	}
	
	function deleteFile(obj){
		obj.parent().remove();
	}
	
	
	var files= [];
	var fileCnt = 0;
	
	$("#attach").change(function(event){
		files[fileCnt] = event.target.files[0];
			
		var str = "<label>"+(fileCnt+1)+" - "+event.target.files[0].name+"</label><br>"
		$("#fileList").append(str);
		
		fileCnt++;
	});
		
	$("#regist").on("click",function(event){
		event.preventDefault();
	
		var fileLen = files.length;
		
		for(var i=0; i<fileLen; i++){
			alert("파일 = "+files[i]);
		}
		
		var formData = new FormData();
		
		for(var i=0; i<fileLen; i++){
			formData.append("attach["+i+"]", files[i]);
		}
		
		alert(formData);
		
		$.ajax({
			type : 'post',
			enctype : 'multipart/form-data',
			url : '/archives/attach',
			dataType : 'text',
			data : formData,
			processData : false,
			contentType : false,
			success : function(data){
				alert("data = "+data);
				fileCnt = 0;
			}
		});
	});
</script>

