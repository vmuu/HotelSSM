<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
 <meta name="Author" content="灵悟">
  <meta name="Keywords" content="灵悟酒店管理系统">
  <meta name="Description" content="灵悟酒店管理系统">
  <title>灵悟|酒店管理系统注册页面</title>
  <link href="../resources/home/css/login.css" type="text/css" rel="Stylesheet" />
  <link href="../resources/home/css/regsiter.css" type="text/css" rel="Stylesheet" />
  <link href="../resources/home/css/index.css" type="text/css" rel="Stylesheet" />
  <style>
    #ad>ul {
       margin:0;
    }
  </style>
</head>
<body>
  <!--头部-->

  <header>
    <div>
      <a href=""><img src="/HotelSSM/WebContent/resources/home/images/logo-1.jpg" alt=""> </a> <span>注册</span>
    </div>

  </header>
  <!--中间部分-->
  <div id="reg">
         <!---温馨提示-->
		 <div class="msg">
			 <div class="panel">
    <form id="user_info">
      <div class="form-group">
        <label for="uname">用户名：</label>
        <input required minlength="3" maxlength="9" type="text" placeholder="请输入用户名" autofocus name="name" id="uname"/>
        <span class="msg-default">用户名长度在3到9位之间</span>
      </div>
      <div class="form-group">
        <label for="upwd">密码：</label>
        <input type="password" minlength="6" maxlength="12" placeholder="请输入密码" name="password" id="upwd"/>
        <span class="msg-default hidden">密码长度在6到12位之间</span>
      </div>
      <div class="form-group">
        <label for="upwd2">确认密码：</label>
        <input type="password" placeholder="再次输入密码" id="upwd2"/>
        <span class="msg-default hidden">密码长度在6到12位之间</span>
      </div>
      <!--
	  <div class="form-group">
        <label for="uemail">邮箱：</label>
        <input required type="email" placeholder="请输入邮箱地址" name="uemail" id="uemail"/>
        <span class="msg-default hidden">请输入合法的邮箱地址</span>
      </div>
	  -->
      <div class="form-group">
        <label for="uphone">手机：</label>
        <input required type="tel" placeholder="请输入手机号码" name="mobile" maxlength="11" id="uphone"/>
        <span class="msg-default hidden">请输入合法的手机号码</span>
      </div>
      <div>
        <div class="form-group">
          <label></label>
          <input type="button" value="提交注册信息" id="btn_reg" style="cursor:pointer;" />
        </div>
      </div>

    </form>
  </div>
			 <div id="ad">
			    <!--<p>注册会员后，你可以:</p>-->
				<!--<ul>-->
				    <!--<li><b>1</b>查询，计划您的订单</li>-->
					<!--<li><b>2</b>预订美食，客房</li>-->
					<!--<li><b>3</b>享受超低优惠折扣</li>-->
				<!--</ul>-->
               <div class="login">
                   已有账号，去 <a href="login">登陆</a>
               </div>
				<ul id="trigger">
				  <li><img src="../resources/home/images/new1.png" alt=""></li>
				</ul>
				
			 </div>
		 </div>
  </div>
   <%@include file="../common/footer.jsp"%>
	  <script src="../resources/home/js/jquery-1.11.3.js"></script>
