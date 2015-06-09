
$(function(){		   
	$("#menus > li").not(".navhome").hover(function(){
		$(this).addClass("navmoon");
	},function(){
		$(this).removeClass("navmoon");
	});
	$("#menus > li > ul > li ").click(function(){
		$("#menus > li").removeClass("navmoon");
	});
}); 
