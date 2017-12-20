<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<title>搜索结果页面</title>
	<link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="icon/iconfont.css">
	<style>
		/*-------------全局设置 开始-------------------*/
		a,
		a:hover,
		a:visited,
		a:active,
		a:link{
			text-decoration: none;
			color: black;
		}
		.pointer{
			cursor: pointer;
		}
		/*-------------全局设置 结束-------------------*/


		/*---------------head部分 开始-------------------*/
		#head nav.navset{
			margin-bottom: 0;
		}
		#head nav:first-of-type a{
			color: #FFF;
			font-size: 16px;
			user-select: none;
		}
		/*font-color-black*/
		#head .fc-black li a{
			color: black;
		}
		.chb-logo{
			position: relative;
			top: -8px;
		}
		.bgcolor{
			background-color: #1e89e0;
		}
		.navbar-default .navbar-nav>.open>a,
		.navbar-default .navbar-nav>.open>a:focus,
		.navbar-default .navbar-nav>.open>a:hover{
			background-color: rgba(221,221,221,0.3);
		}
		.dropdown-menu{
			min-width: 143px;
		}
		.dropdown-menu:hover{
			background-color: rgba(221,221,221,1);
		}
		/*---------------head部分 结束-------------------*/


		/*---------------class="container path"部分 开始-------------------*/
		.path{
			height: 54px;
			line-height: 54px;
			font-size: 12px;
		}
		.path span:first-of-type{
			user-select: none;
			color: #999;
		}
		.path span:nth-of-type(n+2){
			margin-left: 5px;
		}
		.path i{
			display: inline-block;
			font-style: normal;
			font-size: 16px;
			user-select: none;
		}
		.path a.normal:hover{
			color: #0089dc;
		}
		/*---------------class="container path"部分 结束-------------------*/

		/*---------------footer部分 开始-------------------*/

		#footer{
			margin-top: 50px;
		}
		#footer .row .nav li:first-of-type{
			font-size: 14px;
			line-height: 30px;
			font-weight: 400;
		}
		#footer .row .nav li a{
			padding: 0;
			margin: 0;
			font-size: 12px;
			color: #999;
			display: block;
			line-height: 24px;
			text-decoration: none;
			width: 50%;
		}
		.footer-copyright{
			padding-top: 60px;
		}
		.footer-copyright .owner{
			display: block;
			text-align: center;
			color: #0e0e0e;
			font-weight: 400;
			font-size: 12px;
			margin: 0;
			padding: 0;
		}
		.footer-copyright p{
			margin: 0;
			padding: 0 ;
			color:#999;
			text-align: center;
		}
		.footer-copyright p a{
			text-decoration: none;
			color:#999;
		}
		/*---------------footer部分 结束-------------------*/

		/*-------------------搜索框-------------------------*/
		.path .shop-search{
			display: inline-block;
			margin: 10px 0;
			height: 32px;
			width: 260px;
			line-height: 32px;
			border: 1px solid #ccc;
			background: #fff;
			float: right;
		}
		.shop-search .search{
			height: 30px;
			width: 190px;
			line-height: 24px;
			font-size: 16px;
			border: 0;
			outline: 0;
			padding: 4px 0;
			margin: 0 8px;
			cursor: auto;
			background-color: #FFF;
			vertical-align: text-bottom;
		}
		.shop-search .search-btn{
			display: inline-block;
			width: 30px;
			height: 30px;
			text-align: center;
			border: none;
			color: #999;
			cursor: pointer;
			outline: 0;
			background: transparent;
			line-height: 24px;
			padding: 4px 0;
			margin: 0 8px;
			vertical-align: text-bottom;
		}
		.shop-search .search-btn i{
			font-size: 20px;
		}
		.shop-search .search-btn i:hover{
			color: #5eaeeb;
		}
		/*-------------------搜索框-------------------------*/

		/*-------------------<div class="container main-content">------*/
         .search-foodtable{
			 background-color: #FFF;
			 width: 100%;
			 margin-bottom: 15px;
			 border: 1px solid #ddd;
		 }
		.search-foodtable tbody tr:first-of-type{
			background-color: #F9F9F9;
		}
		.search-foodtable th{
			padding: 0.5em 1em;
			border: 1px solid #ddd;
			font-style: normal;
			font-weight: 400;
		}
		.search-foodtable h4.search-shopname{
			margin-bottom: 0;
			padding-bottom: 5px;
			font-size: 1.2em;
			line-height: 1.5;
		}
		.search-foodtable .starrating-content{
			display: inline-block;
			width: 110px;
			font-size: 12px;
			color: #ffc30c;
			white-space: nowrap;
		}
		.search-foodtable .search-sales{
			margin-right: 5px;
			padding: 10px;
			border-right: 1px solid #CCC;
		}

		.search-foodtable tbody tr:nth-of-type(n+2) td{
			padding: 11px 14px;
			border: 0px;
			border-top: 1px solid #f5f5f5;
		}
		.search-foodtable .search-goodsname{
			font-size: 18px;
			font-weight: 500;
		}
		.search-foodtable .search-co12{
			width: 100px;
			text-align: center;
		}
		.search-foodtable .search-co13{
			width: 160px;
			text-align: center;
		}
		.search-foodtable .search-co13 a{
			font-size: 14px;
			background-color: #0080d9;
			padding: 7px 30px;
			color: #FFF;
		}
		.search-foodtable .search-co14{
			width: 130px;
		}
		.search-foodtable .search-co14 div:first-of-type{
			color: #ffc30c;
		}
		/*-------------------<div class="container main-content">------*/

	</style>
