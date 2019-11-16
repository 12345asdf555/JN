<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>

<head>
<base href="<%=basePath%>">
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=Generator content="Microsoft Word 15 (filtered)">
<title>Welding Procedure Specification (WPS)</title>

<script type="text/javascript" src="resources/js/FileSaver.js"></script>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="resources/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="resources/js/jquery.wordexport.js"></script>

<script>
	$(document).ready(function() {
		/* var wpsid = document.getElementById("wpsid"); */
		var wpsid = $("#wpsid").val();

		$.ajax({
			type : "post",
			async : false,
			url : "wps/outputWpsliblist?wpsid=" + wpsid,
			data : {},
			dataType : "json", //返回数据形式为json  
			success : function(result) {
				if (result) {
					document.getElementById("WPS Number and Revision").innerText = result.ary[0].wpslibName;
					document.getElementById("Date").innerText = result.ary[0].createdate;
					document.getElementById("Welding Procedure Qualification Record").innerText = result.ary[0].wpslibName;
					document.getElementById("PQR Certificate No").innerText = "";
					document.getElementById("Welding Process").innerText = result.ary[0].fweld_method_name;
					document.getElementById("Type").innerText = result.ary[0].fweld_way_name;
					document.getElementById("Welding Technique").innerText = result.ary[0].fweld_process_name;
					document.getElementById("Welding Positions").innerText = result.ary[0].fweld_position_name;
					document.getElementById("Specification and Grade – side 1").innerText = "EH36 DH36 AH36 EH32 DH32 AH32";
					document.getElementById("Specification and Grade – side 2").innerText = "EH36 DH36 AH36 EH32 DH32 AH32";
					document.getElementById("Form").innerText = "Plate 板材";
					document.getElementById("Thickness Range").innerText = "11.2~17.6";
					document.getElementById("Pipe Outside Diameter").innerText = "N/A";
					document.getElementById("Name").innerText = "L-61";
					document.getElementById("LR Grading").innerText = "4YTM";
					document.getElementById("National Classification (if any)").innerText = "AWS A 5.17/A5.17M:EM12k";
					document.getElementById("Filler Metal Sizes").innerText = "4.8mm";
					document.getElementById("Flux Type and Trade Name").innerText = "P230";
					document.getElementById("GCShielding").innerText = "GCN/A";
					document.getElementById("GFShielding").innerText = "GFN/A";
					document.getElementById("GCBacking").innerText = "GCN/A";
					document.getElementById("GFBacking").innerText = "GFN/A";
					document.getElementById("Tungsten Electrode Type & Size").innerText = "N/A";
					document.getElementById("Backing Strip Type & Size").innerText = "N/A";
					document.getElementById("Pre Heat Temperature").innerText = "/";
					document.getElementById("Interpass Temperature").innerText = "200℃";
					document.getElementById("Post weld Heat Treatment and/or Ageing").innerText = "1111";
					document.getElementById("Method").innerText = "/";
					document.getElementById("Temperature").innerText = "/";
					document.getElementById("Time").innerText = "/";
					document.getElementById("Heating and Cooling Rates").innerText = "/";
					document.getElementById("Method of Back Gouging and Cleaning").innerText = "/";
					document.getElementById("String or Weave Bead").innerText = "string 直拖";
					document.getElementById("Weaving").innerText = "/";
					document.getElementById("Amplitude").innerText = "/";
					document.getElementById("Frequency").innerText = "/";
					document.getElementById("Dwell time").innerText = "/";
					document.getElementById("Contact tube to work distance").innerText = "20~30mm";
					document.getElementById("Pulse Welding Details").innerText = "222";
					document.getElementById("Base Current").innerText = "/";
					document.getElementById("Base Time").innerText = "/";
					document.getElementById("Peak Current").innerText = "/";
					document.getElementById("Peak Time").innerText = "/";
					for (var i = 0; i < 10; i++) {
						if (i < result.dary.length) {
							document.getElementById("Run" + (i + 1).toString()).innerText = i + 1;
							document.getElementById("Process" + (i + 1).toString()).innerText = result.dary[i].fweld_method;
							document.getElementById("FillMet" + (i + 1).toString()).innerText = result.dary[i].dianame;
							document.getElementById("CurrA" + (i + 1).toString()).innerText = result.dary[i].fpreset_ele_bottom + "~" + result.dary[i].fpreset_ele_top;
							document.getElementById("Volt" + (i + 1).toString()).innerText = result.dary[i].fpreset_vol_bottom + "~" + result.dary[i].fpreset_vol_top;
							document.getElementById("Type" + (i + 1).toString()).innerText = result.dary[i].fpower_polarity;
							document.getElementById("WireSpeed" + (i + 1).toString()).innerText = "//";
							document.getElementById("Trav" + (i + 1).toString()).innerText = result.dary[i].fweld_speed;
							document.getElementById("Input" + (i + 1).toString()).innerText = "//";
						} else {
							document.getElementById("Run" + (i + 1).toString()).innerText = "-";
							document.getElementById("Process" + (i + 1).toString()).innerText = "-";
							document.getElementById("FillMet" + (i + 1).toString()).innerText = "-";
							document.getElementById("CurrA" + (i + 1).toString()).innerText = "-";
							document.getElementById("Volt" + (i + 1).toString()).innerText = "-";
							document.getElementById("Type" + (i + 1).toString()).innerText = "-";
							document.getElementById("WireSpeed" + (i + 1).toString()).innerText = "-";
							document.getElementById("Trav" + (i + 1).toString()).innerText = "-";
							document.getElementById("Input" + (i + 1).toString()).innerText = "-";
						}
					}
					document.getElementById("Other Information").innerText = "Each run/layer to be grinded free of slag";
				}
			},
			error : function(errorMsg) {
				alert("数据请求失败，请联系系统管理员!");
			}
		});
	});
</script>

<style>
<!-- /* Font Definitions */
@font-face {
	font-family: "MS Mincho";
	panose-1: 2 2 6 9 4 2 5 8 3 4;
}

@font-face {
	font-family: 宋体;
	panose-1: 2 1 6 0 3 1 1 1 1 1;
}

@font-face {
	font-family: "Cambria Math";
	panose-1: 2 4 5 3 5 4 6 3 2 4;
}

@font-face {
	font-family: "Book Antiqua";
	panose-1: 2 4 6 2 5 3 5 3 3 4;
}

@font-face {
	font-family: "Frutiger LT 45 Light";
}

@font-face {
	font-family: "Frutiger LT 65 Bold";
}

@font-face {
	font-family: "Lloyds Register Logo";
}

@font-face {
	font-family: "\@宋体";
	panose-1: 2 1 6 0 3 1 1 1 1 1;
}

@font-face {
	font-family: "\@MS Mincho";
	panose-1: 2 2 6 9 4 2 5 8 3 4;
}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal {
	margin: 0cm;
	margin-bottom: .0001pt;
	font-size: 10.0pt;
	font-family: "Times New Roman", serif;
}

h1 {
	margin-top: 12.0pt;
	margin-right: 0cm;
	margin-bottom: 3.0pt;
	margin-left: 0cm;
	page-break-after: avoid;
	font-size: 11.0pt;
	font-family: "Book Antiqua", serif;
	text-decoration: underline;
}

h2 {
	margin-top: 12.0pt;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 39.7pt;
	margin-bottom: .0001pt;
	text-indent: -39.7pt;
	line-height: 15.0pt;
	font-size: 11.0pt;
	font-family: "Book Antiqua", serif;
}

h3 {
	margin-top: 12.0pt;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 39.7pt;
	margin-bottom: .0001pt;
	text-indent: -39.7pt;
	line-height: 15.0pt;
	font-size: 11.0pt;
	font-family: "Book Antiqua", serif;
}

h4 {
	margin-top: 12.0pt;
	margin-right: 0cm;
	margin-bottom: 0cm;
	margin-left: 39.7pt;
	margin-bottom: .0001pt;
	text-indent: -39.7pt;
	line-height: 15.0pt;
	font-size: 11.0pt;
	font-family: "Book Antiqua", serif;
}

h5 {
	margin: 0cm;
	margin-bottom: .0001pt;
	page-break-after: avoid;
	font-size: 11.0pt;
	font-family: "Book Antiqua", serif;
	font-weight: normal;
}

