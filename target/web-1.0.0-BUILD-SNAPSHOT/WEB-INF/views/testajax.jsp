<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#modDiv{
		width:300px;
		height:100px;
		background-color:gray;
		position:absolute;
		top:50%;
		left:50%;
		margin-top:-50px;
		margin-left:-150px;
		padding:10px;
		z-index:1000;
	}
</style>
</head>
<body>
	<h2>Ajax Test Page</h2>
	
	<div>
		<div>
			Replyer <input type="text" name="replyer" id="Replyer"> 
		</div>
		<div>
			Reply Text <input type="text" name="replytext" id="Replytext">
		</div>
		<button id="AddreplyBtn">Add Reply</button>
	</div>
	<ul id ="replies"></ul>
	
	<ul class="pagination">
	</ul>
	
	<div id="modDiv" style="display:none;">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="replytext"> 
		</div>
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">Delete</button>
			<button type="button" id="closeBtn">Close</button>
		</div>
	</div>
	
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<script>
	
		var boardno = 9;
		
		getPageList(1);
		
		function getAllList(){
			$.getJSON("/replies/all/"+boardno, function(data){
				
				var str = "";
				console.log(data.length);
				
				$(data).each(function(){
					str += "<li data-replyno='"+this.replyno+"' class='replyLi'>"
							+this.replyno+":"+this.replytext
							+"<button>Det</button></li>";
				});
				$("#replies").html(str);
			});
		}
		
		$("#AddreplyBtn").on("click", function(){
			
			var replyer = $("#Replyer").val();
			var replytext = $("#Replytext").val();
			
			$.ajax({
				type : 'post',
				url : '/replies',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					boardno : boardno,
					replyer : replyer,
					replytext : replytext
				}),
				success : function(result){
					
					if(result == 'success'){
						alert("댓글이 등록되었습니다.");
						getAllList();
					}
				}
				
			});
		});
		
		$("#replies").on("click", ".replyLi button", function(){
		
			var reply = $(this).parent();
			var replyno = reply.attr("data-replyno");
			var replytext = reply.text();
			
			$(".modal-title").html(replyno);
			$("#replytext").val(replytext);
			$("#modDiv").show("slow");
			/* alert(replyno + " : " + replytext); */
		});
	
		$("#replyDelBtn").on("click", function(){
			
			var replyno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type : 'delete',
				url : '/replies/'+replyno,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result){
					console.log("result: "+result);
					if(result == 'success'){
						alert("댓글이 삭제되었습니다.");
						$("#modDiv").hide("slow");
						getAllList();
					}
				}
			});
		});
		
		$("#replyModBtn").on("click",function(){
		
			var replyno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type : "put",
				url : "/replies/"+replyno,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				data : JSON.stringify({
					replytext : replytext
				}),
				dataType : "text",
				success : function(result){
					console.log("result: "+result);
					if(result == "success"){
						alert("댓글이 수정되었습니다.");
						$("#modDiv").hide("slow");
						getPageList(replyPage);
					}
				}
				
			});
		});
		
		function getPageList(page){
			
			$.getJSON("/replies/"+boardno+"/"+page, function(data){
				
				console.log(data.list.length);
				
				var str = "";
				
				$(data.list).each(function(){
					
					str+= "<li data-replyno='"+this.replyno+"' class='replyLi'>"
							+this.replyno+":"+this.replytext
							+"<button>Mod</button></li>";
					
				});
				
				$("#replies").html(str);
				
				printPaging(data.pageutil);
				
			});
		}
		
		function printPaging(pageutil){
			
			var str = "";
			
			if(pageutil.prev){
				str += "<li><a href= '"+(pageutil.startPage - 1)+"'> << </a></li>";
			}
			
			for(var i = pageutil.startPage, len = pageutil.endPage; i <= len; i++){
				var strClass = pageutil.cri.page == i? 'class = active' :'';
				str += "<li "+strClass+"><a href= '"+i+"'>"+i+"</a></li>";
			}
			
			if(pageutil.next){
				str += "<li><a href= '"+(pageutil.endPage + 1)+"'> >> </a></li>";
			}
			
			$(".pagination").html(str);
		}
		
		var replyPage = 1;
		$(".pagination").on("click", "li a", function(event){
		
			event.preventDefault();
			
			replyPage = $(this).attr("href");
			
			getPageList(replyPage);
		})
	</script>
</body>
</html>