<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登陆界面</title>
<script src="js/global.js"></script>

 <style type="text/css">
input#rightcode {
	font-family: Arial;
	font-style: italic;
	color: red;
	padding: 2px 3px;
	letter-spacing: 2px;
	font-weight: bolder;
}
input{
border-radius:10px;
}
div{
opacity:0.90;
border-radius:10px;
/* box-shadow:0px 0px  10px 5px #aaa; */
/* box-shadow:0px 0px 10px 5px #aaa inset; */
}
#uwin{
 box-shadow:0px 0px 10px 5px #aaa inset;
 background:url('img/timg.png') no-repeat 1px center
/* border-image:url('img/timg.png') 30 30 round;
 border-image-width:30px; */
}


</style> 
<script>
	var username, userpsw, str;
	function createNewCode() {
		var arr = [ '0', '1', '3', '4', '5', '6', '7', '8', '9'/* , 'a', 'b', 'c',
				'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
				'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A',
				'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' */ ];
		str = "";
		var strlength = 4;
		for (var i = 0; i < strlength; i++) {
			var num = Math.floor(Math.random() * arr.length);
			str += arr[num];
		}
		;
		var btn = document.getElementById("rightcode");
		btn.value = str;
	};

	function setCookie(_name, val, expires) {
		var d = new Date();
		d.setDate(d.getDate() + expires);
		document.cookie = _name + "=" + val + ";path=/;expires="
				+ d.toGMTString();
	}//获取cookie
	function getCookie(_name) {

		var cookie = document.cookie;
		var arr = cookie.split("; ");
		for (var i = 0; i < arr.length; i++) {

			var newArr = arr[i].split("=");
			if (newArr[0] == _name) {
				return newArr[1];
			}
		}
		return "";
	}
	/*
	      如何将json对象转换为字符串
	          JSON.stringify(对象);
	          返回值是一个字符串
	      如何将字符串转换为json对象
	          JSON.parse(字符串)
	          返回值是对象
	 */

	if (getCookie("init")) {
		var cookie = JSON.parse(getCookie("init"));
		username = cookie.name;
		userpsw = cookie.pass;
	}

	function submitForm() {

		if ($("#check").is(":checked")) {
			var obj = {};
			obj.name = $("#username").val();
			obj.pass = $("#userpsw").val();
			var a = JSON.stringify(obj);
			setCookie("init", a, 7);
		}
		var name = $("#username").val();
		var pwd = $("#userpsw").val();
		var yan = $("#yan").val();
		var flag = $("#frm").form("validate");
		if (flag) {
			if (str == yan) {
				login(name, pwd);

			} else {
				$.messager.alert("提示", "验证码错误");
			}
		} else {
			$.messager.alert("提示", "输入内容为空");
		}
	}

	function login(name, pwd) {
		$.post("ulogin", {
			un : name,
			pwd : pwd
		}, function(res) {
			if (res == 0) {
				$.messager.alert("提示", "该用户不存在");
			} else if (res == 1) {
				window.location.href = "index.jsp";
			} else if (res == 3) {
				$.messager.alert("提示", "该用户已被锁定");
			} else {
				$.messager.alert("提示", "密码错误");
			}

		}, "json")
	}
	
 	function keyLogin(event) {
		if (event.keyCode=="13") {
			submitForm();
		}
	} 
	$(function() {
		createNewCode();
		if (username != null) {
			$('#uwin').panel('close');
			$.messager
					.show({
						height:120,
						title : '消息提示',
						timeout : 1000,
						showType : 'slide',
						style:{
							top:document.body.scrollTop+document.documentElement.scrollTop,
						},

						msg : '<font size=\"2\" color=\"#666666\"><strong>是否登陆上次保存账号?'
								+ '<br clear=left>'
								+ '<br><span  style=\"padding-left:60px\"></span><input type=\"button\" value=\"登陆\" onClick=\"showlogin()\">'
								+ '<span  style=\"padding-left:20px\"></span><input type=\"button\" value=\"清除记录\" onClick=\"closeshow()\">'

					});
			$('#uwin').panel('open');

		}
		

	})

	function showlogin() {
		$('#uwin').panel('close');
		$("#frm").form("load", {
			name : username,
			psw : userpsw
		});
		login(username, userpsw);
	}

	function closeshow() {
		$('#uwin').panel('open');
		$.messager.show({
			title : '消息提示',
			height:120,
			timeout : 5000,
			style:{
				top:document.body.scrollTop+document.documentElement.scrollTop,
			},
			showType : 'slide',
			msg : '已清空上次登陆记录'
		});
		setCookie("init","",0);
	}
	
	
	!function(e, t, a) {
	    function r() {
	        for (var e = 0; e < s.length; e++) s[e].alpha <= 0 ? (t.body.removeChild(s[e].el), s.splice(e, 1)) : (s[e].y--, s[e].scale += .004, s[e].alpha -= .013, s[e].el.style.cssText = "left:" + s[e].x + "px;top:" + s[e].y + "px;opacity:" + s[e].alpha + ";transform:scale(" + s[e].scale + "," + s[e].scale + ") rotate(45deg);background:" + s[e].color + ";z-index:99999");
	        requestAnimationFrame(r)
	    }
	    function n() {
	        var t = "function" == typeof e.onclick && e.onclick;
	        e.onclick = function(e) {
	            t && t(),
	            o(e)
	        }
	    }
	    function o(e) {
	        var a = t.createElement("div");
	        a.className = "heart",
	        s.push({
	            el: a,
	            x: e.clientX - 5,
	            y: e.clientY - 5,
	            scale: 1,
	            alpha: 1,
	            color: c()
	        }),
	        t.body.appendChild(a)
	    }
	    function i(e) {
	        var a = t.createElement("style");
	        a.type = "text/css";
	        try {
	            a.appendChild(t.createTextNode(e))
	        } catch(t) {
	            a.styleSheet.cssText = e
	        }
	        t.getElementsByTagName("head")[0].appendChild(a)
	    }
	    function c() {
	        return "rgb(" + ~~ (255 * Math.random()) + "," + ~~ (255 * Math.random()) + "," + ~~ (255 * Math.random()) + ")"
	    }
	    var s = [];
	    e.requestAnimationFrame = e.requestAnimationFrame || e.webkitRequestAnimationFrame || e.mozRequestAnimationFrame || e.oRequestAnimationFrame || e.msRequestAnimationFrame ||
	    function(e) {
	        setTimeout(e, 1e3 / 60)
	    },
	    i(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: fixed;}.heart:after{top: -5px;}.heart:before{left: -5px;}"),
	    n(),
	    r()
	} (window, document);