h6 {
	margin-top: 12.0pt;
	margin-right: 0cm;
	margin-bottom: 3.0pt;
	margin-left: 212.4pt;
	text-align: justify;
	text-justify: inter-ideograph;
	text-indent: -35.4pt;
	font-size: 11.0pt;
	font-family: "Arial", sans-serif;
	font-weight: normal;
	font-style: italic;
}

p.MsoHeading7, li.MsoHeading7, div.MsoHeading7 {
	margin-top: 12.0pt;
	margin-right: 0cm;
	margin-bottom: 3.0pt;
	margin-left: 247.8pt;
	text-align: justify;
	text-justify: inter-ideograph;
	text-indent: -35.4pt;
	font-size: 10.0pt;
	font-family: "Arial", sans-serif;
}

p.MsoHeading8, li.MsoHeading8, div.MsoHeading8 {
	margin-top: 12.0pt;
	margin-right: 0cm;
	margin-bottom: 3.0pt;
	margin-left: 283.2pt;
	text-align: justify;
	text-justify: inter-ideograph;
	text-indent: -35.4pt;
	font-size: 10.0pt;
	font-family: "Arial", sans-serif;
	font-style: italic;
}

p.MsoHeading9, li.MsoHeading9, div.MsoHeading9 {
	margin-top: 12.0pt;
	margin-right: 0cm;
	margin-bottom: 3.0pt;
	margin-left: 318.6pt;
	text-align: justify;
	text-justify: inter-ideograph;
	text-indent: -35.4pt;
	font-size: 9.0pt;
	font-family: "Arial", sans-serif;
	font-style: italic;
}

p.MsoHeader, li.MsoHeader, div.MsoHeader {
	margin: 0cm;
	margin-bottom: .0001pt;
	font-size: 10.0pt;
	font-family: "Times New Roman", serif;
}

p.MsoFooter, li.MsoFooter, div.MsoFooter {
	margin: 0cm;
	margin-bottom: .0001pt;
	font-size: 10.0pt;
	font-family: "Times New Roman", serif;
}

p.MsoAcetate, li.MsoAcetate, div.MsoAcetate {
	mso-style-link: "批注框文本 字符";
	margin: 0cm;
	margin-bottom: .0001pt;
	font-size: 9.0pt;
	font-family: "Times New Roman", serif;
}

p.LRSubTitle, li.LRSubTitle, div.LRSubTitle {
	mso-style-name: LRSubTitle;
	margin: 0cm;
	margin-bottom: .0001pt;
	line-height: 13.0pt;
	font-size: 10.0pt;
	font-family: "Frutiger LT 45 Light", sans-serif;
}

p.LRTitle, li.LRTitle, div.LRTitle {
	mso-style-name: LRTitle;
	margin: 0cm;
	margin-bottom: .0001pt;
	line-height: 24.0pt;
	font-size: 20.0pt;
	font-family: "Frutiger LT 45 Light", sans-serif;
}

p.LRBodyText, li.LRBodyText, div.LRBodyText {
	mso-style-name: LRBodyText;
	margin: 0cm;
	margin-bottom: .0001pt;
	line-height: 11.0pt;
	font-size: 8.0pt;
	font-family: "Frutiger LT 45 Light", sans-serif;
}

p.LRBodyData, li.LRBodyData, div.LRBodyData {
	mso-style-name: LRBodyData;
	margin: 0cm;
	margin-bottom: .0001pt;
	line-height: 11.0pt;
	font-size: 8.0pt;
	font-family: "Frutiger LT 65 Bold", sans-serif;
}

p.LRTableHeading, li.LRTableHeading, div.LRTableHeading {
	mso-style-name: LRTableHeading;
	margin: 0cm;
	margin-bottom: .0001pt;
	line-height: 10.0pt;
	font-size: 8.0pt;
	font-family: "Frutiger LT 65 Bold", sans-serif;
}

p.LRTableText, li.LRTableText, div.LRTableText {
	mso-style-name: LRTableText;
	margin: 0cm;
	margin-bottom: .0001pt;
	line-height: 9.0pt;
	font-size: 7.0pt;
	font-family: "Frutiger LT 45 Light", sans-serif;
}

p.LRTableData, li.LRTableData, div.LRTableData {
	mso-style-name: LRTableData;
	margin: 0cm;
	margin-bottom: .0001pt;
	line-height: 10.0pt;
	font-size: 8.0pt;
	font-family: "Frutiger LT 65 Bold", sans-serif;
}

p.LREndorsementTitle, li.LREndorsementTitle, div.LREndorsementTitle {
	mso-style-name: LREndorsementTitle;
	margin: 0cm;
	margin-bottom: .0001pt;
	line-height: 13.0pt;
	font-size: 10.0pt;
	font-family: "Frutiger LT 65 Bold", sans-serif;
}

p.LRFootnotes, li.LRFootnotes, div.LRFootnotes {
	mso-style-name: LRFootnotes;
	margin: 0cm;
	margin-bottom: .0001pt;
	line-height: 9.0pt;
	font-size: 7.0pt;
	font-family: "Frutiger LT 45 Light", sans-serif;
	font-style: italic;
}

p.LRDisclaimer, li.LRDisclaimer, div.LRDisclaimer {
	mso-style-name: LRDisclaimer;
	margin: 0cm;
	margin-bottom: .0001pt;
	text-align: justify;
	text-justify: inter-ideograph;
	line-height: 8.5pt;
	font-size: 7.0pt;
	font-family: "Frutiger LT 45 Light", sans-serif;
}

p.LRStatements, li.LRStatements, div.LRStatements {
	mso-style-name: LRStatements;
	margin: 0cm;
	margin-bottom: .0001pt;
	line-height: 10.0pt;
	font-size: 8.0pt;
	font-family: "Frutiger LT 45 Light", sans-serif;
}

p.LRCaption2, li.LRCaption2, div.LRCaption2 {
	mso-style-name: LRCaption2;
	margin: 0cm;
	margin-bottom: .0001pt;
	font-size: 8.0pt;
	font-family: "Book Antiqua", serif;
}

p.LRCaption1, li.LRCaption1, div.LRCaption1 {
	mso-style-name: LRCaption1;
	margin: 0cm;
	margin-bottom: .0001pt;
	font-size: 7.0pt;
	font-family: "Book Antiqua", serif;
}

p.DocumentTitle, li.DocumentTitle, div.DocumentTitle {
	mso-style-name: "Document Title";
	margin: 0cm;
	margin-bottom: .0001pt;
	font-size: 14.0pt;
	font-family: "Book Antiqua", serif;
	font-weight: bold;
}

p.LRTextIN, li.LRTextIN, div.LRTextIN {
	mso-style-name: LRTextIN;
	margin: 0cm;
	margin-bottom: .0001pt;
	font-size: 10.0pt;
	font-family: "Book Antiqua", serif;
}

p.LRCaption3, li.LRCaption3, div.LRCaption3 {
	mso-style-name: LRCaption3;
	margin: 0cm;
	margin-bottom: .0001pt;
	font-size: 10.0pt;
	font-family: "Book Antiqua", serif;
}

p.LRFooter, li.LRFooter, div.LRFooter {
	mso-style-name: LRFooter;
	margin: 0cm;
	margin-bottom: .0001pt;
	font-size: 7.0pt;
	font-family: "Book Antiqua", serif;
}

p.LRLogo, li.LRLogo, div.LRLogo {
	mso-style-name: LRLogo;
	margin: 0cm;
	margin-bottom: .0001pt;
	font-size: 62.0pt;
	font-family: "Lloyds Register Logo";
}

span.a {
	mso-style-name: "批注框文本 字符";
	mso-style-link: 批注框文本;
	font-family: "Times New Roman", serif;
}

.MsoChpDefault {
	font-size: 10.0pt;
}
/* Page Definitions */
@page WordSection1 {
	size: 595.3pt 841.9pt;
	margin: 36.0pt 40.0pt 36.0pt 44.0pt;
}

div.WordSection1 {
	page: WordSection1;
}

@page WordSection2 {
	size: 595.3pt 841.9pt;
	margin: 36.0pt 40.0pt 36.0pt 44.0pt;
}

div.WordSection2 {
	page: WordSection2;
}

