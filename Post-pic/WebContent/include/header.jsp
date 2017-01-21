<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<%=request.getContextPath() %>/css/thumblr.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/sub.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/js/jquery.bxslider.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/js/isotope.pkgd.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/js/script.js" type="text/javascript"></script>

<title>Post Pic</title>

</head>


<body>
	<div id="wrap">

		<div class="l-header  logged-out-header hide-logo">
			<h1 class="logo">
				<a tabindex="-1" class="logo-anchor" href="<%=request.getContextPath() %>/" aria-label="PP">
					<div class="png-logo">
						<img src="<%=request.getContextPath() %>/img/logo/logo.jpg">
					</div>
				</a>
			</h1>
			<div class="right" style="padding-right: 15px;">
			
				<c:choose>
    				<c:when test="${empty userVO }">
						<a class="signup_link login-button" href="<%=request.getContextPath() %>/loginForm.do" role="button">로그인</a>
						<a class="signup_link signup-button" href="<%=request.getContextPath() %>/memberShip.do" role="button">가입</a>
				</c:when>
    				<c:otherwise>
    					<a class="signup_link login-button" href="<%=request.getContextPath() %>/loginout.do" role="button">로그아웃</a>
						<a class="signup_link signup-button" href="<%=request.getContextPath() %>/memberPage.do" role="button">마이페이지</a>
    				</c:otherwise>
    			</c:choose>
				
			</div>
			<div class="ui_search " id="search_field">
				<form method="get" action="<%=request.getContextPath() %>/main.do" id="search_form"
					class="search_form is_tag_search" role="search" novalidate="">
					<div class="search_form_row ">
						<div class="search_form_field">
							<input tabindex="1" type="text" name="q" id="search_query"
								placeholder="#해쉬태그 검색" value="${param.q}"
								class="search_query popover_button " autocomplete="off"
								required="required" stye="background:#3BB54A">
						</div>
					</div>
				</form>
			</div>
			<div id="popover_search"
				class="popover popover_menu popover_gradient search_popover"
				style="display: none;">
				<div class="popover_inner">
					<div id="search_results_container"
						class="search_results_container popover_scroll">
						<div class="scrollable_container">
							<div class="tracked_tags tag search_results_section"></div>
						</div>
					</div>
				</div>
			</div>

		</div>


		<div class="discover-controls-wrapper">
			<div class="content-controls">
				<div class="types-tabs">
					<a href="<%=request.getContextPath() %>/upload/upload.do" class="content-control active"
						style="width: 80px; margin-left: 15px;" data-text="PostPic"
						data-content-type="trending"> Post Pic! </a>
					
					<a href="/list.do" class="content-control active"
						style="width: 110px;" data-text="free" FreeBoard="text"> Free
						Board </a>
						
					<a href="/explore/photos" class="content-control active"
						style="width: 70px;" data-text="notice" data-content-type="notice">
						Notice </a>

					
					<c:if test="${not empty userVO }" >
						<span class="content-control active" style="float:right;margin-right:10px;">
							[ ${userVO.name } 접속중 ]
						</span>
	    			</c:if>
	    			
				</div>
				
			</div>
		</div>



		