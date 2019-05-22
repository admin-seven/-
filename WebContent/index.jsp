<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>CRM</title>
<style type="text/css">
a{
text-decoration: none;
}
</style>
<script src="js/global.js"></script>
<script>

$(function() {
	(function(window, document, undefined) {
		// 存储所有的雪花
		const
		snows = [];
		// 下落的加速度
		const
		G = 0.01;

		const
		fps = 60;

		// 速度上限，避免速度过快
		const
		SPEED_LIMIT_X = 1;
		const
		SPEED_LIMIT_Y = 1;

		const
		W = window.innerWidth;
		const
		H = window.innerHeight;

		let
		tickCount = 1500;
		let
		ticker = 0;
		let
		lastTime = Date.now();
		let
		deltaTime = 0;

		let
		canvas = null;
		let
		ctx = null;

		let
		snowImage = null;

		window.requestAnimationFrame = (function() {
			return window.requestAnimationFrame
					|| window.webkitRequestAnimationFrame
					|| window.mozRequestAnimationFrame
					|| window.oRequestAnimationFrame
					|| window.msRequestAnimationFrame
					|| function(callback) {
						setTimeout(callback, 1000 / fps);
					}
		})();

		init();

		function init() {
			createCanvas();
			canvas.width = W;
			canvas.height = H;
			canvas.style.cssText = 'position: fixed; top: 0; left: 0; pointer-events: none;';
			document.body.appendChild(canvas);
			// 小屏幕时延长添加雪花时间，避免屏幕上出现太多的雪花
			if (W < 768) {
				tickCount = 100;
			}

			snowImage = new Image();
			snowImage.src = 'http://localhost:8080/CRM/img/flo_3.png';

			loop();
		}

		function loop() {
			requestAnimationFrame(loop);

			ctx.clearRect(0, 2, W, H);

			const
			now = Date.now();
			deltaTime = now - lastTime;
			lastTime = now;
			ticker += deltaTime;

			if (ticker > tickCount) {
				snows.push(new Snow(Math.random() * W, 0,
						Math.random() * 20 + 5));
				ticker %= tickCount;
			}

			const
			length = snows.length;
			snows.map(function(s, i) {
				s.update();
				s.draw();
				if (s.y >= H) {
					snows.splice(i, 1);
				}
			});
		}

		function Snow(x, y, radius) {
			this.x = x;
			this.y = y;
			this.sx = 0;
			this.sy = 0;
			this.deg = 0;
			this.radius = radius;
			this.ax = Math.random() < 0.5 ? 0.005 : -0.005;
		}

		Snow.prototype.update = function() {
			const
			deltaDeg = Math.random() * 0.6 + 0.2;

			this.sx += this.ax;
			if (this.sx >= SPEED_LIMIT_X || this.sx <= -SPEED_LIMIT_X) {
				this.ax *= -1;
			}

			if (this.sy < SPEED_LIMIT_Y) {
				this.sy += G;
			}

			this.deg += deltaDeg;
			this.x += this.sx;
			this.y += this.sy;
		}

		Snow.prototype.draw = function() {
			const
			radius = this.radius;
			ctx.save();
			ctx.translate(this.x, this.y);
			ctx.rotate(this.deg * Math.PI / 180);
			ctx.drawImage(snowImage, -radius, -radius, radius * 2,
					radius * 2);
			ctx.restore();
		}

		function createCanvas() {
			canvas = document.createElement('canvas');
			ctx = canvas.getContext('2d');
		}

	})(window, document);

		$("#tt")
				.tree(
						{
							url : "index/tree",
							method : "POST",
							animate : true,
							lines : true,
							onClick : function(node) {
								var isLeaf = $('#tt').tree('isLeaf', node.text);
								if (isLeaf) {
									var flag = $('#tta').tabs('exists',
											node.text);
									if (flag) {
										$('#tta').tabs('select', node.text);
									} else {
										var root = $('#tt').tree('getParent',
												node.target)
										if (root != null) {
											$('#tta')
													.tabs(
															'add',
															{
																title : node.text,
																closable: true,
																content : "<iframe src='"
																		+ node.path
																		+ ".jsp' style='width:100%;height:600px;'/>"
															});
										}
									}
								}

							}
						});
	})

	function fixHeight(percent) {
		return (document.body.clientHeight) * percent;
	}

	function fixWidth(percent) {
		return (document.body.clientWidth - 5) * percent;
	}

	function exit() {
		$('#mm').menu('show', {
			left : fixWidth(0.43),
			top : fixHeight(0.09)
		});
	}
	function person() {

		$("#dd").dialog("open");
	}
	function save() {
		$.messager.confirm("确认信息", "确定修改？", function(r) {
			if (r) {
				$.post("index/updateTelAndEmail", {
					protectEmail : $("#pkemail").val(),
					protectMTel : $("#pktel").val()
				}, function(res) {
					if (res > 0) {
						$.messager.alert("提示", "信息保存");
						$("#dd").dialog("close");
					} else {
						$.messager.alert("提示", "保存失败");
						$("#dd").dialog("close");
					}
				}, "json")
			}

		})

	}
	function clear() {
		$("#dd").dialog("close");
	}
	function remove() {
		$.messager.confirm('提示', '您想要退出该系统吗？', function(r) {
			if (r) {
				$.post("logout", {}, function(res) {
					if (res > 0) {
						$.messager.alert("提示", "已安全退出");
						window.location.href = "login.jsp";
					}
				}, "json")
			}
		});
	}

	/* function editpsw() {
		$("#Psw").dialog("open");

	}
	function savePsw() {
		var flag = $("#pswFrm").form("validate");
		if(flag){
			$.messager.confirm("信息提示", "确定修改密码？", function(r) {
				if (r) {
					$.post("index/updatePsw", {
						passWord :$("#newPsw").val()
					}, function(res) {
						if(res>0){
							$.messager.alert("提示","修改成功");
							$("#Psw").dialog("close");
						}else{
							$.messager.alert("提示","修改失败");
						}
					}, "json")
				}
			})
			
		}else{
			$.messager.alert("提示","不允许提交空值");
		}
	}
	function clearPsw() {
		$("#Psw").dialog("close");
	}
	function initpsw() {
		$.messager.confirm("信息提示", "确定初始化密码？", function(r) {
			if (r) {
				$.post("index/updatePsw", {
					passWord : "123456"
				}, function(res) {
					if(res){
						$.messager.alert("提示","初始化成功");
						$("#Psw").dialog("close");
					}else{
						$.messager.alert("提示","修改失败");
					}
				}, "json")
			}
		})
	}
	function pin() {
		var btn = document.getElementById("qd");
		if(btn.innerText=="已签到"){
			piny();
		}else{
			$.post("index/addUserCheck",{checkState:"已签到"},function(res){
				if(res>0){
					$.messager.alert("提示","签到成功");
					//数据库拿出
					btn.innerHTML = "已签到";
				}else{
					$.messager.alert("提示","签到成功");
				}
			},"json")  
		}
	}
	function piny() {
		
		$.messager.alert("提示","今日已签到");
	}
	function pout(){
		var btn = document.getElementById("qc");
		if(btn.innerText=="已签出"){
			 pouty();
		}else{
			 $.post("index/updateUserCheck",{isCancel:"已签出"},function(res){
					if(res>0){
						btn.innerHTML = "已签出";
						$.messager.alert("提示","签出成功");
						
					}else{
						$.messager.confirm("提示","今日还未签到，无法签出",function(r){
							if(r){
								$.messager.confirm("提示","是否签到",function(a){
									if(a){
										 pin();
									}
								})
								
							}
						})
					}
				},"json"); 
		}
		
	}
	function pouty(){
		$.messager.alert("提示","今日已签出");
	} */