@page WordSection3 {
	size: 595.3pt 841.9pt;
	margin: 36.0pt 40.0pt 36.0pt 44.0pt;
}

div.WordSection3 {
	page: WordSection3;
}

@page WordSection4 {
	size: 595.3pt 841.9pt;
	margin: 36.0pt 42.55pt 36.0pt 42.55pt;
}

div.WordSection4 {
	page: WordSection4;
}
/* List Definitions */
ol {
	margin-bottom: 0cm;
}

ul {
	margin-bottom: 0cm;
}
-->
</style>

</head>

<body lang=ZH-CN>
	<input name="wpsid" id="wpsid" type="hidden" value="${wpsid}" />
	<button onclick="outputText()">导出</button>
	<a href="wps/goWpslib;" class="easyui-linkbutton" iconCls="icon-newadd">返回</a>

	<div id="export_word">

		<div class=WordSection1>

			<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
				width=698 style='width:523.4pt;border-collapse:collapse'>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td>
					<td width=404 colspan=4 rowspan=2 valign=top
						style='width:303.0pt;padding:
  1.0pt 6.0pt 0cm 6.0pt;height:11.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Info></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=131 colspan=2 valign=top
						style='width:98.4pt;padding:1.0pt 6.0pt 0cm 6.0pt;
  height:11.0pt'>
						<p class=LRStatements>
							<span lang=EN-GB>Certificate no</span><span
								style='font-family:宋体'>证书编号</span><span lang=EN-GB>:</span>
						</p>
					</td>
					<td width=163 rowspan=2 valign=top
						style='width:122.0pt;padding:1.0pt 6.0pt 0cm 6.0pt;
  height:11.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name="LR_M_CertNumber"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=131 colspan=2 valign=top
						style='width:98.4pt;padding:1.0pt 6.0pt 0cm 6.0pt;
  height:11.0pt'>
						<p class=LRStatements>
							<span lang=EN-GB>Page </span><span lang=EN-GB>1</span><span
								lang=EN-GB> of </span><span lang=EN-GB>2</span><span
								style='font-family:宋体'>共</span><span lang=EN-GB>2</span><span
								style='font-family:宋体'>页第</span><span lang=EN-GB>1</span><span
								style='font-family:宋体'>页</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:75.1pt'>
					<td width=100 valign=top
						style='width:75.1pt;padding:1.0pt 6.0pt 0cm 6.0pt;
  height:75.1pt'>
						<p class=MsoNormal style='margin-top:4.0pt'>
							<span lang=EN-US><img width=84 height=90 id="Picture 1"
								src="resources/js/CCS-510%20WPSf.files/image001.gif" alt=LR></span>
						</p>
					</td>
					<td width=598 colspan=6 valign=bottom
						style='width:448.3pt;padding:1.0pt 6.0pt 0cm 6.0pt;
  height:75.1pt'>
						<p class=LRTitle>
							<span lang=EN-GB>Welding Procedure Specification (WPS)</span>
						</p>
						<p class=LRTitle>
							<b><span style='font-family:宋体'>焊接工艺说明书</span></b>
						</p>
					</td>
				</tr>
				<tr style='height:11.0pt'>
					<td width=698 colspan=7
						style='width:523.4pt;border:none;border-top:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:11.0pt'>
						<p class=LRTableText>
							<span lang=FR>Qualification Codes/Standards</span><span
								style='font-family:宋体'>用于认可的法规</span><span lang=FR>/</span><span
								style='font-family:宋体'>标准</span><span lang=FR>:</span>
						</p>
					</td>
				</tr>
				<tr style='height:13.0pt'>
					<td width=698 colspan=7
						style='width:523.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Qualification></a>LR Rules for
								the Manufaceture, Testing and Certification of Materials, July
								201</span><span lang=EN-GB>6</span><span lang=EN-GB> </span>
						</p>
					</td>
				</tr>
				<tr style='height:11.0pt'>
					<td width=348 colspan=3
						style='width:261.1pt;background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Manufacturer’s Name</span><span
								style='font-family:宋体'>制造商的名称</span><span lang=EN-GB>:</span>
						</p>
					</td>
					<td width=350 colspan=4
						style='width:262.3pt;background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Manufacturer’s Address</span><span
								style='font-family:宋体'>制造商的地址</span><span lang=EN-GB>:</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:24.0pt'>
					<td width=348 colspan=3 valign=top
						style='width:261.1pt;border:none;
  border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:24.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=ManName></a>JIANGNAN SHIPYARD
								(GROUP) Co.,Ltd</span>
						</p>
					</td>
					<td width=350 colspan=4 valign=top
						style='width:262.3pt;border:none;
  border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:24.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=MannAdd></a>988 Changxing
								Jiangnan Avenue,&nbsp; Changxing Island, Shanghai, P. R. China</span>
						</p>
					</td>
				</tr>
				<tr>
					<td width=174 colspan=2 valign=top
						style='width:130.85pt;border:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>WPS Number and Revision:</span>
						</p>
						<p class=LRTableText>
							<span style='font-family:宋体'>焊接工艺说明书编号和版本</span><span lang=EN-GB>:</span>
						</p>
					</td>
					<td width=174 valign=top
						style='width:130.25pt;border:none;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Date:</span>
						</p>
						<p class=LRTableText>
							<span style='font-family:宋体'>日期</span><span lang=EN-GB>:</span>
						</p>
					</td>
					<td width=174 colspan=2 valign=top
						style='width:130.25pt;border:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Welding Procedure Qualification Record No</span><span
								style='font-family:宋体'>焊接工艺评定记录编号</span><span lang=EN-GB>(PQR):</span>
						</p>
					</td>
					<td width=176 colspan=2 valign=top
						style='width:132.05pt;border:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>PQR Certificate No</span><span lang=EN-GB>:</span>
						</p>
						<p class=LRTableText>
							<span style='font-family:宋体'>焊接工艺评定记录证书编号</span><span lang=EN-GB>:</span>
						</p>
					</td>
				</tr>
				<tr style='height:13.0pt'>
					<td width=174 colspan=2
						style='width:130.85pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="WPS Number and Revision" lang=EN-GB><a name=WPS1></a></span>
						</p>
					</td>
					<td width=174
						style='width:130.25pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Date" lang=EN-GB><a name=Text45></a></span>
						</p>
					</td>
					<td width=174 colspan=2
						style='width:130.25pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Welding Procedure Qualification Record" lang=EN-GB><a
								name=Weld1></a></span>
						</p>
					</td>
					<td width=176 colspan=2
						style='width:132.05pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<a name=PQRCertNo></a><span id="PQR Certificate No" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='height:11.0pt'>
					<td width=348 colspan=3
						style='width:261.1pt;background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Welding Process</span><span
								style='font-family:宋体'>焊接方法</span><span lang=EN-GB>:</span>
						</p>
					</td>
					<td width=350 colspan=4
						style='width:262.3pt;background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Type</span><span style='font-family:
  宋体'>焊接方式</span><span
								lang=EN-GB>:</span>
						</p>
					</td>
				</tr>
				<tr style='height:13.0pt'>
					<td width=348 colspan=3
						style='width:261.1pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Welding Process" lang=EN-GB><a name=WeldProcess></a></span>
						</p>
					</td>
					<td width=350 colspan=4
						style='width:262.3pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<a name=Type></a><span id="Type" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='height:11.0pt'>
					<td width=698 colspan=7
						style='width:523.4pt;background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Welding Technique</span><span
								style='font-family:宋体'>焊接工艺</span><span lang=EN-GB>:</span>
						</p>
					</td>
				</tr>
				<tr style='height:21.0pt'>
					<td width=698 colspan=7
						style='width:523.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:21.0pt'>
						<p class=LRTableData>
							<a name=WeldTech></a><span id="Welding Technique" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='height:11.0pt'>
					<td width=698 colspan=7
						style='width:523.4pt;background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Welding Positions</span><span
								style='font-family:宋体'>焊接位置</span><span lang=EN-GB>:</span>
						</p>
					</td>
				</tr>
				<tr style='height:13.0pt'>
					<td width=698 colspan=7
						style='width:523.4pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=WeldPos></a></span><span
								id="Welding Positions" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:12.0pt'>
					<td width=698 colspan=7
						style='width:523.4pt;background:#CCCCCC;padding:0cm 5.4pt 0cm 5.4pt;
  height:12.0pt'>
						<p class=LRTableHeading>
							<span lang=EN-GB>Weld Preparation Details (Sketch)</span><b><span
								style='font-family:宋体'>焊前坡口准备细节（简图）</span></b>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid'>
					<td width=348 colspan=3
						style='width:261.1pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Joint Design</span><span style='font-family:宋体'>接头型式</span><span
								lang=EN-GB style='color:white'><a name=Text44></a>double
								click to edit picture</span>
						</p>
					</td>
					<td width=350 colspan=4
						style='width:262.3pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Welding Sequences</span><span
								style='font-family:宋体'>焊道布置</span><span lang=EN-GB
								style='color:white'>double click to edit picture</span>
						</p>
					</td>
				</tr>
				<tr height=0>
					<td width=100 style='border:none'></td>
					<td width=74 style='border:none'></td>
					<td width=174 style='border:none'></td>
					<td width=56 style='border:none'></td>
					<td width=118 style='border:none'></td>
					<td width=13 style='border:none'></td>
					<td width=163 style='border:none'></td>
				</tr>
			</table>

			<p class=LRTableText>
				<span lang=EN-GB>&nbsp;</span>
			</p>

		</div>

		<span lang=EN-GB
			style='font-size:7.0pt;font-family:"Frutiger LT 45 Light",sans-serif'><br
			clear=all style='page-break-before:auto'> </span>

		<div class=WordSection2>

			<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
				width=697 style='width:522.8pt;border-collapse:collapse'>
				<tr style='height:140.0pt'>
					<td width=348
						style='width:261.1pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:140.0pt'>
						<p class=LRCaption2 align=center style='text-align:center'>
							<a name="_MON_1059483429"></a><a name="_MON_1059483446"></a><a
								name="_MON_1059483458"></a><a name="_MON_1059483674"></a><a
								name="_MON_1060089089"></a><a name="_MON_1073299871"></a><a
								name="_MON_1081772259"></a><a name="_MON_1092465225"></a><a
								name="_MON_1110715300"></a><a name="_MON_1110715323"></a><a
								name="_MON_1110715325"></a><a name="_MON_1110715337"></a><a
								name="_MON_1110715340"></a><a name="_MON_1110715356"></a><a
								name="_MON_1110715363"></a><a name="_MON_1161076227"></a><a
								name="_MON_1161077047"></a><a name="_MON_1161080594"></a><span
								lang=EN-GB><img width=329 height=199
								src="resources/js/CCS-510%20WPSf.files/image002.gif"></span>
						</p>
					</td>
					<td width=349
						style='width:261.7pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:140.0pt'>
						<p class=LRCaption2 style='text-indent:24.0pt'>
							<span lang=EN-GB><img width=217 height=132
								src="resources/js/CCS-510%20WPSf.files/image003.gif"></span>
						</p>
					</td>
				</tr>
			</table>

		</div>

		<span lang=EN-GB
			style='font-size:5.0pt;font-family:"Book Antiqua",serif'><br
			clear=all style='page-break-before:auto'> </span>

		<div class=WordSection3>

			<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
				width=697 style='width:522.8pt;border-collapse:collapse'>
				<tr style='page-break-inside:avoid;height:12.0pt'>
					<td width=697 colspan=8
						style='width:522.8pt;background:#CCCCCC;padding:0cm 5.4pt 0cm 5.4pt;
  height:12.0pt'>
						<p class=LRTableHeading>
							<span lang=EN-GB>Base Material Details</span><b><span
								style='font-family:宋体'>母材金属的详细信息</span></b>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=697 colspan=8
						style='width:522.8pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Specification and Grade – side 1</span><span
								style='font-family:宋体'>标准和级别</span><span lang=EN-GB>–</span><span
								style='font-family:宋体'>第</span><span lang=EN-GB>1 </span><span
								style='font-family:宋体'>侧</span><span lang=EN-GB>:</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=697 colspan=8
						style='width:522.8pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=MatSpec1></a></span><span
								id="Specification and Grade – side 1" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=697 colspan=8
						style='width:522.8pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Specification and Grade – side 2</span><span
								style='font-family:宋体'>标准和级别</span><span lang=EN-GB>–</span><span
								style='font-family:宋体'>第</span><span lang=EN-GB>2 </span><span
								style='font-family:宋体'>侧</span><span lang=EN-GB>:</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=697 colspan=8
						style='width:522.8pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Specification and Grade – side 2" lang=EN-GB><a
								name=MatSpec2></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=232 colspan=2
						style='width:174.25pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Form</span><span style='font-family:
  宋体'>型式</span><span
								lang=EN-GB>:</span>
						</p>
					</td>
					<td width=232 colspan=4
						style='width:173.65pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Thickness Range </span><span
								style='font-family:宋体'>厚度范围 </span><span lang=EN-GB>(mm):</span>
						</p>
					</td>
					<td width=233 colspan=2
						style='width:174.9pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Pipe Outside Diameter </span><span
								style='font-family:宋体'>管子外径 </span><span lang=EN-GB>(mm):</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=232 colspan=2
						style='width:174.25pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<a name=Dropdown2></a><span id="Form" lang=EN-GB></span>
						</p>
					</td>
					<td width=232 colspan=4
						style='width:173.65pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=MatThick></a></span><span
								id="Thickness Range" lang=EN-GB></span>
						</p>
					</td>
					<td width=233 colspan=2
						style='width:174.9pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Pipe Outside Diameter" lang=EN-GB><a
								name=PipeOut></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:12.0pt'>
					<td width=697 colspan=8
						style='width:522.8pt;background:#CCCCCC;padding:0cm 5.4pt 0cm 5.4pt;
  height:12.0pt'>
						<p class=LRTableHeading>
							<span lang=EN-GB>Consumable Details</span><b><span
								style='font-family:宋体'>焊接材料的详细信息</span></b>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=697 colspan=8
						style='width:522.8pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Filler Metal</span><span style='font-family:宋体'>填充金属</span><span
								lang=EN-GB>:</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=232 colspan=2
						style='width:174.25pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Name</span><span style='font-family:
  宋体'>名称</span><span
								lang=EN-GB>:</span>
						</p>
					</td>
					<td width=232 colspan=4
						style='width:173.65pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>LR Grading</span><span style='font-family:宋体'>劳氏船级社的级别</span><span
								lang=EN-GB>:</span>
						</p>
					</td>
					<td width=233 colspan=2
						style='width:174.9pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>National Classification (if any)</span><span
								style='font-family:宋体'>国家标准级别</span><span lang=EN-GB>(</span><span
								style='font-family:宋体'>如果适用</span><span lang=EN-GB>):</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=232 colspan=2
						style='width:174.25pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text49></a></span><span id="Name"
								lang=EN-GB></span>
						</p>
					</td>
					<td width=232 colspan=4
						style='width:173.65pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text50></a></span><span id="LR Grading"
								lang=EN-GB></span>
						</p>
					</td>
					<td width=233 colspan=2
						style='width:174.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text51></a></span><span
								id="National Classification (if any)" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=697 colspan=8 valign=top
						style='width:522.8pt;border:none;
  border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=FillMat></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=352 colspan=4
						style='width:264.0pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Filler Metal Sizes</span><span
								style='font-family:宋体'>填充金属的尺寸 </span><span lang=EN-GB>(mm):</span>
						</p>
					</td>
					<td width=345 colspan=4
						style='width:258.8pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Flux Type and Trade Name</span><span
								style='font-family:宋体'>焊剂的形式和商品名称</span><span lang=EN-GB>:</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:30.0pt'>
					<td width=352 colspan=4 valign=top
						style='width:264.0pt;border:none;
  border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=FillMetSizes></a></span><span
								id="Filler Metal Sizes" lang=EN-GB></span>
						</p>
					</td>
					<td width=345 colspan=4 valign=top
						style='width:258.8pt;border:none;
  border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text52></a></span><span
								id="Flux Type and Trade Name" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=115 rowspan=2
						style='width:86.4pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Gas Composition</span><span lang=EN-GB>:</span>
						</p>
						<p class=LRTableText>
							<span style='font-family:宋体'>气体成分</span><span lang=EN-GB>:</span>
						</p>
					</td>
					<td width=120 colspan=2
						style='width:90.0pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Shielding</span><span style='font-family:
  宋体'>保护气体</span>
						</p>
					</td>
					<td width=117
						style='width:87.6pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="GCShielding" lang=EN-GB><a name=GFShield1></a></span>
						</p>
					</td>
					<td width=75 rowspan=2
						style='width:56.4pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Gas Flow Rate</span><span lang=EN-GB>:</span>
						</p>
						<p class=LRTableText>
							<span style='font-family:宋体'>气体流量</span><span lang=EN-GB>:</span>
						</p>
					</td>
					<td width=101 colspan=2
						style='width:75.45pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Shielding</span><span style='font-family:
  宋体'>保护气体</span>
						</p>
					</td>
					<td width=169
						style='width:126.95pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="GFShielding" lang=EN-GB><a name=GFShield2></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=120 colspan=2
						style='width:90.0pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Backing</span><span style='font-family:
  宋体'>背部气体</span>
						</p>
					</td>
					<td width=117
						style='width:87.6pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="GCBacking" lang=EN-GB><a name=GFBack1></a></span>
						</p>
					</td>
					<td width=101 colspan=2
						style='width:75.45pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Backing</span><span style='font-family:
  宋体'>背部气体</span>
						</p>
					</td>
					<td width=169
						style='width:126.95pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="GFBacking" lang=EN-GB><a name=GFBack2></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=235 colspan=3
						style='width:176.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Tungsten Electrode Type &amp; Size</span><span
								style='font-family:宋体'>钨极的形式和尺寸</span><span lang=EN-GB>:</span>
						</p>
					</td>
					<td width=462 colspan=5
						style='width:346.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Tungsten Electrode Type & Size" lang=EN-GB><a
								name=ElectSize></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=235 colspan=3
						style='width:176.4pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Backing Strip Type &amp; Size</span><span
								style='font-family:宋体'>背部衬垫的形式和尺寸</span><span lang=EN-GB>:</span>
						</p>
					</td>
					<td width=462 colspan=5
						style='width:346.4pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Backing Strip Type & Size" lang=EN-GB><a
								name=BackStripSize></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid'>
					<td width=697 colspan=8
						style='width:522.8pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRFootnotes>
							<span lang=EN-GB>&#8224; Select from dropdown menu</span><span
								style='font-family:宋体'>通过下拉菜单来选择</span>
						</p>
						<p class=LRFootnotes>
							<span lang=EN-GB>* Delete as appropriate</span><span
								style='font-family:宋体'>删出不适用的项目</span>
						</p>
					</td>
				</tr>
				<tr height=0>
					<td width=115 style='border:none'></td>
					<td width=117 style='border:none'></td>
					<td width=3 style='border:none'></td>
					<td width=117 style='border:none'></td>
					<td width=75 style='border:none'></td>
					<td width=37 style='border:none'></td>
					<td width=64 style='border:none'></td>
					<td width=169 style='border:none'></td>
				</tr>
			</table>

		</div>

		<span lang=EN-GB
			style='font-size:10.0pt;font-family:"Times New Roman",serif'><br
			clear=all style='page-break-before:always'> </span>

		<div class=WordSection4>

			<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
				width=697 style='width:522.9pt;border-collapse:collapse'>
				<tr style='page-break-inside:avoid;height:12.0pt'>
					<td width=697 colspan=19
						style='width:522.8pt;border:none;border-top:solid silver 1.0pt;
  background:#CCCCCC;padding:0cm 5.4pt 0cm 5.4pt;height:12.0pt'>
						<p class=LRTableHeading>
							<span lang=EN-GB>Preheat/Heat Treatment Details</span><b><span
								style='font-family:宋体'>预热</span></b><b><span lang=EN-GB>/</span></b><b><span
								style='font-family:宋体'>焊后热处理的详细信息</span></b><span lang=EN-GB>:</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=199 colspan=5
						style='width:149.4pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Pre Heat Temperature</span><span
								style='font-family:宋体'>预热温度</span><span lang=EN-GB>&#730;C
								(min</span><span style='font-family:宋体'>最低</span><span lang=EN-GB>):</span>
						</p>
					</td>
					<td width=148 colspan=4
						style='width:111.1pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Pre Heat Temperature" lang=EN-GB><a name=PreHeat></a></span><span
								lang=EN-GB></span>
						</p>
					</td>
					<td width=212 colspan=8
						style='width:158.9pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Interpass Temperature</span><span
								style='font-family:宋体'>层间温度</span><span lang=EN-GB>&#730;C
								(max</span><span style='font-family:宋体'>最高</span><span lang=EN-GB>):</span>
						</p>
					</td>
					<td width=138 colspan=2
						style='width:103.4pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Interpass></a></span><span
								id="Interpass Temperature" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=400 colspan=15
						style='width:300.8pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Post weld Heat Treatment and/or Ageing</span><span
								style='font-family:宋体'>焊后热处理和</span><span lang=EN-GB>/</span><span
								style='font-family:宋体'>或时效处理</span><span lang=EN-GB>:</span>
						</p>
					</td>
					<td width=498 colspan=2
						style='width:373.4pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=HeatCoolRates></a></span><span
								id="Post weld Heat Treatment and/or Ageing" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=347 colspan=9
						style='width:260.5pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Method</span><span style='font-family:
  宋体'>方法</span><span
								lang=EN-GB>:</span>
						</p>
					</td>
					<td width=180 colspan=6
						style='width:134.8pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Temperature</span><span style='font-family:宋体'>温度</span><span
								lang=EN-GB> &#730;C:</span>
						</p>
					</td>
					<td width=170 colspan=4
						style='width:127.5pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Time</span><span style='font-family:
  宋体'>时间</span><span
								lang=EN-GB>:</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=347 colspan=9
						style='width:260.5pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Method2></a></span><span id="Method"
								lang=EN-GB></span>
						</p>
					</td>
					<td width=180 colspan=6
						style='width:134.8pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Temp2></a></span><span id="Temperature"
								lang=EN-GB></span>
						</p>
					</td>
					<td width=170 colspan=4
						style='width:127.5pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Time2></a></span><span id="Time"
								lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=199 colspan=5
						style='width:149.4pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Heating and Cooling Rates</span><span
								style='font-family:宋体'>加热和冷却速度</span><span lang=EN-GB>:</span>
						</p>
					</td>
					<td width=498 colspan=14
						style='width:373.4pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=HeatCoolRates></a></span><span
								id="Heating and Cooling Rates" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:6.0pt'>
					<td width=697 colspan=19
						style='width:522.8pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRCaption2>
							<span lang=EN-GB style='font-size:5.0pt'>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:12.0pt'>
					<td width=697 colspan=19
						style='width:522.8pt;background:#CCCCCC;padding:
  0cm 5.4pt 0cm 5.4pt;height:12.0pt'>
						<p class=LRTableHeading>
							<span lang=EN-GB>Technique Details</span><b><span
								style='font-family:宋体'>技术细节</span></b><span lang=EN-GB>:</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=697 colspan=19
						style='width:522.8pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Method of Back Gouging and Cleaning</span><span
								style='font-family:宋体'>背部刨槽和清理的方法</span><span lang=EN-GB>:</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=697 colspan=19
						style='width:522.8pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=MethodBackGouge></a></span><span
								id="Method of Back Gouging and Cleaning" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=347 colspan=9
						style='width:260.5pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>String or Weave Bead</span><span
								style='font-family:宋体'>直拖焊道或摆动焊道</span><span lang=EN-GB>:</span>
						</p>
					</td>
					<td width=350 colspan=10
						style='width:262.3pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Weaving</span><span style='font-family:
  宋体'>摆幅</span><span
								lang=EN-GB> (Maximum width of run</span><span
								style='font-family:宋体'>焊道最大宽度</span><span lang=EN-GB>)</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=347 colspan=9
						style='width:260.5pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableText>
							<span id="String or Weave Bead" lang=EN-GB><a
								name=WeavLimits></a></span>
						</p>
					</td>
					<td width=350 colspan=10
						style='width:262.3pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text56></a></span><span id="Weaving"
								lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=92 colspan=2 rowspan=2
						style='width:68.9pt;border:none;border-bottom:
  solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Oscillations:</span>
						</p>
						<p class=LRTableText>
							<span style='font-family:宋体'>机械摆动</span><span lang=EN-GB>:</span>
						</p>
					</td>
					<td width=201 colspan=5
						style='width:150.55pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Amplitude</span><span style='font-family:
  宋体'>摆幅</span>
						</p>
					</td>
					<td width=201 colspan=5
						style='width:150.55pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Frequency</span><span style='font-family:
  宋体'>频率</span>
						</p>
					</td>
					<td width=204 colspan=7
						style='width:152.8pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Dwell time</span><span style='font-family:宋体'>停留时间</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=201 colspan=5
						style='width:150.55pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Amplitude></a></span><span
								id="Amplitude" lang=EN-GB></span>
						</p>
					</td>
					<td width=201 colspan=5
						style='width:150.55pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Frequency></a></span><span
								id="Frequency" lang=EN-GB></span>
						</p>
					</td>
					<td width=204 colspan=7
						style='width:152.8pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=DwellTime></a></span><span
								id="Dwell time" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=697 colspan=19
						style='width:522.8pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Contact tube to work distance</span><span
								style='font-family:宋体'>导电嘴到工件的距离</span><span lang=EN-GB>:</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=697 colspan=19
						style='width:522.8pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Contact tube to work distance" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=697 colspan=5
						style='width:522.8pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Pulse Welding Details</span><span
								style='font-family:宋体'>脉冲焊接的细节</span><span lang=EN-GB>:</span>
						</p>
					</td>
					<td width=498 colspan=14
						style='width:373.4pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=HeatCoolRates></a></span><span
								id="Pulse Welding Details" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=174 colspan=4
						style='width:130.2pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Base Current</span><span style='font-family:宋体'>基础电流</span><span
								lang=EN-GB>:</span>
						</p>
					</td>
					<td width=174 colspan=5
						style='width:130.3pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Base Time</span><span style='font-family:
  宋体'>基础时间</span><span
								lang=EN-GB>:</span>
						</p>
					</td>
					<td width=174 colspan=5
						style='width:130.3pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Peak Current</span><span style='font-family:宋体'>峰值电流</span><span
								lang=EN-GB>:</span>
						</p>
					</td>
					<td width=176 colspan=5
						style='width:132.0pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Peak Time</span><span style='font-family:
  宋体'>峰值时间</span><span
								lang=EN-GB>:</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=174 colspan=4
						style='width:130.2pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Base Current" lang=EN-GB></span>
						</p>
					</td>
					<td width=174 colspan=5
						style='width:130.3pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text53></a></span><span id="Base Time"
								lang=EN-GB></span>
						</p>
					</td>
					<td width=174 colspan=5
						style='width:130.3pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text54></a></span><span
								id="Peak Current" lang=EN-GB></span>
						</p>
					</td>
					<td width=176 colspan=5
						style='width:132.0pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text55></a></span><span id="Peak Time"
								lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:6.0pt'>
					<td width=697 colspan=19
						style='width:522.8pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRCaption2>
							<span lang=EN-GB style='font-size:5.0pt'>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:12.0pt'>
					<td width=697 colspan=19
						style='width:522.8pt;background:#CCCCCC;padding:
  0cm 5.4pt 0cm 5.4pt;height:12.0pt'>
						<p class=LRTableHeading>
							<span lang=EN-GB>Welding Details</span><b><span
								style='font-family:宋体'>焊接细节</span></b>
						</p>
					</td>
				</tr>
				<tr>
					<td width=54 valign=top
						style='width:40.55pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Run</span>
						</p>
						<p class=LRTableText>
							<span style='font-family:宋体'>焊道</span>
						</p>
					</td>
					<td width=75 colspan=2 valign=top
						style='width:56.5pt;border:none;border-right:
  solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Process</span>
						</p>
						<p class=LRTableText>
							<span style='font-family:宋体'>焊接方法</span>
						</p>
					</td>
					<td width=76 colspan=3 valign=top
						style='width:56.85pt;border:none;
  border-right:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Size of Filler Metal</span>
						</p>
						<p class=LRTableText>
							<span style='font-family:宋体'>填充金属尺寸</span>
						</p>
					</td>
					<td width=98 colspan=2 valign=top
						style='width:73.2pt;border:none;border-right:
  solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Current</span>
						</p>
						<p class=LRTableText>
							<span style='font-family:宋体'>焊接电流</span>
						</p>
						<p class=LRTableText>
							<span lang=EN-GB>A</span>
						</p>
					</td>
					<td width=64 colspan=2 valign=top
						style='width:48.0pt;border:none;border-right:
  solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Voltage</span>
						</p>
						<p class=LRTableText>
							<span style='font-family:宋体'>电弧电压</span>
						</p>
						<p class=LRTableText>
							<span lang=EN-GB>V</span>
						</p>
					</td>
					<td width=72 valign=top
						style='width:54.0pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Type of Current/ Polarity</span>
						</p>
						<p class=LRTableText>
							<span style='font-family:宋体'>电流形式</span><span lang=EN-GB>/</span><span
								style='font-family:宋体'>极性</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:51.6pt;border:none;border-right:
  solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Wire Feed Speed</span>
						</p>
						<p class=LRTableText>
							<span style='font-family:宋体'>送丝速度</span>
						</p>
					</td>
					<td width=85 colspan=5 valign=top
						style='width:63.8pt;border:none;border-right:
  solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Travel Speed</span>
						</p>
						<p class=LRTableText>
							<span style='font-family:宋体'>焊接速度</span>
						</p>
					</td>
					<td width=105 valign=top
						style='width:78.4pt;border:none;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Heat Input</span>
						</p>
						<p class=LRTableText>
							<span style='font-family:宋体'>热输入量</span>
						</p>
						<p class=LRTableText>
							<span lang=EN-GB>KJ/mm</span>
						</p>
					</td>
				</tr>
				<tr style='height:13.0pt'>
					<td width=54
						style='width:40.55pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Run1></a></span><span id="Run1"
								lang=EN-GB></span>
						</p>
					</td>
					<td width=75 colspan=2
						style='width:56.5pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Process1" lang=EN-GB><a name=Process1></a></span>
						</p>
					</td>
					<td width=76 colspan=3
						style='width:56.85pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMet1" lang=EN-GB><a name=FillMet1></a></span><span
								lang=EN-GB></span>
						</p>
					</td>
					<td width=98 colspan=2
						style='width:73.2pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="CurrA1" lang=EN-GB><a name=CurrA1></a></span><span
								lang=EN-GB></span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Volt1" lang=EN-GB><a name=Volt1></a></span><span
								lang=EN-GB></span>
						</p>
					</td>
					<td width=72
						style='width:54.0pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Type1" lang=EN-GB><a name=Type1></a></span><span
								lang=EN-GB></span>
						</p>
					</td>
					<td width=69 colspan=2
						style='width:51.6pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=WireSpeed1></a></span><span
								id="WireSpeed1" lang=EN-GB></span>
						</p>
					</td>
					<td width=85 colspan=5
						style='width:63.8pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Trav1></a></span><span id="Trav1"
								lang=EN-GB></span>
						</p>
					</td>
					<td width=105
						style='width:78.4pt;border:none;background:#E5E5E5;padding:
  0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Input1></a></span><span id="Input1"
								lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='height:13.0pt'>
					<td width=54
						style='width:40.55pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Run2></a></span><span id="Run2"
								lang=EN-GB></span>
						</p>
					</td>
					<td width=75 colspan=2
						style='width:56.5pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Process2" lang=EN-GB><a name=Process2></a></span>
						</p>
					</td>
					<td width=76 colspan=3
						style='width:56.85pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=FillMet2></a></span><span id="FillMet2"
								lang=EN-GB></span>
						</p>
					</td>
					<td width=98 colspan=2
						style='width:73.2pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=CurrA2></a></span><span id="CurrA2"
								lang=EN-GB></span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Volt2></a></span><span id="Volt2"
								lang=EN-GB></span>
						</p>
					</td>
					<td width=72
						style='width:54.0pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Type2" lang=EN-GB><a name=Type2></a></span>
						</p>
					</td>
					<td width=69 colspan=2
						style='width:51.6pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=WireSpeed2></a></span><span
								id="WireSpeed2" lang=EN-GB></span>
						</p>
					</td>
					<td width=85 colspan=5
						style='width:63.8pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Trav2></a></span><span id="Trav2"
								lang=EN-GB></span>
						</p>
					</td>
					<td width=105
						style='width:78.4pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Input2></a></span><span id="Input2"
								lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='height:13.0pt'>
					<td width=54
						style='width:40.55pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Run3" lang=EN-GB><a name=Run3></a></span>
						</p>
					</td>
					<td width=75 colspan=2
						style='width:56.5pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Process3" lang=EN-GB><a name=Process3></a></span>
						</p>
					</td>
					<td width=76 colspan=3
						style='width:56.85pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMet3" lang=EN-GB><a name=FillMet3></a></span>
						</p>
					</td>
					<td width=98 colspan=2
						style='width:73.2pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="CurrA3" lang=EN-GB><a name=CurrA3></a></span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Volt3" lang=EN-GB><a name=Volt3></a></span>
						</p>
					</td>
					<td width=72
						style='width:54.0pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Type3" lang=EN-GB><a name=Type3></a></span>
						</p>
					</td>
					<td width=69 colspan=2
						style='width:51.6pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="WireSpeed3" lang=EN-GB><a name=WireSpeed3></a></span>
						</p>
					</td>
					<td width=85 colspan=5
						style='width:63.8pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Trav3" lang=EN-GB><a name=Trav3></a></span>
						</p>
					</td>
					<td width=105
						style='width:78.4pt;border:none;background:#E5E5E5;padding:
  0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Input3" lang=EN-GB><a name=Input3></a></span>
						</p>
					</td>
				</tr>
				<tr style='height:13.0pt'>
					<td width=54
						style='width:40.55pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Run4" lang=EN-GB><a name=Run4></a></span>
						</p>
					</td>
					<td width=75 colspan=2
						style='width:56.5pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Process4" lang=EN-GB><a name=Process4></a></span>
						</p>
					</td>
					<td width=76 colspan=3
						style='width:56.85pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMet4" lang=EN-GB><a name=FillMet4></a></span>
						</p>
					</td>
					<td width=98 colspan=2
						style='width:73.2pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="CurrA4" lang=EN-GB><a name=CurrA4></a></span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Volt4" lang=EN-GB><a name=Volt4></a></span>
						</p>
					</td>
					<td width=72
						style='width:54.0pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Type4" lang=EN-GB><a name=Type4></a></span>
						</p>
					</td>
					<td width=69 colspan=2
						style='width:51.6pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="WireSpeed4" lang=EN-GB><a name=WireSpeed4></a></span>
						</p>
					</td>
					<td width=85 colspan=5
						style='width:63.8pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Trav4" lang=EN-GB><a name=Trav4></a></span>
						</p>
					</td>
					<td width=105
						style='width:78.4pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Input4" lang=EN-GB><a name=Input4></a></span>
						</p>
					</td>
				</tr>
				<tr style='height:13.0pt'>
					<td width=54
						style='width:40.55pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Run5" lang=EN-GB><a name=Run5></a></span>
						</p>
					</td>
					<td width=75 colspan=2
						style='width:56.5pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Process5" lang=EN-GB><a name=Process5></a></span>
						</p>
					</td>
					<td width=76 colspan=3
						style='width:56.85pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMet5" lang=EN-GB><a name=FillMet5></a></span>
						</p>
					</td>
					<td width=98 colspan=2
						style='width:73.2pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="CurrA5" lang=EN-GB><a name=CurrA5></a></span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Volt5" lang=EN-GB><a name=Volt5></a></span>
						</p>
					</td>
					<td width=72
						style='width:54.0pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Type5" lang=EN-GB><a name=Type5></a></span>
						</p>
					</td>
					<td width=69 colspan=2
						style='width:51.6pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="WireSpeed5" lang=EN-GB><a name=WireSpeed5></a></span>
						</p>
					</td>
					<td width=85 colspan=5
						style='width:63.8pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Trav5" lang=EN-GB><a name=Trav5></a></span>
						</p>
					</td>
					<td width=105
						style='width:78.4pt;border:none;background:#E5E5E5;padding:
  0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Input5" lang=EN-GB><a name=Input5></a></span>
						</p>
					</td>
				</tr>
				<tr style='height:13.0pt'>
					<td width=54
						style='width:40.55pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Run6" lang=EN-GB><a name=Run6></a></span>
						</p>
					</td>
					<td width=75 colspan=2
						style='width:56.5pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Process6" lang=EN-GB><a name=Process6></a></span>
						</p>
					</td>
					<td width=76 colspan=3
						style='width:56.85pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMet6" lang=EN-GB><a name=FillMet6></a></span>
						</p>
					</td>
					<td width=98 colspan=2
						style='width:73.2pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="CurrA6" lang=EN-GB><a name=CurrA6></a></span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Volt6" lang=EN-GB><a name=Volt6></a></span>
						</p>
					</td>
					<td width=72
						style='width:54.0pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Type6" lang=EN-GB><a name=Type6></a></span>
						</p>
					</td>
					<td width=69 colspan=2
						style='width:51.6pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="WireSpeed6" lang=EN-GB><a name=WireSpeed6></a></span>
						</p>
					</td>
					<td width=85 colspan=5
						style='width:63.8pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Trav6" lang=EN-GB><a name=Trav6></a></span>
						</p>
					</td>
					<td width=105
						style='width:78.4pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Input6" lang=EN-GB><a name=Input6></a></span>
						</p>
					</td>
				</tr>
				<tr style='height:13.0pt'>
					<td width=54
						style='width:40.55pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Run7" lang=EN-GB><a name=Run7></a></span>
						</p>
					</td>
					<td width=75 colspan=2
						style='width:56.5pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Process7" lang=EN-GB><a name=Process7></a></span>
						</p>
					</td>
					<td width=76 colspan=3
						style='width:56.85pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMet7" lang=EN-GB><a name=FillMet7></a></span>
						</p>
					</td>
					<td width=98 colspan=2
						style='width:73.2pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="CurrA7" lang=EN-GB><a name=CurrA7></a></span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Volt7" lang=EN-GB><a name=Volt7></a></span>
						</p>
					</td>
					<td width=72
						style='width:54.0pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Type7" lang=EN-GB><a name=Type7></a></span>
						</p>
					</td>
					<td width=69 colspan=2
						style='width:51.6pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="WireSpeed7" lang=EN-GB><a name=WireSpeed7></a></span>
						</p>
					</td>
					<td width=85 colspan=5
						style='width:63.8pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Trav7" lang=EN-GB><a name=Trav7></a></span>
						</p>
					</td>
					<td width=105
						style='width:78.4pt;border:none;background:#E5E5E5;padding:
  0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Input7" lang=EN-GB><a name=Input7></a></span>
						</p>
					</td>
				</tr>
				<tr style='height:13.0pt'>
					<td width=54
						style='width:40.55pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Run8" lang=EN-GB><a name=Run8></a></span>
						</p>
					</td>
					<td width=75 colspan=2
						style='width:56.5pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Process8" lang=EN-GB><a name=Process8></a></span>
						</p>
					</td>
					<td width=76 colspan=3
						style='width:56.85pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMet8" lang=EN-GB><a name=FillMet8></a></span>
						</p>
					</td>
					<td width=98 colspan=2
						style='width:73.2pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="CurrA8" lang=EN-GB><a name=CurrA8></a></span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Volt8" lang=EN-GB><a name=Volt8></a></span>
						</p>
					</td>
					<td width=72
						style='width:54.0pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Type8" lang=EN-GB><a name=Type8></a></span>
						</p>
					</td>
					<td width=69 colspan=2
						style='width:51.6pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="WireSpeed8" lang=EN-GB><a name=WireSpeed8></a></span>
						</p>
					</td>
					<td width=85 colspan=5
						style='width:63.8pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Trav8" lang=EN-GB><a name=Trav8></a></span>
						</p>
					</td>
					<td width=105
						style='width:78.4pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Input8" lang=EN-GB><a name=Input8></a></span>
						</p>
					</td>
				</tr>
				<tr style='height:13.0pt'>
					<td width=54
						style='width:40.55pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Run9" lang=EN-GB><a name=Run9></a></span>
						</p>
					</td>
					<td width=75 colspan=2
						style='width:56.5pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Process9" lang=EN-GB><a name=Process9></a></span>
						</p>
					</td>
					<td width=76 colspan=3
						style='width:56.85pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMet9" lang=EN-GB><a name=FillMet9></a></span>
						</p>
					</td>
					<td width=98 colspan=2
						style='width:73.2pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="CurrA9" lang=EN-GB><a name=CurrA9></a></span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Volt9" lang=EN-GB><a name=Volt9></a></span>
						</p>
					</td>
					<td width=72
						style='width:54.0pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Type9" lang=EN-GB><a name=Type9></a></span>
						</p>
					</td>
					<td width=69 colspan=2
						style='width:51.6pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="WireSpeed9" lang=EN-GB><a name=WireSpeed9></a></span>
						</p>
					</td>
					<td width=85 colspan=5
						style='width:63.8pt;border:none;border-right:solid silver 1.0pt;
  background:#E5E5E5;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Trav9" lang=EN-GB><a name=Trav9></a></span>
						</p>
					</td>
					<td width=105
						style='width:78.4pt;border:none;background:#E5E5E5;padding:
  0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Input9" lang=EN-GB><a name=Input9></a></span>
						</p>
					</td>
				</tr>
				<tr style='height:13.0pt'>
					<td width=54
						style='width:40.55pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Run10" lang=EN-GB><a name=Run10></a></span>
						</p>
					</td>
					<td width=75 colspan=2
						style='width:56.5pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Process10" lang=EN-GB><a name=Process10></a></span>
						</p>
					</td>
					<td width=76 colspan=3
						style='width:56.85pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMet10" lang=EN-GB><a name=FillMet10></a></span>
						</p>
					</td>
					<td width=98 colspan=2
						style='width:73.2pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="CurrA10" lang=EN-GB><a name=CurrA10></a></span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Volt10" lang=EN-GB><a name=Volt10></a></span>
						</p>
					</td>
					<td width=72
						style='width:54.0pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Type10" lang=EN-GB><a name=Type10></a></span>
						</p>
					</td>
					<td width=69 colspan=2
						style='width:51.6pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="WireSpeed10" lang=EN-GB><a name=WireSpeed10></a></span>
						</p>
					</td>
					<td width=85 colspan=5
						style='width:63.8pt;border:none;border-right:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Trav10" lang=EN-GB><a name=Trav10></a></span>
						</p>
					</td>
					<td width=105
						style='width:78.4pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Input10" lang=EN-GB><a name=Input10></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:6.0pt'>
					<td width=697 colspan=19
						style='width:522.8pt;border:none;border-top:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:6.0pt'>
						<p class=LRCaption2>
							<span lang=EN-GB style='font-size:5.0pt'>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:12.0pt'>
					<td width=697 colspan=19
						style='width:522.8pt;background:#CCCCCC;padding:
  0cm 5.4pt 0cm 5.4pt;height:12.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>Other Information</span><b><span
								style='font-family:宋体'>其它信息</span></b>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:45.0pt'>
					<td width=697 colspan=19 valign=top
						style='width:522.8pt;border:none;
  border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:45.0pt'>
						<p class=LRTableData>
							<span id="Other Information" lang=EN-GB><a name=Text47></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:6.0pt'>
					<td width=697 colspan=19
						style='width:522.8pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRCaption2>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='height:13.0pt'>
					<td width=347 colspan=9
						style='width:260.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Manufacturer:</span>
						</p>
					</td>
					<td width=350 colspan=10
						style='width:262.3pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Surveyor to </span><span lang=EN-GB><a
								name="LR_O_Represents"></a>Lloyd's Register EMEA</span>
						</p>
					</td>
				</tr>
				<tr style='height:12.0pt'>
					<td width=347 colspan=9 rowspan=2 valign=top
						style='width:260.5pt;padding:
  0cm 5.4pt 0cm 5.4pt;height:12.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Man10></a>JIANGNAN SHIPYARD
								(GROUP) Co.,Ltd</span>
						</p>
					</td>
					<td width=350 colspan=10
						style='width:262.3pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:12.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB
								style='font-size:7.0pt;font-family:
  "Frutiger LT 45 Light",sans-serif'>A
								subsidiary of Lloyd's Register Group Limited</span>
						</p>
					</td>
				</tr>
				<tr style='height:15.0pt'>
					<td width=350 colspan=10
						style='width:262.3pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:15.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB
								style='font-size:7.0pt;font-family:
  "Frutiger LT 45 Light",sans-serif'>Office:</span><span
								lang=EN-GB><a name="LR_O_Office"></a>Shanghai</span>
						</p>
					</td>
				</tr>
				<tr>
					<td width=205 colspan=6
						style='width:153.9pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Name:</span>
						</p>
					</td>
					<td width=142 colspan=3
						style='width:106.6pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Date:</span>
						</p>
					</td>
					<td width=208 colspan=7
						style='width:155.95pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Name:</span>
						</p>
					</td>
					<td width=142 colspan=3
						style='width:106.35pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Date:</span>
						</p>
					</td>
				</tr>
				<tr style='height:15.0pt'>
					<td width=205 colspan=6
						style='width:153.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:15.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB><a name=Name10></a>JINWEI&nbsp;&nbsp; HE</span>
						</p>
					</td>
					<td width=142 colspan=3
						style='width:106.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:15.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=DateSurvey></a></span><span lang=EN-GB>2017-6-27</span>
						</p>
					</td>
					<td width=208 colspan=7
						style='width:155.95pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:15.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB><a name="LR_M_Surveyor"></a>JIANGSHAN </span><span
								lang=EN-GB>&nbsp;</span><span lang=EN-GB>HU</span>
						</p>
					</td>
					<td width=142 colspan=3
						style='width:106.35pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:15.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name="LR_M_IssueDate"></a>2017-6-2</span><span
								lang=EN-GB>7</span>
						</p>
					</td>
				</tr>
				<tr style='height:15.0pt'>
					<td width=347 colspan=9
						style='width:260.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:15.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Signature:</span>
						</p>
					</td>
					<td width=350 colspan=10
						style='width:262.3pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:15.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Signature:</span>
						</p>
					</td>
				</tr>
				<tr style='height:30.0pt'>
					<td width=347 colspan=9
						style='width:260.5pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt'>
						<p class=LRCaption2>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=350 colspan=10
						style='width:262.3pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:30.0pt'>
						<p class=LRCaption2>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:6.0pt'>
					<td width=697 colspan=19
						style='width:522.8pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRCaption2>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid'>
					<td width=697 colspan=19
						style='width:522.8pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRFootnotes>
							<span lang=EN-GB>1. This WPS is valid only if used by the
								above manufacturer.</span><span style='font-family:宋体'>本焊接工艺说明书仅对上述的制造商有效。</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid'>
					<td width=697 colspan=19
						style='width:522.8pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRFootnotes>
							<span lang=EN-GB>2. The manufacturer is responsible for
								ensuring that WPS meets the technical requirements for the
								application.</span><span style='font-family:宋体'>制造商负责保证</span><span
								style='font-family:宋体'>本焊接工艺说明书满足使用中相关的技术要求。</span>
						</p>
					</td>
				</tr>
				<tr height=0>
					<td width=811 style='border:none'></td>
					<td width=567 style='border:none'></td>
					<td width=563 style='border:none'></td>
					<td width=663 style='border:none'></td>
					<td width=384 style='border:none'></td>
					<td width=90 style='border:none'></td>
					<td width=1311 style='border:none'></td>
					<td width=153 style='border:none'></td>
					<td width=668 style='border:none'></td>
					<td width=292 style='border:none'></td>
					<td width=1080 style='border:none'></td>
					<td width=818 style='border:none'></td>
					<td width=214 style='border:none'></td>
					<td width=202 style='border:none'></td>
					<td width=90 style='border:none'></td>
					<td width=423 style='border:none'></td>
					<td width=59 style='border:none'></td>
					<td width=502 style='border:none'></td>
					<td width=1568 style='border:none'></td>
				</tr>
			</table>

			<p class=MsoNormal>
				<span lang=EN-GB>&nbsp;</span>
			</p>

			<p class=MsoNormal>
				<span lang=EN-GB>&nbsp;</span>
			</p>

		</div>

	</div>

</body>

</html>
