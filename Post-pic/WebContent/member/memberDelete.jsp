<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/include/header.jsp" />

<style>
	.membtn{
		height:32px;
		padding:10px;
		cursor:pointer;
	}
	.hr_tag{
		    line-height: 34px;
		    text-indent: 7px;
		    font-size: 13px;
		    font-weight: bold;
		    color: #000;
	}
	.th_tit{
		font-weight:bold;
		margin-left:20px;
	}
</style>



<script>
	
	function outmem() {
		if($("#password").val() == ""){
			alert("비밀번호를 입력해주세요.");
			$("#password").focus();
			return false;
		}
		if( confirm("정말 탈퇴하시겠습니까?") ){
			return true;
		}else{
			return false;
		}
	
	
	}
</script>


<div class="header-box" style="height: 50px;"></div>

<section class="visual"
	style="background: url('./img/main/visual_bg02.jpg') no-repeat center top;">
	<h2 class="visual-txt">
		<img src="../img/main/visual_txt.png" alt="">
	</h2>
</section>



<section id="container">
	<h2 class="page-tit hide-text">가지마! 바보야~ ㅠ.ㅠ(회원탈퇴)</h2>
	<section class="recent_work_wrap">



		<section id="container" class="company">


			<section class="news-section company-section">


				<div class="modal_request">
					<div class="request-top">
						<h3 class="request-tit">가지마! 바보야~ ㅠ.ㅠ(회원탈퇴)</h3>
					</div>
					
						<fieldset>
							<legend>가지마! 바보야~ ㅠ.ㅠ(회원탈퇴)</legend>
							<div class="request-cont">
								<form name="loginForm" method="post" action="<%=request.getContextPath()%>/memberDeleteProcess.do" onsubmit="return outmem();">
								<ul class="request-input" >
								
									<li>
										<label for="login" class="th_tit" style="font-size:20px;">본인확인</label>
										<div class="td_txt" style="text-align:center;">
											<input type="password" id="password" name="password" style="ime-mode: disabled; width: 30%;margin-left:10px;" placeholder="패스워드" />
											<input type="submit" class="membtn" value="탈퇴" style="margin-left:10px;" />
										</div>
										
									</li>

									
								</ul>
								</form>
								
							</div>
						</fieldset>
					



					
				</div>



				<!--  asdasdasd -->
			</section>
			<a href="#wrap" class="btn_topGo"><img
				src="<%=request.getContextPath()%>/img/sub/btn_topGo.png"
				alt="상단바로가기" title="상단으로 가기"></a>
		</section>

	</section>
	<!-- //container End -->
</section>


<jsp:include page="/include/footer.jsp" />