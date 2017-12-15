<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
     <title></title>
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="icon/iconfont.css">
    <link href="icon/icon.css" rel="stylesheet" type="text/css">
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
        ul,li{
            list-style: none;
            text-decoration: none;
        }
        em{
            font-style: normal;
            font-weight: 400;
            font-size: 14px;
        }
        /*-------------全局设置 结束-------------------*/


        /*---------------main部分 开始-------------------*/
        .shop-main{
            margin-top: 20px;
        }
        .shop-main .shop-menu-main{
            margin-top: 0;
        }
        .shop-main .menu-main-content{

        }
        .shop-main .shop-cart{
            z-index: 102;
            position: fixed;
            right: 0;
            bottom: 0;
            width: 320px;
            height: 46px;
            font-size: 14px;
        }



        .goods .btn-wrapper {
            float: right;
            display: inline-block;
            vertical-align: middle;
        }

        .btn-wrapper .btn-control {
            font-size: 0;
        }

        .btn-control .cart-add, .cart-decrease {
            display: inline-block;
            padding: 6px;
            line-height: 24px;
            font-size: 24px;
            color: rgb(0, 160, 220);
        }

        .btn-control .cart-count {
            display: inline-block;
            padding-top: 6px;
            vertical-align: top;
            text-align: center;
            font-size: 10px;
            line-height: 24px;
            color: rgb(147, 153, 159);
        }




        .shop-cart .shop-cartbasket{
            top:0px;
            height: auto;
            z-index: 1;
            position: absolute;
            width: 100%;
            background-color: #fff;
            box-shadow: 0 1px 15px #ccc;
        }
        .shop-cart .shop-grouphead{
            padding: 12px 10px;
            height: 45px;
            position: relative;
            border-bottom: 1px solid #eee;
            font-size: 14px;
        }
        .shop-cart .single{
            background-color: #FAFAFA;
            border-top: 2px solid #0089dc;
        }
        .shop-cart .shop-grouphead-row{
            height: 30px;
        }
        .shop-cart .shop-grouphead-row>a{
            color: #0089dc;
            display: inline-block;
            margin-left: 10px;
        }
        .shop-cart .shop-cartbasket-tablerow{
            display: table;
            table-layout: fixed;
            height: 45px;
            width: 100%;
            padding: 0 10px;
            /*margin-top: -1px;*/
            font-size: 14px;
        }
        .shop-cartbasket-tablerow .cell.itemname{
            width: 50%;
            margin-right: 10px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            color: #666;
        }
        .shop-cartbasket-tablerow .cell{
            display: table-cell;
            vertical-align: middle;
            border-bottom: 1px solid #eee;
        }
        .shop-cartbasket-tablerow .cell.itemquantity{
            width: 35%;
            text-align: center;
            font-size: 0;
        }
        .shop-cartbasket-tablerow  .cell.itemtotal{
            text-align: center;
            color: #f17530;
        }
        .shop-cart .shop-cartfooter{
            z-index: 2;
            position: relative;
            cursor: pointer;
            height: 46px;
            background-color: #2c2c2c;
            box-shadow: 0 1px 3px #2c2c2c;
        }
        .shop-cart .icon-cart{
            position: relative;
            width: 40px;
            text-align: center;
            color: #FFF;
            font-size:20px;
            display: inline-block;
            vertical-align: middle;
        }
        .shop-cart .shop-cartpieces{
            position: absolute;
            top: -6px;
            left: 22px;
            height: 16px;
            line-height: 14px;
            min-width: 16px;
            border-radius: 50%;
            font-size: 12px;
            text-align: center;
            background-color: #ff2828;
            color: #FFF;
            font-weight: 700;
        }
        .price{
            font-size: 24px;
            color: #FFF;
            display: inline-block;
            vertical-align: middle;
            margin-left: 2px;
            padding: 0 6px;
        }
        .shop-cart .shop-cartfooter-text{
            position: relative;
            font-size: 12px;
            margin-left: 2px;
            padding: 0 6px;
            color: #999;
            border-left: 1px solid #555;
            line-height: 1;
            display: inline-block;
            vertical-align: middle;
            box-sizing: border-box;
        }
        .shop-cart .shop-cartfooter-checkout{
            position: absolute;
            top: 0;
            bottom: 0;
            right: 0;
            border: 0;
            outline: 0;
            width: 120px;
            text-align: center;
            font-weight: 700;
        }
        .shop-cart .shop-cartfooter-checkout.disable{
            background-color: #e4e4e4;
            color: #333;
            cursor: auto;
        }
        .shop-cart .shop-cartfooter-checkout.enable{
            background-color: #51d862;
            color: #FFF;
            cursor: pointer;
        }
        /*---------------main部分 结束-------------------*/

    </style>
