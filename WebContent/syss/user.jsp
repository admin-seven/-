<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理</title>
<script src="../js/global.js"></script>
<script type="text/javascript">
	$(function() {
		init();
	})
	function init() {
		$("#usersTab").datagrid({
			url : 'getUserAlls',
			method : 'post',
			pagination : true,
			singleSelect : true,
			toolbar : '#usersTool',
			queryParams : {
				userName : $("#userName").val(),
				startTime : $("#startTime").datetimebox('getValue'),
				endTime : $("#endTime").datetimebox('getValue'),
				isclose : $("#isLockOut").combobox('getValue')
			}
		})
	}
	function formattercaozuo(value, row, index) {
		return "<a href='javascript:void(0)' onclick='set("
				+ index
				+ ")'>设置<a/>  <a href='javascript:void(0)' onclick='update("
				+ index
				+ ")'>修改<a/>  <a href='javascript:void(0)' onclick='deletes("
				+ index
				+ ")'>删除<a/>  <a href='javascript:void(0)' class='easyui-linkbutton'  onclick='RestPasUesr("
				+ index + ")'>重置密碼</a> "

	}

	function RestPasUesr(index) {

		var rows = $("#usersTab").datagrid('getData').rows[index];
		var resetPassword = rows.resetPassword;
		var id = rows.id;
		$.post("ResetUserPas", {
			passWord : "ysd123",
			id : id
		}, function(res) {
			if (res > 0) {
				$('#usersTab').datagrid('reload');
				$.messager.alert("提示", "密碼重置成功");
			} else {
				$.messager.alert("提示", "密碼重置失败");
			}
		})
	}
	/* 打开添加的对话框 */
	function add() {
		$("#addusersDialog").dialog("open");
	}
	/* 添加用户 */
	function addUsersSubmit() {
		var flag = $("#addusersDialog").form("validate");
		if (flag) {
			$.post("addAllUsers", {
				loginName : $("#loginName").val(),
				passWord : $("#passWord").val(),
				protectEmail : $("#protectEmail").val(),
				protectMTel : $("#protectMTel").val()
			}, function(res) {
				if (res > 0) {
					$('#usersTab').datagrid('reload');
					$('#addusersDialog').dialog("close");
					$.messager.alert("提示","新增成功!!!!")
				} else {
					$.messager.alert("提示", "该用户已存在,请勿重复添加！");
				}
			}, "json")
		} else {
			$.messager.alert("提示", "请完善您要添加的数据！！！");
		}

	}
	/* 取消添加的对话框 */
	function addUsersClose() {
		$('#addusersDialog').dialog("close");
	}
	/* 删除用户 */
	function deletes(index) {
		var datas = $("#usersTab").datagrid("getData");
		var row = datas.rows[index];
		$.messager.confirm('确认删除', '您确认想要删除吗？', function(r) {
			if (r) {
				$.post("deleteAllUsers", {
					id : row.id
				}, function(res) {
					if (res > 0) {
						$('#usersTab').datagrid('reload');
						$.messager.alert('提示', '删除成功！！！');
					}
				}, "json")
			}
		});
	}
	/* 修改用户信息 */
	function update(index) {
		var datas = $("#usersTab").datagrid("getData");
		var row = datas.rows[index];
		//填充表单
		$("#updateusersFrm").form("load", row)
		//打开弹窗
		$("#updateusersDialog").dialog("open");
	}
	function updateUsersSubmit() {
		$.post("updateAllUsers", {
			id : $("#id1").val(),
			loginName : $("#loginName1").val(),
			protectEmail : $("#protectEmail1").val(),
			protectMTel : $("#protectMTel1").val()
		}, function(res) {
			if (res > 0) {
				$('#usersTab').datagrid('reload');
				$('#updateusersDialog').dialog("close");
				$.messager.alert('提示',"修改成功!!!!")
			} else {
				$.messager.alert('提示',"修改失败!!!!")
			}
		}, "json")
	}
	/* 取消修改的对话框 */
	function updateUsersClose() {
		$('#updateusersDialog').dialog("close");
	}
	function formatterisLockOut(value, row, index) {
		return value == 1 ? '是' : '否';
	}
	function suodingisLockOut(value, rows, index) {
		return rows.isLockOut == 1 ? "锁定" : "未锁定"
	}
	function suoding(value, row, index) {
		return '<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="suodingYonghu('
				+ index
				+ ')">锁定用户</a>   <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="jiesuoYonghu('
				+ index + ')">解锁用户 </a>'
	}

	function suodingYonghu(index) {
		var id = $("#usersTab").datagrid('getData').rows[index].id;
		var isLockOut = $("#usersTab").datagrid('getData').rows[index].isLockOut;
		if (isLockOut == 0) {
			$.post("OpenCloseUser", {
				id : id,
				isLockOut : 1
			}, function(res) {
				if (res > 0) {
					$('#usersTab').datagrid('reload');
					$.messager.alert("提示", "用户锁定成功");
				} else {
					$.messager.alert("提示", "该用户锁定失败");
				}
			})
		} else {
			alert("该用户已被锁定")
		}

	}
	function jiesuoYonghu(index) {
		var id = $("#usersTab").datagrid('getData').rows[index].id;
		var isLockOut = $("#usersTab").datagrid('getData').rows[index].isLockOut;
		if (isLockOut == 1) {
			$.post("OpenCloseUser", {
				id : id,
				isLockOut : 0
			}, function(res) {
				if (res > 0) {
					$('#usersTab').datagrid('reload');
					$.messager.alert("提示", "用户解锁成功");
				} else {
					$.messager.alert("提示", "解锁失败");
				}
			})
		} else {
			alert("该用户未被锁定")
		}

	}

	//查询网络咨询师
	function WLZSH() {
		$("#usersTab").datagrid({
			url : 'getUserByRolesId',
			method : 'post',
			pagination : true,
			singleSelect : true,
			toolbar : '#usersTool',
			queryParams : {
				roleId : 2
			}
		})

	}
	//查询咨询师
	function ZSH() {
		$("#usersTab").datagrid({
			url : 'getUserByRolesId',
			method : 'post',
			pagination : true,
			singleSelect : true,
			toolbar : '#usersTool',
			queryParams : {
				roleId : 3
			}
		})
	}
	function ZSHJL() {
		$("#usersTab").datagrid({
			url : 'getUserByRolesId',
			method : 'post',
			pagination : true,
			singleSelect : true,
			toolbar : '#usersTool',
			queryParams : {
				roleId : 4
			}
		})
	}
	//设置角色权限
	var a;
	function set(index) {
		a=index;
		var data = $("#usersTab").datagrid("getData");
		var row = data.rows[index];
		$("#setFrm").window("setTitle", "正在设置" + row.LoginName + "权限信息");
		$("#allrole").datagrid({
			url : "getRolesAll",
			method : "post",
			singleSelect : true,
		});
		$("#myrole").datagrid({
			url : "getuRoles",
			method : "post",
			singleSelect : true,
			queryParams : {
				id : row.id
			}
		});
		$("#setFrm").window("open");
	}

	function reload() {
		init();
	}
	
	function addUserToRole(){
		var d = $("#usersTab").datagrid("getData");
		var data = d.rows[a];
		var row = $("#allrole").datagrid("getSelected");
		if(row) {
			$.post("addUserRole", {
				userId: data.id,
				roleId: row.id,
			}, function(res) {
				if(res>0) {
					if(res ==10){
						$.messager.alert("提示", "请勿做无效操作！！！")
					}
					$("#myrole").datagrid("reload");
				}else{
					$.messager.alert("提示", "赋予失败！！！")
				}
			}, "json")
		} else {
			$.messager.alert("提示", "请选择！！！")
		} 
	}
	function delUserToRole(){
		var d = $("#usersTab").datagrid("getData");
		var data = d.rows[a];
		var row = $("#myrole").datagrid("getSelected");
		if(row) {
			$.post("delUserRole", {
				userId: data.id,
				roleId: row.id,
			}, function(res) {
				if(res>0) {
					$("#myrole").datagrid("reload");
				}
			}, "json")
		} else {
			$.messager.alert("提示", "请选择！！！")
		}
	}
