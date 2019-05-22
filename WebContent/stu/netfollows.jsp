<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生跟踪</title>
<script src="../js/global.js"></script>
<script type="text/javascript">
	$(function() {
		init();
	})
	function init() {
		$("#netfollowsTab").datagrid({
			url : 'selectNetfollows',
			method : 'post',
			pagination : true,
			singleSelect : true,
			toolbar : '#netfollowTool',
			queryParams : {
				loginName: "${name}",
				studentName : $("#studentName").val(),
				followTime : $("#followTime").datebox('getValue'),
				nextFollowTime : $("#nextFollowTime").datebox('getValue'),
				followState : $("#followState").combobox('getValue'),
				followType : $("#followType").combobox('getValue'),
			}
		})
	}
	 function formatterfollowType(value, row, index) {
		 if (value == 1) {
				return "面谈";
			} else if (value == 2) {
				return "电话";
			} else {
				return "网络";
			}

	} 

	 function formatterfollowState(value, row, index) {
		if (value == 1) {
			return "思量";
		} else if (value == 2) {
			return "上门未报名";
		} else {
			return "报名未进班";
		}
	} 
</script>


</head>
<body>
	<!-- 显示跟踪者信息 -->
	<table id="netfollowsTab" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'id',title:'跟踪者编号'"></th>
				<th data-options="field:'studentName',title:'学生姓名'"></th>
				<th data-options="field:'followTime',title:'跟踪时间'"></th>
				<th data-options="field:'followType',title:'跟踪方式',formatter:formatterfollowType"></th>
				<th data-options="field:'content',title:'内容'"></th>
				<th data-options="field:'nextFollowTime',title:'下一次跟踪时间'"></th>
				<th
					data-options="field:'followState',title:'回访情况',formatter:formatterfollowState"></th>
				<!-- <th
					data-options="field:'caozuo',title:'操作',formatter:formattercaozuo"></th> -->
		</thead>
	</table>
	<div id="netfollowTool">
		<form id="gsy" class="easyui-form">
			<label for="name">学员名称:</label> <input class="easyui-validatebox"
				type="text" id="studentName" data-options="required:true" /> <label
				for="name">开始时间:</label> <input class="easyui-datebox" type="text"
				id="followTime" data-options="required:true" /> <label for="name">结束时间:</label>
			<input class="easyui-datebox" type="text" id="nextFollowTime"
				data-options="required:true" /> <label for="name">回访情况:</label> <select
				id="followState" class="easyui-combobox">
				<option value="">--请选择--</option>
				<option value="1">思量</option>
				<option value="2">上门未报名</option>
				<option value="3">报名未进班</option>
			</select> <label for="name">跟踪方式:</label> <select id="followType"
				class="easyui-combobox">
				<option value="">--请选择--</option>
				<option value="1">面谈</option>
				<option value="2">网络</option>
				<option value="3">电话</option>
			</select> <a href="javascript:void(0)" onclick="init()"
				class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
		</form>
		<!-- class="easyui-validatebox" -->
	</div>

</body>
</html>