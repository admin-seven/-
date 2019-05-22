<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>分量顺序</title>
<script src="../js/global.js"></script>
<script type="text/javascript">
	$(function() {
		init();
	})
	function init() {
		$("#askersTab").datagrid({
			url : 'getAskerAlls',
			method : 'post',
			pagination : true,
			singleSelect : true
		})
	}
	function formattercaozuo(value, row, index) {
		return "<a href='javascript:void(0)' onclick='set("
				+ index
				+ ")'>分配资源<a/>  <a href='javascript:void(0)' onclick='updateWeight("
				+ index + ")'>编辑权重<a/>"

	}
	function formattercaozuostu(value, row, index) {
		return "<a href='javascript:void(0)' onclick='addStuToUser(" + index
				+ ")'>设置<a/>";
	}

	function addStuToUser(index) {
		$.messagers.confirm("提示", "确认把此学生分配给该员工？", function(r) {
			if (r) {

			}
		})
	}
	/* 编辑权重 */
	function updateWeight(index){
		var datas = $("#askersTab").datagrid("getData");
		var row = datas.rows[index];
		//填充表单
		$("#updateusersFrm").form("load", row)
		//打开弹窗
		$("#updateusersDialog").dialog("open");
	}
	function set(index) {
		var data = $("#askersTab").datagrid("getData");
		var row = data.rows[index];
		//allStu
		$("#setFrm").window("setTitle", "正在设置" + row.askerName + "权限信息");
		$("#allStu").datagrid({
			url : "getStuAll",
			method : "post",
			singleSelect : true,
		});
		$("#setFrm").window("open");
	}
</script>
</head>
<body>

	<table id="askersTab" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'askerId',title:'访问者编号'"></th>
				<th data-options="field:'askerName',title:'用户名'"></th>
				<th data-options="field:'roleName',title:'用户角色'"></th>
				<th data-options="field:'checkInTime',title:'签到时间'"></th>
				<th data-options="field:'weight',title:'权重'"></th>
				<th data-options="field:'bakContent',title:'备注'"></th>
				<th
					data-options="field:'caozuo',title:'操作',formatter:formattercaozuo"></th>
		</thead>
	</table>

	<div id="setFrm" class="easyui-window"
		data-options="modal:true,closed:true"
		style="width: 400px; height: 200px;">
		<table>
			<tr>
				<td width="500px">
					<table id="allStu" class="easyui-datagrid"
						data-options="title:'尚未分配的学生',singleSelect:true">
						<thead>
							<tr>
								<th data-options="field:'id'">学生编号</th>
								<th data-options="field:'name'">学生名称</th>
								<th data-options="field:'caozuo',formatter:formattercaozuostu">操作</th>
							</tr>
						</thead>
					</table>
				</td>

			</tr>
		</table>

	</div>
</body>
</html>