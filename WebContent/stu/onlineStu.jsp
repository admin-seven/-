<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>网络学生</title>
<script src="../js/global.js"></script>
<script type="text/javascript"
	src="../js/jquery-easyui-1.4.3/datagrid-export.js"></script>
<script type="text/javascript">
	$(function() {
		init();
	})
	function init() {
		$("#studentTab").datagrid({
			url : 'selectOnline',
			method : 'post',
			pagination : true,
			singleSelect : true,
			toolbar : '#tabBar',
			queryParams : {
				name : $("#name").val(),
				sex : $("#sex").combobox("getValue"),
				age : $("#age").val(),
				phone : $("#phone").val(),
				isValid : $("#isValid").combobox("getValue"),
				qq : $("#qq").val(),
				weixin : $("#weixin").val()
			}
		})
	}

	function formattersex(value, row, index) {
		return value == 1 ? "男" : "女";
	}

	function formatterstate(value, row, index) {
		return value == 1 ? "状态无" : "状态有";
	}
	function formatterisHome(value, row, index) {
		return value == 1 ? "已上门" : "未上门";
	}

	function formatterisValid(value, row, index) {
		return value == 1 ? "有效" : "无效";
	}

	function formatterisReturnVist(value, row, index) {
		return value == 1 ? "已回访" : "未回访";
	}
	function formatterisBaoBei(value, row, index) {
		return value == 1 ? "已报备" : "未报备";
	}

	//导出excel
	function exportExcel() {
		$('#studentTab').datagrid('toExcel', 'a.xls'); // export to excel
	}
	//打开设置隐藏列对话框
	function lookstu() {
		$("#hiddenColumn_dialog").dialog("open");
	}
	function saveColumn() {
		var cbx = $("#hiddenColumn_form input[type='checkbox']"); //获取Form里面是checkbox的Object
		var checkedValue = "";
		var unCheckValue = "";
		for (var i = 0; i < cbx.length; i++) {
			if (cbx[i].checked) {//获取已经checked的Object
				if (checkedValue.length > 0) {
					checkedValue += "," + cbx[i].value; //获取已经checked的value

				} else {
					checkedValue = cbx[i].value;
				}
			}
			if (!cbx[i].checked) {//获取没有checked的Object
				if (unCheckValue.length > 0) {
					unCheckValue += "," + cbx[i].value; //获取没有checked的value

				} else {
					unCheckValue = cbx[i].value;
				}
			}
		}
		var checkeds = new Array();
		if (checkedValue != null && checkedValue != "") {
			checkeds = checkedValue.split(',');
			for (var i = 0; i < checkeds.length; i++) {
				$('#studentTab').datagrid('hideColumn', checkeds[i]); //隐藏相应的列
			}

		}
		var unChecks = new Array();

		if (unCheckValue != null && unCheckValue != "") {
			unChecks = unCheckValue.split(',');
			for (var i = 0; i < unChecks.length; i++) {
				$('#studentTab').datagrid('showColumn', unChecks[i]); //显示相应的列
			}
		}
		$('#hiddenColumn_dialog').dialog('close');
	}
	//关闭设置隐藏列弹框
	function closed_hiddenColumn() {
		$('#hiddenColumn_dialog').dialog('close');
	}
	//全选按钮
	function ChooseAll() {

		var a = $("#isQuanXuan").text();//获取按钮的值
		if ("全选" == a.trim()) {
			$("#hiddenColumn_form input[type='checkbox']")
					.prop("checked", true);//全选
			$('#isQuanXuan').linkbutton({
				text : '全不选'
			});
		} else {
			$("#hiddenColumn_form input[type='checkbox']").removeAttr(
					"checked", "checked");//取消全选
			$('#isQuanXuan').linkbutton({
				text : '全选'
			});
		}

	}

	function formattercaozuo(value, row, index) {
		return "   <a href='javascript:void(0)' onclick='chakan(" + index
				+ ")'>查看</a>  <a href='javascript:void(0)' onclick='zhuizong("
				+ index + ")'>追踪</a>";

	}
	/* 新建学员窗口 */
	function addStu() {
		$("#add-dialog").dialog("open");
	}
	/* 学员窗口取消 */
	function clearStu() {
		$("#add-dialog").dialog("close");
	}

	/* 保存新建学员 */
	function bcStu() {
		$.post("addOnlineStu", {
			createTime : $("#addcreateTime").combobox("getValue"),
			name : $("#addname").val(),
			sex : $("#addsex").combobox("getValue"),
			age : $("#addage").val(),
			phone : $("#addphone").val(),
			status : $("#addstatus").val(),
			netPusherId : $("#addnetPusherId").val(),
			state : $("#addstate").combobox("getValue"),
			formPart : $("#addformPart").val(),
			qq : $("#addqq").val(),
			weixin : $("#addwx").val(),
			isBaoBei : $("#addisBaoBei").combobox("getValue"),
			homeTime : $("#addhomeTime").datetimebox("getValue")
		}, function(res) {
			if (res > 0) {
				$("#tabStu").datagrid("reload");
				$("#add-dialog").dialog("close");
				$.messager.alert("提示", "新增成功")
			} else {
				$.messager.alert("提示", "新增失败")
			}
		}, "json")
	}
	/* 查看 */
	function chakan(index) {
		var data = $("#studentTab").datagrid("getData");
		var row = data.rows[index];
		$("#chakan-frm").form("load", row);
		$("#chakan-dialog").dialog("open");
	}

	function closeStu() {
		$("#chakan-dialog").dialog("close");
	}

	/* 跟踪 */
	var studentName;
	function zhuizong(index) {
		$("#genzongDialog").dialog("open");
		var arr = $("#studentTab").datagrid("getData");
		var row = arr.rows[index];
		$("#genzong-frms").form("load", row);
		$("#genzongDialog").window("setTitle", "正在对" + row.name + "添加跟踪");
		studentName = row.name;

	}
	/* 提交跟踪 */
	function follerSubmit() {
		$.post("zzStu", {
			studentId : $("#GZid").val(),
			studentName : studentName,
			/* name : $("#name").val(), */
			followType : $("#followType").combobox("getValue"),
			content : $("#content").val(),
			followTime : $("#followTime").datetimebox('getValue'), 
			followState : $("#followState").combobox("getValue")
		}, function(res) {
			if (res > 0) {
				$("#genzongDialog").dialog("close");
				$("#studentTab").datagrid("reload");
				$.messager.alert("提示", "新增成功")

			} else {
				$.messager.alert("提示", "新增失败")
			}
		}, "json")
	}

	/* 关闭跟踪 */
	function follerClose() {
		$("#genzongDialog").dialog("close");
	}
