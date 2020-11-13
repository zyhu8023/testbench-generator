//用于注

$(function(){

	var error_name = false;
	var error_password = false;
	var error_check_password = false;
	var error_phone = false;
	var error_check = false;

	function check_user_name(){
		var $name = $('#username');
		var len = $name.val().length;
		var val = $('#username').val();
		if(val==''){
			$name.next().html('用户名不能为空！')
			$name.next().show();
			error_name = true;
			return;
		}
		if(len<3||len>20)
		{
			$name.next().html('用户名是3到15个字符');
			$name.next().show();
			error_name = true;
		}
		else 
		{
			$name.next().hide();
			error_name = false;
		}
	};

	function check_pwd(){
		var $pwd = $('#pwd');
		var len = $pwd.val().length;
		var val = $pwd.val();
		if(val==''){
			$pwd.next().html('密码不能为空！')
			$pwd.next().show();
			error_password = true;
			return;
		}
		if (len<6||len>20)
		{
			$pwd.next().html('密码长度在6-20位之间')
			$pwd.next().show();
			error_password = true;
		}
		else 
		{
			$pwd.next().hide();
			error_password = false;
		}
	};

	function check_cpwd(){
		var pass = $('#pwd').val();
		var cpass = $('#cpwd').val();

		if(pass!=cpass)
		{
			$('#cpwd').next().html('两次输入的密码不一致')
			$('#cpwd').next().show();
			error_check_password = true;
		}
		else
		{
			$('#cpwd').next().hide();
			error_check_password = false;
		}		
		
	};

	function check_phone(){
		var re = /^0?(13|14|15|17|18|19)[0-9]{9}$/
		var $phone = $('#phone');
		if(re.test($phone.val()))
		{ 
			$phone.next().hide();
			error_phone = false;
		}
		else
		{
			$phone.next().show();
			$phone.next().html('你输入的手机号码格式不对');
			error_phone = true;
		}
	};

	$('#username').blur(function() {
		check_user_name();
	});
	$('#user_name').focus(function(){
		$(this).next().hide();
	})

	$('#pwd').blur(function() {
		check_pwd();
	});
	$('#pwd').focus(function(){
		$(this).next().hide();
	})

	$('#cpwd').blur(function() {
		check_cpwd();
	});
	$('#cpwd').focus(function(){
		$(this).next().hide();
	})

	$('#phone').blur(function() {
		check_phone();
	});
	$('#phone').focus(function(){
		$(this).next().hide();
	})

	$('#allow').click(function() {
		if($(this).is(':checked'))
		{
			error_check = false;
			$(this).siblings('span').hide();
		}
		else
		{
			error_check = true;
			$(this).siblings('span').html('请勾选同意');
			$(this).siblings('span').show();
		}
	});

	$('#reg_form').submit(function() {
		check_user_name();
		check_pwd();
		check_cpwd();
		check_phone();

		if(error_name == false && error_password == false && error_check_password == false && error_phone == false && error_check == false)
		{
			return true;
		}
		else
		{
			return false;
		}

	});
})