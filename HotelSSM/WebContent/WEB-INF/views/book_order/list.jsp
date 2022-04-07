<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>
<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="wu-toolbar">
        <div class="wu-toolbar-button">
            <%@include file="../common/menus.jsp"%>
        </div>
        <div class="wu-toolbar-search">
            <label>预定姓名:</label><input id="search-name" class="wu-text" style="width:100px">
            <label>身份证号:</label><input id="search-idCard" class="wu-text" style="width:100px">
            <label>手机号码:</label><input id="search-mobile" class="wu-text" style="width:100px">
            <label>客户:</label>
            <select id="search-account" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<c:forEach items="${accountList}" var="account">
            	<option value="${account.id }">${account.name }</option>
            	</c:forEach>
            </select>
            <label>房型:</label>
            <select id="search-roomType" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<c:forEach items="${roomTypeList}" var="roomType">
            	<option value="${roomType.id }" price="${roomType.price }">${roomType.name }</option>
            	</c:forEach>
            </select>
            <label>状态:</label>
            <select id="search-status" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<option value="0">预定中</option>
            	<option value="1">已入住</option>
            	<option value="2">已结算离店</option>
            </select>
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- 添加弹框 -->
<div id="add-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:420px; padding:10px;">
	<form id="add-form" method="post">
        <table>
            <tr>
                <td align="right">客户:</td>
                <td>
	                <select id="add-accountId" name="accountId" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择客户'">
		            	<c:forEach items="${accountList}" var="account">
		            	<option value="${account.id }" real-name="${account.realName }" id-card="${account.idCard }" mobile="${account.mobile }">${account.name }</option>
		            	</c:forEach>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">房型:</td>
                <td>
	                <select id="add-roomTypeId" name="roomTypeId" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择房型'">
		            	<c:forEach items="${roomTypeList}" var="roomType">
		            	<option value="${roomType.id }">${roomType.name }</option>
		            	</c:forEach>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">入住人姓名:</td>
                <td><input type="text" id="add-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请输入姓名'" /></td>
            </tr>
            <tr>
                <td align="right">身份证号:</td>
                <td><input type="text" id="add-idCard" name="idCard" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请输入身份证号'"  /></td>
            </tr>
            <tr>
                <td align="right">手机号码:</td>
                <td><input type="text" id="add-mobile" name="mobile" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请输入手机号'" /></td>
            </tr>
            <tr>
                <td align="right">入住日期:</td>
                <td><input type="text" id="add-arriveDate" name="arriveDate" class="wu-text easyui-datebox easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">离店日期:</td>
                <td><input type="text" id="add-leaveDate" name="leaveDate" class="wu-text easyui-datebox easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">状态:</td>
                <td>
	                <select id="add-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择状态'">
		            	<option value="0">预定中</option>
		            	<option value="1">已入住</option>
		            	<option value="2">已结算离店</option>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">备注:</td>
                <td><textarea id="add-remark" name="remark" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
            </tr>
        </table>
    </form>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="id" id="edit-id">
        <table>
           <tr>
                <td align="right">客户:</td>
                <td>
	                <select id="edit-accountId" name="accountId" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择客户'">
		            	<c:forEach items="${accountList}" var="account">
		            	<option value="${account.id }" real-name="${account.realName }" id-card="${account.idCard }" mobile="${account.mobile }">${account.name }</option>
		            	</c:forEach>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">房型:</td>
                <td>
	                <select id="edit-roomTypeId" name="roomTypeId" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择房型'">
		            	<c:forEach items="${roomTypeList}" var="roomType">
		            	<option value="${roomType.id }">${roomType.name }</option>
		            	</c:forEach>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">入住人姓名:</td>
                <td><input type="text" id="edit-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请输入姓名'" /></td>
            </tr>
            <tr>
                <td align="right">身份证号:</td>
                <td><input type="text" id="edit-idCard" name="idCard" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请输入身份证号'"  /></td>
            </tr>
            <tr>
                <td align="right">手机号码:</td>
                <td><input type="text" id="edit-mobile" name="mobile" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请输入手机号'" /></td>
            </tr>
            <tr>
                <td align="right">入住日期:</td>
                <td><input type="text" id="edit-arriveDate" name="arriveDate" class="wu-text easyui-datebox easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">离店日期:</td>
                <td><input type="text" id="edit-leaveDate" name="leaveDate" class="wu-text easyui-datebox easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">状态:</td>
                <td>
	                <select id="edit-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择状态'">
		            	<option value="0">预定中</option>
		            	<option value="1">已入住</option>
		            	<option value="2">已结算离店</option>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">备注:</td>
                <td><textarea id="edit-remark" name="remark" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
            </tr>
        </table>
    </form>
</div>
<%@include file="../common/footer.jsp"%>

