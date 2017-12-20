$(document).ready(function() {

	$('#businessForm').bootstrapValidator({
		message : '值不可用',
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			/***************密码框***************/
			password : {
				validators : {
					notEmpty : {
						message : '请输入原密码！'
					},
				}
			},
			newPassword : {
				validators : {
					notEmpty : {
						message : '请输入新密码！'
					},
					different : {
						field : 'password',
						message : '新密码不能和原密码一样!'
					},
				}
			},
			newPassword2 : {
				validators : {
					notEmpty : {
						message : '请再次输入新密码！'
					},
					identical : {
						field : 'newPassword',
						message : '再次输入的密码跟新密码不一样！'
					},
					different : {
						field : 'password',
						message : '新密码不能和原密码一样!'
					},
				}
			},
			/***************商店信息***************/
			shopName : {
				validators : {
					notEmpty : {
						message : '商店名不可为空！'
					},
				}
			},
		},
	});


});

function alertBox(str,title){
	  $.gDialog.alert(str, {
	    title: title,
	    animateIn: "bounceIn",
	    animateOut: "bounceOut"
	  }); 
	};
function confirmBox(str,title){
	$.gDialog.confirm(str, {
		title: title,
		animateIn : "bounceInDown",
		animateOut: "bounceOutUp"
	});
}


function delConfirm() {
	if(confirmBox("确定删除该商品？","提示")){
		return true;
	}
	return false;
	};

/*********************************商店尚未审核**********************************/
function noAudit() {
	alertBox("您的商店正在审核中，不可编辑！","警告");
}
/******************************添加商品****************************/

/******************************添加商品类型****************************/

/**********************删除商品类型***********************/


/**************************************数字加减********************************************/

function servicenumUp() {
	var invalue = parseFloat($("#serviceinput").val()) + 1.0;
	if (invalue <= 10)
		$("#serviceinput").val(invalue);else {
		alertBox("服务范围不可超过10公里","警告");
		$("#serviceinput").val(10.0);
	}

}
;

$("#serviceinput").onblur(function(){
	if($("#serviceinput").val()>10){
		alertBox("服务范围不可超过10公里","警告");
		$("#serviceinput").val(10.0);
	}
})

function servicenumDown() {
	if ($("#serviceinput").val() > 0) {
		$("#serviceinput").val(parseFloat($("#serviceinput").val()) - 1.0);
	}
}
;

function deliverynumUp() {
	$("#deliveryinput").val(parseFloat($("#deliveryinput").val()) + 1.0).toFixed(1);
}
;
function deliverynumDown() {
	if ($("#deliveryinput").val() > 0) {
		$("#deliveryinput").val(parseFloat($("#deliveryinput").val()) - 1.0).toFixed(1);
	}
}
;

function startnumUp() {
	$("#startinput").val(parseFloat($("#startinput").val()) + 1.0);
}
;
function startnumDown() {
	if ($("#startinput").val() > 0) {
		$("#startinput").val(parseFloat($("#startinput").val()) - 1.0);
	}
}
;

/************************************图片预览*******************************************/
function preview(file) {
	var prevDiv = document.getElementById('preview');
	if (file.files && file.files[0]) {
		var reader = new FileReader();
		reader.onload = function(evt) {
			prevDiv.innerHTML = '<img class="img-thumbnail img-responsive" style="width: 200px;" src="' + evt.target.result + '" />';
		}
		reader.readAsDataURL(file.files[0]);
	} else {
		prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
	}
}
function previewBig(file) {
	var prevDiv = document.getElementById('previewBig');
	if (file.files && file.files[0]) {
		var reader = new FileReader();
		reader.onload = function(evt) {
			prevDiv.innerHTML = '<img class="img-thumbnail img-responsive" style="width: 300px;" src="' + evt.target.result + '" />';
		}
		reader.readAsDataURL(file.files[0]);
	} else {
		prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
	}
}
function preview1(file) {
	var prevDiv = document.getElementById('preview1');
	if (file.files && file.files[0]) {
		var reader = new FileReader();
		reader.onload = function(evt) {
			prevDiv.innerHTML = '<img class="img-thumbnail img-responsive" style="width: 200px;" src="' + evt.target.result + '" />';
		}
		reader.readAsDataURL(file.files[0]);
	} else {
		prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
	}
}
function preview2(file) {
	var prevDiv = document.getElementById('preview2');
	if (file.files && file.files[0]) {
		var reader = new FileReader();
		reader.onload = function(evt) {
			prevDiv.innerHTML = '<img class="img-thumbnail img-responsive" style="width: 200px;" src="' + evt.target.result + '" />';
		}
		reader.readAsDataURL(file.files[0]);
	} else {
		prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
	}
}
function preview3(file) {
	var prevDiv = document.getElementById('preview3');
	if (file.files && file.files[0]) {
		var reader = new FileReader();
		reader.onload = function(evt) {
			prevDiv.innerHTML = '<img class="img-thumbnail img-responsive" style="width: 200px;" src="' + evt.target.result + '" />';
		}
		reader.readAsDataURL(file.files[0]);
	} else {
		prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
	}
}
function preview4(file) {
	var prevDiv = document.getElementById('preview4');
	if (file.files && file.files[0]) {
		var reader = new FileReader();
		reader.onload = function(evt) {
			prevDiv.innerHTML = '<img class="img-thumbnail img-responsive" style="width: 200px;" src="' + evt.target.result + '" />';
		}
		reader.readAsDataURL(file.files[0]);
	} else {
		prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
	}
}
function preview5(file) {
	var prevDiv = document.getElementById('preview5');
	if (file.files && file.files[0]) {
		var reader = new FileReader();
		reader.onload = function(evt) {
			prevDiv.innerHTML = '<img class="img-thumbnail img-responsive" style="width: 200px;" src="' + evt.target.result + '" />';
		}
		reader.readAsDataURL(file.files[0]);
	} else {
		prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
	}
}