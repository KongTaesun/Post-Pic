<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/include/header.jsp" />


<div class="header-box" style="height: 50px;"></div>

<section class="visual"
	style="background: url('./img/main/visual_bg02.jpg') no-repeat center top;">
	<h2 class="visual-txt">
		<img src="../img/main/visual_txt.png" alt="">
	</h2>
</section>

<script type="text/javascript">

function se_nums(no){
	location.href="<%=request.getContextPath() %>/upload/modpic.do?no="+no;
}

$(window).load(function() {
	add_items();
});


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

function add_items() {
	$(".portfolio").html('');
	
	
	var userid = '${userVO.id }';
	
	
	$.ajax({
		url : "<%=request.getContextPath() %>/ajax/mypic.jsp",
		type : "get",
		data : {userid:userid},
		
		success : function(data){
			data = eval(data);
			
			//console.log(data);
			
			
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

</script>



<section id="container">
	<h2 class="page-tit hide-text">포트폴리오</h2>
	<section class="recent_work_wrap">



		<section id="container" class="company">


			<section class="news-section company-section">



				<!-- adasdasd -->

				<div class="modal_request">
					<div class="request-top">
						<h3 class="request-tit">내 사진 관리</h3>
					</div>
					
					
					<section class="recent_work_wrap">

						<div class="recent_work_top">
							
							<nav class="article_nav">
								<a href="#" class="web_a active" sch_type="A" data-filter="all">전체</a>
								<a href="#" class="web_k" sch_type="C" data-filter="tr">여행</a> <a
									href="#" class="business_k" sch_type="B" data-filter="gi">걸그룹</a> <a
									href="#" class="mobile_k" sch_type="M" data-filter="sp">스포츠</a>
							</nav>
				 			
						</div>
				
				
						<div class="list_wrap">
							<ul class="portfolio">
				
							</ul>
				
						</div>
						
					</section>


				</div>


				<!--  asdasdasd -->
			</section>
			<a href="#wrap" class="btn_topGo"><img
				src="<%=request.getContextPath() %>/img/sub/btn_topGo.png"
				alt="상단바로가기" title="상단으로 가기"></a>
		</section>

	</section>
	<!-- //container End -->
</section>


<jsp:include page="/include/footer.jsp" />