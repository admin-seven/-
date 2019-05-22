<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>员工签到</title>
<script src="../js/global.js"></script>
<script type="text/javascript">
	$(function() {
		init();
	})
	function init() {
		$("#userCheck").datagrid({
			url : 'getUsercheckAll',
			method : 'post',
			pagination : true,
			singleSelect : true,
			toolbar : '#userchecksTool',
			queryParams : {
				userName : $("#username").val(),
				checkInTime : $('#checkTime').datebox('getValue'),
				isCancel : $('#isCancel').combobox('getValue'),
				checkOutTime : $('#checkOutTime').datebox('getValue'),
			}
		})
	}
	function shuaxin(){
		$("#userCheck").datagrid({
			url : 'getUsercheckAll',
			method : 'post',
			pagination : true,
			singleSelect : true,
			toolbar : '#userchecksTool',
			queryParams : {
				userName : "",
				checkInTime :"",
				isCancel :"",
				checkOutTime : "",
			}
		})
	}
	function formattercaozuo(value, row, index) {
		return "<a href='javascript:void(0)' onclick='qiant(" + index
				+ ")'>签出</a>";
	}
	function qiant(index) {
		var data = $("#userCheck").datagrid("getData");
		var row = data.rows[index];
if(row.isCancel == "未签出"){
	$.post("updateUserCheckQC", {
		isCancel : "已签出",
		Id : row.id
	}, function(res) {
		if (res > 0) {
			 $("#userCheck").datagrid("reload");
			$.messager.alert("提示", "签出成功");

		} else {
			$.messager.alert("提示", "签出失败");
		}
	}, "json");
}else{
	$.messager.alert("提示", "请勿重复操作");
}
	
	}
</script>
</head>
<body>
	<!-- getUsercheckAll -->
	<div id="userchecksTool">
		姓名：<input type="text" class="easyui-textbox" id="username">
		签到时间:<input type="text" class="easyui-datebox" id="checkTime">
		签出状态:<select id="isCancel" class="easyui-combobox">
			<option value="">--请选择--</option>
			<option value="已签出">已签出</option>
			<option value="未签出">未签出</option>
		</select> 签出时间:<input type="text" class="easyui-datebox" id="checkOutTime">
		<a href="javascript:void(0)" onclick="init()"
			class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
			<a href="javascript:void(0)" onclick="shuaxin()"
			class="easyui-linkbutton" data-options="iconCls:'icon-reload'">刷新</a>
	</div>
	<table id="userCheck" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'Id',title:'编号'"></th>
				<th data-options="field:'userId',title:'用户编号'"></th>
				<th data-options="field:'userName',title:'员工名称'"></th>
				<th data-options="field:'checkInTime',title:'签到时间'"></th>
				<th data-options="field:'checkState',title:'签到状态'"></th>
				<th data-options="field:'isCancel',title:'签出状态'"></th>
				<th data-options="field:'checkOutTime',title:'签出时间'"></th>

				<th
					data-options="field:'caozuo',title:'操作',formatter:formattercaozuo"></th>
		</thead>

	</table>
</body>
</html>