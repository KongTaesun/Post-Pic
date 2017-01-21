<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/include/header.jsp" />


<div class="header-box" style="height:80px;"></div>



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

				<div class="section-banner"></div>
				<form class="board-list" action="" method="get" name="searchs">
					<fieldset>
						<legend>공지사항</legend>
						<h4 class="bo-tit">- 공지사항</h4>
						<div class="page_num">
							<strong class="active">1</strong>/1
						</div>
						<div class="bo-list">
							<table class="ta_list">
								<caption>공지사항</caption>
								<colgroup>
									<col width="8%">
									<col width="auto">
									<col width="10%">
									<col width="15%">
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>진행상황</th>
										<th>등록일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="ta_num">7</td>
										<td class="td_tit"><a href="company_news_view.php?idx=11"
											title="카드결제 공지사항">카드결제 공지사항</a></td>
										<td class="td_name">관리자</td>
										<td class="td_date">2016-04-05</td>
									</tr>





									<tr>
										<td class="ta_num">6</td>
										<td class="td_tit"><a href="company_news_view.php?idx=9"
											title="중소기업진흥공단 2016년 고성장기업 수출역량강화사업 수행기관 선정">중소기업진흥공단
												2016년 고성장기업 수출역량강화사업 수행기관 선정</a></td>
										<td class="td_name">관리자</td>
										<td class="td_date">2016-04-04</td>
									</tr>
									<tr>
										<td class="ta_num">5</td>
										<td class="td_tit"><a href="company_news_view.php?idx=10"
											title="도약을 위한 부산지사 설립">도약을 위한 부산지사 설립</a></td>
										<td class="td_name">관리자</td>
										<td class="td_date">2016-04-04</td>
									</tr>
									<tr>
										<td class="ta_num">4</td>
										<td class="td_tit"><a href="company_news_view.php?idx=8"
											title="인쇄 사업부 웹사이트 오픈">인쇄 사업부 웹사이트 오픈</a></td>
										<td class="td_name">관리자</td>
										<td class="td_date">2016-03-10</td>
									</tr>
									<tr>
										<td class="ta_num">3</td>
										<td class="td_tit"><a href="company_news_view.php?idx=7"
											title="5월 12일 사옥이전 안내 ">5월 12일 사옥이전 안내 </a></td>
										<td class="td_name">관리자</td>
										<td class="td_date">2016-03-10</td>
									</tr>
									<tr>
										<td class="ta_num">2</td>
										<td class="td_tit"><a href="company_news_view.php?idx=6"
											title="기업부설연구서 설립 - 앞으로 IT시장의 선두업체로 성장하겠습니다.">기업부설연구서 설립
												- 앞으로 IT시장의 선두업체로 성장하겠습니다.</a></td>
										<td class="td_name">관리자</td>
										<td class="td_date">2015-10-16</td>
									</tr>
									<tr>
										<td class="ta_num">1</td>
										<td class="td_tit"><a href="company_news_view.php?idx=5"
											title=" 홈페이지가 리뉴얼 되었습니다."> 홈페이지가 리뉴얼 되었습니다.</a></td>
										<td class="td_name">관리자</td>
										<td class="td_date">2016-01-05</td>
									</tr>

								</tbody>
							</table>
							<div class="pagination ">
								<a href="#" class="prev_all"><img
									src="./img/common/board_btnprev.gif" alt="처음으로"></a> <a
									href="#" class="prev"><img
									src="./img/common/board_btnsmallprev.gif" alt="이전"></a> <span><a
									href="#" class="active">1</a></span> <span><a href="#">2</a></span> <span><a
									href="#">3</a></span><a href="#" class="next"><img
									src="./img/common/board_btnsmallnext.gif" alt="다음"></a> <a
									href="#" class="next_all"><img
									src="./img/common/board_btnnext.gif" alt="끝으로"></a>
							</div>

							<div class="sps_sch">

								<input type="hidden" name="g_list_rows" id="g_list_rows"
									value="10"> <label for="" class="blind">검색조건</label> <select
									name="cate" id="cate" class="select-cus">
									<option value="r_title">제목</option>
									<option value="r_content">내용</option>
								</select>
								<div class="search_box">
									<input type="text" id="keyword" name="keyword" value=""
										class="frm_input required" maxlength="30"> <input
										type="submit" value="검색" class="btn_search">
								</div>
							</div>
						</div>

					</fieldset>
				</form>
			</section>
			<a href="#wrap" class="btn_topGo"><img
				src="./img/sub/btn_topGo.png" alt="상단바로가기" title="상단으로 가기"></a>
		</section>

	</section>
	<!-- //container End -->
</section>


	<jsp:include page="/include/footer.jsp" />