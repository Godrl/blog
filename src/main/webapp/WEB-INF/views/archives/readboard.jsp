<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@include file="../include/header.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

	<!-- Home Section -->
	<section id="home" class="main-single-post parallax-section">
	     <div class="overlay"></div>
	     <div class="container">
	          <div class="row">
	
	               <div class="col-md-12 col-sm-12">
	                    <h1>Read Board</h1>
	               </div>
	
	          </div>
	     </div>
	</section>
	
	<!-- Blog Single Post Section -->
	<section id="blog-single-post">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-1 col-md-12 col-sm-12">
					<div class="blog-single-post-thumb">
						<form role="form" action="modify" method="post">
							<input type='hidden' name='boardno' value="${boardVO.boardno}">
							<input type='hidden' name='boardCat' value="${boardVO.boardCat}">
							<input type='hidden' name='writer' value="${boardVO.writer }">
							<input type='hidden' name='id' value="${loginVO.ID}"> 
							<input type='hidden' name='page' value="${search.page}"> 
							<input type='hidden' name='perPageNum' value="${search.perPageNum}">
							<input type='hidden' name='replyPageNum' value="${search.replyPageNum}">
							<input type='hidden' name='searchType' value="${search.searchType}">
							<input type='hidden' name='keyword' value="${search.keyword}">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						</form>
					
	                    <div class="blog-post-title">
	                    	<h2>${boardVO.title}</h2>
	                    </div>
	
	                    <div class="blog-post-format">
	                    	<span><a href="#"><img src="../resources/images/profile.jpg" class="img-responsive img-circle"> ${boardVO.writer }</a></span>
	                        <span><i class="fa fa-date"></i> ${boardVO.regdate }</span>
	                        <span><i class="fa fa-comment-o">${boardVO.replynum }</i></span>
	                    </div>
	
	                    <div class="blog-post-des">
	                        <blockquote><textarea class="form-control" rows="20" readonly>${boardVO.content }</textarea> </blockquote>
	                    </div>
	                    
						<div class="blog-comment-form">
							<c:if test="${loginVO.ID == boardVO.writer }" >
								<input name="submit" type="submit" class="smoothScroll btn btn-default" id="bMod" value="Modify">
								<input name="submit" type="submit" class="smoothScroll btn btn-default" id="bDel" value="Delete">
							</c:if>
							<input name="submit" type="submit" class="smoothScroll btn btn-default" id="bList" value="List">
	                    </div>
						
						<div class="blog-comment">
							<h3>Comments</h3>
							<ul class="timeline">
								<li class="time-label" id="repliesDiv">
									<span class="bg green">Click Here to show reply
										<small id="replynumSmall"> [ ${boardVO.replynum } ] </small>
									</span>
								</li>
							</ul>
							<div class="text-center">
								<ul id="pagination" class="pagination pagination-sm no-margin">
								</ul>
							</div>
						</div>
			    
						<script id="template" type="text/x-handlebars-template">
							{{#each .}}
								<li class="replyLi" data-replyno={{replyno}}>
									<div class="media">
	                        			<div class="media-object pull-left">
	                            			<img src="../resources/images/none.jpg" class="img-responsive img-circle" alt="Blog Image 11">
	                            		</div>
										<div class="media-body">
						 	   				<h3 class="media-heading">{{replyer}}</h3>
											<span>{{prettifyDate regdate}}</span>
											{{#conferAuth replyer}}
												<a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
											{{/conferAuth}}																						
											<div class="media-text"><p>{{replytext}}</p></div>	
	    	                        	</div>
	        	                	</div>
								</li>
							{{/each}}		
						</script>
						
						<sec:authorize access="isAnonymous()">
							<h3><a href="/member/signin">Please Sign-in to write a comment</a></h3>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
	   						<div class="blog-comment-form">
							<h3>Leave a Comment</h3>
							<input type="text" class="form-control" name="writer" required="required" id="Replyer" value="${loginVO.ID }" readonly="readonly"/>
							<textarea name="message" rows="5" class="form-control" id="Replytext" placeholder="Message" required="required"></textarea>
							<div class="col-md-3 col-sm-4">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<input name="submit" type="submit" class="form-control" id="AddReply" value="Post Your Comment">
							</div>
						</div>
	   					</sec:authorize>
						
						<div id="modifyModal" class="modal modal-primary fade" role="dialog">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title"></h4>
									</div>
									<div class="modal-body" data-replyno>
										<p> <input type="text" id="replytext" class="form-control"> </p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-info" id="replyMod">Modify</button>
										<button type="button" class="btn btn-danger" id="replyDel">Delete</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<script>

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
	    xhr.setRequestHeader(header, token);
	});

//날짜 표시 기능 추가
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
	
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	
//댓글 작성자만 댓글 수정 가능 기능 추가
	Handlebars.registerHelper("conferAuth",function(replyer,block){
		
		var auth ="";
		if(replyer == "${loginVO.ID}"){
			auth += block.fn(); 
		}
		return auth;
	});
	

	var printData = function(replyArr,target,templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);
	}
	
	var boardno = ${boardVO.boardno};
	var replypage = 1;
	var boardCat = "${boardVO.boardCat}";
	
	//페이지 정보 얻기
	function getPage(pageInfo) {
		
		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $("#template"));
			printPaging(data.pageutil, $(".pagination"));

			$("#modifyModal").modal("hide");
			$("#replynumSmall").html("["+ data.pageutil.Rpltotal +"]");
		});
	}
	
	//댓글 페이징 기능
	var printPaging = function(pageutil, target) {

		var str = "";

		if (pageutil.prev) {
			str += "<li><a href='" + (pageutil.startPage - 1) + "'> << </a></li>";
		}

		for (var i = pageutil.startPage, len = pageutil.endPage; i <= len; i++) {
			var strClass = pageutil.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href = '"+i+"'>" + i + "</a></li>";
		}

		if (pageutil.next) {
			str += "<li><a href='" + (pageutil.endPage + 1) + "'> >> </a></li>";
		}

		target.html(str);
	};
	
	//댓글 수정창에 정보 보내기
	$(".timeline").on("click", ".replyLi", function(event) {
		var reply = $(this);

		$("#replytext").val(reply.find('.media-text').text());
		$(".modal-title").html(reply.attr("data-replyno"));
	});
	
	//댓글 목록 가져오기.
	$("#repliesDiv").on("click", function() {
		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/replies/" + boardno + "/1/"+boardCat);
	});
	
	//댓글 페이지 처리.
	$(".pagination").on("click", "li a", function(event) {
		event.preventDefault();

		replypage = $(this).attr("href");

		getPage("/replies/" + boardno + "/" +replypage+"/"+boardCat);
	});
	
	//댓글등록
	$("#AddReply").on("click", function() {
		var replyerObj = $("#Replyer");
		var replytextObj = $("#Replytext");
		var replyer = replyerObj.val();
		var replytext = replytextObj.val();
	
		$.ajax({
			type : "post",
			url : "/replies/",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : "text",
			data : JSON.stringify({
				boardno : boardno,
				replyer : replyer,
				replytext : replytext,
				boardCat : boardCat
			}),
			success : function(result) {
				console.log("result: " + result);
				if (result == "success") {
					alert("댓글이 등록되었습니다.");
					replypage = 1;
					getPage("/replies/" + boardno + "/" + replypage+"/"+boardCat);
					//replyerObj.val("");
					replytextObj.val("");
				}
			}
		});
	});
	
	//댓글수정
	$("#replyMod").on("click", function() {
		var replyno = $(".modal-title").html();
		var replytext = $("#replytext").val();

		$.ajax({
			type : "put",
			url : "/replies/" + replyno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				replytext : replytext,
				boardCat : boardCat
			}),
			dataType : "text",
			success : function(result) {
				console.log("result = " + result);
				if (result == "success") {
					alert("댓글이 수정되었습니다.");
					getPage("/replies/" + boardno + "/" + replypage + "/"+boardCat);
				}
			}
		});
	});

	//댓글삭제
	$("#replyDel").on("click", function() {
		var replyno = $(".modal-title").html();
		var replytext = $("#replytext").val();

		$.ajax({
			type : 'delete',
			url : '/replies/' + replyno+'/'+boardCat,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("reuslt = " + result);
				if (result == "success") {
					alert("댓글이 삭제되었습니다.");
					getPage("/replies/" + boardno +"/"+ replypage+"/"+boardCat);
				}
			}
		});
	});
	
</script>

<!-- Footer Section -->
<%@ include file="../include/footer.jsp"%>

<script>
	$(document).ready(function() {
	
		var cat = "${boardVO.boardCat}";
		var link = cat.substring(2,7);
		
		var formObj = $("form[role='form']");
	
		console.log(formObj);
		
		$("#bMod").on("click", function() {
			formObj.attr("action", "/archives/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});
	
		$("#bDel").on("click", function() {
			formObj.attr("action", "/archives/delete");
			formObj.submit();
		});

		$("#bList").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/archives/"+link);
			formObj.submit();
		});
	
	});

</script>