<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/global.js"></script>
<script type="text/javascript"
	src="../js/jquery-easyui-1.4.3/datagrid-export.js"></script>
<script type="text/javascript">
	function formattersex(value, row, index) {
		return value == 1 ? "男" : "女";
	}

	function formatterstate(value, row, index) {
		return value == 1 ? "状态无" : "状态有";
	}

	function formatterisValid(value, row, index) {
		return value == 1 ? "有效" : "无效";
	}

	function formatterisReturnVist(value, row, index) {
		return value == 1 ? "已回访" : "未回访";
	}

	function formatterisHome(value, row, index) {
		return value == 0 ? "已上门" : "未上门";
	}

	function formatterisPay(value, row, index) {
		return value == 1 ? "已缴费" : "未缴费";
	}

	function formatterisReturnMoney(value, row, index) {
		return value == 0 ? "已退费" : "未退费";
	}

	function formatterisInClass(value, row, index) {
		return value == 0 ? "已进班" : "未进班";
	}

	function formatterisDel(value, row, index) {
		return value == 0 ? "已删除" : "未删除";
	}

	function formatterisBaoBei(value, row, index) {
		return value == 1 ? "已报备" : "未报备";
	}

	$(function() {
		initStu();
	})

	function initStu() {
		$("#tabStu").datagrid({
			url : "getStu",
			method : "post",
			fitColumns : true,
			toolbar : "#tabBar",
			singleSelect : true,
			pagination : true,
			queryParams : {
				name : $("#name").val(),
				phone : $("#phone").val(),
				ziXunName : $("#ziXunName").val(),
				isPay : $("#isPay").combobox("getValue"),
				isValid : $("#isValid").combobox("getValue"),
				isReturnVist : $("#isReturnVist").combobox("getValue"),
				qq : $("#qq").val(),
				createTime : $("#createTime").datebox('getValue'),
				homeTime : $("#homeTime").datebox('getValue'),
				firstVistTime : $("#firstVistTime").datebox('getValue'),
				payTime : $("#payTime").datebox('getValue'),
				inClassTime : $("#inClassTime").datebox('getValue')
			}

		})
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

		$.post("addStu", {
			name : $("#addname").val(),
			sex : $("#addsex").combobox("getValue"),
			age : $("#addage").val(),
			phone : $("#addphone").val(),
			status : $("#addstatus").val(),
			state : $("#addstate").combobox("getValue"),
			msgSource : $("#addly").val(),
			sourceUrl : $("#addwz").val(),
			sourceKeyWorld : $("#addgj").val(),
			qq : $("#addqq").val(),
			weixin : $("#addwx").val(),
			isBaoBei : $("#addisBaoBei").combobox("getValue"),
			content : $("#addbz").val()
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

	function formattercaozuo(value, row, index) {
		return "<a href='javascript:void(0)' onclick='edit(" + index
				+ ")'>编辑</a>   <a href='javascript:void(0)' onclick='chakan("
				+ index
				+ ")'>查看</a>  <a href='javascript:void(0)' onclick='genzong("

				+ index + ")'>追踪</a>";
	}
	/* 跟踪 */
	var studentName;
	function genzong(index) {
		$("#genzongDialog").dialog("open");
		var arr = $("#tabStu").datagrid("getData");
		var row = arr.rows[index];
		$("#genzong-frms").form("load", row);
		$("#genzongDialog").window("setTitle", "正在对" + row.name + "添加跟踪");
		studentName = row.name;

	}
	/* 提交跟踪 */
	function follerSubmit() {
		$.post("zzStu", {
			studentId : $("#GZid").val(),
			studentName:studentName,
			/* name : $("#name").val(), */
			followType : $("#followType").combobox("getValue"),
			content : $("#content").val(),
			followTime : $("#followTime").datetimebox('getValue'),
			followState : $("#followState").combobox("getValue")
		}, function(res) {
			if (res > 0) {
				$("#genzongDialog").dialog("close");
				$("#tabStu").datagrid("reload");
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
	function chakan(index) {
		var data = $("#tabStu").datagrid("getData");
		var row = data.rows[index];
		$("#chakan-frm").form("load", row);
		$("#chakan-dialog").dialog("open");
	}

	function closeStu() {
		$("#chakan-dialog").dialog("close");
	}

	function edit(index) {
		var data = $("#tabStu").datagrid("getData");
		var row = data.rows[index];
		$("#edit-frm").form("load", row);
		$("#edit-dialog").dialog("open");
	}

	function updateStu() {
		$.post("updateStu", {
			id : $("#updateid").val(),
			name : $("#updatename").val(),
			sex : $("#updatesex").val(),
			age : $("#updateage").val(),
			phone : $("#updatephone").val(),
			status : $("#updatestatus").val(),
			state : $("#updatestate").val(),
			msgSource : $("#updatemsgSource").val(),
			sourceUrl : $("#updatesourceUrl").val(),
			sourceKeyWorld : $("#updatesourceKeyWorld").val(),
			address : $("#updateaddress").val(),
			qq : $("#updateqq").val(),
			weixin : $("#updateweixin").val(),
			learnForward : $("#updatelearnForward").val(),
			isBaoBei : $("#updateisBaoBei").val(),
			ziXunName : $("#updateziXunName").val(),
			createUser : $("#updatecreateUser").val(),
			concern : $("#updateconcern").val()
		}, function(res) {
			if (res > 0) {
				$("#tabStu").datagrid("reload");
				$("#edit-dialog").dialog("close");
				$.messager.alert("提示", "修改成功")
			} else {
				$.messager.alert("提示", "修改失败")
			}
		}, "json")
	}

	function updateClear() {
		$("#edit-dialog").dialog("close");
	}

	//导出excel
	function exportExcel() {
		$('#tabStu').datagrid('toExcel', 'seven.xls'); // export to excel
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
				$('#tabStu').datagrid('hideColumn', checkeds[i]); //隐藏相应的列
			}

		}
		var unChecks = new Array();

		if (unCheckValue != null && unCheckValue != "") {
			unChecks = unCheckValue.split(',');
			for (var i = 0; i < unChecks.length; i++) {
				$('#tabStu').datagrid('showColumn', unChecks[i]); //显示相应的列
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
</script>
</head>
<body>
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
		<form style="width: 450px; height: 300px;" id="hiddenColumn_form"
			class="easyui-form">
			<a href="javascript:void()" class="easyui-linkbutton" id="isQuanXuan"
				onclick="ChooseAll()" data-options="iconCls:'icon-edit'">全选</a>
			<table>
				<tr>
					<td><input type="checkbox" value="id" />编号</td>

					<td><input type="checkbox" value="name" />姓名</td>

					<td><input type="checkbox" value="sex" />性别</td>

					<td><input type="checkbox" value="age" />年龄</td>
				</tr>
				<tr>
					<td><input type="checkbox" value="phone" />电话</td>

					<td><input type="checkbox" value="status" />学历</td>

					<td><input type="checkbox" value="state" />状态</td>

					<td><input type="checkbox" value="dafen" />打分</td>
				</tr>
				<tr>
					<td><input type="checkbox" value="msgSource" />来源渠道</td>

					<td><input type="checkbox" value="sourceUrl" />来源网站</td>

					<td><input type="checkbox" value="sourceKeyWorld" />来源关键词</td>

					<td><input type="checkbox" value="address" />地址</td>
				</tr>
				<tr>
					<!-- <td><input type="checkbox" value="netPusherId" />推销者id</td>

					<td><input type="checkbox" value="askerId" />发布者id</td> -->

					<td><input type="checkbox" value="qq" />QQ</td>

					<td><input type="checkbox" value="weixin" />微信</td>
				</tr>
				<tr>
					<td><input type="checkbox" value="content" />内容</td>

					<td><input type="checkbox" value="createTime" />创建时间</td>

					<td><input type="checkbox" value="learnForward" />来源部门</td>
					<td><input type="checkbox" value="record" />课程方向</td>

				</tr>
				<tr>



					<td><input type="checkbox" value="firstVistTime" />第一次回访时间</td>

					<td><input type="checkbox" value="isHome" />是否上门</td>
					<td><input type="checkbox" value="homeTime" />上门时间</td>

					<td><input type="checkbox" value="lostValid" />无效原因</td>
				</tr>
				<tr>



					<td><input type="checkbox" value="payTime" />缴费时间</td>
					<td><input type="checkbox" value="money" />金额</td>

					<td><input type="checkbox" value="isReturnMoney" />是否退费</td>

					<td><input type="checkbox" value="isInClass" />是否进班</td>
				</tr>
				<tr>


					<td><input type="checkbox" value="inClassTime" />进班时间</td>
					<td><input type="checkbox" value="inClassContent" />进班备注</td>

					<td><input type="checkbox" value="askerContent" />退费原因</td>

					<td><input type="checkbox" value="isDel" />是否删除</td>
				</tr>
				<tr>



					<td><input type="checkbox" value="formPart" />来源部门</td>
					<td><input type="checkbox" value="concern" />学员关注</td>

					<td><input type="checkbox" value="isBaoBei" />是否报备</td>

					<td><input type="checkbox" value="ziXunName" />咨询师姓名</td>
				</tr>
				<tr>


					<td><input type="checkbox" value="createUser" />录入人</td>
					<td><input type="checkbox" value="returnMoneyReason" />退费原因</td>

					<td><input type="checkbox" value="preMoney" />定金金额</td>

					<td><input type="checkbox" value="preMoneyTime" />定金时间</td>
				</tr>
				<tr>

					<td><input type="checkbox" value="isPay" />是否缴费</td>
					<td><input type="checkbox" value="isValid" />是否有效</td>
					<td><input type="checkbox" value="isReturnVist" />是否回访</td>
				</tr>

			</table>
		</form>
	</div>

	<!-- <a href="javascript:void(0)" onclick="a()"></a> -->
	<table id="tabStu" class="easyui-datagrid">
		<thead>
			<tr>

				<!--Name：学生名字    record:课程方向		lostValid:无效原因		createTime:创建时间
		isHome:是否上门	homeTime:上门时间		money:定金金额		preMoneyTime:定金时间
		ispay:是否缴费	paymoney:缴费时间 		money:缴费金额	isReturnMoney:是否退费	
		returnMoneyReason:退费原因		isInClass:是否进班	inClassTime:进班时间
		inClassConteent:进班备注	ZiXunName:咨询师备注（跟踪者）	followTime:跟踪时间
		nextFollowTime:下一次跟踪时间
		isReturnVist：是否回访
	  -->
				<!--<th data-options="field:'asd',checkbox:true"></th> -->
				<th data-options="field:'id',title:'ID'"></th>
				<th data-options="field:'name',title:'名称'"></th>
				<th data-options="field:'sex',title:'性别',formatter:formattersex"></th>
				<th data-options="field:'age',title:'年龄'"></th>
				<th data-options="field:'phone',title:'电话'"></th>
				<th data-options="field:'status',title:'学历'"></th>
				<th data-options="field:'state',title:'状态',formatter:formatterstate"></th>
				<th data-options="field:'dafen',title:'打分'"></th>
				<th data-options="field:'msgSource',title:'消息来源'"></th>
				<th data-options="field:'sourceUrl',title:'来源网站'"></th>
				<th data-options="field:'sourceKeyWorld',title:'来源关键词'"></th>
				<th data-options="field:'address',title:'地址'"></th>
				<!-- <th data-options="field:'netPusherId',title:'推销者ID'"></th>
				<th data-options="field:'askerId',title:'发布者ID'"></th> -->
				<th data-options="field:'qq',title:'QQ'"></th>

				<th data-options="field:'weixin',title:'微信'"></th>
				<th data-options="field:'content',title:'在线备注'"></th>
				<th data-options="field:'createTime',title:'创建时间'"></th>
				<th data-options="field:'learnForward',title:'来源部门'"></th>

				<th data-options="field:'record',title:'课程方向'"></th>


				<th data-options="field:'firstVistTime',title:'首次回访时间'"></th>
				<th
					data-options="field:'isHome',title:'是否上门',formatter:formatterisHome"></th>
				<th data-options="field:'homeTime',title:'上门时间'"></th>
				<th data-options="field:'lostValid',title:'无效原因'"></th>

				<th data-options="field:'payTime',title:'缴费时间'"></th>
				<th data-options="field:'money',title:'金额（定金/缴费）'"></th>

				<th
					data-options="field:'isReturnMoney',title:'是否退费',formatter:formatterisReturnMoney"></th>
				<th
					data-options="field:'isInClass',title:'是否进班',formatter:formatterisInClass"></th>
				<th data-options="field:'inClassTime',title:'进班时间'"></th>
				<th data-options="field:'inClassContent',title:'进班备注'"></th>
				<th data-options="field:'askerContent',title:'退费原因'"></th>
				<th
					data-options="field:'isDel',title:'是否删除',formatter:formatterisDel"></th>
				<th data-options="field:'formPart',title:'来源部门'"></th>

				<th data-options="field:'concern',title:'学员关注'"></th>
				<th
					data-options="field:'isBaoBei',title:'是否报备',formatter:formatterisBaoBei"></th>
				<th data-options="field:'ziXunName',title:'咨询师名称'"></th>
				<th data-options="field:'createUser',title:'录入人'"></th>
				<th data-options="field:'returnMoneyReason',title:'退费原因'"></th>
				<th data-options="field:'preMoney',title:'定金金额'"></th>
				<th data-options="field:'preMoneyTime',title:'定金时间'"></th>
				<th
					data-options="field:'isPay',title:'是否缴费',formatter:formatterisPay"></th>
				<th
					data-options="field:'isValid',title:'是否有效',formatter:formatterisValid"></th>
				<th
					data-options="field:'isReturnVist',title:'是否回访',formatter:formatterisReturnVist"></th>
				<th
					data-options="field:'formattercaozuo',title:'操作',formatter:formattercaozuo"></th>
			</tr>
		</thead>
	</table>



	<!--
		姓名关键字、电话、咨询师、是否缴费、是否有效、
		是否回访、QQ、创建时间/上门时间/首次回访时间/缴费时间/进班时间
	  -->

	<!-- 数据表格tab的工具条 -->
	<div id="tabBar">
		<!-- <a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add'" onclick="add()">新增</a> -->
		名称:<input type="text" class="easyui-textbox" id="name" /> 电话：<input
			class="easyui-textbox" type="text" id="phone"> 咨询师：<input
			class="easyui-textbox" type="text" id="ziXunName"> QQ：<input
			type="text" class="easyui-textbox" id="qq"> 创建时间：<input
			type="text" class="easyui-datebox" id="createTime"> 上门时间：<input
			type="text" class="easyui-datebox" id="homeTime"> 首次回访时间：<input
			type="text" class="easyui-datebox" id="firstVistTime"> 缴费时间：<input
			type="text" class="easyui-datebox" id="payTime"> 进班时间：<input
			type="text" class="easyui-datebox" id="inClassTime"> 是否缴费：<select
			id="isPay" class="easyui-combobox" name="是否缴费">
			<option value=" ">---请选择---</option>
			<option value="1">已缴费</option>
			<option value="2">未缴费</option>
		</select> 是否有效：<select id="isValid" class="easyui-combobox" name="是否有效">
			<option value=" ">---请选择---</option>
			<option value="1">有效</option>
			<option value="2">无效</option>
		</select> 是否回访：<select id="isReturnVist" class="easyui-combobox" name="是否回访">
			<option value=" ">---请选择---</option>
			<option value="1">已回访</option>
			<option value="2">未回访</option>
		</select>
		<%--  类别：<select class="easyui-combobox" id="looktid">
			<option value="">--请选择--</option>
			<c:forEach items="${type}" var="a">
			<option value="${a.tid }">${a.tname}</option>
			</c:forEach>
			</select>  --%>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="lookstu()" data-options="iconCls:'icon-tip'">显示</a> <a
			href="javascript:void(0)" onclick="initStu()"
			class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
		<a href="javascript:void(0)" onclick="addStu()"
			class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a> <a
			class="easyui-linkbutton" plain="true" onclick="exportExcel()"
			id="serach" data-options="iconCls:'icon-print'">导出excel</a>
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



	<!-- 添加追踪  -->
	<div id="zz-dialog" class="easyui-dialog"
		style="width: 600px; height: 300px"
		data-options="title:'新建学员窗口',modal:true,closed:true,
					buttons:[{
						text:'保存',
						handler:function(){zzStu()}
					},{
						text:'关闭',
						handler:function(){zzcloseStu()}
					}]">
		<form id="zz-frm">
			<table>
				<thead>

					<tr>
						<td><label for="name">学生ID:</label></td>
						<td><input class="easyui-validatebox" type="text"
							id="addstudentId" /></td>

					</tr>
					<tr>
						<td><label for="name">内容:</label></td>
						<td><input class="easyui-validatebox" type="text"
							id="addcontent" /></td>

					</tr>
					<tr>
						<td><label for="name">用户:</label></td>
						<td><input class="easyui-validatebox" type="text"
							id="adduserId" /></td>

					</tr>
					<tr>
						<td><label for="name">创建时间:</label></td>
						<td><input class="easyui-validatebox" type="text"
							id="addcreateTime" /></td>

					</tr>


				</thead>
			</table>
		</form>
	</div>

	<!-- 添加  -->
	<div id="add-dialog" class="easyui-dialog"
		style="width: 600px; height: 300px"
		data-options="title:'新建学员窗口',modal:true,closed:true,
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
						<td><label for="name">状态:</label></td>
						<td><select id="addstate" class="easyui-combobox">
								<option value=" ">---请选择---</option>
								<option value="2">有状态</option>
								<option value="1">无状态</option>
						</select></td>
					</tr>

					<tr>
						<td><label for="name">来源渠道:</label></td>
						<td><input class="easyui-validatebox" type="text" id="addly" />
						</td>
					</tr>

					<tr>
						<td><label for="name">来源网站:</label></td>
						<td><input class="easyui-validatebox" type="text" id="addwz" />
						</td>
					</tr>

					<tr>
						<td><label for="name">来源关键词:</label></td>
						<td><input class="easyui-validatebox" type="text" id="addgj" />
						</td>
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
						<td><label for="name">在线备注:</label></td>
						<td><input class="easyui-validatebox" type="text" id="addbz" />
						</td>
					</tr>
				</thead>
			</table>
		</form>
	</div>
	<!-- 查看   -->
	<div id="chakan-dialog" class="easyui-dialog"
		style="width: 600px; height: 300px"
		data-options="title:'学员信息窗口',modal:true,closed:true,
					buttons:[{
						text:'关闭',
						handler:function(){closeStu()}
					}]">
		<form id="chakan-frm">
			<table>
				<thead>
					<tr>
						<td><label for="name">创建时间:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="createTime" /></td>
					</tr>
					<tr>
						<td><label for="name">学员姓名:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="name" /></td>
					</tr>
					<tr>
						<td><label for="name">学员电话:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="phone" /></td>
					</tr>
					<tr>
						<td><label for="name">性别:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="sex" /></td>
					</tr>
					<tr>
						<td><label for="name">年龄:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="age" /></td>
					</tr>
					<tr>
						<td><label for="name">学历:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="status" /></td>
					</tr>
					<tr>
						<td><label for="name">个人状态:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="state" /></td>
					</tr>
					<tr>
						<td><label for="name">来源渠道:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="msgSource" /></td>
					</tr>
					<tr>
						<td><label for="name">来源网址:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="sourceUrl" /></td>
					</tr>
					<tr>
						<td><label for="name">来源关键词:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="sourceKeyWorld" /></td>
					</tr>
					<tr>
						<td><label for="name">姓名（咨询）:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="ziXunName" /></td>
					</tr>
					<tr>
						<td><label for="name">所在区域:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="address" /></td>
					</tr>
					<tr>
						<td><label for="name">微信:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="weixin" /></td>
					</tr>
					<tr>
						<td><label for="name">学员QQ:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="qq	" /></td>
					</tr>
					<tr>
						<td><label for="name">来源部门:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="learnForward" /></td>
					</tr>
					<tr>
						<td><label for="name">是否报备:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="isBaoBei" /></td>
					</tr>
					<tr>
						<td><label for="name">课程方向:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="record" /></td>
					</tr>
					<tr>
						<td><label for="name">是否有效:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="isValid" /></td>
					</tr>
					<tr>
						<td><label for="name">打分:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="dafen" /></td>
					</tr>
					<tr>
						<td><label for="name">是否回访:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="isReturnVist" /></td>
					</tr>
					<tr>
						<td><label for="name">首次回访时间:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="firstVistTime" /></td>
					</tr>
					<tr>
						<td><label for="name">是否上门:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="isHome" /></td>
					</tr>
					<tr>
						<td><label for="name">上门时间:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="homeTime" /></td>
					</tr>
					<tr>
						<td><label for="name">无效原因:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="lostValid" /></td>
					</tr>
					<tr>
						<td><label for="name">是否缴费:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="isPay" /></td>
					</tr>
					<tr>
						<td><label for="name">缴费时间:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="payTime" /></td>
					</tr>
					<tr>
						<td><label for="name">金额:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="money" /></td>
					</tr>
					<tr>
						<td><label for="name">是否退费:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="isReturnMoney" /></td>
					</tr>
					<tr>
						<td><label for="name">是否进班:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="isInClass" /></td>
					</tr>
					<tr>
						<td><label for="name">进班时间:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="inClassTime" /></td>
					</tr>
					<tr>
						<td><label for="name">进班备注:</label></td>
						<td><input class="easyui-validatebox" type="text"
							name="inClassContent" /></td>
					</tr>
					<tr>
						<td><label for="name">退费原因:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="askerContent" /></td>
					</tr>
					<tr>
						<td><label for="name">定金金额:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="preMoney" /></td>
					</tr>
					<tr>
						<td><label for="name">定金时间:</label></td>
						<td><input readonly="readonly" class="easyui-validatebox"
							type="text" name="preMoneyTime" /></td>
					</tr>
				</thead>
			</table>
		</form>
	</div>

	<!-- 修改 -->
	<div id="edit-dialog" class="easyui-dialog"
		style="width: 600px; height: 300px"
		data-options="title:'我的对话框',modal:true,closed:true,
					buttons:[{
						text:'保存',
						handler:function(){updateStu()}
					},{
						text:'关闭',
						handler:function(){updateClear()}
					}]">
		<form id="edit-frm">
			<table>
				<thead>
					<tr>
						<td><label for="name">编号:</label></td>
						<td><input class="easyui-validatebox" type="text" name="id"
							id="updateid" /></td>
					</tr>
					<tr>
						<td><label for="name">姓名:</label></td>
						<td><input class="easyui-validatebox" type="text" name="name"
							id="updatename" /></td>
					</tr>
					<tr>
						<td><label for="name">性别:</label></td>
						<td><input class="easyui-validatebox" type="text" name="sex"
							id="updatesex" /></td>
					</tr>
					<!-- <tr>
							<td>
								<label for="name">性别:</label>
							</td>
							<td>
								<select id="updatesex" class="easyui-combobox">   
								    <option value="">---请选择---</option>   
								    <option value="1">男</option>   
								    <option value="2">女</option>   
								</select>
							</td>
						</tr> -->


					<tr>
						<td><label for="name">年龄:</label></td>
						<td><input class="easyui-validatebox" type="text" name="age"
							id="updateage" /></td>
					</tr>
					<tr>
						<td><label for="name">电话:</label></td>
						<td><input class="easyui-validatebox" type="text"
							name="phone" id="updatephone" /></td>
					</tr>
					<tr>
						<td><label for="name">学历:</label></td>
						<td><input class="easyui-validatebox" type="text"
							name="status" id="updatestatus" /></td>
					</tr>
					<tr>
						<td><label for="name">状态:</label></td>
						<td><input class="easyui-validatebox" type="text"
							name="state" id="updatestate" /></td>
					</tr>
					<tr>
						<td><label for="name">来源渠道:</label></td>
						<td><input class="easyui-validatebox" type="text"
							name="msgSource" id="updatemsgSource" /></td>
					</tr>
					<tr>
						<td><label for="name">来源网站:</label></td>
						<td><input class="easyui-validatebox" type="text"
							name="sourceUrl" id="updatesourceUrl" /></td>
					</tr>
					<tr>
						<td><label for="name">来源关键词:</label></td>
						<td><input class="easyui-validatebox" type="text"
							name="sourceKeyWorld" id="updatesourceKeyWorld" /></td>
					</tr>
					<tr>
						<td><label for="name">所在区域:</label></td>
						<td><input class="easyui-validatebox" type="text"
							name="address" id="updateaddress" /></td>
					</tr>
					<tr>
						<td><label for="name">学员关注:</label></td>
						<td><input class="easyui-validatebox" type="text"
							name="concern" id="updateconcern" /></td>
					</tr>
					<tr>
						<td><label for="name">来源部门:</label></td>
						<td><input class="easyui-validatebox" type="text"
							name="learnForward" id="updatelearnForward" /></td>
					</tr>
					<tr>
						<td><label for="name">学员QQ:</label></td>
						<td><input class="easyui-validatebox" type="text" name="qq"
							id="updateqq" /></td>
					</tr>
					<tr>
						<td><label for="name">微信号:</label></td>
						<td><input class="easyui-validatebox" type="text"
							name="weixin" id="updateweixin" /></td>
					</tr>
					<tr>
						<td><label for="name">是否报备:</label></td>
						<td><input class="easyui-validatebox" type="text"
							name="isBaoBei" id="updateisBaoBei" /></td>
					</tr>
					<tr>
						<td><label for="name">咨询师:</label></td>
						<td><input class="easyui-validatebox" type="text"
							name="ziXunName" id="updateziXunName" /></td>
					</tr>
					<tr>
						<td><label for="name">录入人:</label></td>
						<td><input class="easyui-validatebox" type="text"
							name="createUser" id="updatecreateUser" /></td>
					</tr>

				</thead>
			</table>
		</form>
	</div>



</body>
</html>