</script>
</head>
<body>
	<div id="tabBar">
		名称:<input type="text" class="easyui-textbox" id="name" /> 性别：<select
			id="sex" class="easyui-combobox" name="是否有效">
			<option value=" ">---请选择---</option>
			<option value="1">男</option>
			<option value="2">女</option>
		</select> 年龄：<input type="text" class="easyui-textbox" id="age" /> 电话：<input
			class="easyui-textbox" type="text" id="phone"> QQ：<input
			type="text" class="easyui-textbox" id="qq"> 微信：<input
			type="text" class="easyui-textbox" id="weixin"> 是否报备：<select
			id="isValid" class="easyui-combobox" name="是否有效">
			<option value=" ">---请选择---</option>
			<option value="1">已报备</option>
			<option value="2">未报备</option>
		</select> <a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="lookstu()" data-options="iconCls:'icon-tip'">显示</a> <a
			href="javascript:void(0)" onclick="init()" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">搜索</a> <a
			href="javascript:void(0)" onclick="addStu()"
			class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a><a
			class="easyui-linkbutton" plain="true" onclick="exportExcel()"
			id="serach" data-options="iconCls:'icon-print'">导出excel</a>

	</div>
	<table id="studentTab" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'id',title:'ID'"></th>
				<th data-options="field:'createTime',title:'创建时间'"></th>
				<th data-options="field:'name',title:'学员姓名'"></th>
				<th data-options="field:'ziXunName',title:'咨询师姓名'"></th>
				<th data-options="field:'sex',title:'性别',formatter:formattersex"></th>
				<th data-options="field:'age',title:'年龄'"></th>
				<th data-options="field:'phone',title:'学员电话'"></th>
				<th data-options="field:'status',title:'学历'"></th>
				<th
					data-options="field:'state',title:'个人状态',formatter:formatterstate"></th>
				<th data-options="field:'address',title:'所在地域'"></th>
				<th data-options="field:'qq',title:'学院QQ'"></th>
				<th data-options="field:'weixin',title:'微信'"></th>
				<th data-options="field:'formPart',title:'来源部门'"></th>
				<th
					data-options="field:'isValid',title:'是否有效',formatter:formatterisValid"></th>
				<th
					data-options="field:'isReturnVist',title:'是否回访',formatter:formatterisReturnVist"></th>
				<th
					data-options="field:'isHome',title:'是否上门',formatter:formatterisHome"></th>
				<th
					data-options="field:'isBaoBei',title:'是否报备',formatter:formatterisBaoBei"></th>
				<th data-options="field:'homeTime',title:'上门时间'"></th>
				<th data-options="field:'caozuo',title:'操作',formatter:formattercaozuo"></th>
		</thead>
	</table>
	<!-- 设置隐藏列 -->
	<div id="hiddenColumn_dialog" class="easyui-dialog"
		data-options="title:'设置隐藏列',modal:true,closed:'true',
			buttons:[{
				text:'保存',
				handler:function(){
				saveColumn();<!-- 保存 -->
				initStu();<!-- 刷新 -->
				closed_hiddenColumn();<!-- 关闭弹窗 -->
				}
			},{
				text:'关闭',
				handler:function(){
				closed_hiddenColumn();
				}
			}]">
		<form style="width: 450px; height: 150px;" id="hiddenColumn_form"
			class="easyui-form">
			<a href="javascript:void()" class="easyui-linkbutton" id="isQuanXuan"
				onclick="ChooseAll()" data-options="iconCls:'icon-edit'">全选</a>
			<table>
				<tr>
					<td><input type="checkbox" value="createTime" />创建时间</td>

					<td><input type="checkbox" value="name" />姓名</td>

					<td><input type="checkbox" value="sex" />性别</td>

					<td><input type="checkbox" value="age" />年龄</td>
				</tr>
				<tr>
					<td><input type="checkbox" value="phone" />电话</td>

					<td><input type="checkbox" value="ziXunName" />咨询师姓名</td>

					<td><input type="checkbox" value="status" />学历</td>

					<td><input type="checkbox" value="state" />个人状态</td>
				</tr>
				<tr>
					<td><input type="checkbox" value="homeTime" />上门时间</td>

					<td><input type="checkbox" value="isBaoBei" />是否报备</td>

					<td><input type="checkbox" value="isHome" />是否上门</td>

					<td><input type="checkbox" value="isReturnVist" />是否回访</td>
				</tr>
				<tr>


					<td><input type="checkbox" value="qq" />QQ</td>

					<td><input type="checkbox" value="weixin" />微信</td>
					<td><input type="checkbox" value="formPart" />来源部门</td>
					<td><input type="checkbox" value="isValid" />是否有效</td>
				</tr>


			</table>
		</form>
	</div>

	<!-- 添加  -->
	<div id="add-dialog" class="easyui-dialog"
		style="width: 370px; height: 300px"
		data-options="title:'新建网络学员窗口',modal:true,closed:true,
					buttons:[{
						text:'保存',
						handler:function(){bcStu()}
					},{
						text:'关闭',
						handler:function(){clearStu()}
					}]">
		<form>
			<table>
				<thead>
					<tr>
						<td><label for="name">创建时间:</label></td>
						<td><input class="easyui-datetimebox" type="text"
							id="addcreateTime" /></td>
					</tr>
					<tr>
						<td><label for="name">姓名:</label></td>
						<td><input class="easyui-validatebox" type="text"
							id="addname" /></td>
					</tr>

					<tr>
						<td><label for="name">性别:</label></td>
						<td><select id="addsex" class="easyui-combobox">
								<option value="">---请选择---</option>
								<option value="1">男</option>
								<option value="2">女</option>
						</select></td>
					</tr>

					<tr>
						<td><label for="name">年龄:</label></td>
						<td><input class="easyui-validatebox" type="text" id="addage" />
						</td>
					</tr>

					<tr>
						<td><label for="name">电话:</label></td>
						<td><input class="easyui-validatebox" type="text"
							id="addphone" /></td>
					</tr>

					<tr>
						<td><label for="name">学历:</label></td>
						<td><input class="easyui-validatebox" type="text"
							id="addstatus" /></td>
					</tr>

					<tr>
						<td><label for="name">个人状态:</label></td>
						<td><select id="addstate" class="easyui-combobox">
								<option value=" ">---请选择---</option>
								<option value="2">有状态</option>
								<option value="1">无状态</option>
						</select></td>
					</tr>



					<tr>
						<td><label for="name">来源部门:</label></td>
						<td><input class="easyui-validatebox" type="text"
							id="addformPart" /></td>
					</tr>



					<tr>
						<td><label for="name">学员QQ:</label></td>
						<td><input class="easyui-validatebox" type="text" id="addqq" />
						</td>
					</tr>

					<tr>
						<td><label for="name">微信号:</label></td>
						<td><input class="easyui-validatebox" type="text" id="addwx" />
						</td>
					</tr>

					<tr>
						<td><label for="name">是否报备:</label></td>
						<td><select id="addisBaoBei" class="easyui-combobox">
								<option value=" ">---请选择---</option>
								<option value="1">已报备</option>
								<option value="2">未报备</option>
						</select></td>
					</tr>
					<tr>
						<td><label for="name">上门时间:</label></td>
						<td><input class="easyui-datetimebox" type="text"
							id="addhomeTime" /></td>
					</tr>


				</thead>
			</table>
		</form>
	</div>

	<!-- 查看   -->
	<div id="chakan-dialog" class="easyui-dialog"
		style="width: 300px; height: 300px"
		data-options="title:'学员信息窗口',modal:true,closed:true,
					buttons:[{
						text:'关闭',
						handler:function(){closeStu()}
					}]">
		<form id="chakan-frm">
			<table>
				<thead>
					<tr>
						<td><label for="name">ID:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="id" /></td>
					</tr>
					<tr>
						<td><label for="name">创建时间:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="createTime" /></td>
					</tr>
					<tr>
						<td><label for="name">学员姓名:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="name" /></td>
					</tr>
					<tr>
						<td><label for="name">学员电话:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="phone" /></td>
					</tr>
					<tr>
						<td><label for="name">性别:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="sex" /></td>
					</tr>
					<tr>
						<td><label for="name">年龄:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="age" /></td>
					</tr>
					<tr>
						<td><label for="name">学历:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="status" /></td>
					</tr>
					<tr>
						<td><label for="name">个人状态:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="state" /></td>
					</tr>
					<tr>
						<td><label for="name">姓名（咨询）:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="ziXunName" /></td>
					</tr>
					<tr>
						<td><label for="name">所在区域:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="address" /></td>
					</tr>
					<tr>
						<td><label for="name">微信:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="weixin" /></td>
					</tr>
					<tr>
						<td><label for="name">学员QQ:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="qq	" /></td>
					</tr>
					<tr>
						<td><label for="name">来源部门:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="learnForward" /></td>
					</tr>
					<tr>
						<td><label for="name">是否报备:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="isBaoBei" /></td>
					</tr>
					<tr>
						<td><label for="name">是否有效:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="isValid" /></td>
					</tr>
					<tr>
						<td><label for="name">是否回访:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="isReturnVist" /></td>
					</tr>
					<tr>
						<td><label for="name">是否上门:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="isHome" /></td>
					</tr>
					<tr>
						<td><label for="name">上门时间:</label></td>
						<td><input class="easyui-validatebox" readonly="readonly"
							type="text" name="homeTime" /></td>
					</tr>



				</thead>
			</table>
		</form>
	</div>

	<!-- 添加跟踪信息 -->
	<div id="genzongDialog" class="easyui-dialog"
		data-options="modal:true,closed:true">
		<form id="genzong-frms" class="easyui-form" title="跟踪的窗口">
			<table>

				<tr>
					<td><label for="name">id:</label></td>
					<td><input class="easyui-numberbox" type="text" id="GZid"
						name="id" data-options="required:true" /></td>
				</tr>
				<!-- <tr>
					<td><label for="name">id:</label></td>
					<td><input class="easyui-numberbox" type="text" id="GZUid"
						name="id" data-options="required:true" /></td>
				</tr> -->
				<!-- <tr>
					<td><label for="name">学生姓名:</label></td>
					<td><input class="easyui-textbox" type="text" id="name12"
						name="name" data-options="required:true" /></td>
				</tr> -->
				<tr>
					<td><label for="name">跟踪方式:</label></td>
					<td><select id="followType" class="easyui-combobox">
							<option value="">---请选择---</option>
							<option value="在线">在线</option>
							<option value="网站浏览">网站浏览</option>
					</select></td>
				</tr>


				<tr>
					<td><label for="name">内容:</label></td>
					<td><input class="easyui-validatebox" type="text" id="content"
						data-options="required:true" /></td>
				</tr>
			  	<tr>
					<td><label for="name">跟踪时间:</label></td>
					<td><input class="easyui-datetimebox" type="text"
						id="followTime" data-options="required:true" /></td>
				</tr>  
				<!-- <tr>
					<td><label for="name">回访情况:</label></td>
					<td><input class="easyui-validatebox" type="text"
						id="followState" data-options="required:true" /></td>
				</tr> -->

				<tr>
					<td><label for="name">回访情况:</label></td>
					<td><select id="followState" class="easyui-combobox">
							<option value="">---请选择---</option>
							<option value="已跟踪">已跟踪</option>
							<option value="未跟踪">未跟踪</option>
					</select></td>
				</tr>
				<tr>
					<td><a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="follerSubmit()">提交</a></td>
					<td><a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="follerClose()">取消</a></td>
				</tr>
			</table>
		</form>

	</div>


</body>
</html>




