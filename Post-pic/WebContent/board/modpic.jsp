<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/include/header.jsp" />

<script type="text/javascript">

var frm = document.frm;

$(document).ready(function(){
	$("#title").focus();
	
});



function doWrite(){
	
	var form = document.writeForm;
	
	if(form.title.value == ""){
		alert("제목을 입력해주세요.");
		form.title.focus();
		return false;
	}
	/*
	if(form.writer.value == ""){
		alert("글쓴이를 입력해주세요.");
		form.writer.focus();
		return false;
	}
	*/
	
	if(form.content.value == ""){
		alert("내용울 입력해주세요.");
		form.content.focus();
		return false;
	}
	
	if(form.attachfile1.value == ""){
		alert("이미지를 입력해주세요.");
		form.attachfile1.focus();
		return false;
	}
	
	// 파일 확장자 체크
	if(checkExt(form.attachfile1)){
		return false;
	}
	
	
	
	
	//return true;
	return false; // 임시로 막음
}

function checkExt(obj){
	var fobidName = ['java','exe','js','jsp','class'];
	var filename = obj.value;
	var ext = filename.substring(filename.lastIndexOf('.')+1);
	
	for(var i=0; i<fobidName.length; i++){
		if(fobidName[i] == ext){
			alert(ext + "확장자는 파일업로드 정책에 위배됩니다.");
			return true;
		}
	}
	
	return false;
	
}


</script>


<div class="header-box" style="height:50px;"></div>

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

				

				<!-- adasdasd -->

				<div class="modal_request" >
					<div class="request-top">
						<h3 class="request-tit">이미지 수정</h3>
					</div>

					
					<form name="writeForm" method="post" action="<%=request.getContextPath() %>/upload/modok.do" onsubmit="return doWrite()"  enctype="multipart/form-data" >
						<input type="hidden" name="writer" value="${userVO.name }" />
						<input type="hidden" name="regid" value="${userVO.id }" />
						<input type="hidden" name="depth" value="0" />
						<input type="hidden" name=board_no value="0" />
						<fieldset>
							<legend>온라인문의</legend>
							<div class="request-cont">
								<ul class="request-input">
									<li><label for="company" class="th_tit">구분</label>
										<div class="td_txt radid_check">
											<span>
												<input type="radio" id="r_category01"
												name="types" value="tr" checked=""> <label
												for="r_category01">여행</label>

											</span>
											<span>
											 	 <input type="radio" id="r_category02"
												name="types" value="gi"> <label for="r_category02">걸그룹</label>
											</span>
											<span>
											 	 <input type="radio" id="r_category03"
												name="types" value="sp"> <label for="r_category02">스포츠</label>
											</span>
										</div>
									</li>
									
									<li><label for="email" class="th_tit">제목</label>
										<div class="td_txt">
											<input type="text" id="title" name="title" value="${ boardVO.title }"
												style="ime-mode: disabled">
										</div>
									</li>
									<li class="txtarea"><label for="res_content"
										class="th_tit">내용</label>
										<div class="td_txt">
											<textarea name="content" id="content"
												placeholder="이미지 내용">${ boardVO.content }</textarea>
										</div></li>
									<li class="file"><label for="file1" class="th_tit">첨부파일</label>
										<div class="td_txt">
											<input type="file" id="attachfile1" name="attachfile1">
										</div>
									</li>
									<li><label for="email" class="th_tit">태그</label>
										<div class="td_txt">
											<input type="text" id="tags" name="tags"
												style="ime-mode: disabled;width:60%;" value="${ boardVO.tags }" >
											<span style="font-weight:bold;color:red;">(#태그 형식으로 작성하세요)</span>
										</div>
									</li>
								</ul>
								
								<div class="request_btn">
									<div class="btn-wrap">
										<input type="submit" class="btn-style01" value="업로드" style="cursor:pointer;" />
									</div>
								</div>
							</div>
						</fieldset>
					</form>
					
				</div>
				<script type="text/javascript">
					$(document).ready(function(){
						var tmp_type = '${ boardVO.types }';
						
						if(tmp_type=="tr"){
							$("#r_category01").attr("checked","checked");	
						}
						
						if(tmp_type=="gi"){
							$("#r_category02").attr("checked","checked");	
						}
						
						if(tmp_type=="sp"){
							$("#r_category03").attr("checked","checked");	
						}
						
						
					});
				</script>



				<!--  asdasdasd -->
			</section>
			<a href="#wrap" class="btn_topGo"><img
				src="<%=request.getContextPath() %>/img/sub/btn_topGo.png" alt="상단바로가기" title="상단으로 가기"></a>
		</section>

	</section>
	<!-- //container End -->
</section>


<jsp:include page="/include/footer.jsp" />