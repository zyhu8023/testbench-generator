$(function(){
	$add = $('.converter-wrapper');
	$files = $('.files_container');
	// $('#file_add').click(function(){
	// 	if($add.css('display') == 'block')
	// 	{
	// 		$add.css('display','none');
	// 		$files.css('display','block');
	// 	}
	// });
//删除
	var $ul = $('.data-table-wrapper');
	// var $del = $('#quit').children();
	$ul.delegate('a','click',function(){
		var $del = $('#quit').children();
		$(this).parents('li').remove();
		if($ul.has("li").length == 0)
		{
			$add.css('display','block');
			$files.css('display','none');
		}
	});
//添加
	// $files_add = $('#add_btn');

	// $files_add.click(function(){
	// 	var $li = '<li class="row"><div class="col-xs-4" id="name">LED.v</div><div class="col-xs-2" id="path">到	<em>>></em>	LED_INST.v</div><div class="col-xs-1"><div id="ready">准备好了</div></div><div class="col-xs-4" id="size">2.31KB</div><div class="col-xs-1" id="quit"><a href="#">X</a></div></li>'
	// 	$ul.append($li);
	// })

//登录
	$('.login').click(function(){
		$('.logoin_pop').show();
		//阻止事件冒泡
		// return false;

	});
	// $('.pop').click(function(){
	// 	return false;
	// });

	$('.close').click(function(){
		$('.logoin_pop').hide();
	})

	$(".file").on("change","input[type='file']",function(){
	    var $msg = $('.file').find('span');
	    var filePath=$(this).val();
	    if(filePath.indexOf("v")!=-1)
	    {
	    	var arr=filePath.split('\\');
        	var fileName=arr[arr.length-1];
	    	$msg.html(fileName);
	    }
	    else
	    {
	    	$msg.html('添加更多文件');
	    }

	    

	})

})







