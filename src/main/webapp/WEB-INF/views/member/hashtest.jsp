<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<title>SHA256 Hash Generator Online</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="description" content="Generate the SHA256 hash of any string."> 
	<meta name="keywords" content="SHA256 Hash Generator, SHA256 Online" >
<script type="text/javascript" src="../resources/js/hashencode.js"></script>	
<script language="javascript" type="text/javascript">
function clearall()
{	
	document.getElementById('txt1').value = "";
	document.getElementById('txt2').value = "";
	document.getElementById("txt1").focus();
}
function replaceAll(find, replace, str) {
  return str.replace(new RegExp(find, 'g'), replace);
}
function calc()
{
	var strTxt = document.getElementById('txt1').value;
	if( strTxt.length == 0 )
	{
		document.getElementById('txt2').value = "";
		return;
	}
	
	if( document.getElementById("separate_lines").checked )
	{
		var strLines=[];
		if( strTxt.search("\r\n")>0 )strLines = strTxt.split("\r\n");
		else if( strTxt.search("\r")>0 ) strLines = strTxt.split("\r");
		else if( strTxt.search("\n")>0  )strLines = strTxt.split("\n");
		else strLines[0]=strTxt;
		
	//	var strLines = strTxt.split("\n");
		var strHashALL = "";
		var strHashTmp = "";
		for( var i in strLines ) 
		{
			if( strLines[i].length != 0 )
			{
				strHashTmp = hex_sha256( strLines[i]  );
				strHashTmp = strHashTmp.toUpperCase();
			}
			else
				strHashTmp = "";
			strHashALL += strHashTmp + "\n";
		}
		document.getElementById('txt2').value = strHashALL;			
	}
	else
	{
		if( strTxt.search("\r")>0 ) strTxt=replaceAll( "\r", "", strTxt );
		var strHash = hex_sha256( strTxt );
		strHash = strHash.toUpperCase();
	
		document.getElementById('txt2').value = strHash;
	}
}
</script>

</head>

<body>

<div class="container" >
	
	<div id="header">
		<div id="Logo"></div>
		<div id="LogoText">SHA256 Hash Generator</div>
	</div><!-- header -->

	<div class="sec_blank"></div>
	
	<div class="sec_tips">
	<p>This online tool allows you to generate the SHA256 hash of any string. SHA256 is designed by NSA, it's more reliable than SHA1.</p>
	<p>Enter your text below:</p>
	 </div>
	<textarea id="txt1" class="texts" onkeyup="calc();" autofocus></textarea>
	<div class="btn_parent">
		<div class="CalcHash" onclick="return calc();">Generate</div>
		<div class="CalcHash" onclick="return clearall();">Clear All</div>
		<div class="check_box"><label><input type="checkbox" name="separate_lines" id="separate_lines" onclick="calc();">Treat each line as a separate string</label></div>
	</div>
	
	<div class="sec_tips">
	<p>SHA256 Hash of your string:</p>
	</div>
	
	<textarea id="txt2" class="texts noboder" ></textarea>

	<div class="sec_blank"></div>
	
	<div id="sec_btm">
		<p>Copyright &copy; 2012 - 2015 <a href="http://PasswordsGenerator.net" title="Password Generator">PasswordsGenerator.net</a>. All Rights Reserved.</p>
		<p>Contact us: PasswordGenerator( at )outlook.com</p>
	</div><!-- sec_btm -->

<div style="clear:both"></div>
</div><!-- container -->



<!-- Piwik -->
<script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//ezmd5.com/log/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 7]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="//ezmd5.com/log/piwik.php?idsite=7" style="border:0;" alt="" /></p></noscript>
<!-- End Piwik Code -->


</body> 
</html>