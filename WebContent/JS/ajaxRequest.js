// 创建对象
var Hup={
	// 创建Ajax引擎
	createXmlHttpRequest:function createXmlHttpRequest() {
		var xmlreq = false;
		if (window.XMLHttpRequest) {
			xmlreq = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			try {
				xmlreq = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e1) {
				try {
					xmlreq = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e2) {
					alert(e2);
				}
			}
		}
		return xmlreq;
	},

	// 设置响应函数
	getReadyStateHandler : function getReadyStateHandler(req) {

		return function() {

			if (req.readyState == 4) {

				if (req.status == 200) {
					//alert(req.responseText);
					var ele=document.getElementsByTagName("html");
					//console.info(ele);
				    ele[0].innerHTML = req.responseText;
				} else {
					alert("HTTP error: " + req.status);
					return false;
				}
			}
		};
	},

	// 组织表单中的数据
	getParams2Str : function getParams2Str(sForm) {

		var strDiv = "";

		try {
			var objForm = document.forms[sForm];
			if (!objForm)
				return strDiv;
			var elt, sName, sValue;
			for ( var fld = 0; fld < objForm.elements.length; fld++) {
				elt = objForm.elements[fld];// 获取表单中的input元素
				sName = elt.name;// 名字
				sValue = "" + elt.value;// 值
				// 封装参数
				if (fld == objForm.elements.length - 1)
					strDiv = strDiv + sName + "=" + sValue + "";
				else
					strDiv = strDiv + sName + "=" + sValue + "&";
			}
			// alert(strDiv);
		} catch (ex) {
			return strDiv;
		}
		return strDiv;
	},

	submitActionWithForm : function(action, sForm) {
		// 创建Ajax引擎
		var req =this.createXmlHttpRequest();
		// 处理Ajax的事件处理函数，接收服务器响应的数据
		var handlerFunction = this.getReadyStateHandler(req);
		req.onreadystatechange =handlerFunction;
		// 打开连接，false：同步，必须等待值加载完成之后，才往后执行
		req.open("POST", action, false);
		req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		// 发送请求，向服务器发送数据(表单中的数据)
		var str = this.getParams2Str(sForm);
		req.send(str);
	}
};