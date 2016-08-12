function LTrim(str) 
{ 
	var i; 
	for(i=0;i<str.length;i++) 
	{ 
	if(str.charAt(i)!=" "&&str.charAt(i)!="?")break; 
	} 
	str=str.substring(i,str.length); 
	return str; 
} 

function RTrim(str) 
{ 
	var i; 
	for(i=str.length-1;i>=0;i--) 
	{ 
		if(str.charAt(i)!=" "&&str.charAt(i)!="?")break; 
	} 
	str=str.substring(0,i+1); 
	return str; 
} 
//除去左右空格
function Trim(str) 
{ 
	return LTrim(RTrim(str)); 
} 
// 退出系统
function quit(){
	if(confirm("真的要退出系统吗?")){
		window.location.href="logout.jsp";
	}
}

// 检测数字
function checkNumber(theObj)
{
	if(typeof(theObj.value)!="undefined"&&theObj.value!=""&&!isNaN(theObj.value))
	{
		return true;
	}
	return false;
}

// 关闭对话框
function refreshOpener(){

    // opener.location.href=sHref;
    opener.location.reload();
    window.close();
}
