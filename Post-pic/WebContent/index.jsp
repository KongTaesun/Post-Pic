<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/include/header.jsp" />
<style>
.comment_tbl {
	
}

.comment_tbl th {
	background: #3BB54A;
	width: 15%;
}

#comment {
	height: 30px;
	width: 80%;
	margin-left: 10px;
}

#commentBtn {
	width: 15%;
	height: 30px;
}
.delbtn{
	float:right;
	padding-top:5px;
	cursor:pointer;
}
</style>


<div class="header-box"></div>

<script type="text/javascript">

$(document).ready(function(){
	$("#heart_img").click(function(){
		
		// 로그인 여부를 확인을 위해 코멘트에 있는 기능 가져다 쓰기
		var board_no = $("#board_no").val();
		var writer = $("#writer").val();
		if(writer==""){
			alert("로그인이 필요합니다.");
			return false;
		}
		
		// 로그인 체크 끝 이제 t_board_like에 추가 하고 t_board 에 like 수 올리기 ----
		
		$.ajax({
			url : "<%=request.getContextPath() %>/board/likepost.jsp",
			type : "get",
			data : {writer:writer,board_no:board_no},
			
			success : function(data){
				data = $.trim(data);
				if(data=="Y"){
					
					var old_like = $("#post_like").text();
					old_like = parseInt(old_like)+1;
					
					$("#post_like").text(old_like);
					$("#heart_img").attr("src","<%=request.getContextPath() %>/img/common/heart2.png");
					alert("추천하셨습니다.");
				}else{
					//alert(data);
					alert("이미 추천하셨습니다.");
				}
				
			},
			error:function(){
				alert("수신실패");
			}
			
		});	
		
		
		
		
		
	});
	
	
	$("#commentBtn").click(function(){
		
		var comment = $("#comment").val();
		var writer = $("#writer").val();
		var board_no = $("#board_no").val();
		
		
		if(writer==""){
			alert("로그인이 필요합니다.");
			return false;
		}
		
		if(comment==""){
			alert("내용을 입력해주세요.");
			$("#comment").focus();
			return false;
		}
		
		if(writer==""){
			alert("로그인이 필요합니다.");
			$("#writer").focus();
			return false;
		}
		
		if(board_no==""){
			alert("오류!");
			$("#board_no").focus();
			return false;
		}
		
		$("#comment_tbl").html('');
		
		$.ajax({
			url : "<%=request.getContextPath() %>/board/inserComment.jsp",
			type : "get",
			data : {comment:comment,writer:writer,board_no:board_no},
			
			success : function(data){
				data = eval(data);
				console.log(data);
				$("#comment").val('');
				
				$(data).each(function(index){
					var no = this.no;
					var board_no = this.board_no;
					var content = this.content;
					var writer = this.writer;
					var regdate = this.regdate;
					
					inTableComment(no, board_no,content,writer,regdate);
				});
				
			},
			error:function(){
				alert("수신실패");
			}
			
			
			
		});	
		
		
	});
	
});
	
	function getComment(board_no){
		$("#comment_tbl").html("");
		$.ajax({
			url : "<%=request.getContextPath() %>/board/selectComment.jsp",
			type : "get",
			data : {board_no:board_no},
			
			success : function(data){
				data = eval(data);
				console.log(data);
				$("#comment").val('');
				
				$(data).each(function(index){
					var no = this.no;
					var board_no = this.board_no;
					var content = this.content;
					var writer = this.writer;
					var regdate = this.regdate;
					
					inTableComment(no, board_no,content,writer,regdate);
				});
				
			},
			error:function(){
				alert("수신실패");
			}
			
		});	
		
	}
	
	function getHeart(board_no){
		
		var userid = '${userVO.id }';
		
		$.ajax({
			url : "<%=request.getContextPath() %>/board/getlike.jsp",
			type : "get",
			data : {board_no:board_no,writer:userid},
			
			success : function(data){
				data = parseInt($.trim(data));
				
				if(data>0){
					$("#heart_img").attr("src","<%=request.getContextPath() %>/img/common/heart2.png");	
				}else{
					$("#heart_img").attr("src","<%=request.getContextPath() %>/img/common/heart1.png");
				}
				
			},
			error:function(){
				alert("수신실패");
			}
			
		});	
		
	}
	
	function delcom(no, board_no){
		
		if(confirm("정말 삭제하시겠습니까?")){
			
			
			$.ajax({
				url : "<%=request.getContextPath() %>/board/delComment.jsp",
				type : "get",
				data : {no:no},
				
				success : function(data){
					
					getComment(board_no);		
					
				},
				error:function(){
					alert("수신실패");
				}
				
			});
			
			
			
			
			
		}
	}


	function inTableComment(no, board_no,content,writer,regdate){
		
		//alert(content + "|"+writer+"|"+regdate );
		var sql = "";	
		var useird = '${userVO.id }';
		
		sql += "<dt>"+writer+"</dt>";
		sql += "<dd>"+content;
		
		if(useird == writer){
			sql += "<span class='delbtn' onclick='delcom("+no+", "+board_no+")'><img src='<%=request.getContextPath() %>/img/common/dels.png'></span>";
		}
		
		sql += "</dd>";
		
		
		
		//alert(sql);
		
		var html = $("#comment_tbl").html();
		html += sql;
		$("#comment_tbl").html(html);
		
	}


	// 관리자 팝업관리
	function setCookie(name, value, expiredays) {
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires="
				+ todayDate.toGMTString() + ";"
	}

	function getCookieee(name) {
		var nameOfCookie = name + "=";
		var x = 0;

		while (x <= document.cookie.length) {
			var y = (x + nameOfCookie.length);
			if (document.cookie.substring(x, y) == nameOfCookie) {
				if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
					endOfCookie = document.cookie.length;
				return unescape(document.cookie.substring(y, endOfCookie));
			}
			x = document.cookie.indexOf(" ", x) + 1;
			if (x == 0)
				break;
		}
		return "";
	}

	function closeWin(div_num) {

		if ($("#oneday_check" + div_num).prop("checked")) {
			setCookie("popDiv" + div_num, "done", 1); // 1일동안 쿠키를 보존합니다.
			$("#popDiv" + div_num).hide();
		} else {
			$("#popDiv" + div_num).hide();
		}

	}

	
	function se_nums(r_idx) {
		
		//$("#client_pop").html('');
		
		
		$.ajax({			
			url     : "<%=request.getContextPath() %>/ajax/posts.do",
			type 	: "get",
			data    : "no="+r_idx,
			cache   : false,
			success : function(data) {

				//$("#client_pop").html(data);
				
				data = eval(data);
				console.log(data);
				
				
				$(data).each(function(index){
					var no = this.no;
					var title = this.title;
					var content = this.content;
					var writer = this.writer;
					var regdate = this.regdate;
					var imgs = this.imgs;
					var types = this.types;
					var tags = this.tags;
					
					var view_cnt = this.view_cnt;
					var like_cnt = this.like_cnt;
					
					$("#posts_img").attr("src","<%=request.getContextPath() %>/upload/"+imgs);
					$("#posts_title").text(title);
					$("#post_hit").text(view_cnt);
					$("#post_like").text(like_cnt);
					$("#posts_tag").text(tags);
					$("#board_no").val(no);
					
					getComment(no);
					getHeart(no);
					/*
					posts_title
					post_hit
					posts_tag
					*/
										
				});
				
		
				$('.modalbg').fadeIn('fast',function(){
					$('.modalpop').fadeIn('fast',function(){
						
					});				
				});
				
			  
			},
			error   : function() {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		 
		
		
		
		$('.modalbg').fadeIn('fast',function() {
			$('.modalpop').fadeIn('fast',function() {
				var modalSlide = $('.modal_slide').show()
			});
		});
		

		var wh = $(window).width();
		
	}
</script>




<!--

<div class="popup_layer" id="popDiv1" style="position: absolute; top: 0px; left: 0px; z-index: 100; display: block; width: 400px; height: 480px;">
	<form action="" method="" name="">
		<fieldset>
			<legend>팝업</legend>
			<div class="popup_img" style="width:395px;"><img src="" alt="이미지 설명"></div>
			<div class="popup_footer clearfix" style="width:385px;">
				<span><input type="checkbox" value="1" id="oneday_check"> <label for="oneday_check">24시간동안 다시 열람하지 않습니다.</label></span>
				<button type="button" class="hd_pops_close hd_pops_10" title="레이어팝업 닫기">닫기</button>
			</div>
		</fieldset>
	</form>			
</div>

-->








<section class="visual"
	style="background: url('../img/main/visual_bg02.jpg') no-repeat center top;">
	<h2 class="visual-txt">
		<img src="../img/main/visual_txt.png" alt="">
	</h2>
</section>
<section id="container">
	<h2 class="page-tit hide-text">포트폴리오</h2>
	<section class="recent_work_wrap">

		<div class="recent_work_top">


			<nav class="article_nav">
				<a href="#" class="web_a active" sch_type="A" data-filter="all">전체</a>
				<a href="#" class="web_k" sch_type="C" data-filter="tr">여행</a> <a
					href="#" class="business_k" sch_type="B" data-filter="gi">걸그룹</a> <a
					href="#" class="mobile_k" sch_type="M" data-filter="sp">스포츠</a>
			</nav>

		</div>


		<!-- <ul class="visual_wrap web-visual">
				<li><img src="../img/main/main_visual-01.jpg" alt=""></li>
				<li><img src="../img/main/main_visual-02.jpg" alt=""></li>
				<li><img src="../img/main/main_visual-03.jpg" alt=""></li> 
			</ul>
			<ul class="visual_wrap mob-visual">
				<li><img src="../img/main/m-main_visual-01.jpg" alt=""></li>
				<li><img src="../img/main/m-main_visual-02.jpg" alt=""></li>
				<li><img src="../img/main/m-main_visual-03.jpg" alt=""></li>
			</ul> -->
		<div class="list_wrap">
			<ul class="portfolio">

			</ul>

		</div>
		<div class="btn_wrap">
			<a href="#" title="상단으로 가기" class="btn_more"><img
				src="<%=request.getContextPath() %>/img/main/btn_more.png"
				alt="상단으로 가기"></a>
		</div>
	</section>

	<script type="text/javascript">
		

		function inTable(no,title,content,writer,regdate,imgs,types,tags){
					
			var outs = "";
			
			outs += "<li class='list-content "+types+" ajax' onclick='se_nums(\""+no+"\"); return false;' r_order='"+no+"' style='position: absolute; left: 734px; top: 0px;'>";
			
			//outs += "<li class='list-content customize ajax' style='position: absolute; left: 734px; top: 0px;'>";
			
			outs += "	<div class='portfolio-cont'>";
			outs += "		<div class='list-img'>";
			outs += "			<img src='<%=request.getContextPath() %>/upload/"+imgs+"'";
			outs += "				alt=''>";
			outs += "		</div>";
			outs += "		<div class='list-icon'>";
			outs += "			<span class='cPink'></span> <span class='cGray'></span>";
			outs += "		</div>";
			outs += "		<a href='#' class='list-subject'><span class='btn-listMore'>더보기</span>"+title+"</a>";
			outs += "		<a href='#' class='list-tag'><span class='btn-listMore'>Tag : </span>"+tags+"</a>";
			outs += "	</div>";
			outs += "</li>";
			
			

			return outs;
			
		}
	
	
		// 자료 더 가져오기
		
		

		function add_items() {
			$(".portfolio").html('');
			
			var q = '${param.q}';
			
			
			
			$.ajax({
				url : "<%=request.getContextPath() %>/ajax/mainpic.do",
				type : "get",
				data : {types:'all',q:q},
				
				success : function(data){
					data = eval(data);
					console.log(data);
					
					
					$(data).each(function(index){
						var no = this.no;
						var title = this.title;
						var content = this.content;
						var writer = this.writer;
						var regdate = this.regdate;
						var imgs = this.imgs;
						var types = this.types;
						var tags = this.tags;
						var outs = inTable(no,title,content,writer,regdate,imgs,types,tags);
						var items = $(outs);
						$("ul.portfolio").append(items).isotope('appended', items);
						
					});
					$("ul.portfolio").masonry();
					
				},
				error:function(){
					alert("수신실패");
				}
				
			});	

			
			
			
				
			
		}

		$(function() {
			// 위로가기 버튼 클릭
			$(".btn_more").on('click', function(e) {
				var ta = 0;
				$('html, body').stop().animate({
					'scrollTop' : ta
				}, 800, 'easeInOutQuint', function() {
					//window.location.hash = target;
				});
				e.preventDefault();
			});

			// 필터 변경
			$(".article_nav a").click(function() {
				var new_sch_type = $(this).attr("sch_type");
				if (new_sch_type != sch_type) {
					sch_type = new_sch_type;
					$("ul.portfolio li.ajax").remove(); // 기존 컨텐츠 삭제

					cur_cnt = $(".list-content").length; // 가져온 갯수 (초기 설정)
					total_cnt = cur_cnt + total_cnt_arr[sch_type]; // 전체 갯수

					add_items(); // 컨텐츠 가져오기
				}
			});

			// 스크롤하다가 지정된 위치까지 다다르면 계속해서 내용을 추가하기
			$(window).on("scroll", function() {
				if (cur_cnt < total_cnt) {
					var h = $(window).height(); // 창의 높이
					//var sh = $(window).prop('scrollHeight'); // 내용물의 높이
					var sh = document.body.scrollHeight; // 내용물의 높이
					var st = $(window).scrollTop(); // 현재 스크롤 위치 : 0 ~ (내용물의 높이 - 창의 높이)
					var gap = 600; // 추가 액션을 실행할 위치 (남은 스크롤 높이)

					// 바닥까지 스크롤 되었으면...
					//console.log("st : " + st + ", sh:" + sh+ ", h:" + h+", gap:"+gap);
					if (st >= sh - h - gap) {
						add_items();
					}
				}
			});
		});

		$(window).load(function() {
			add_items();
		});
		
	</script>


	<!-- portfolio view -->
	<div class="modalpop" id="client_pop">

		<div class="modal_content">

			<div class="txt">
				<div class="bx-wrapper" style="max-width: 100%; margin: 0px auto;">
					<div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 400px;text-align:center;">
						<img src="" alt="" id="posts_img" style="max-width:90%;max-height:90%;">
						<!-- <img src="http://works.jnkworks.com/upload/file/1477366208_2" alt="" style=""> -->
					</div>
				</div>
				<dl>

					<dd class="detail">
						<dl>
							<dt>제목</dt>
							<dd id="posts_title"></dd>
							<dt>조회수 / 좋아요</dt>
							<dd>
								<span id="post_hit">0</span> / <span id="post_like">0</span>
								<span style="float:right;margin-right:10px;margin-top:5px;cursor:pointer;"><img src="<%=request.getContextPath() %>/img/common/heart1.png" id="heart_img" /></span>
							</dd>
							<dt>태그</dt>
							<dd id="posts_tag"></dd>
						</dl>
					</dd>
				</dl>

			</div>

			<div class="txt" style="overflow: auto; height: 100%;line-height:150%;">
				<div class="bx-wrapper" style="max-width: 100%; margin: 0px auto;">
					<table border="1" width="100%" class="comment_tbl">
						<tr>
							<th width="25%" >${userVO.id }</th>
							<td><input type="text" name="comment" id="comment"
								onkeydown="if(event.keyCode==13) $('#commentBtn').trigger('click')" />
								<input type="button" value="등록" id="commentBtn" /></td>
						</tr>

					</table>

					<input type="hidden" name="writer" id="writer" value="${userVO.id }" />
					<input type="hidden" name="board_no" id="board_no" value="${param.no }" />
					
				</div>

				<dl style="margin-top: 10px;overflow:auto;height:450px;" >
					<dd class="detail">
						<dl id="comment_tbl">
							<!-- 
							<dt>작성자</dt>
							<dd>내용</dd>
							 -->
						</dl>
					</dd>
				</dl>
			</div>
		</div>
		<a href="#!" class="btn_close" onclick="cl_pop();">창닫기</a>
	</div>


	<!-- //portfolio view -->

	<style type="text/css">
body {
	background-color: #fff;
}
</style>


	<script type="text/javascript">
		function number_format(data) {
			if (!/[^0-9]/.test(data)) {
				data = "" + data;
				var ret = [];
				var len = data.length;
				var ind = len - (parseInt(len / 3) * 3) || 3;
				for (var i = 0; i < len; i++) {
					ret.push(data.charAt(i));
					ind--;
					if (ind <= 0) {
						ret.push(",");
						ind = 3;
					}
				}
				return ret.join("").replace(/(^,|,$)/g, "");
			} else {
				return data;
			}
		}
	</script>











	<script type="text/javascript">
		$(function() {
			$(".reset").click(function() {

				//onclick="document.pay_frm.reset();"
				document.pay_frm.reset();
				$(".total_money .cRed").text("880,000");
			});
		});
	</script>


</section>
<!-- //container End -->
<script type="text/javascript">
	function cl_pop() {

		//$("#client_pop").html('');	
		$('.modalpop').fadeOut('fast', function() {
			$('.modalbg').fadeOut('fast');
		});
		//$("body").removeClass("layerOn");
	}
</script>


<jsp:include page="/include/footer.jsp" />