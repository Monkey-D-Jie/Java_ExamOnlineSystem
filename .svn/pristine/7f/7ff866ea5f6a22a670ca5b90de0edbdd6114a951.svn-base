function gotopage(path, where, Form2) {
	var form=document.forms[Form2];//获取表单
	var page = form.pageNO;// 获取表单中的页号
	// 验证数据和设置pageNo的值
	if (where == "next") {

		page.value = form.nextpageNO.value;

	} else if (where == "prev") {

		page.value = form.prevpageNO.value;
	} else if (where == "end") {

		page.value = form.sumPage.value;
	} else if (where == "start") {
		page.value = 1;
	} else if (where == "go") {
		var theForm = form;
		if (Trim(theForm.goPage.value) == "") {
			alert("请输入页数");
			theForm.goPage.focus();
			return false;
		}
		if (!checkNumber(theForm.goPage)) {
			alert("请输入正确页数(数字)");
			theForm.goPage.focus();
			return false;
		}

		var objgo = parseInt(theForm.goPage.value);
		var objsum = parseInt(theForm.sumPage.value);
		if (objgo <= 0 || objgo > objsum) {
			alert("不存在此页，请重新输入页数");
			theForm.goPage.focus();
			return false;
		}

		page.value = theForm.goPage.value;
	}

	Hup.submitActionWithForm(path, Form2);
}

function gotoquery(path, Form2) {
	var form=document.forms[Form2];//获取表单
	form.pageNO.value = 1;
	form.pageSize.value == 10;
	Hup.submitActionWithForm(path, Form2);
}