</head>
<body>

<div id="big-box">
	<div id="head">
	<nav class="navbar navbar-default navbar-static-top bgcolor navset">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><img class="chb-logo" src="img/chb-logo.jpg" alt="吃货宝"></a>
				</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="#">首页</a></li>
					<li><a href="#">我的订单</a></li>
					<li><a href="#">加盟合作</a></li>
					</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">规则中心</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">13729000000 <span class="caret"></span></a>
						<ul class="dropdown-menu fc-black">
							<li><a href="#">个人中心</a></li>
							<li><a href="#">我的收藏</a></li>
							<li><a href="#">我的地址</a></li>
							<li><a href="#">安全设置</a></li>
							<li><a href="#">退出登录</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div id="main">
		<div class="container path">
			<span>当前位置：</span>
			<span><a href="#" class="normal">广东海洋大学</a></span>
			<span><a href="#">[切换地址]</a> </span>
			<span><i>&gt;</i>&nbsp;&nbsp;搜索结果</span>
			<div class="shop-search">
				<input class="search" type="text" maxlength="30" placeholder="搜索商家,美食...">
				<a href="javascript:;" class="search-btn"><i class="icon Hui-iconfont">&#xe665;</i></a>
			</div>
		</div>
		<div class="container main-content">
			<div>

			</div>
		</div>
	</div>
	<footer id="footer">
		<div class="container clearfix">
			<div class="row">
				<div class="col-xs-2">
					<ul class="nav nav-sidebar">
						<li><span>商务合作</span></li>
						<li><a href="#">我要开店</a></li>
						<li><a href="#">加盟指南</a></li>
						<li><a href="#">市场合作</a></li>
						<li><a href="#">开放平台</a></li>
					</ul>
				</div>
				<div class="col-xs-2">
					<ul class="nav nav-sidebar">
						<li><span>商务合作</span></li>
						<li><a href="#">我要开店</a></li>
						<li><a href="#">加盟指南</a></li>
						<li><a href="#">市场合作</a></li>
						<li><a href="#">开放平台</a></li>
					</ul>
				</div>
				<div class="col-xs-2">
					<ul class="nav nav-sidebar">
						<li><span>商务合作</span></li>
						<li><a href="#">我要开店</a></li>
						<li><a href="#">加盟指南</a></li>
						<li><a href="#">市场合作</a></li>
						<li><a href="#">开放平台</a></li>
					</ul>
				</div>
				<div class="col-xs-3">
					<ul class="nav nav-sidebar">
						<li><span>商务合作</span></li>
						<li><a href="#">我要开店</a></li>
						<li><a href="#">加盟指南</a></li>
						<li><a href="#">市场合作</a></li>
						<li><a href="#">开放平台</a></li>
					</ul>
				</div>
				<div class="col-xs-3">
					<ul class="nav nav-sidebar">
						<li><span>商务合作</span></li>
						<li><a href="#">我要开店</a></li>
						<li><a href="#">加盟指南</a></li>
						<li><a href="#">市场合作</a></li>
						<li><a href="#">开放平台</a></li>
					</ul>
				</div>
			</div>
			<div class="footer-copyright">
				<span class="owner">所有方：广东九州有限公司</span>
				<p>
					增值电信业务许可证 :
					<a href="#">沪B2-20150033</a>
					|
					<a href="#">沪ICP备 09007032</a>
					|
					<a href="#">上海工商行政管理</a>
					Copyright ©2008-2017 ele.me, All Rights Reserved.
				</p>
			</div>
		</div>
	</footer>
