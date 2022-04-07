<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>灵悟|酒店管理系统用户中心</title>
  <meta name="Author" content="灵悟">
  <meta name="Keywords" content="灵悟酒店管理系统">
  <meta name="Description" content="灵悟酒店管理系统">
  <link rel="stylesheet" href="../../resources/home/css/index.css"/>
  <!--<link rel="stylesheet" href="css/myOrder.css"/>-->
  <style>
    #contain{
      padding: 10px 0;
    }
    .tabs{
      width:162px;
      float: left;
      padding: 10px 0;
      text-align: center;
      background: #EDEDED;
    }
    .tabs li{
      line-height: 36px;
    }
    .content{
      padding: 0 10px;
      float:left;
      width: 1000px;
    }
    .content>div{
      display: none;
      width: 1000px;
    }
    .content .details{
      float:left;
      display: block;
      width: 1000px;
      /*padding:0  10px;*/
    }
    table{
      border: 1px solid #dddddd;
      border-collapse: collapse;
      width: 100%;
      margin-bottom: 20px;
    }
    table th{
      background: #F2F2F2;
    }
    #contain .content table td{
      /*width:163px;*/
      border: 1px solid #dddddd;
      text-align: center;
    }
    .details table td{
      width: 163px;
    }
    table td input[type='checkbox']{
      float:left;
    }
    table td div{
      display: inline-block;
      border:1px solid #dddddd;
      padding: 5px;
    }
    table img{
      width: 100px;
      height: 100px;
      vertical-align: middle;
    }
    h3{
      margin:10px 0;
    }
    .total{
      text-align: right;
      padding: 10px 0;
    }
    .totalPrice{
      color: #DD4C40;
      font-size: 18px;
      font-weight: bold;
      margin-right: 10px;
    }
    .price{
      color:#DD4C40;
      font-weight: bold;
    }
    .count{
      width: 30px;
      text-align: center;
    }
    .title{
      font-weight: bold;
    }
    .msg{
      color:#DD4C40;
      min-height: 200px;
      line-height: 200px;
      font-weight: bold;
      text-align: center;
      display: none;
    }
    .tabs>li>a.active{
      color: #dd0000;
    }
    .order>table th{
      text-align: left;
      padding:5px ;
    }

    #contain .content .order .product{
      max-width:110px;
    }
    #contain .content table th{
      text-align: center;
    }
    #contain .content tr.title td{
      height: 25px;
      text-align: left;
    }
    #contain .content table td{
      max-width:220px ;
    }
    #contain .content td.productImg{
      text-align: left;
    }
	.form-control {
		display: block;
		width: 700px;
		height: 20px;
		padding: 6px 12px;
		font-size: 14px;
		line-height: 1.42857143;
		color: #555;
		background-color: #fff;
		background-image: none;
		border: 1px solid #ccc;
		border-radius: 4px;
		-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
		box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
		-webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
		-o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
		transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
.btn-success {
    color: #fff;
    background-color: #5cb85c;
    border-color: #4cae4c;
}

.btn {
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
}

  </style>
</head>
<body>
    <!--头部-->
    <div id="c_header"></div>
    <!--主体-->
    <div id="contain">
        <!--tab选项卡-->
      <ul class="tabs">
       
       	<li><a href="../index">首页</a></li>
        <li><a href="#order">我的订单</a></li>
        <li><a href="#info">我的资料</a></li>
        <li><a href="#pwd">修改密码</a></li>

      </ul>

      <div class="content">
        
        <div class="order" style="display: block;">
          <table>
            <thead>
            <tr>
              <!--<th colspan="4">订单编号：</th>-->
              <!--<th colspan="2" >订单时间:</th>-->
              <th>房型图片</th>
              <th>房型</th>
              <th>入住人</th>
              <th>手机号</th>
              <th>身份证号</th>
              <th>状态</th>
              <th>下单时间</th>
              <th>备注</th>
            </tr>
            </thead>
            <tbody>
               <c:forEach items="${bookOrderList }" var="bookOrder">
               <tr>
					<c:forEach items="${roomTypeList }" var="roomType">
						<c:if test="${roomType.id == bookOrder.roomTypeId }">
							<td><img src="${roomType.photo }" width="100px"></td>
							<td>${roomType.name }</td>
						</c:if>
					</c:forEach>
					<td>${bookOrder.name }</td>
					<td>${bookOrder.mobile }</td>
					<td>${bookOrder.idCard }</td>
					<td>
						<c:if test="${bookOrder.status == 0 }">
			          		<font color="red">预定中</font>
			          	</c:if>
			          	<c:if test="${bookOrder.status == 1 }">
			          		已入住
			          	</c:if>
			          	<c:if test="${bookOrder.status == 2 }">
			          		已结算离店
			          	</c:if>
					</td>
					<td><fmt:formatDate value="${bookOrder.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${bookOrder.remark }</td>
               </tr>
               </c:forEach>
            </tbody>
          </table>
          
        </div>
        <div class="info" >
          <form id="update-info-form">
          <table style="border:0px;cellspacing:0px;">
            <tbody>
               <tr>
					<td style="border:0px;">用户名：</td><td style="float:left;width:400px;max-width: 420px;border:0px;"><input class="form-control" type="text" value="${account.name}" name="name" /></td>
               </tr>
			   <tr style="border:0px;">
					<td style="border:0px;">真实姓名：</td><td style="float:left;width:400px;max-width: 820px;border:0px;"><input class="form-control" type="text" value="${account.realName}" name="realName" /></td>
               </tr>
			   <tr>
					<td style="border:0px;">身份证号：</td><td style="float:left;width:400px;max-width: 820px;border:0px;"><input class="form-control" type="text" value="${account.idCard}" name="idCard" /></td>
               </tr>
			   <tr>
					<td style="border:0px;">手机号码：</td><td style="float:left;width:400px;max-width: 820px;border:0px;"><input class="form-control" type="text" value="${account.mobile}" name="mobile" /></td>
               </tr>
			   <tr>
					<td style="border:0px;">联系地址：</td><td style="float:left;width:400px;max-width: 820px;border:0px;"><input class="form-control" type="text" value="${account.address}" name="address" /></td>
               </tr>
			   <tr>
					<td style="border:0px;"><button type="button" id="update-info-btn" class="btn btn-success" style="width:100px;">提交</button></td><td style="float:left;width:400px;max-width: 820px;border:0px;"></td>
               </tr>
            </tbody>
          </table>
          </form>
        </div>
		<div class="pwd" >
          <table style="border:0px;cellspacing:0px;">
            <tbody>
               <tr>
					<td style="border:0px;">原密码：</td><td style="float:left;width:400px;max-width: 420px;border:0px;"><input class="form-control" type="password" id="old-password" /></td>
               </tr>
			   <tr style="border:0px;">
					<td style="border:0px;">新密码：</td><td style="float:left;width:400px;max-width: 820px;border:0px;"><input class="form-control" type="password" id="new-password" /></td>
               </tr>
			   <tr>
					<td style="border:0px;">重复密码：</td><td style="float:left;width:400px;max-width: 820px;border:0px;"><input class="form-control" type="password" id="renew-password" /></td>
               </tr>
			   
			   <tr>
					<td style="border:0px;"></td><td style="float:left;margin-top:15px;width:400px;max-width: 820px;border:0px;"><button type="button" class="btn btn-success" id="update-password-btn" style="width:100px;">提交</button></td>
               </tr>
            </tbody>
          </table>
          
        </div>
      </div>

    </div>
    <!--底部-->
    <div id="c_footer"></div>
    <script src="../../resources/home/js/jquery-1.11.3.js"></script>
 <script>
	$(".tabs").on("click","li a",function(){
    $(this).addClass("active").parents().siblings().children(".active").removeClass("active");
    var href=$(this).attr("href");
    href=href.slice(1);
    var $div=$("div.content>div."+href);
     $div.show().siblings().hide();
    //修改个人信息
     $("#update-info-btn").click(function(){
    	$.ajax({
    		url:'update_info',
    		type:'post',
    		dataType:'json',
    		data:$("#update-info-form").serialize(),
    		success:function(data){
    			alert(data.msg);
    		}
    	});
    });
    //修改密码
    $("#update-password-btn").click(function(){
    	var oldPassword = $("#old-password").val();
    	var newPassword = $("#new-password").val();
    	var renewPassword = $("#renew-password").val();
    	if(oldPassword == ''){
    		alert('请填写原密码！');
    		return;
    	}
    	if(newPassword == ''){
    		alert('请填写新密码！');
    		return;
    	}
    	if(newPassword != renewPassword){
    		alert('两次密码不一致！');
    		return;
    	}
    	$.ajax({
    		url:'update_pwd',
    		type:'post',
    		dataType:'json',
    		data:{oldPassword:oldPassword,newPassword:newPassword},
    		success:function(data){
    			alert(data.msg)
    		}
    	});
    });
});
	
</script>
    
</body>
</html>