<!-- End of easyui-dialog -->
<script type="text/javascript">
	
	
	
	/**
	*  添加记录
	*/
	function add(){
		var validate = $("#add-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#add-form").serialize();
		$.ajax({
			url:'add',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','添加成功！','info');
					$("#add-name").val('');
					$("#add-remark").val('');
					$('#add-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	/**
	* 编辑记录
	*/
	function edit(){
		var validate = $("#edit-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#edit-form").serialize();
		$.ajax({
			url:'edit',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','修改成功！','info');
					$('#edit-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	
	/**
	* 删除记录
	*/
	function remove(){
		$.messager.confirm('信息提示','确定要删除该记录？', function(result){
			if(result){
				var item = $('#data-datagrid').datagrid('getSelected');
				if(item == null || item.length == 0){
					$.messager.alert('信息提示','请选择要删除的数据！','info');
					return;
				}
				
				$.ajax({
					url:'delete',
					dataType:'json',
					type:'post',
					data:{id:item.id},
					success:function(data){
						if(data.type == 'success'){
							$.messager.alert('信息提示','删除成功！','info');
							$('#data-datagrid').datagrid('reload');
						}else{
							$.messager.alert('信息提示',data.msg,'warning');
						}
					}
				});
			}	
		});
	}
	
	/**
	* Name 打开编辑窗口
	*/
	function openEdit(){
		//$('#add-form').form('clear');
		var item = $('#data-datagrid').datagrid('getSelected');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要编辑的数据！','info');
			return;
		}
		$('#edit-dialog').dialog({
			closed: false,
			modal:true,
            title: "编辑客户信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: edit
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#edit-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	//$("#add-form input").val('');
            	$("#edit-id").val(item.id);
            	$("#edit-name").val(item.name);
            	$("#edit-arriveDate").datebox('setValue',item.arriveDate);
            	$("#edit-leaveDate").datebox('setValue',item.leaveDate);
            	$("#edit-idCard").val(item.idCard);
            	$("#edit-mobile").val(item.mobile);
            	$("#edit-status").combobox('setValue',item.status);
            	$("#edit-accountId").combobox('setValue',item.accountId);
            	$("#edit-roomTypeId").combobox('setValue',item.roomTypeId);
            	$("#edit-remark").val(item.remark);
            }
        });
	}
	
	/**
	* Name 打开添加窗口
	*/
	function openAdd(){
		//$('#add-form').form('clear');
		$('#add-dialog').dialog({
			closed: false,
			modal:true,
            title: "添加客户信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: add
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#add-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	$("#add-form input").val('');
            	
            }
        });
	}
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var option = {name:$("#search-name").val()};
		var status = $("#search-status").combobox('getValue');
		var account = $("#search-account").combobox('getValue');
		var roomType = $("#search-roomType").combobox('getValue');
		if(status != -1){
			option.status = status;
		}
		if(account != -1){
			option.accountId = account;
		}
		if(roomType != -1){
			option.roomTypeId = roomType;
		}
		option.idCard = $("#search-idCard").val();
		option.mobile = $("#search-mobile").val();
		$('#data-datagrid').datagrid('reload',option);
	});
	
	
	function add0(m){return m<10?'0'+m:m }
	function format(shijianchuo){
	//shijianchuo是整数，否则要parseInt转换
		var time = new Date(shijianchuo);
		var y = time.getFullYear();
		var m = time.getMonth()+1;
		var d = time.getDate();
		var h = time.getHours();
		var mm = time.getMinutes();
		var s = time.getSeconds();
		return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
	}
	
	$("#add-accountId").combobox({
		onSelect:function(data){
			//console.log(data);
			var option = $("#add-accountId option[value='"+data.value+"']");
			$("#add-name").val(option.attr('real-name'));
			$("#add-idCard").val(option.attr('id-card'));
			$("#add-mobile").val(option.attr('mobile'));
		}
	});
	
	$("#edit-accountId").combobox({
		onSelect:function(data){
			//console.log(data);
			var option = $("#add-accountId option[value='"+data.value+"']");
			$("#edit-name").val(option.attr('real-name'));
			$("#edit-idCard").val(option.attr('id-card'));
			$("#edit-mobile").val(option.attr('mobile'));
		}
	});
	
	/** 
	* 载入数据
	*/
	$('#data-datagrid').datagrid({
		url:'list',
		rownumbers:true,
		singleSelect:true,
		pageSize:20,           
		pagination:true,
		multiSort:true,
		fitColumns:true,
		idField:'id',
	    treeField:'name',
		fit:true,
		columns:[[
			{ field:'chk',checkbox:true},
			{ field:'accountId',title:'客户',width:100,formatter:function(value,row,index){
				var accountList = $("#search-account").combobox('getData');
				for(var i=0;i<accountList.length;i++){
					if(accountList[i].value == value)return accountList[i].text;
				}
				return value;
			}},
			{ field:'roomTypeId',title:'房型',width:150,formatter:function(value,row,index){
				var roomTypeList = $("#search-roomType").combobox('getData');
				for(var i=0;i<roomTypeList.length;i++){
					if(roomTypeList[i].value == value){
						return roomTypeList[i].text + '(￥:' + $("#search-roomType option[value='"+value+"']").attr('price') + ')';
					}
				}
				return value;
			}},
			{ field:'name',title:'预定人',width:60,sortable:true},
			{ field:'idCard',title:'身份证号',width:100,sortable:true},
			{ field:'mobile',title:'手机号',width:100,sortable:true},
			{ field:'arriveDate',title:'入住日期',width:100,sortable:true},
			{ field:'leaveDate',title:'离店日期',width:100,sortable:true},
			{ field:'status',title:'状态',width:100,formatter:function(value,row,index){
				switch(value){
					case 0:{
						return '预定中';
					}
					case 1:{
						return '已入住';
					}
					case 2:{
						return '已结算离店';
					}
				}
				return value;
			}},
			{ field:'createTime',title:'预定时间',width:150,formatter:function(value,row,index){
				return format(value);
			}},
			{ field:'remark',title:'备注',width:120,sortable:true}
		]]
	});
	
</script>