<script>
  /*1.对用户名进行验证*/
  var login=0;
  uname.onblur = function(){
    var val=this.value;
    if(this.validity.valueMissing){
      this.nextElementSibling.innerHTML = '用户名不能为空';
      this.nextElementSibling.className = 'msg-error';
      login=0;
      this.setCustomValidity('用户名不能为空');
    }else if(this.validity.tooShort){
      this.nextElementSibling.innerHTML = '用户名不能少于3位';
      this.nextElementSibling.className = 'msg-error';
      login=0;
      this.setCustomValidity('用户名不能少于3位');
    }else {
      this.nextElementSibling.innerHTML = '用户名格式正确';
      this.nextElementSibling.className = 'msg-success';
      login=1;
      this.setCustomValidity('');
    }

  }


  //2.对密码进行验证
  upwd.onfocus = function(){
    this.nextElementSibling.innerHTML = '密码至少为6位数字或者字符';
    this.nextElementSibling.className = 'msg-default';
    login=0;
  }
  upwd.onblur = function(){
    if(upwd.value == '' || upwd.value.length < 6){
      this.nextElementSibling.innerHTML = '密码至少为6位数字或者字符';
	  this.nextElementSibling.className = 'msg-default';
      login=0;
    }else{
		this.nextElementSibling.innerHTML = '输入正确';
		this.nextElementSibling.className = 'msg-success';
		login=1;
		this.setCustomValidity('');
	}
      
  }
  
  
  /*3.对邮箱地址进行验证
  uemail.onblur = function(){
    if(this.validity.valueMissing){
      this.nextElementSibling.innerHTML = '邮箱不能为空';
      this.nextElementSibling.className = 'msg-error';
      login=0;
      this.setCustomValidity('邮箱不能为空');
    }else if(this.validity.typeMismatch){
      this.nextElementSibling.innerHTML = '邮箱格式不正确';
      login=0;
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('邮箱格式不正确');
    }else {
      this.nextElementSibling.innerHTML = '邮箱格式正确';
      this.nextElementSibling.className = 'msg-success';
      login=1;
      this.setCustomValidity('');
    }
  }
  uemail.onfocus = function(){
    this.nextElementSibling.innerHTML = '请输入合法的邮箱地址';
    this.nextElementSibling.className = 'msg-default';
    login=0;
  }*/
  uphone.onblur = function(){
	var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
    if(this.validity.valueMissing){
      this.nextElementSibling.innerHTML = '电话号码不能为空';
      this.nextElementSibling.className = 'msg-error';
      login=0;
      this.setCustomValidity('电话号码不能为空');
    }else if(this.validity.typeMismatch){
      this.nextElementSibling.innerHTML = '电话号码格式不正确';
      this.nextElementSibling.className = 'msg-error';
      login=0;
      this.setCustomValidity('电话号码格式不正确');
    }else if(!myreg.test(uphone.value)){
		this.nextElementSibling.innerHTML = '电话号码格式不正确';
      this.nextElementSibling.className = 'msg-error';
      login=0;
      this.setCustomValidity('电话号码格式不正确');
	}
	else {
      this.nextElementSibling.innerHTML = '格式正确';
      this.nextElementSibling.className = 'msg-success';
      login=1;
      this.setCustomValidity('');
    }
  }
  uphone.onfocus = function(){
    this.nextElementSibling.innerHTML = '请输入合法的手机号码';
    this.nextElementSibling.className = 'msg-default';
    login=0;
  }
  //确认密码
  upwd2.onblur=function() {
    if (upwd2.value != upwd.value) {
      this.nextElementSibling.innerHTML = '两次密码输入不一致';
      login=0;
      this.nextElementSibling.className = 'msg-error';
    } else if (upwd2.value == upwd.value) {
      this.nextElementSibling.innerHTML = '输入正确';
      this.nextElementSibling.className = 'msg-success';
      login=1;
    }
  }
  $('#btn_reg').click(function(){
    //表单序列化，获得所有的用户输入
    if (upwd2.value != upwd.value){
    	return;
    }
    var data = $('#user_info').serialize();

    //异步提交请求数据
    $.ajax({
      type: 'POST',
      dataType:'json',
      url: 'reg',
      data: data,
      success: function(result){
        //console.log(result);
        if(result.type=='success'){
          alert('注册成功！');
          location.href='login';
        }else {
          alert(result.msg)
        }
      }
    });
  })
  
/*功能点2：轮播*/
var pic = {
  intr: function () {
    var i = 1;
    var str1 = $("#trigger img").attr("src");
    var str = str1.toString();
    var timer = setInterval(function () {
      i++;
      if (i > 3) {
        i = 1;
      }
      str = str.replace(/[1-3]/, i);
      $("#trigger img").attr("src", str);
    }, 2000);
  }
}
pic.intr();
</script>	

</body>
</html>