</script> 
</head>

<body style="background-image: url('img/4.jpg');">
	 <div
		style="margin-top: 180px; margin-left: 400px; width: 600px;" >
		<div style="background-image: url('img/5.jpg');" class="easyui-panel" title="请先登录" id="uwin">
			<div style="padding: 20px; margin-left: 20px;">
				<form id="frm">
				
					<table cellpadding="5">
						<tr>
							<td>用户名:</td>
							<td><input id="username" name="name" class="easyui-validatebox"
								data-options="required:true" /></td>
						</tr>
						<tr>
							<td>验证码:</td>
							<td><input type="text" class="easyui-validatebox" name="yan"
								id="yan" data-options=""><input type="button" id="rightcode"
								onclick="createNewCode()"></td>
						</tr>
						<tr>
							<td>密码:</td>
							<td><input id="userpsw" type="password" name="psw"
								class="easyui-validatebox" data-options="required:true" /></td>
						</tr>

					</table>
				</form>
				<br />
				<div style="text-align: center; padding-top: 5px;">
					<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
						onclick="submitForm()">登陆</a> <a class="easyui-linkbutton"
						data-options="iconCls:'icon-clear'" onclick="clearForm()">取消</a>
				</div>
			</div>
			<div>
				<label for=""><input type="checkbox" id="check">7天免登陆</label>
			</div>
		</div>
	</div> 
</body>


</html>