</head>
<body>

<div id="big-box">
        <div class="container shop-main">
            <div class="shop-menu">
                <div class="shop-menu-main">
                    <div class="menu-main-content">
                        <div><input class="change" type="button" value="change"></div>
                        <div>
                            <div class="goods">
                                <img src="http://fuss10.elemecdn.com/d/03/7288c8e4da156666553239f034f15jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85" alt="">
                                <span class="goods-name" data-id="1">青菜</span>
                                <span class="goods-price">￥10</span>
                            </div>
                            <div class="goods">
                                <img src="http://fuss10.elemecdn.com/d/03/7288c8e4da156666553239f034f15jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85" alt="">
                                <span class="goods-name" data-id="2">米饭</span>
                                <span class="goods-price">￥2</span>
                            </div>
                            <div class="goods">
                                <img src="http://fuss10.elemecdn.com/d/03/7288c8e4da156666553239f034f15jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85" alt="">
                                <span class="goods-name" data-id="3">魔力</span>
                                <span class="goods-price">￥99</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
            create();
            function create(_UserId,_StopId,_minPrice) {
                $(".change").on("click",function () {
                    getStopId = 9;
                })

                //创建元素方法
                function createEle(eleName,className,parent) {
                    var create  = document.createElement(eleName);
                    className ? create.className = className:'';
                    parent? parent.appendChild(create):'';
                    return create;
                }
                //从session中获取getUserId、getStopId
                var getUserId = 1;
                var getStopId = 7;
                //起送价
                var minPrice = 20;
                //是否可以支付
                var isPay = false;
                //购物车商品数组
                var shopCartFoods = [];
                //初始化购物车
                var shopCartEl = initShopCart();
                //按钮添加到页面
                initBtn()
                //绑定支付按钮
                pay();
                function initShopCart() {
                    var parent = $(".shop-menu")[0];
                    var div = createEle("div","",parent);
                    var shopCart = createEle("div","shop-cart",div);


                    var shopCartbasket = createEle("div","shop-cartbasket",shopCart);
                    var shopCartbasketInner = createEle("div","",shopCartbasket);
                    var shopGrouphead = createEle("div","shop-grouphead single",shopCartbasketInner);
                    var shopGroupheadRow = createEle("div","shop-grouphead-row",shopGrouphead);
                    shopGroupheadRow.innerHTML = '购物车'+'<a href="#">[清空]</a>';
                    var empty = shopGroupheadRow.querySelectorAll("a")[0];

                    var shopCartfooter = createEle("div","shop-cartfooter",shopCart)
                    var iconCart = createEle("span","icon-cart",shopCartfooter);
                    iconCart.innerHTML = '<i class="icon Hui-iconfont">&#xe6b9;</i>';

                    var shopCartpieces = createEle("span","shop-cartpieces",iconCart);
                    var price = createEle("p","price",shopCartfooter);
                    var shopCartfooterText = createEle("div","shop-cartfooter-text",shopCartfooter);
                    var shopCartfooterCheckout = createEle("button","shop-cartfooter-checkout",shopCartfooter);

                    //方便调用 声明购物车元素对象
                    var cartObj = {
                        num:shopCartpieces,//购买数量
                        price:price,//商品总价格
                        desc:shopCartfooterText,//配送费
                        pay:shopCartfooterCheckout,//购买按钮
                        empty:empty,//清空
                        cartList:shopCartbasket,//购物车列表
                        emptyBox:shopGrouphead//清空按键父元素

                    }
                    //隐藏商品数量
                    cartObj.num.style.display ="none";
                    cartObj.num.innerText = 0;
                    //设置配送费
                    cartObj.desc.innerHTML = '配送费¥1';
                    //设置商品总价格
                    cartObj.price.innerText = 0;
                    //设置支付按钮
                    cartObj.pay.innerText = '购物车是空的';

                    //点击购物车显示、隐藏
                    $(shopCartfooter).on("click",function () {
                        shopCartClick();
                    });
                    //清空购物车
                    $(empty).on("click",function () {
                        $(".menu-main-content .goods").each(function () {
                            var dec = $(this).find(".cart-decrease.icon-remove_circle_outline")[0];
                            dec.style.display ='none';
                            var count = $(this).find(".cart-count")[0];
                            count.innerHTML = 0;
                            count.style.display ='none';
                        })
                        shopCartFoods = [];
                        refreshShopCart();
                        removeLocalStorage();
                        //阻止冒泡
                        return false;
                    });
                    return cartObj;
                }
                //点击购物车，弹出、隐藏购物列表
                function shopCartClick(type) {
                    var top = parseInt($(shopCartEl.cartList).css("top"));
                    if(type=="up"){
                        var setTop = 0;
                        $(shopCartEl.cartList).children("div").each(function () {
                            setTop += $(this).outerHeight();
                        })
                        var setTop = -setTop;
                        $(shopCartEl.cartList).animate({top:setTop},0)
                    }else if(type=="down"){
                        var setTop = 0;
                        $(shopCartEl.cartList).children("div").each(function () {
                            setTop += $(this).outerHeight();
                        })
                        var setTop = -setTop;
                        $(shopCartEl.cartList).animate({top:setTop},0)
                    }else{
                        if(top == 0 || top == null){
                            var setTop = 0;
                            $(shopCartEl.cartList).children("div").each(function () {
                                setTop += $(this).outerHeight();
                            })
                            var setTop = -setTop;
                            $(shopCartEl.cartList).animate({top:setTop},0)
                        }else{
                            $(shopCartEl.cartList).animate({top:0},0)
                        }
                    }
                }
                //绑定按键事件
                function initBtn() {
                    var goodsDiv = $("div.goods");
                    for(var i=0;i<goodsDiv.length;i++){
                        var btnWarpper = createEle("div","btn-wrapper",goodsDiv[i]);
                        var btnControl = creatBtnControl(decCartControl, addCartControl, 0);
                        btnWarpper.appendChild(btnControl);
                    }
                }
                // 创建 按钮组建
                function creatBtnControl(decFn, addFn, count) {
                    var btnControl = createEle("div","btn-control","");
                    //减号按钮
                    var cartDec = createEle("div","cart-decrease icon-remove_circle_outline",btnControl);
                    cartDec.style.display = count ? 'inline-block' : 'none';
                    $(cartDec).on("click",decFn);
                    //按钮数量
                    var cartCount = createEle("div","cart-count",btnControl)
                    cartCount.style.display = count ? 'inline-block' : 'none';
                    cartCount.innerHTML = count ? count : 0;
                    //加号
                    var cartAdd = createEle("div","cart-add icon-add_circle",btnControl)
                    $(cartAdd).on("click",addFn);
                    return btnControl;
                }
                //添加商品
                function addCartControl() {
                    //数量span
                    var count = this.previousElementSibling;
                    //减号span
                    var cartDec = count.previousElementSibling;
                    //获取 当前按钮的商品信息
                    var info = getThisGoodsInfo(this);
                    //判断是否是同一个商店的 ， 不是就清空
                    if(shopCartFoods.length>0){
                        for(var i=0;i<shopCartFoods.length;i++){
                            if(shopCartFoods[i].stopId != getStopId){
                                shopCartEl.empty.click();
                            }
                        }
                    }
                    //获取 数量
                    var value = info.num;
                    //数量 自身先加1 再赋值给页面元素
                    count.innerHTML = ++value;
                    // 因为数量增加  展示减号元素 和 count元素
                    count.style.display = 'inline-block';
                    cartDec.style.display = 'inline-block';
                    // TODO: 准备好一个数组 把 商品信息添加到数组内
                    var newInfo = getThisGoodsInfo(this);
                    var index = hasItem(shopCartFoods, newInfo);

                    if (index != -1) {
                        shopCartFoods[index] = newInfo; //存在替换
                    } else {
                        shopCartFoods.push(newInfo)
                    }
                    //刷新购物车
                    refreshShopCart()
                    //添加商品购物车窗口变化
                    shopCartClick("up")
                    //存储购物车信息
                    saveLocalStorage(shopCartFoods);
                }
                //删除商品
                function decCartControl() {
                    //数量span
                    var count = this.nextElementSibling;
                    //获取 当前按钮的商品信息
                    var info = getThisGoodsInfo(this);
                    //获取 数量
                    var value = info.num;
                    //数量 自身先加1 再赋值给页面元素
                    --value;
                    // 因为数量为零 展示减号元素 和 count元素
                    if (value <= 0) {

                        value = 0;

                        count.style.display = 'none';

                        this.style.display = 'none';
                    }

                    count.innerHTML = value+"";

                    // TODO: 准备好一个数组 更新商品信息
                    var newInfo =getThisGoodsInfo(this);
                    var index = hasItem(shopCartFoods, newInfo)
                    if (value == 0 && index != -1) {
                        shopCartFoods.splice(index, 1);
                    } else if (value != 0 && index != -1) {
                        shopCartFoods[index] = newInfo
                    }

                    //刷新购物车
                    refreshShopCart()
                    //当商品减少到0的时候，购物车缩下去
                    shopCartClick("down")
                    //把购物车信息存储在localStorage
                    saveLocalStorage(shopCartFoods);
                }
                //TODO:更新购物车组建
                function refreshShopCart() {
                    //用来记录用户购买了多少件商品
                    var count = 0;
                    //记录商品总价
                    var totalPrice = 0;

                    if (shopCartFoods.length == 0) {
                        shopCartEl.cartList.style.top = 0;
                    }
                    for (var i = 0; i < shopCartFoods.length; i++) {
                        count += shopCartFoods[i].num;
                        totalPrice += shopCartFoods[i].num * shopCartFoods[i].price;
                    }
                    shopCartEl.price.innerHTML = '&yen;' + totalPrice;
                    //根据数量处理 购物车数量
                    shopCartEl.num.innerHTML = count;
                    if (count > 0) {
                        shopCartEl.num.style.display = 'block';
                    } else {
                        shopCartEl.num.style.display = 'none';
                    }
                    //根据总价处理 支付按钮
                    if (totalPrice >= minPrice) {
                        isPay = true;
                        shopCartEl.pay.className = 'shop-cartfooter-checkout enable';
                        shopCartEl.pay.innerHTML = '去结算'
                    } else if (totalPrice > 0) {
                        isPay = false;
                        shopCartEl.pay.className = 'shop-cartfooter-checkout enable';
                        shopCartEl.pay.innerHTML = '&yen;' + minPrice + '起送'
                    }else{
                        isPay = false;
                        shopCartEl.pay.className = 'shop-cartfooter-checkout disable';
                        shopCartEl.pay.innerHTML = '购物车是空的';
                    }
                    //创建(更新)购物车列表
                    createShopCartList()
                }
                //TODO:创建购物车详情列表
                function createShopCartList() {
                    //当你有了数据变更时 把所有元素删除掉重新添加一遍
                    shopCartEl.cartList.innerHTML = "";
                    shopCartEl.cartList.appendChild(shopCartEl.emptyBox);
                    for (var i = 0; i < shopCartFoods.length; i++) {
                        var shopCartbasketTablerow = createEle("div","shop-cartbasket-tablerow",shopCartEl.cartList);
                        var itemname = createEle("div", "cell itemname", shopCartbasketTablerow);
                        itemname.innerHTML = shopCartFoods[i].name;
                        $(itemname).attr({"data-id":shopCartFoods[i].id})
                        var itemquantity = createEle("div", "cell itemquantity", shopCartbasketTablerow);
                        // 创建btncontrol
                        var btnControl = creatBtnControl(shopCartControlDec, shopCartControlAdd, shopCartFoods[i].num)
                        itemquantity.appendChild(btnControl);
                        //这种商品的总价格
                        var itemtotal = createEle("div", "cell itemtotal", shopCartbasketTablerow);
                        itemtotal.innerText = "¥"+(shopCartFoods[i].price*shopCartFoods[i].num);
                    }
                }
                //TODO:购物车列表中的 加号按钮点击事件
                function shopCartControlAdd() {
                    var findSpan = $(".menu-main-content").find('span[data-id="'+ getThisGoodsId(this) +'"]')
                    var findBtn = $(findSpan).siblings(".btn-wrapper").find(".cart-add.icon-add_circle")[0]
                    findBtn.click();
                }
                //TODO:购物车列表中的 减号按钮点击事件
                function shopCartControlDec() {
                    var findSpan = $(".menu-main-content").find('span[data-id="'+ getThisGoodsId(this) +'"]')
                    var findBtn = $(findSpan).siblings(".btn-wrapper").find(".cart-decrease.icon-remove_circle_outline")[0]
                    findBtn.click();
                }
                //在菜单列表中，获取该按钮的商品信息
                function getThisGoodsInfo(that) {

                    var $box = $(that).closest(".goods");
                    var goodsId = parseInt($box.find(".goods-name")[0].getAttribute("data-id"));
                    var goodsName = $box.find(".goods-name")[0].innerText;
                    var reg = /[0-9]{1,10}[\.]?[0-9]{0,2}$/g;
                    var goodsPrice = parseInt(reg.exec($box.find(".goods-price")[0].innerText)[0]);
                    var num = parseInt($box.find(".cart-count")[0].innerText);//该商品在购物车的数量
                    var info = {
                        id:goodsId,
                        name:goodsName,
                        price:goodsPrice,
                        num:num,
                        userId:getUserId,
                        stopId:getStopId
                    }
                    return info;
                }
                //在购物车列表中，获取该按键的商品id
                function getThisGoodsId(that) {
                    var $itemname = $(that).closest(".shop-cartbasket-tablerow");
                    var goodsId = $itemname.find(".cell.itemname")[0].getAttribute("data-id");
                    return goodsId;
                }
                // 购物车商品数组中是否已经存放了该元素
                function hasItem(arr, item) {
                    for (var i = 0; i < arr.length; i++) {
                        if(arr[i].name == item.name){
                            return i;
                        }
                    }
                    return -1;
                }
                //支付
                function pay() {
                    $(shopCartEl.pay).on("click",function () {
                        //ajax请求
                        if(isPay){
                        	over = shopCartFoods.length;
                           readMeg();
			               function readMeg() {
			                    // shopCartFoods
			                    for(var i=0;i<shopCartFoods.length;i++){
				                    for(var j=0;j<shopCartFoods[i].num;j++){
					                    var setSend ={
				                            id:""+shopCartFoods[i].id,
				                            name:shopCartFoods[i].name,
				                            price:""+shopCartFoods[i].price,
				                            userId:""+shopCartFoods[i].userId,
				                            shopId:""+shopCartFoods[i].stopId
				                        }
				                        sendMsg("add",setSend);
				                    }  
			                    }
			                }
                        }
                        //阻止冒泡
                        return false;
                    })
                }
        
        var over;//判断购物列表里面的东西有没有全部放进数据库了（来源：购物车商品的数量；当为0时，全部写入购物车）
        function sendMsg(type,data){
                var switchType = {
                    add:function () {
                        $.ajax({
                            url:"${pageContext.request.contextPath}/shopCartAddGoods.action",
                            type:"post",
                            dataType:"json",
                            data:data,
                            success:function(result){
                                if(result.result == "success"){
                                	console.log("添加商品没问题");
                                	console.log(over);
                                	over -=1;
                                	if(!over){
                                		alert("购物成功");
                                		removeLocalStorage();
	                               		location.replace("pageJump.action");
                                	}
                                }else if(result.result == "fail"){
                                	console.log("添加商品有问题")
                                }
                            },
                            error:function(XMLResponse){alert(XMLResponse.responseText)}
                        });
                    },
                    dec:function () {},
                    empty:function () {}
                }
                switchType[type]();
            }

//没什么卵用 ，弄起来超烦
                //购物车信息存localStorage
                function saveLocalStorage(obj) {
                    localStorage.setItem("shopcart"+getUserId, JSON.stringify(obj));
                }
                //从localStorage获取购物车信息
                function getLocalStorage() {
                    return JSON.parse( localStorage.getItem("shopcart"+getUserId) );
                }
                //清空该用户的localStorage
                function removeLocalStorage() {
                    localStorage.removeItem("shopcart"+getUserId)
                }
            }
    })
</script>
<!--模拟用户操作-->
<script>
    $(function () {
        var getUserId = 1;
        var getLocalStorage = JSON.parse( localStorage.getItem("shopcart"+getUserId) );
        if(getLocalStorage && getLocalStorage!=[]){
            for(var i=0;i<getLocalStorage.length;i++){
                var id = getLocalStorage[i].id ;
                var num =  getLocalStorage[i].num;
                for(var j=0;j<num;j++){
                    var findSpan = $(".menu-main-content").find('span[data-id="'+ id +'"]');
                    var findBtn = $(findSpan).siblings(".btn-wrapper").find(".cart-add.icon-add_circle")[0]
                    findBtn.click();
                }
            }
        }

    })
</script>
</body>
</html>