</script>
</head>
<body>
	<!-- 工具条 -->
	<div id="usersTool">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="reload()" data-options="iconCls:'icon-reload'">刷新表</a> <a
			href="javascript:void(0)" class="easyui-linkbutton" onclick="WLZSH()">网络咨询师</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="ZSH()">咨询师</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="ZSHJL()">咨询师经理</a>
			<a href="javascript:void(0)" onclick="add()"
				class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
		<form id="gsy" class="easyui-form">
			 <label
				for="name">用户名:</label> <input class="easyui-validatebox"
				type="text" id="userName" data-options="required:true" /> <label
				for="name">创建起止时间:</label> <input class="easyui-datetimebox"
				type="text" id="startTime" data-options="required:true" /> <label
				for="name">创建结束时间:</label> <input class="easyui-datetimebox"
				type="text" id="endTime" data-options="required:true" /> <label
				for="name">是否锁定:</label> <select id="isLockOut"
				class="easyui-combobox">
				<option value=" ">--请选择--</option>
				<option value="1">锁定</option>
				<option value="2">未锁定</option>

			</select> <a href="javascript:void(0)" onclick="init()"
				class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
		</form>
		<!-- class="easyui-validatebox" -->
	</div>
	<!-- 显示用户信息 -->
	<table id="usersTab" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'id',title:'用户编号'"></th>
				<th data-options="field:'loginName',title:'登录名'"></th>
				<th data-options="field:'passWord',title:'密码'"></th>
				<th
					data-options="field:'isLockOut',title:'是否锁定',formatter:suodingisLockOut"></th>
				<th data-options="field:'lastLoginTime',title:'最后一次登陆时间'"></th>
				<th data-options="field:'createTime',title:'账户创建时间'"></th>
				<th data-options="field:'psdWrongTime',title:'密码错误次数'"></th>
				<th data-options="field:'lockTime',title:'被锁定时间'"></th>
				<th data-options="field:'protectEmail',title:'密保邮箱'"></th>
				<th data-options="field:'protectMTel',title:'密保手机号'"></th>
				<th data-options="field:'suoding',formatter:suoding">账号锁定</th>
				<th data-options="field:'resetPassword',hidden:true">重置密码</th>
				<th
					data-options="field:'caozuo',title:'操作',formatter:formattercaozuo"></th>
		</thead>
	</table>

	<!-- 添加用户信息 -->
	<div id="addusersDialog" class="easyui-dialog"
		data-options="modal:true,closed:true">
		<form id="addusersFrm" class="easyui-form">
			<table>
				<tr>
					<td><label for="name">登录名:</label></td>
					<td><input class="easyui-validatebox" type="text"
						id="loginName" name="loginName" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">密码:</label></td>
					<td><input class="easyui-validatebox" type="text"
						id="passWord" name="passWord" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">密保邮箱:</label></td>
					<td><input class="easyui-validatebox" type="text"
						id="protectEmail" name="protectEmail" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">密保手机号:</label></td>
					<td><input class="easyui-validatebox" type="text"
						id="protectMTel" name="protectMTel" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="addUsersSubmit()">提交</a></td>
					<td><a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="addUsersClose()">取消</a></td>
				</tr>
			</table>
		</form>

	</div>
	<!-- 修改用户信息 -->
	<div id="updateusersDialog" class="easyui-dialog"
		data-options="modal:true,closed:true">
		<form id="updateusersFrm" class="easyui-form">
			<table>
				<tr>
					<td><label for="name">用户编号:</label></td>
					<td><input disabled="disabled" class="easyui-validatebox"
						type="text" id="id1" name="id" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">登录名:</label></td>
					<td><input disabled="disabled" class="easyui-validatebox"
						type="text" id="loginName1" name="loginName"
						data-options="required:true" /></td>
				</tr>

				<tr>
					<td><label for="name">密保邮箱:</label></td>
					<td><input class="easyui-validatebox" type="text"
						id="protectEmail1" name="protectEmail"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td><label for="name">密保手机号:</label></td>
					<td><input class="easyui-validatebox" type="text"
						id="protectMTel1" name="protectMTel" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="updateUsersSubmit()">提交</a></td>
					<td><a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="updateUsersClose()">取消</a></td>
				</tr>
			</table>
		</form>

	</div>

	<!-- 所有角色 -->
	<div id="setFrm" class="easyui-window"
		data-options="modal:true,closed:true"
		style="width: 500px; height: 600px;">
		<table>
			<tr>
				<td width="200px">
					<table id="allrole" class="easyui-datagrid"
						data-options="title:'所有角色',singleSelect:true">
						<thead>
							<tr>
								<th data-options="field:'name',width:150">角色名称</th>
							</tr>
						</thead>
					</table>
				</td>
				<td width="100px"><a href="javascript:void(0)"
					class="easyui-linkbutton" onclick="addUserToRole()">--></a><br />
					<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="delUserToRole()"> <--</a></td>
				<td width="200px" valign="top">
					<table id="myrole" class="easyui-datagrid"
						data-options="title:'当前角色',singleSelect:true">
						<thead>
							<tr>
								<th data-options="field:'name',width:150">角色名称</th>
							</tr>
						</thead>
					</table>
				</td>
			</tr>
		</table>

	</div>

</body>
</html>