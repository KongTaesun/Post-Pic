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
	function isNull(obj, msg) {
		if (obj.value == "") {
			alert(msg)
			obj.focus();
			return true;
		}
		return false;
	}
	function checkForm() {
		var form = document.loginForm;

		if (isNull(form.id, '아이디를 입력해주세요'))
			return false;

		if (isNull(form.password, '패스워드를 입력해주세요'))
			return false;
		return true;
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
	<h2 class="page-tit hide-text">포트폴리오</h2>
	<section class="recent_work_wrap">



		<section id="container" class="company">


			<section class="news-section company-section">


				<div class="modal_request">
					<div class="request-top">
						<h3 class="request-tit">로그인</h3>
					</div>
					
						<fieldset>
							<legend>온라인문의</legend>
							<div class="request-cont">
								<form name="loginForm" method="post" action="<%=request.getContextPath()%>/loginProcess.do" onsubmit="return checkForm();">
								<ul class="request-input" >
								
									<li><label for="login" class="th_tit" style="font-size:20px;">로그인</label>
										<div class="td_txt" style="text-align:center;">
											<input type="text" id="id" name="id" style="ime-mode: disabled; width: 30%;" placeholder="아이디" />
											<input type="password" id="password" name="password" style="ime-mode: disabled; width: 30%;margin-left:10px;" placeholder="패스워드" />
											<input type="submit" class="membtn" value="로그인" style="margin-left:10px;" />
										</div>
										
									</li>

									
								</ul>
								</form>
								
								<ul style="border-bottom:solid 2px #3BB54A;margin:50px 0px 20px 0px;">
									<li>
										<label class="hr_tag">※ 아이디 / 패스워드 찾기</label>
									</li>
								</ul>
								
								
								
								<div class="request-input" style="text-align:center;">
									<span class="th_tit" >아이디 찾기</span>
									<span class="th_tit" >|</span>
									<span class="th_tit" >패스워드 찾기</span>
									<span class="th_tit" >|</span>
									<span class="th_tit" ><a href="<%=request.getContextPath()%>/memberShip.do">가입하기</a></span>
								</div>

							</div>
						</fieldset>
					



					<!-- 
					<div align="center">
						
						<form name="loginForm" method="post"
							action="<%=request.getContextPath()%>/loginProcess.do"
							onsubmit="return checkForm()">

							<input type="text" id="id" name="id" size="20" autocomplete="OFF"
								placeholder="아이디" /> <input type="password" id="password"
								name="password" size="20" autocomplete="OFF" placeholder="패스워드" />

							<input type="submit" value="로그인" />
						</form>
					</div>
					 -->
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