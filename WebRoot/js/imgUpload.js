 jQuery(function($){
    // Create variables (in this scope) to hold the API and image size
    // 创建变量(在这个范围内)来保存API和图像大小
   		var jcrop_api,
        boundx,        //原始图片的宽度
        boundy,        //原始图片的高度
        // Grab some information about the preview pane
        // 获取关于预览面板的一些信息
        $preview = $('#preview-pane'),
        $pcnt = $('#preview-pane .preview-container'),
        $pimg = $('#preview-pane .preview-container img'),

        xsize = $pcnt.width(),      //剪切后的图片的边框宽度
        ysize = $pcnt.height();     //剪切后的图片的边框高度
    
    console.log('init',[xsize,ysize]);
    $('#target').Jcrop({
      onChange: updatePreview,
      onSelect: updatePreview,
      aspectRatio: xsize / ysize
    },function(){
      // Use the API to get the real image size
      // 使用API获取真实的图像大小
      var bounds = this.getBounds();
      boundx = bounds[0];
      boundy = bounds[1];
      // Store the API in the jcrop_api variable
      // 将API存储在jcrop_apiAPI变量中
      jcrop_api = this;
      // Move the preview into the jcrop container for css positioning
      //将预览移动到jcrop物容器中，用于css定位，将预览移到css位置的jcrop裁剪容器中。
      $preview.appendTo(jcrop_api.ui.holder);
    });

    function updatePreview(c)
    {
      if (parseInt(c.w) > 0)
      {
        var rx = xsize / c.w;
        var ry = ysize / c.h;
         /* $('#w').val(c.w);
         $('#h').val(c.h);
         $('#x1').val(c.x);
         $('#y1').val(c.y);
         $('#x2').val(c.x+c.w);
         $('#y2').val(c.y+c.h); */
         $('#w').val(c.w);
         $('#h').val(c.h);
         $('#x').val(c.x);
         $('#y').val(c.y);
         $('#x2').val(c.x+c.w);
         $('#y2').val(c.y+c.h);

        $pimg.css({
          width: Math.round(rx * boundx) + 'px',
          height: Math.round(ry * boundy) + 'px',
          marginLeft: '-' + Math.round(rx * c.x) + 'px',
          marginTop: '-' + Math.round(ry * c.y) + 'px'
        });
      }
    };
    
    //上传图片
    $("#userImg")[0].addEventListener('change', function(){
         var formData =new FormData($("#form1")[0]);
         $.ajax({
       		 type:'post',
       		 url:'user/imgUpload.action',
       		 //contentType:'application/json;charset=utf-8',
       		 data:formData,
       		 async: false,  
       		 cache: false,  
       		 contentType: false,  
       		 processData: false, 
       		 success:function(data){
       			/*$("#target").attr("src", data);
       			$("#img-target").attr("src", data);
       			$(".jcrop-holder img:first").attr("src", data);*/
       			$("img").attr("src","upload/"+data);
       			$("#oldImgPath").val(data);
       		 },
       	 	 error: function(data){
             alert("图片上传失败！");
             }
       	  });
    });
    
  });