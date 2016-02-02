<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var xhr = new XMLHttpRequest();
var url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList'; /*URL*/
var queryParams = '?' + encodeURIComponent('ServiceKey') + '=%2BsrXKXWBJD%2FbZnmOXnC%2FIk93WKZ%2FjkbHa%2FLsWttU6DmcbM%2B7fTiMHspZoCn6QbcJjXZ4APlra0SEsh%2FccvJ0zg%3D%3D'; /*Service Key*/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /*한페이지결과수*/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*페이지번호*/
queryParams += '&' + encodeURIComponent('arrange') + '=' + encodeURIComponent('B'); /*정렬순서*/
queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); /*OS 구분*/
queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('공유자원포털'); /*어플이름*/
xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        alert('Status: '+this.status+' Headers: '+JSON.stringify(this.getAllResponseHeaders()));
        alert(' Body: '+xmlToJson(this.responseText));
    }
};

xhr.send('');

//Changes XML to JSON
function xmlToJson(xml) {
	
	// Create the return object
	var obj = {};

	if (xml.nodeType == 1) { // element
		// do attributes
		if (xml.attributes.length > 0) {
		obj["@attributes"] = {};
			for (var j = 0; j < xml.attributes.length; j++) {
				var attribute = xml.attributes.item(j);
				obj["@attributes"][attribute.nodeName] = attribute.nodeValue;
			}
		}
	} else if (xml.nodeType == 3) { // text
		obj = xml.nodeValue;
	}

	// do children
	if (xml.hasChildNodes()) {
		for(var i = 0; i < xml.childNodes.length; i++) {
			var item = xml.childNodes.item(i);
			var nodeName = item.nodeName;
			if (typeof(obj[nodeName]) == "undefined") {
				obj[nodeName] = xmlToJson(item);
			} else {
				if (typeof(obj[nodeName].push) == "undefined") {
					var old = obj[nodeName];
					obj[nodeName] = [];
					obj[nodeName].push(old);
				}
				obj[nodeName].push(xmlToJson(item));
			}
		}
	}
	return obj;
};

</script>
</head>
<body>
성공<br/>
<pre>${data}</pre>
</body>
</html>