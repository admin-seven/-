var globalData = {
	pre: "http://localhost:8080/CRM/",
	mytheme: "metro-blue",
	
}

document.write('<link rel="stylesheet" href="' + globalData.pre + 'js/jquery-easyui-1.4.3/themes/icon.css" type="text/css"/>');
document.write('<link rel="stylesheet" href="' + globalData.pre + 'js/jquery-easyui-1.4.3/themes/'+globalData.mytheme+'/easyui.css"/>');
document.write('<script type="text/javascript" src="' + globalData.pre + 'js/jquery-easyui-1.4.3/jquery.min.js" ></script>');
document.write('<script type="text/javascript" src="' + globalData.pre + 'js/jquery-easyui-1.4.3/jquery.easyui.min.js" ></script>');
document.write('<script src="' + globalData.pre + 'js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>');
