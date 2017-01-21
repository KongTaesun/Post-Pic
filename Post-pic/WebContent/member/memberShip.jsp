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

<script>
	$(document).ready(function() {
		$('#idchkbn').click(function() {
			
			var tmpid = $("#id").val();
			
			if($.trim(tmpid) == ""){
				alert("아이디를 입력하세요");
				$("#id").val("");
				$("#id").focus();
				return false;
			}
				
			
			$.ajax({
				url : "<%=request.getContextPath()%>/member/memberIDCheck.jsp",
				data : {
					id : tmpid
				},
				success : function(data) {
					var tmp_data = $.trim(data);
					if(tmp_data>0){
						$('#searchResult').text("(사용할 수 없습니다)");
						$("#idchk").val("N");
					}else{
						$('#searchResult').text("(사용 가능합니다)");
						$("#idchk").val("Y");
					}
					//$('#searchResult').text(data);
				}
			});
			
			
		});
		
		$("#id").change(function(){
			$('#searchResult').text('');
			$("#idchk").val("N");
		});
		
		
		$("#selmail").change(function(){
			$("#email_domain").val($(this).val());
		});
		
		
		$(".onlyNumber").keyup(function(event){

            if (!(event.keyCode >=37 && event.keyCode<=40)) {

                var inputVal = $(this).val();

                $(this).val(inputVal.replace(/[^0-9]/gi,''));

            }

        });
		
		
	});
	
	
	
	
	
	
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
// 다음 주소 API
function DaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if (data.userSelectedType === 'R') {
				//법정동명이 있을 경우 추가한다.
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName
							: data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('
						+ extraAddr + ')'
						: '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			$("#post").val(data.zonecode);
			$("#basic_addr").val(fullAddr);
			$("#detail_addr").focus();

		}
	}).open();
}

function fn_check(){
	
	if($.trim( $("#id").val() )==""){
		alert("아이디를 입력해주세요.");
		$("#id").focus();
		return false;
	}
	
	if($.trim( $("#chkid").val() )=="N"){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	
	if($.trim( $("#name").val() )==""){
		alert("이름을 입력해주세요.");
		$("#name").focus();
		return false;
	}
	
	if($.trim( $("#password").val() )==""){
		alert("패스워드를 입력해주세요.");
		$("#password").focus();
		return false;
	}
	
	if($.trim( $("#password2").val() )==""){
		alert("패스워드 확인을 입력해주세요.");
		$("#password2").focus();
		return false;
	}
	
	if( $("#password").val() != $("#password2").val() ){
		alert("패스워드 확인이 일치하지 않습니다.");
		$("#password2").focus();
		return false;
	}
	
	if($.trim( $("#email_id").val() )==""){
		alert("이메일을 입력해주세요.");
		$("#email_id").focus();
		return false;
	}
	
	
	if($.trim( $("#email_domain").val() )==""){
		alert("이메일을 입력해주세요.");
		$("#email_domain").focus();
		return false;
	}
	
	return true;
}
</script>


<section id="container">
	<h2 class="page-tit hide-text">포트폴리오</h2>
	<section class="recent_work_wrap">

		<section id="container" class="company">

			<section class="news-section company-section">

				<div class="modal_request">
					<div class="request-top">
						<h3 class="request-tit">회원가입</h3>
					</div>



					<form name="writeForm" method="post" action="<%=request.getContextPath()%>/memberProcess.do" onsubmit="return fn_check();">
						<input type="hidden" id="idchk" value="N" />
						
						<fieldset>
							<legend>온라인문의</legend>
							<div class="request-cont">
							
								<ul class="request-input" >
								
									<li><label for="ID" class="th_tit">아이디</label>
										<div class="td_txt">
											<input type="text" id="id" name="id"
												style="ime-mode: disabled; width: 30%;">
												<input type="button" class="membtn" id="idchkbn" value="중복확인" />
												<span
												style="font-weight: bold; color: red;" id="searchResult"></span>
										</div>
									</li>
									
									<li><label for="NAME" class="th_tit">이름</label>
										<div class="td_txt">
											<input type="text" id="name" name="name" style="ime-mode: disabled; width: 30%;">
										</div>
									</li>
									
									<li><label for="PASSWORD" class="th_tit">비밀번호</label>
										<div class="td_txt">
											<input type="password" id="password" name="password"
												style="ime-mode: disabled; width: 30%;">
										</div>
									</li>
									
									<li><label for="PASSWORD2" class="th_tit">비밀번호 확인</label>
										<div class="td_txt">
											<input type="password" id="password2" name="password2"
												style="ime-mode: disabled; width: 30%;">
										</div>
									</li>
								
								
									<li><label for="EMAIL" class="th_tit">이메일</label>
										<div class="td_txt">
											<input type="text" id="email_id" name="email_id" style="ime-mode: disabled; width: 30%;"> @ <input type="text" id="email_domain" name="email_domain" style="ime-mode: disabled; width: 30%;">
											<select id="selmail">
												<option value="">직접입력</option>
												<option value="naver.com">naver.com</option>
												<option value="daum.net">daum.net</option>
												<option value="gmail.com">gmail.com</option>
											</select>
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
											<select name="tel1" id="tel1">
												<option value='010'>010</option>
												<option value='011'>011</option>
												<option value='016'>016</option>
												<option value='017'>017</option>
												<option value='018'>018</option>
												<option value='019'>019</option>
												<option value='02'>02</option>
												<option value='031'>031</option>
												<option value='032'>032</option>
												<option value='033'>033</option>
												<option value='041'>041</option>
												<option value='042'>042</option>
												<option value='043'>043</option>
												<option value='051'>051</option>
												<option value='052'>052</option>
												<option value='053'>053</option>
												<option value='054'>054</option>
												<option value='055'>055</option>
												<option value='061'>061</option>
												<option value='062'>062</option>
												<option value='063'>063</option>
												<option value='064'>064</option>
												<option value='070'>070</option>
											</select>
											-
											<input type="text" id="tel2" name="tel2" style="ime-mode: disabled; width: 30%;" class="onlyNumber" maxlength="4" > - 
											<input type="text" id="tel3" name="tel3" style="ime-mode: disabled; width: 30%;" class="onlyNumber" maxlength="4" >
											
										</div>
									</li>
									
									
									<li><label for="POST" class="th_tit">주소</label>
										<div class="td_txt">
											<input type="text" id="post" name="post" style="ime-mode: disabled; width: 30%;"  readonly=readonly >
												<input type="button" class="membtn" value="우편번호 찾기" onclick="DaumPostcode()" />
												<span
												style="font-weight: bold; color: red;" id="searchResult"></span>
										</div>
										
										
										<div class="td_txt" style="margin-top:10px;">
											<input type="text" id="basic_addr" name="basic_addr"
												style="ime-mode: disabled" placeholder="기본주소" readonly=readonly>
										</div>
										
										<div class="td_txt" style="margin-top:10px;">
											<input type="text" id="detail_addr" name="detail_addr"
												style="ime-mode: disabled" placeholder="상세주소">
										</div>
										
									</li>
								
								
									
	
								
								
								</ul>

								<div class="request_btn">
									<div class="btn-wrap">
										<input type="submit" class="btn-style01" value="회원가입"
											style="cursor: pointer;" />
									</div>
								</div>
							</div>
						</fieldset>
					</form>



					
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