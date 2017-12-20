$(document).ready(function(){
	$(".shop-list li").on("click",function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        $(".shop-list-inner").empty();
        showInner(this.innerText)
    })
    var userLocation=localStorage.getItem("userPoint");
    //地址
    $("#center-user-addr").text(userLocation)
    
    
    //商家列表
    var shopStr=localStorage.getItem("nearbyShopIdList")
    var shopItems=shopStr.split(",");
	for(var i=0;i<shopItems.length;i++){
		var shopItem=shopItems[i].split(":");
		var shopId=shopItem[0];
		var shopName=shopItem[1];
		var shopPic=shopItem[2];
		$("#shopItems").append('<li class="shop-block"><a href="user/getBusiness.action?shopId='+shopId+'"><div class="shop-logo"><img src="upload/business/'+shopPic+'?imageMogr2/thumbnail/70x70" alt="商家图片"><span class="timeout">45+ 分钟</span></div>'
				+'<div class="shop-content"><div class="block-title">'+shopName+'</div>'
                +'<span class="starrating"><i class="icon Hui-iconfont">&#xe6ff;</i><i class="icon Hui-iconfont">&#xe6ff;</i><i class="icon Hui-iconfont">&#xe6ff;</i><i class="icon Hui-iconfont">&#xe6ff;</i><i class="icon Hui-iconfont">&#xe6ff;</i><span class="monthsales">月售5809单</span></span><div class="cost">免配送费</div><div class="activity"></div></div></a></li>');
	}
	
});   