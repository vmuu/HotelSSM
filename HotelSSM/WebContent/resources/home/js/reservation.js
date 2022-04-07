$("#c_header").load("data/head/header.php",function(){
  navText("酒店预定");
  loginName();
});
//功能点3：异步请求数据
 /*页面加载完成后，异步请求产品列表*/
$(function(){
  loadProductByPage(1,$("#kw").val());
});

//点击页码跳转页面,绑定事件监听
$("#pages").on("click","a",function(e){
    //阻止鼠标事件
    e.preventDefault();
    var $target=$(e.target);
    $target.addClass("active").siblings(".active").removeClass("active");
    //获取要跳转的页号
    pageNum =parseInt( $("#pages>a.active").attr('href'));
    loadProductByPage(pageNum,$("#kw").val());
    //页面移动到页头
    var TOP=$("#guest_rooms").offset().top-40;
    $("body").scrollTop(TOP);
    //loadProductByPage(pageNum,type);
})
//分页加载商品数据，并动态创建分页条
function loadProductByPage(pageNum,kw){
  $.ajax({
    url: 'data/rooms_select.php',
    data:{pageNum:pageNum,kw:kw},
    success: function(pager){
      //遍历读取到分页器对象，拼接HTML，追加到DOM树
      var html = ''; 
      $.each(pager.data,function(i,room){
        html += `
                <tr>
          <td><img data-rid="${room.rid}" src="${room.rPic}" alt="">
          </td>
          <td align="center">
            <p><b> ${room.houseType}</b></p>
            <!--<p class="sub_txt"><a href="#{room.rid}">查看更多信息</a></p>-->
          </td>
          <td><p>${room.bedType=='1'?'1.8米':(room.bedType=='2'?'1.5米':'1.2米')}</p></td>
          <td>${room.cancel=='1'?'可取消':'不可取消'}</td>
          <td><p>优惠房价： <b>￥${room.proPrice}</b></p>
              <p>门市价：￥${room.RegPrice}</p>
          </td>
          <td class="status">${(room.roomNum-room.bookNum)>6?'有房':((room.roomNum-room.bookNum)==0?'空房':'紧张')}</td>
          <td class="book"><input type="button" class="booking" value="预订"></td>
        </tr>
        `;
      });
      //$('ul#room-list').html(html);
	      $("#pro_list tbody").html(html);


      $("#pro_list tbody .status").each(function (i, elem){
        var status=$("#pro_list tbody .status:eq("+i+")");
        console.log(status.html()=="空房");
        if(status.html()=="空房"){
          status.siblings(".book").children().addClass("disable");
        }
      });

     //动态生成页码
        var html="";
        html+=`
			   <a href="1" >首页</a>
                <a href=${pageNum==1?1:pageNum-1} class="">上一页</a>
			 `;
        for(var i=1;i<=pager.pageCount;i++){
            if(i==pageNum){
                html+=`
		     <a href="${i}" class="active">${i}</a>
	        ` ;
            }else{
                html+=`
		     <a href="${i}">${i}</a>
	        ` ;
            }
        }
        html+=`
		      <a href=${pageNum==pager.pageCount?pager.pageCount:pageNum+1} >下一页</a>
				<a href="${pager.pageCount}" >尾页</a>
	         `;
	   $("#pages").html(html);
	  //将上一页，下一页的href定义

    }

  });
}
//功能点：关键字搜索
 $("#search").click(function(){
   loadProductByPage(1,$("#kw").val());
 });
/*功能点：设施服务的图标*/
$("#room_loot .text-group").each(function(i,elem){
	console.log(i);
	var item=25;
	console.log("-6px"+"-"+(403+item*i)+"px");
	$("#room_loot .text-group:eq("+i+") span.label>i").css("background-position","-6px "+"-"+(403+item*i)+"px");
});

//
 $("#pro_list tbody").on("click","img",function(e){
   var rid=$(this).data('rid');
   console.log(rid);
   sessionStorage["rid"]=rid;
   //跳转到详情页
   window.location.href="room_detail.html";
});
//当房态为空房的时候，预订按钮为
$("#pro_list tbody ").on("click",".booking",function(e){
  var rid=$(this).parent().siblings().children("img").data('rid');
  console.log(rid);
  sessionStorage["rid"]=rid;
  //跳转到详情页
  window.location.href="room_detail.html";
});