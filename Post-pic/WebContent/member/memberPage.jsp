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
</style>

<div class="header-box" style="height: 50px;"></div>

<section class="visual"
	style="background: url('./img/main/visual_bg02.jpg') no-repeat center top;">
	<h2 class="visual-txt">
		<img src="../img/main/visual_txt.png" alt="">
	</h2>
</section>



<section id="container">
	<h2 class="page-tit hide-text">마이페이지</h2>
	<section class="recent_work_wrap">



		<section id="container" class="company">


			<section class="news-section company-section">



				<!-- adasdasd -->

				<div class="modal_request">
					<div class="request-top">
						<h3 class="request-tit">마이페이지</h3>
					</div>




					<form name="writeForm" method="post" action="<%=request.getContextPath()%>/memberProcess.do" onsubmit="return fn_check();">
						<input type="hidden" id="idchk" value="N" />
						
						<fieldset>
							<legend>온라인문의</legend>
							<div class="request-cont">
							
								<ul style="border-bottom:solid 2px #3BB54A;margin:20px 0px 20px 0px;">
									<li>
										<label class="hr_tag">※ 기본 정보</label>
									</li>
								</ul>
							
								<ul class="request-input" >
								
									<li><label for="ID" class="th_tit">아이디</label>
										<div class="td_txt">
											${ memberVO.id }
										</div>
									</li>
									
									<li><label for="NAME" class="th_tit">이름</label>
										<div class="td_txt">
											${ memberVO.name }
										</div>
									</li>
									
									
								
									<li><label for="EMAIL" class="th_tit">이메일</label>
										<div class="td_txt">
											${ memberVO.email_id }@${ memberVO.email_domain }
										</div>
									</li>

									
								</ul>
								
								<ul style="border-bottom:solid 2px #3BB54A;margin:20px 0px 20px 0px;">
									<li>
										<label class="hr_tag">※ 선택 정보</label>
									</li>
								</ul>
								
								
								
								<ul class="request-input">
								
									<li><label for="TEL" class="th_tit">전화번호</label>
										<div class="td_txt">
											${ memberVO.tel1 } - ${ memberVO.tel2 } - ${ memberVO.tel3 }
										</div>
									</li>
									
									
									<li><label for="POST" class="th_tit">주소</label>
										<div class="td_txt">
											(${ memberVO.post }) ${ memberVO.basic_addr } ${ memberVO.detail_addr }
										</div>
										
									</li>
								
								
									
	
								
								
								</ul>
								
								
								<ul style="border-bottom:solid 2px #3BB54A;margin:20px 0px 20px 0px;">
									<li>
										<label class="hr_tag">※ 마이 서비스</label>
									</li>
								</ul>
								
								

								<div class="request_btn">
									<div class="btn-wrap">
										<input type="button" class="btn-style01" value="수정" style="cursor: pointer;" onclick="modifyMember()" />
										<input type="button" class="btn-style01" value="탈퇴" style="cursor: pointer;" onclick="deleteMember()" />
										<input type="button" class="btn-style01" value="내사진" style="cursor: pointer;" onclick="mypic()" />
									</div>
								</div>
							</div>
						</fieldset>
					</form>
					


					<script>
						function deleteMember() {
							location.href = "${pageContext.request.contextPath}/memberDelete.do";
						}

						function modifyMember() {
							location.href = "${pageContext.request.contextPath}/memberModify.do";
						}
						
						function mypic() {
							location.href = "${pageContext.request.contextPath}/memberPic.do";
						}
					</script>

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