function CheckAll(elementsA, elementsB) {
	for (i = 0; i < elementsA.length; i++) {
		elementsA[i].checked = true;
	}
	if (elementsB.checked == false) {
		for (j = 0; j < elementsA.length; j++) {
			elementsA[j].checked = false;
		}
	}
}

function checkdel(delid, formname) {
	var flag = false;
	for (i = 0; i < delid.length; i++) {
		if (delid[i].checked) {
			formname.id.value = delid[i].value;// ��ֵֵ
			flag = true;
			break;
		}
	}
	if (!flag) {
		alert("选择要删除项！！！");
		return false;
	} else {
		if (confirm("你确定要删除吗！")) {
			formname.submit();
		}
	}
}