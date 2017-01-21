var opt_portfolio = {
		itemSelector: '.list-content',
		layoutMode: 'masonry',	
		//filter: '.gi',
		masonry: {
			// set to the element
			columnWidth: '.list-content',
			isFitWidth: true
		  }
	}

$(document).ready(function(){
	$(".recent_work_wrap nav.article_nav a:eq(0)").addClass("active");

	$("ul.portfolio").isotope(opt_portfolio);

	$(".recent_work_wrap nav.article_nav").on("click",".web_k,.mobile_k,.business_k,.web_a",function(e){
		$(this).addClass("active").siblings().removeClass("active");
		var _sType=$(this).attr("data-filter");
		
		
		if(_sType == "all"){
			$("ul.portfolio").isotope({
				itemSelector: '.list-content',
				layoutMode: 'masonry',
				filter: '.gi,.tr,.sp',
				masonry: {
					// set to the element
					columnWidth: '.list-content',
					isFitWidth: true
				  }
			});
			
		}else{
			$("ul.portfolio").isotope({
				itemSelector: '.list-content',
				layoutMode: 'masonry',
				filter: '.'+_sType,			
				masonry: {
					// set to the element
					columnWidth: '.list-content',
					isFitWidth: true
				  }
			});
		}
		
		
		e.preventDefault();
	});
	
	$('.btn_modal_request').click(function(e){
		var wh = $(window).width();
		$('.modalbg').fadeIn('fast',function(){
			$('.modal_request').fadeIn('fast')
		});
		e.preventDefault();
	});

	$(".btn_agree_layer").click(function(e){
		
		$(".agree_layer").fadeIn('fast');
		
		e.preventDefault();

		$(".btn_small_layer_close").click(function(e){
			if($(".agree_layer").is(":visible")){
				$(".agree_layer").fadeOut('fast');
			}
			e.preventDefault();
		});
	});


	$('.modalpop .btn_close').click(function(){
		$('.modalpop').fadeOut('fast',function(){
			$('.modalbg').fadeOut('fast');
		});
		
	});

	$(".modalbg,.btn_close").click(function(){
		if($(".modalpop").is(":visible")){
			$(".modalpop").fadeOut(100,function(){
				$(".modalbg").fadeOut(200,function(){
					//$(".modalpop").empty();
					// 임시로 막음
				});
			});
		}else if($(".modal_request").is(":visible")){
			$(".modal_request").fadeOut(100,function(){
				$(".modalbg").fadeOut(200,function(){
					$(".modalpop").empty();
				});
			});
		}else if($(".modal_cardBuy").is(":visible")){
			$(".modal_cardBuy").fadeOut(100,function(){
				$(".modalbg").fadeOut(200,function(){
					$(".modalpop").empty();
				});
			});
		}
		return false;
	});
	
	var $smenu=$('#gnb > li');
	var $locTxt=$('h2.page-tit').text();
	for (var i=0; i<$smenu.length; i++){
		var menutxt=$.trim($smenu.eq(i).find('.korTit').text());
		var loctxt=$.trim($locTxt);
		if (menutxt == loctxt){
			$smenu.eq(i).addClass('active');
		}
	}

	//버튼클릭 애니메이션
	$('a[href^="#wrap"]').on('click',function (e) {
		e.preventDefault();
		var target = this.hash,
		$target = $(target);		
		var ta = $target.offset().top;
		$('html, body').stop().animate({
			'scrollTop':  ta
		}, 800, 'easeInOutQuint' ,function () {
			//window.location.hash = target;
		});
	});


	//gnb menu
	$("#gnb > li").hover(function(){
		var wh = $(window).width();
		if(wh>1024){
			$(this).find(".depth02").stop(true,true).slideDown(300);
		}		
	},function(){
		
			$(this).find(".depth02").stop(true,true).slideUp(100);
		
	});

	//모바일 gnb on
	$(".btn_all_menu").click(function(e){
		$("#gnb").addClass("on");
		$("body").addClass("layerOn");
		e.preventDefault();
		$(".mo_btn_gnbClose").click(function(e){
			$("#gnb").removeClass("on");
			$("body").removeClass("layerOn");
			e.preventDefault();
		});
	});
	
	//결제모듈테스트
	$(".btn_cardBuy").click(function(e){
		$(".modalbg").fadeIn(100,function(){
			$(".modal_cardBuy").fadeIn(200);
		});
		//alert("서비스 준비중입니다.")
		e.preventDefault();
		return false;

	});

	$(".btn_quick_more").on( 'click', function(e) {
		var ta = 0;
		$('html, body').stop().animate({
			'scrollTop':  ta
		}, 800, 'easeInOutQuint' , function () {
			//window.location.hash = target;
		});
		e.preventDefault();
	});

});


$(window).scroll(function(){
	var wTop = $(window).scrollTop();
	if(wTop>200){					
		$(".quick-content").fadeIn(300);
	}else{
		$(".quick-content").fadeOut(300);
	}

});


//숫자만 입력 가능하게
function fn_checkNumber(strObjName){
    var pattern = /^[0-9]+$/;
    
    if(strObjName.value != ""){
        if(!pattern.test(strObjName.value)){
            alert("숫자만 입력가능합니다");
            strObjName.value="";
            strObjName.focus();
        }
    }
}
function reset_pop_size(){
		var winSize = $(window).width();
		if(winSize < 480){
			$('.popup_img,.popup_footer').css('width',320)
		} else {
			$('.popup_img,.popup_footer').css('width',460)
			}		
}
$(function() {
	$( window ).load(function() {
		reset_pop_size();
	});
	$( window ).resize(function() {
		reset_pop_size();
	});
});