</div>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!--设置左上角用户位置-->
<script>
$(function () {
    setUserLocation()
	function setUserLocation() {
        var userLocation = localStorage.getItem("userPoint");
        if(userLocation.trim() == null ){
            alert("这里插入搜索页面地址");
		}else{
            $("#main .path .normal").html(userLocation);
		}
    }
})
</script>
<!-- 加入搜索到的结果 -->
<script>
	function createEle(eleName,className,parent) {
	    //准备改jquery版本的
        var create  = document.createElement(eleName);
        className ? create.className = className:'';
        parent? parent.appendChild(create):'';
        return create;
    }

/* 	var goodsMsg = [
	    //goodsName商品名字，price商品价格，goodsScore商品评分 monthSale该商品月售卖
	    {goodsName:"青菜",price:"11",monthSale:45,goodsScore:"4.8"},
		{goodsName:"豆腐",price:"2",monthSale:45,goodsScore:"3"},
        {goodsName:"豆",price:"20",monthSale:45,goodsScore:"2"}
		];
	//商店信息
	var Msg = [
	    //shopId:商店id，shopName商店名字，shopScore商店评分，monthSale总月售，sendTime平均配送时间
	    {shopId:1,shopName:"大众寿司1",shopScore:5,monthSale:45,sendTime:30,goodsMsg:goodsMsg},
        {shopId:1,shopName:"大众寿司2",shopScore:5,monthSale:45,sendTime:30,goodsMsg:goodsMsg},
        {shopId:1,shopName:"大众寿司3",shopScore:5,monthSale:45,sendTime:30,goodsMsg:goodsMsg},
		];  */
	// 外部输入
	//商品信息(goodsName\price\goodsScore)
	
	var getMsgFormLocation = JSON.parse(localStorage.getItem("searchShopsAndGoodsList"));
	
  	var Msg = [];
	for(var i=0;i<getMsgFormLocation.length;i++){
		var newMsg = {};
		var g = getMsgFormLocation[i];
		newMsg.shopId = g.id;
		newMsg.shopName = g.shopName;
		newMsg.shopScore = g.shopScore;
		newMsg.monthSale = 45;
		newMsg.sendTime = 30;
		newMsg.goodsMsg = [];
		if(g.getSearchGoodsStyleVo != null && g.getSearchGoodsStyleVo.length > 0 ){
			for(var j=0; j<g.getSearchGoodsStyleVo.length; j++){
			var gg = g.getSearchGoodsStyleVo[j].getSearchGoodsVo[0];
			var newGoodsMsg = {}
			if(gg.sellState == 0){
				newGoodsMsg.goodsName = gg.goodName;
				newGoodsMsg.price = gg.price;
				newGoodsMsg.monthSale = 45;
				newGoodsMsg.goodsScore = 5;
				/* sellState 销售状态(0正在销售/1无)*/
				newGoodsMsg.sellState = gg.sellState;
			}
			newMsg.goodsMsg.push(newGoodsMsg);
		}
		}

		Msg.push(newMsg);
	}  

	//存放搜索到的商品列表的div
	var div_ = $("#main .main-content>div:first-of-type")[0];
    initSearchResult(div_);
	function initSearchResult(div_) {
		for(var i=0;i<Msg.length;i++){
			var table = createEle("table","search-foodtable",div_);
			var tbody = createEle("tbody","",table);
			//显示商店信息的tr(如：th_h4 即 th下的h4标签，)
			var shop_tr = createEle("tr","",tbody);
			var shop_th = createEle("th","",shop_tr);
			$(shop_th).attr({colspan:4});
			var th_h4 = createEle("h4","search-shopname",shop_th);
			var h4_a = createEle("a","",th_h4);
			h4_a.innerText = Msg[i].shopName;
			h4_a.href = "user/getBusiness.action?shopId="+Msg[i].shopId;
			var divStar = createEle("div","starrating-content",shop_th);
			var starContent = createEle("span","starrating",divStar);
            var getShopScore = Msg[i].shopScore;
			//getShopScore 输入评分； spanStar 要添加到的位置
            writeStar(getShopScore,starContent);
            var small1 = createEle("small","search-sales",shop_th);
            small1.innerText = "月售 "+Msg[i].monthSale;
            var small2 = createEle("small","search-needtime",shop_th);
            small2.innerText = "平均"+ Msg[i].sendTime +"分钟送达";
			//显示商品信息
			if(Msg[i].goodsMsg.length>0){
				for(var j=0;j<Msg[i].goodsMsg.length;j++){
	                writeGoods(i,j,tbody);
				}
			}
		}
		
    }
    //i j 获取到具体商品信息的下标，tbody父元素
    function writeGoods(i,j,tbody) {
	    var tr = createEle("tr","",tbody);
	    //第一个td
		var td1 = createEle("td","search-goodsname",tr);
		var td1_a = createEle("a","",td1);
        var td1_a_span = createEle("span","",td1_a);
        td1_a_span.innerText = Msg[i].goodsMsg[j].goodsName;
        //第二个td
		var td2 = createEle("td","search-co12",tr);
		var td2_span = createEle("span","",td2);
        td2_span.innerHTML = "&yen;"+Msg[i].goodsMsg[j].price;
        //第三个td
        var td3 = createEle("td","search-co13",tr);
        var td3_a = createEle("a","",td3);
        td3_a.innerText = "去购买";
        td3_a.href = "user/getBusiness.action?shopId="+Msg[i].shopId;
        //第四个td
        var td4 = createEle("td","search-co14",tr);
        var td4_div = createEle("div","",td4);
        writeStar(Msg[i].goodsMsg[j].goodsScore,td4_div);
        var td4_div2 = createEle("div","",td4);
        td4_div2.innerText = "月售"+ Msg[i].goodsMsg[j].monthSale +"份"

    }
    
    //写星星的方法，getShopScore分数，spanStar父元素
    function writeStar(getShopScore,spanStar) {
        //对分数进行取整（0，0.5，1，1.5之类的）
        var shopScore = Math.floor(getShopScore * 2)/2;
        //分数向上取整
        var shopScoreCeil = Math.ceil(shopScore);
        //分数向下取整
        var shopScoreFloor = Math.floor(shopScore);
        //向上取整的分数大于向下取整的分数，则有一个0.5分
        if(shopScoreCeil>shopScoreFloor){
            //写填满的星星
            for(var i=0;i<shopScoreFloor;i++){
                var iFull = createEle("i","icon Hui-iconfont",spanStar);
                iFull.innerHTML = "&#xe6ff;";
            }
            //写一半的星星
            var iHalf = createEle("i","icon Hui-iconfont",spanStar);
            iHalf.innerHTML = "&#xe701;";
            //写空的星星
            for(var j=0;j<(5-shopScoreCeil);j++){
                var iNone = createEle("i","icon Hui-iconfont",spanStar);
                iNone.innerHTML = "&#xe702;";
            }
        }else{
            //写填满的星星
            for(var i=0;i<shopScore;i++){
                var iFull = createEle("i","icon Hui-iconfont",spanStar);
                iFull.innerHTML = "&#xe6ff;";
            }
            //写空的星星
            for(var j=0;j<(5-shopScoreCeil);j++){
                var iNone = createEle("i","icon Hui-iconfont",spanStar);
                iNone.innerHTML = "&#xe702;";
            }
        }
    }