</script>
</head>
<body>
<%-- <%HttpSession s= request.getSession();%>
	<div id="Psw" class="easyui-dialog" title="个人空间"
		style="width: 240px; height: 300px;"
		data-options="modal:true,closed:true,buttons:[{
				text:'保存',
				iconCls:'icon-save',
				handler:function(){
				savePsw()
				}
			},{
				text:'取消',
				iconCls:'icon-clear',
				handler:function(){
				clearPsw()
				}
			}]">
		<form id="pswFrm">
			<table>

				<tr>
					<td colspan="2"><h2>个人密码修改</h2></td>

				</tr>
				<tr>
					<td>新密码:</td>
					<td><input type="password" id="newPsw"
						class="easyui-validatebox" data-options="required:true" /></td>
				</tr>
			</table>
		</form>

	</div>

	<div style="margin: 20px 0;"></div>
	<div id="dd" class="easyui-dialog" title="个人空间"
		style="width: 240px; height: 300px;"
		data-options="modal:true,closed:true,buttons:[{
				text:'保存',
				iconCls:'icon-save',
				handler:function(){
				save()
				}
			},{
				text:'取消',
				iconCls:'icon-clear',
				handler:function(){
				clear()
				}
			}]">
		<form id="psfrm">
			<table>
				<tr style="text-align: center;">
					<td colspan="2"><h3>个人信息</h3></td>
				</tr>
				<tr >
				<td>签到状态：</td>
					<td  style="font-size: 12px"><%if(s.getAttribute("qdstate")!=null){%>
					<a href="javascript:void(0)"
						onclick="piny()" id="qd">
						<%=s.getAttribute("qdstate") %>
						</a>
						<%}else{ %>
						<a href="javascript:void(0)"
						onclick="pin()" id="qd">
						未签到
						</a>
						<%} %>
					
						&ensp;&ensp;<a href="javascript:void(0)"
						id="qc" onclick="pout()">
						<%if(s.getAttribute("qdstate")==null){%>
						未签出
						<%} %>
						${qcstate}
						</a>
						
						</td>
				</tr>
				<c:forEach items="${user}" var="u">
				
					<tr>
						<td>姓名：</td>
						<td>${u.loginName}</td>
					</tr>
					<tr>
						<td>职业：</td>
						<c:forEach items="${RolesName}" var="r">
							<td>${r.name}</td>
						</c:forEach>
					</tr>
					<tr>
						<td>电话：</td>
						<td><input type="text" class="easyui-textbox" id="pktel"
							value="${u.protectMTel}" /></td>
					</tr>
					<tr>
						<td>邮箱：</td>
						<td><input type="text" class="easyui-textbox" id="pkemail"
							value="${u.protectEmail}" /></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="2">密码功能区块：</td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				<tr>
					<td><a href="javascript:void(0)" onclick="editpsw()"
						class="easyui-linkbutton" data-options="iconCls:'icon-cut'">改</a></td>
					<td><a href="javascript:void(0)" onclick="initpsw()"
						class="easyui-linkbutton" data-options="iconCls:'icon-reload'">初始</a></td>
				</tr>
			</table>
		</form>
	</div> --%>
	<div class="easyui-layout" style="width: 100%; height: 700px;">
		<div data-options="region:'north'" style="height: 50px">
			<div>
				<h2 style="text-align: center;">
					<a href="javascript:void(0)" onclick="exit()">${name}的CRM</a>
				</h2>
				<div id="mm" class="easyui-menu" style="width: 120px;margin-top: 5px">
					<div onclick="remove()" data-options="iconCls:'icon-clear'">安全退出</div>
				</div>

			</div>
			
		</div>
		<div data-options="region:'south',split:true" style="height: 50px;"></div>
		<div data-options="region:'west',split:true" title="导航菜单"
			style="width: 150px;">
			<div id="menuTree">
				<ul id="tt" class="easyui-tree"
					data-options="iconCls:'icon-save',collapsible:true"></ul>
			</div>
			<div id="mm" class="easyui-menu" style="width: 120px;">
				<div onclick="append()" data-options="iconCls:'icon-add'">追加</div>
				<div onclick="remove()" data-options="iconCls:'icon-remove'">移除</div>
			</div>

		</div>
		<div id="centerTabs" data-options="region:'center',iconCls:'icon-ok'"
			style="width: 530px;">
			<div id="tta" class="easyui-tabs"></div>
		</div>
	</div>
</body>
</html>