</script>

<!-- 搜索功能实现 -->
<script>
  $(function () {
	  var $searchBtn = $(".shop-search .search-btn");
	  $searchBtn.on("click",function () {
		  var input_ =  this.previousElementSibling;
		  var searchMsg = input_.value;
		  //getShowShopId从session中获取 目前显示的商家id ，获取到的类型 [1,2,3,4,5]
		  /* var getShowShopId = JSON.parse( localStorage.getItem("nearbyShopIdList") ); */
		  var getShowShopId =[];
			var shopStr=localStorage.getItem("nearbyShopIdList")
		    var shopItems=shopStr.split(",");
			for(var i=0;i<shopItems.length;i++){
				var shopItem=shopItems[i].split(":");
				var shopId=shopItem[0];
				getShowShopId.push(shopId-0);
			}
		  if(searchMsg.trim().length>0 && getShowShopId.length>0){
			  $.ajax({
	              url: "${pageContext.request.contextPath}/shopAndGoodsSearch.action",
	              type: "post",
	              contentType: "application/json",
	              dataType: "json",
	              data: JSON.stringify({searchMsg:searchMsg,nearbyShopIdList:getShowShopId}),
	              success: function (result) {
	                  //跳转页面 location.replace("pageJump.action");
	                if(result == []){
	                	alert("请先选定需要配送到的地址");
	                }
					if(result != []){
					  localStorage.setItem("searchShopsAndGoodsList", JSON.stringify(result));
	                  self.location = "jumpToSearchResultPage.action";
					}
	              },error: function (XMLResponse) {
	                  alert("内部错误");
	              }
	          });
		  }
      })
  })
			
</script>

</body>
</html>
