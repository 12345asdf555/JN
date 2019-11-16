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
<title>Welding Procedure Qualification Record (PQR)</title>

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
			url : "wps/outputPqrliblist?wpsid=" + wpsid,
			data : {},
			dataType : "json", //返回数据形式为json  
			success : function(result) {
				if (result) {
					document.getElementById("p WPS* number and revision").innerText = result.ary[0].fname;
					document.getElementById("Date of welding").innerText = result.ary[0].fcreatedate;
					document.getElementById("Test place/location shop/site").innerText = "JIANGNAN SHIPYARD WELDING  LAB";
					document.getElementById("Manufacturer’s name").innerText = "JIANGNAN SHIPYARD (GROUP) Co.,Ltd";
					document.getElementById("Manufacturer’s address").innerText = "988 Changxing Jiangnan Avenue, Changxing Island, Shanghai, P.R.China,";
					document.getElementById("Base materials").innerText = result.ary[0].fbase_material_name;
					document.getElementById("Welding position").innerText = result.ary[0].fweld_position;
					document.getElementById("Welding process").innerText = "SAW";
					document.getElementById("Plate/Pipe Thickness (mm)").innerText = result.ary[0].fthickness;
					document.getElementById("Pipe outside diameter (mm)").innerText = result.ary[0].fouter_diameter;
					document.getElementById("Joint type").innerText = result.ary[0].fjoint_form;
					document.getElementById("Shielding gas/flux flow rate").innerText = result.ary[0].fprotective_gas + " / " + result.ary[0].fflow;
					document.getElementById("Gas composition").innerText = result.ary[0].fingredient;
					document.getElementById("Filler material").innerText = "L-61";
					document.getElementById("Make/type/diameter").innerText = "LINCOLN ELECTRIC CO.,LTD/4.8mm";
					document.getElementById("Composition").innerText = "N/A";
					document.getElementById("Flux type").innerText = result.ary[0].fweld_material_name;
					document.getElementById("Preheat Temperature").innerText = result.ary[0].fwarm_up_temperature;
					document.getElementById("Interpass Temperature").innerText = result.ary[0].finter_channel_temperature;
					document.getElementById("Postweld heat treatment temperature (method) and control").innerText = "/";
					document.getElementById("Other information").innerText = result.ary[0].fother_information;
					
					for (var i = 0; i < 20; i++) {
						if (i < result.dary.length) {
							document.getElementById("RunNumber" + (i + 1).toString()).innerText = i + 1;
							document.getElementById("Process" + (i + 1).toString()).innerText = result.dary[i].fweld_method;
							document.getElementById("FillMatSize" + (i + 1).toString()).innerText = result.dary[i].dianame;
							document.getElementById("A" + (i + 1).toString()).innerText = result.dary[i].fpreset_ele_bottom + "~" + result.dary[i].fpreset_ele_top;
							document.getElementById("V" + (i + 1).toString()).innerText = result.dary[i].fpreset_vol_bottom + "~" + result.dary[i].fpreset_vol_top;
							document.getElementById("ACDC" + (i + 1).toString()).innerText = result.dary[i].fpower_polarity;
							document.getElementById("FeedSpeed" + (i + 1).toString()).innerText = "   / " + result.dary[i].fweld_speed;;
							document.getElementById("kJmm" + (i + 1).toString()).innerText = result.dary[i].fweld_speed;
						} else {
							document.getElementById("RunNumber" + (i + 1).toString()).innerText = "-";
							document.getElementById("Process" + (i + 1).toString()).innerText = "-";
							document.getElementById("FillMatSize" + (i + 1).toString()).innerText = "-";
							document.getElementById("A" + (i + 1).toString()).innerText = "-";
							document.getElementById("V" + (i + 1).toString()).innerText = "-";
							document.getElementById("ACDC" + (i + 1).toString()).innerText = "-";
							document.getElementById("FeedSpeed" + (i + 1).toString()).innerText = "-";
							document.getElementById("kJmm" + (i + 1).toString()).innerText = "-";
						}
					}
					
					document.getElementById("Date").innerText = result.ary[0].fcreatedate;
					document.getElementById("Welder’s name").innerText = result.ary[0].weldername;
					document.getElementById("WPQ certificate number").innerText = "SH0600001";
					document.getElementById("Visual").innerText = "1";
					document.getElementById("Magnetic particle").innerText = "2";
					document.getElementById("Liquid penetrant").innerText = "3";
					document.getElementById("Radiography").innerText = "4";
					document.getElementById("Ultrasonics").innerText = "5";
					document.getElementById("UTensile").innerText = "1";
					document.getElementById("UYield").innerText = "2";
					document.getElementById("UPercentElong").innerText = "3";
					document.getElementById("UPercentAreaRed").innerText = "4";
					document.getElementById("UFracture").innerText = "5";
					document.getElementById("UTest").innerText = "6";
					document.getElementById("TTTensile").innerText = "531/529";
					document.getElementById("TTYield").innerText = "2";
					document.getElementById("TTPercentElong").innerText = "3";
					document.getElementById("TTPercentAreaRed").innerText = "4";
					document.getElementById("TTFracture").innerText = "Broken base metal";
					document.getElementById("TTTest").innerText = "23℃";
					document.getElementById("AWTTensile").innerText = "1";
					document.getElementById("AWTYield").innerText = "2";
					document.getElementById("AWTPercentElong").innerText = "3";
					document.getElementById("AWTPercentAreaRed").innerText = "4";
					document.getElementById("AWTFracture").innerText = "5";
					document.getElementById("AWTTest").innerText = "23℃";
					document.getElementById("Fillet Weld Fracture1").innerText = "1/";
					document.getElementById("Former1").innerText = "4T";
					document.getElementById("Angle1").innerText = "180";
					document.getElementById("Results1").innerText = "Good";
					document.getElementById("Fillet Weld Fracture2").innerText = "2/";
					document.getElementById("Former2").innerText = "4T";
					document.getElementById("Angle2").innerText = "180";
					document.getElementById("Results2").innerText = "Good";
					document.getElementById("Fillet Weld Fracture3").innerText = "3/";
					document.getElementById("Former3").innerText = "4T";
					document.getElementById("Angle3").innerText = "180";
					document.getElementById("Results3").innerText = "Good";
					document.getElementById("Former4").innerText = "4T";
					document.getElementById("Angle4").innerText = "180";
					document.getElementById("Results4").innerText = "Good";
					document.getElementById("Size").innerText = "10*10*55mm";
					document.getElementById("Type").innerText = "CHARPY-V";
					document.getElementById("STemp1").innerText = "-40";
					document.getElementById("SValue11").innerText = "105";
					document.getElementById("SValue12").innerText = "154";
					document.getElementById("SValue13").innerText = "125";
					document.getElementById("SAverage1").innerText = "128";
					document.getElementById("SRemarks1").innerText = "Good";
					document.getElementById("TTemp2").innerText = "-40";
					document.getElementById("TValue21").innerText = "251";
					document.getElementById("TValue22").innerText = "285";
					document.getElementById("TValue23").innerText = "51";
					document.getElementById("TAverage2").innerText = "195";
					document.getElementById("TRemarks2").innerText = "Good";
					document.getElementById("STemp3").innerText = "-40";
					document.getElementById("SValue31").innerText = "228";
					document.getElementById("SValue32").innerText = "251";
					document.getElementById("SValue33").innerText = "259";
					document.getElementById("SAverage3").innerText = "246";
					document.getElementById("SRemarks3").innerText = "Good";
					document.getElementById("Hardness Survey Type").innerText = "HV";
					document.getElementById("Load").innerText = "98N";
					document.getElementById("HardnessRangeParent material").innerText = "154~172";
					document.getElementById("Weld").innerText = "172~204";
					document.getElementById("H.A.Z.").innerText = "161~208";
					document.getElementById("Name in block capitals1").innerText = "JINWEI  HE";
					document.getElementById("Date1").innerText = "26-Jun-2017";
					document.getElementById("Name in block capitals2").innerText = "J.S. HU";
					document.getElementById("Date2").innerText = "26-Jun-2017";
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
	font-family: "Tw Cen MT Condensed Extra Bold";
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

p.MsoFootnoteText, li.MsoFootnoteText, div.MsoFootnoteText {
	margin: 0cm;
	margin-bottom: .0001pt;
	font-size: 10.0pt;
	font-family: "Times New Roman", serif;
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

p.LRBodyText, li.LRBodyText, div.LRBodyText {
	mso-style-name: LRBodyText;
	margin: 0cm;
	margin-bottom: .0001pt;
	line-height: 11.0pt;
	font-size: 8.0pt;
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

p.LRTableTextCharChar, li.LRTableTextCharChar, div.LRTableTextCharChar {
	mso-style-name: "LRTableText Char Char";
	mso-style-link: "LRTableText Char Char Char";
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
	mso-style-link: "LRFootnotes Char";
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

p.LRTextIN, li.LRTextIN, div.LRTextIN {
	mso-style-name: LRTextIN;
	margin: 0cm;
	margin-bottom: .0001pt;
	font-size: 10.0pt;
	font-family: "Book Antiqua", serif;
	layout-grid-mode: line;
}

span.LRTableTextCharCharChar {
	mso-style-name: "LRTableText Char Char Char";
	mso-style-link: "LRTableText Char Char";
	font-family: "Frutiger LT 45 Light", sans-serif;
}

span.LRFootnotesChar {
	mso-style-name: "LRFootnotes Char";
	mso-style-link: LRFootnotes;
	font-family: "Frutiger LT 45 Light", sans-serif;
	font-style: italic;
}

p.LRCaption2, li.LRCaption2, div.LRCaption2 {
	mso-style-name: LRCaption2;
	margin: 0cm;
	margin-bottom: .0001pt;
	font-size: 8.0pt;
	font-family: "Book Antiqua", serif;
}

p.LRTableText, li.LRTableText, div.LRTableText {
	mso-style-name: LRTableText;
	mso-style-link: "LRTableText Char";
	margin: 0cm;
	margin-bottom: .0001pt;
	line-height: 9.0pt;
	font-size: 7.0pt;
	font-family: "Frutiger LT 45 Light", sans-serif;
}

span.LRTableTextChar {
	mso-style-name: "LRTableText Char";
	mso-style-link: LRTableText;
	font-family: "Frutiger LT 45 Light", sans-serif;
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
	margin: 36.0pt 40.0pt 36.0pt 44.0pt;
}

div.WordSection4 {
	page: WordSection4;
}

@page WordSection5 {
	size: 595.3pt 841.9pt;
	margin: 36.0pt 40.0pt 36.0pt 44.0pt;
}

div.WordSection5 {
	page: WordSection5;
}

@page WordSection6 {
	size: 595.3pt 841.9pt;
	margin: 36.0pt 40.0pt 36.0pt 44.0pt;
}

div.WordSection6 {
	page: WordSection6;
}

@page WordSection7 {
	size: 595.3pt 841.9pt;
	margin: 36.0pt 40.0pt 36.0pt 44.0pt;
}

div.WordSection7 {
	page: WordSection7;
}

@page WordSection8 {
	size: 595.3pt 841.9pt;
	margin: 36.0pt 40.0pt 36.0pt 44.0pt;
}

div.WordSection8 {
	page: WordSection8;
}

@page WordSection9 {
	size: 595.3pt 841.9pt;
	margin: 36.0pt 40.0pt 36.0pt 44.0pt;
}

div.WordSection9 {
	page: WordSection9;
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
	<button onclick="outputTextpqr()">导出</button>
	<a href="wps/goPqrlib;" class="easyui-linkbutton" iconCls="icon-newadd">返回</a>

	<div id="export_wordpqr">

		<div class=WordSection1>

			<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
				width=698 style='width:523.4pt;border-collapse:collapse'>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=428 colspan=5 rowspan=2 valign=top
						style='width:321.0pt;padding:
  1.0pt 6.0pt 0cm 6.0pt;height:11.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Info></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=107 colspan=3 valign=top
						style='width:80.4pt;padding:1.0pt 6.0pt 0cm 6.0pt;
  height:11.0pt'>
						<p class=LRStatements>
							<span lang=EN-GB>PQR Certificate no:</span>
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
					<td width=107 colspan=3 valign=top
						style='width:80.4pt;padding:1.0pt 6.0pt 0cm 6.0pt;
  height:11.0pt'>
						<p class=LRStatements>
							<span lang=EN-GB>Page </span><span lang=EN-GB>1</span><span
								lang=EN-GB> of </span><span lang=EN-GB
								style='layout-grid-mode:line'><a name=NoPages></a>4</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:75.1pt'>
					<td width=100 valign=top
						style='width:75.1pt;padding:1.0pt 6.0pt 0cm 6.0pt;
  height:75.1pt'>
						<p class=MsoNormal style='margin-top:4.0pt'>
							<span lang=EN-US><img width=84 height=90 id="Picture 1"
								src="resources/js/CCS-510%20Welding_Procedure_Qualification_Record.files/image001.png"
								alt=LR></span>
						</p>
					</td>
					<td width=598 colspan=8 valign=bottom
						style='width:448.3pt;padding:1.0pt 6.0pt 0cm 6.0pt;
  height:75.1pt'>
						<p class=LRTitle>
							<span lang=EN-GB>Welding ProcedureQualification
								Record(PQR)</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=464 colspan=6 valign=top
						style='width:348.0pt;padding:1.0pt 6.0pt 0cm 6.0pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Qualification: Codes/Standards</span>
						</p>
					</td>
					<td width=234 colspan=3 valign=top
						style='width:175.4pt;padding:1.0pt 6.0pt 0cm 6.0pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Date of issue</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=464 colspan=6 rowspan=3 valign=top
						style='width:348.0pt;padding:
  1.0pt 6.0pt 0cm 6.0pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text17></a>LR Rules for the
								Manufacture, Test and Certification of Materials July 2016</span>
						</p>
					</td>
					<td width=234 colspan=3 valign=top
						style='width:175.4pt;padding:1.0pt 6.0pt 0cm 6.0pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name="LR_M_IssueDate"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<a name=Text1></a>
					<td width=234 colspan=3 valign=top
						style='width:175.4pt;padding:1.0pt 6.0pt 0cm 6.0pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Office</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=234 colspan=3 valign=top
						style='width:175.4pt;padding:1.0pt 6.0pt 0cm 6.0pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name="LR_O_Office"></a>Shanghai</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=225 colspan=2 valign=top
						style='width:169.05pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>p WPS</span><sup><span lang=EN-GB
								style='font-size:8.0pt'>*</span></sup><span lang=EN-GB> number
								and revision</span>
						</p>
					</td>
					<td width=239 colspan=4 valign=top
						style='width:178.95pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Date of welding</span>
						</p>
					</td>
					<td width=234 colspan=3 valign=top
						style='width:175.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Test place/location shop/site</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=225 colspan=2 valign=top
						style='width:169.05pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="p WPS* number and revision" lang=EN-GB><a name=ManupWPSNumber></a></span>
						</p>
					</td>
					<td width=239 colspan=4 valign=top
						style='width:178.95pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Date of welding" lang=EN-GB><a name=ManupDate></a></span>
						</p>
					</td>
					<td width=234 colspan=3 valign=top
						style='width:175.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Test place/location shop/site" lang=EN-GB><a name=TestPlace></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=698 colspan=9
						style='width:523.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB style='layout-grid-mode:line'>Manufacturer’s
								name</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=698 colspan=9
						style='width:523.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Manufacturer’s name" lang=EN-GB><a name="LR_O_Manufacturer"></a>JIANGNAN SHIPYARD (GROUP) Co.,Ltd</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=698 colspan=9
						style='width:523.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB style='layout-grid-mode:line'>Manufacturer’s
								address</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:33.0pt'>
					<td width=698 colspan=9 valign=top
						style='width:523.4pt;border:none;
  border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:33.0pt'>
						<p class=LRTableData>
							<span id="Manufacturer’s address" lang=EN-GB><a name=ManuAddress></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:6.0pt'>
					<td width=698 colspan=9
						style='width:523.4pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:12.0pt'>
					<td width=698 colspan=9
						style='width:523.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:12.0pt'>
						<p class=LRTableHeading>
							<span lang=EN-GB>Base Material, Consumable and Welding
								Details:</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=225 colspan=2
						style='width:169.05pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Base materials</span>
						</p>
					</td>
					<td width=246 colspan=5
						style='width:184.25pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Welding position</span>
						</p>
					</td>
					<td width=227 colspan=2
						style='width:6.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Welding process</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=225 colspan=2
						style='width:169.05pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Base materials" lang=EN-GB><a name=ParentMaterial></a></span>
						</p>
					</td>
					<td width=246 colspan=5
						style='width:184.25pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Welding position" lang=EN-GB><a name=TestPiecePosition></a></span>
						</p>
					</td>
					<td width=227 colspan=2
						style='width:6.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Welding process" lang=EN-GB><a name=WaFMDWeldProcess></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=349 colspan=4
						style='width:262.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Plate/Pipe Thickness (mm):</span>
						</p>
					</td>
					<td width=349 colspan=5
						style='width:261.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Pipe outside diameter (mm):</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=349 colspan=4
						style='width:262.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text11></a></span><span id="Plate/Pipe Thickness (mm)" lang=EN-GB></span>
						</p>
					</td>
					<td width=349 colspan=5
						style='width:261.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text12></a></span><span id="Pipe outside diameter (mm)" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=225 colspan=2
						style='width:169.05pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Joint type</span>
						</p>
					</td>
					<td width=246 colspan=5
						style='width:184.25pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Shielding gas/flux flow rate</span>
						</p>
					</td>
					<td width=227 colspan=2
						style='width:6.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Gas composition</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=225 colspan=2
						style='width:169.05pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Joint type" lang=EN-GB><a name=JointType></a></span>
						</p>
					</td>
					<td width=246 colspan=5
						style='width:184.25pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=ShieldGasFluxFlow></a></span><span id="Shielding gas/flux flow rate" lang=EN-GB></span>
						</p>
					</td>
					<td width=227 colspan=2
						style='width:6.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Comp></a></span><span id="Gas composition" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=225 colspan=2
						style='width:169.05pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Filler material</span>
						</p>
					</td>
					<td width=246 colspan=5
						style='width:184.25pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Make/type/diameter</span>
						</p>
					</td>
					<td width=227 colspan=2
						style='width:6.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Composition</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=225 colspan=2
						style='width:169.05pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Filler material" lang=EN-GB><a name=FillerMaterial></a></span>
						</p>
					</td>
					<td width=246 colspan=5
						style='width:184.25pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Make/type/diameter" lang=EN-GB><a name=MakeTypeDiam></a>&nbsp;</span>
						</p>
					</td>
					<td width=227 colspan=2
						style='width:6.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Composition" lang=EN-GB><a name=GasComp></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=698 colspan=9
						style='width:523.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Flux type</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=698 colspan=9
						style='width:523.4pt;border:none;border-bottom:solid silver 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Flux type" lang=EN-GB><a name=FluxType></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=310 colspan=3
						style='width:232.8pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Preheat and interpass temperature
								(method) and control</span>
						</p>
					</td>
					<td width=387 colspan=6
						style='width:290.6pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=TempPreHeat></a>Preheat
								Temperature:&nbsp;&nbsp;&nbsp;</span>
							<span id="Preheat Temperature" lang=EN-GB><a name=FluxType></a></span>
							<span lang=EN-GB><a name=TempPreHeat></a>&nbsp;&nbsp;&nbsp;Interpass 
								Temperature:&nbsp;&nbsp;&nbsp;</span>
							<span id="Interpass Temperature" lang=EN-GB><a name=FluxType></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=310 colspan=3
						style='width:232.8pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Postweld heat treatment temperature
								(method) and control</span>
						</p>
					</td>
					<td width=387 colspan=6
						style='width:290.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=TempPostWeld></a></span><span id="Postweld heat treatment temperature (method) and control" lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=310 colspan=3 valign=top
						style='width:232.8pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Other information</span>
						</p>
					</td>
					<td width=387 colspan=6 valign=top
						style='width:290.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:37.8pt'>
					<td width=698 colspan=9 valign=top
						style='width:523.4pt;border:none;
  border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:37.8pt'>
						<p class=LRTableData>
							<span id="Other information" lang=EN-GB><a name=OtherInfo></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid'>
					<td width=698 colspan=9 valign=top
						style='width:523.4pt;border:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRTextIN>
							<span lang=EN-GB style='font-size:5.0pt'>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=349 colspan=4 valign=top
						style='width:262.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Test joint details (sketch with
								dimensions) of weld preparation&nbsp; </span>
						</p>
					</td>
					<td width=349 colspan=5 valign=top
						style='width:261.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar align=right style='text-align:right'>
							<span lang=EN-GB style='color:white'><a name=Text10></a>Double-click
								to edit sketch</span>
						</p>
					</td>
				</tr>
				<tr height=0>
					<td width=100 style='border:none'></td>
					<td width=125 style='border:none'></td>
					<td width=85 style='border:none'></td>
					<td width=39 style='border:none'></td>
					<td width=79 style='border:none'></td>
					<td width=36 style='border:none'></td>
					<td width=7 style='border:none'></td>
					<td width=64 style='border:none'></td>
					<td width=163 style='border:none'></td>
				</tr>
			</table>

			<p class=MsoNormal>
				<span lang=EN-GB>&nbsp;</span>
			</p>

		</div>

		<span lang=EN-GB
			style='font-size:10.0pt;font-family:"Times New Roman",serif'><br
			clear=all style='page-break-before:auto'> </span>

		<div class=WordSection2>

			<p class=MsoNormal style='margin-left:108.0pt;text-indent:36.0pt'>
				<a name="_MON_1059483446"></a><a name="_MON_1059483458"></a><a
					name="_MON_1059483674"></a><a name="_MON_1060089089"></a><a
					name="_MON_1170329634"></a><a name="_MON_1170337554"></a><a
					name="_MON_1170531996"></a><a name="_MON_1170532090"></a><a
					name="_MON_1050405183"></a><span lang=EN-GB><img width=329
					height=199
					src="resources/js/CCS-510%20Welding_Procedure_Qualification_Record.files/image002.png"></span>
			</p>

			<p class=MsoNormal>
				<sup><span lang=EN-GB style='font-size:8.0pt'>*</span></sup><span
					class=LRFootnotesChar><span lang=EN-GB
					style='font-size:7.0pt'>Manufacturer’s Preliminary Welding
						Procedure Specification</span></span>
			</p>

			<p class=MsoNormal>
				<span lang=EN-GB>&nbsp;</span>
			</p>

		</div>

		<span lang=EN-GB
			style='font-size:10.0pt;font-family:"Times New Roman",serif'><br
			clear=all style='page-break-before:always'> </span>

		<div class=WordSection3>

			<p class=MsoNormal>
				<span lang=EN-GB>&nbsp;</span>
			</p>

			<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
				width=695 style='width:521.0pt;border-collapse:collapse;border:none'>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=695 valign=bottom
						style='width:521.0pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Bead sequence detail (sketch to include
								weld metal thickness and back gouging where applicable) </span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=695 valign=bottom
						style='width:521.0pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
				</tr>
			</table>

			<p class=MsoNormal>
				<span lang=EN-GB
					style='font-size:8.0pt;font-family:"Book Antiqua",serif'>&nbsp;</span>
			</p>

			<p class=MsoNormal>
				<span lang=EN-GB
					style='font-size:8.0pt;font-family:"Book Antiqua",serif'>&nbsp;</span>
			</p>

		</div>

		<span lang=EN-GB
			style='font-size:8.0pt;font-family:"Book Antiqua",serif'><br
			clear=all style='page-break-before:auto'> </span>

		<div class=WordSection4>

			<p class=MsoNormal style='margin-left:108.0pt;text-indent:36.0pt'>
				<a name="_MON_1170532018"></a><a name="_MON_1170532091"></a><a
					name="_MON_1170329789"></a><span lang=EN-GB><img width=288
					height=176
					src="resources/js/CCS-510%20Welding_Procedure_Qualification_Record.files/image003.png"></span>
			</p>

		</div>

		<span lang=EN-GB
			style='font-size:10.0pt;font-family:"Times New Roman",serif'><br
			clear=all style='page-break-before:auto'> </span>

		<div class=WordSection5>

			<p class=MsoNormal>
				<span lang=EN-GB
					style='font-size:8.0pt;font-family:"Book Antiqua",serif'>&nbsp;</span>
			</p>

			<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
				width=697 style='width:522.9pt;border-collapse:collapse'>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=697 colspan=9 valign=top
						style='width:522.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableHeading>
							<span lang=EN-GB>Procedure Detail</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB style='layout-grid-mode:line'>Run number</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB style='layout-grid-mode:line'>Process</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB style='layout-grid-mode:line'>Size of
								filler material</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB style='layout-grid-mode:line'>Current</span>
						</p>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB style='layout-grid-mode:line'>A</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB style='layout-grid-mode:line'>Voltage</span>
						</p>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB style='layout-grid-mode:line'>V</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB style='layout-grid-mode:line'>AC/DC
								Polarity</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB style='layout-grid-mode:line'>Wire
								feed/travel speed</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB style='layout-grid-mode:line'>Heat input
								kJ/mm</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=RunNumber1></a></span><span id="RunNumber1" lang=EN-GB
								style='layout-grid-mode:line'></span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process1" lang=EN-GB style='layout-grid-mode:line'><a
								name=Process1></a></span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=FillMatSize1></a></span><span id="FillMatSize1" lang=EN-GB
								style='layout-grid-mode:line'></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a name=A1></a></span><span id="A1"
								lang=EN-GB style='layout-grid-mode:line'></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a name=V1></a></span><span id="V1"
								lang=EN-GB style='layout-grid-mode:line'></span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC1" lang=EN-GB style='layout-grid-mode:line'><a
								name=ACDC1></a></span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=FeedSpeed1></a></span><span id="FeedSpeed1" lang=EN-GB
								style='layout-grid-mode:line'></span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=kJmm1></a></span><span id="kJmm1" lang=EN-GB style='layout-grid-mode:line'></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=RunNumber2></a></span><span id="RunNumber2" lang=EN-GB
								style='layout-grid-mode:line'></span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process2" lang=EN-GB style='layout-grid-mode:line'><a
								name=Process2></a></span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=FillMatSize2></a></span><span id="FillMatSize2" lang=EN-GB
								style='layout-grid-mode:line'></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a name=A2></a></span><span id="A2"
								lang=EN-GB style='layout-grid-mode:line'></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a name=V2></a></span><span id="V2"
								lang=EN-GB style='layout-grid-mode:line'></span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC2" lang=EN-GB style='layout-grid-mode:line'><a
								name=ACDC2></a></span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=FeedSpeed2></a></span><span id="FeedSpeed2" lang=EN-GB
								style='layout-grid-mode:line'></span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=kJmm2></a></span><span id="kJmm2" lang=EN-GB style='layout-grid-mode:line'></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber3" lang=EN-GB style='layout-grid-mode:line'><a
								name=RunNumber3></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process3" lang=EN-GB style='layout-grid-mode:line'><a
								name=Process3></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize3" lang=EN-GB style='layout-grid-mode:line'><a
								name=FillMatSize3></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="A3" lang=EN-GB style='layout-grid-mode:line'><a name=A3></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V3" lang=EN-GB style='layout-grid-mode:line'><a name=V3></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC3" lang=EN-GB style='layout-grid-mode:line'><a
								name=ACDC3></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed3" lang=EN-GB style='layout-grid-mode:line'><a
								name=FeedSpeed3></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm3" lang=EN-GB style='layout-grid-mode:line'><a
								name=kJmm3></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber4" lang=EN-GB style='layout-grid-mode:line'><a
								name=RunNumber4></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process4" lang=EN-GB style='layout-grid-mode:line'><a
								name=Process4></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<spa id="FillMatSize4" lang=EN-GB style='layout-grid-mode:line'><a
								name=FillMatSize4></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="A4" lang=EN-GB style='layout-grid-mode:line'><a name=A4></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V4" lang=EN-GB style='layout-grid-mode:line'><a name=V4></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC4" lang=EN-GB style='layout-grid-mode:line'><a
								name=ACDC4></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed4" lang=EN-GB style='layout-grid-mode:line'><a
								name=FeedSpeed4></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm4" lang=EN-GB style='layout-grid-mode:line'><a
								name=kJmm4></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber5" lang=EN-GB style='layout-grid-mode:line'><a
								name=RunNumber5></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process5" lang=EN-GB style='layout-grid-mode:line'><a
								name=Process5></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize5" lang=EN-GB style='layout-grid-mode:line'><a
								name=FillMatSize5></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="A5" lang=EN-GB style='layout-grid-mode:line'><a name=A5></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V5" lang=EN-GB style='layout-grid-mode:line'><a name=V5></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC5" lang=EN-GB style='layout-grid-mode:line'><a
								name=ACDC5></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed5" lang=EN-GB style='layout-grid-mode:line'><a
								name=FeedSpeed5></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm5" lang=EN-GB style='layout-grid-mode:line'><a
								name=kJmm5></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber6" lang=EN-GB style='layout-grid-mode:line'><a
								name=RunNumber6></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process6" lang=EN-GB style='layout-grid-mode:line'><a
								name=Process6></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize6" lang=EN-GB style='layout-grid-mode:line'><a
								name=FillMatSize6></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="A6" lang=EN-GB style='layout-grid-mode:line'><a name=A6></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V6" lang=EN-GB style='layout-grid-mode:line'><a name=V6></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC6" lang=EN-GB style='layout-grid-mode:line'><a
								name=ACDC6></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed6" lang=EN-GB style='layout-grid-mode:line'><a
								name=FeedSpeed6></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm6" lang=EN-GB style='layout-grid-mode:line'><a
								name=kJmm6></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber7" lang=EN-GB style='layout-grid-mode:line'><a
								name=RunNumber7></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process7" lang=EN-GB style='layout-grid-mode:line'><a
								name=Process7></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize7" lang=EN-GB style='layout-grid-mode:line'><a
								name=FillMatSize7></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="A7" lang=EN-GB style='layout-grid-mode:line'><a name=A7></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V7" lang=EN-GB style='layout-grid-mode:line'><a name=V7></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC7" lang=EN-GB style='layout-grid-mode:line'><a
								name=ACDC7></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed7" lang=EN-GB style='layout-grid-mode:line'><a
								name=FeedSpeed7></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm7" lang=EN-GB style='layout-grid-mode:line'><a
								name=kJmm7></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber8" lang=EN-GB style='layout-grid-mode:line'><a
								name=RunNumber8></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process8" lang=EN-GB style='layout-grid-mode:line'><a
								name=Process8></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize8" lang=EN-GB style='layout-grid-mode:line'><a
								name=FillMatSize8></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="A8" lang=EN-GB style='layout-grid-mode:line'><a name=A8></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V8" lang=EN-GB style='layout-grid-mode:line'><a name=V8></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC8" lang=EN-GB style='layout-grid-mode:line'><a
								name=ACDC8></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed8" lang=EN-GB style='layout-grid-mode:line'><a
								name=FeedSpeed8></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm8" lang=EN-GB style='layout-grid-mode:line'><a
								name=kJmm8></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber9" lang=EN-GB style='layout-grid-mode:line'><a
								name=RunNumber9></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process9" lang=EN-GB style='layout-grid-mode:line'><a
								name=Process9></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize9" lang=EN-GB style='layout-grid-mode:line'><a
								name=FillMatSize9></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="A9" lang=EN-GB style='layout-grid-mode:line'><a name=A9></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V9" lang=EN-GB style='layout-grid-mode:line'><a name=V9></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC9" lang=EN-GB style='layout-grid-mode:line'><a
								name=ACDC9></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed9" lang=EN-GB style='layout-grid-mode:line'><a
								name=FeedSpeed9></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm9" lang=EN-GB style='layout-grid-mode:line'><a
								name=kJmm9></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber10" lang=EN-GB style='layout-grid-mode:line'><a
								name=RunNumber10></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process10" lang=EN-GB style='layout-grid-mode:line'><a
								name=Process10></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize10" lang=EN-GB style='layout-grid-mode:line'><a
								name=FillMatSize10></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="A10" lang=EN-GB style='layout-grid-mode:line'><a name=A10></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V10" lang=EN-GB style='layout-grid-mode:line'><a name=V10></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC10" lang=EN-GB style='layout-grid-mode:line'><a
								name=ACDC10></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed10" lang=EN-GB style='layout-grid-mode:line'><a
								name=FeedSpeed10></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm10" lang=EN-GB style='layout-grid-mode:line'><a
								name=kJmm10></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber11" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text46></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a id="Process11"
								name=Text66></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize11" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text86></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id=A11 lang=EN-GB style='layout-grid-mode:line'><a
								name=Text106></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V11" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text126></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC11" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text146></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed11" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text166></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm11" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text186></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber12" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text47></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process12" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text67></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize12" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text87></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="A12" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text107></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V12" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text127></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC12" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text147></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed12" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text167></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm12" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text187></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber13" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text48></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process13" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text68></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize13" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text88></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="A13" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text108></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V13" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text128></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC13" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text148></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed13" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text168></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm13" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text188></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber14" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text49></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process14" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text69></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize14" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text89></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="A14" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text109></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V14" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text129></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC14" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text149></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed14" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text169></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm14" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text189></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber15" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text50></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process15" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text70></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize15" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text90></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id=A15 lang=EN-GB style='layout-grid-mode:line'><a
								name=Text110></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V15" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text130></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC15" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text150></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed15" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text170></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm15" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text190></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber16" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text51></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process16" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text71></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize16" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text91></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="A16" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text111></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V16" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text131></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC16" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text151></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed16" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text171></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm16" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text191></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber17" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text52></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process17" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text72></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize17" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text92></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="A17" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text112></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V17" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text132></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC17" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text152></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed17" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text172></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm17" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text192></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber18" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text53></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process18" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text73></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize18" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text93></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="A18" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text113></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V18" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text133></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC18" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text153></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed18" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text173></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm18" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text193></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber19" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text54></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process19" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text74></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize19" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text94></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="A19" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text114></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V19" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text134></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC19" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text154></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed19" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text174></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm19" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text194></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="RunNumber20" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text55></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Process20" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text75></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FillMatSize20" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text95></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="A20" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text115></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="V20" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text135></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="ACDC20" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text155></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="FeedSpeed20" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text175></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="kJmm20" lang=EN-GB style='layout-grid-mode:line'><a
								name=Text195></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text56></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text76></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text96></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text116></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text136></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text156></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text176></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text196></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text57></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text77></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text97></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text117></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text137></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text157></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text177></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text197></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text58></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text78></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text98></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text118></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text138></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text158></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text178></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text198></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text59></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text79></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text99></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text119></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text139></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text159></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text179></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text199></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text60></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text80></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text100></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text120></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text140></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text160></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text180></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text200></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text61></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text81></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text101></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text121></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text141></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text161></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text181></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text201></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text62></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text82></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text102></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text122></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text142></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text162></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text182></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text202></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text63></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text83></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text103></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text123></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text143></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text163></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text183></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text203></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text64></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text84></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text104></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text124></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text144></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text164></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text184></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text204></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text65></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text85></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text105></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text125></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text145></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text165></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text185></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'><a
								name=Text205></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:6.0pt'>
					<td width=87 valign=top
						style='width:65.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'>&nbsp;</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'>&nbsp;</span>
						</p>
					</td>
					<td width=80 valign=top
						style='width:60.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'>&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'>&nbsp;</span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'>&nbsp;</span>
						</p>
					</td>
					<td width=69 colspan=2 valign=top
						style='width:52.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'>&nbsp;</span>
						</p>
					</td>
					<td width=171 valign=top
						style='width:128.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'>&nbsp;</span>
						</p>
					</td>
					<td width=95 valign=top
						style='width:70.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB style='layout-grid-mode:line'>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=143 colspan=2 valign=top
						style='width:107.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB style='layout-grid-mode:line'>Date</span>
						</p>
					</td>
					<td width=271 colspan=4 valign=top
						style='width:202.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB style='layout-grid-mode:line'>Welder’s
								name</span>
						</p>
					</td>
					<td width=283 colspan=3 valign=top
						style='width:212.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB style='layout-grid-mode:line'>WPQ
								certificate number</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=143 colspan=2 valign=top
						style='width:107.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Date" lang=EN-GB><a name=ProcedureDetailDate></a></span>
						</p>
					</td>
					<td width=271 colspan=4 valign=top
						style='width:202.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Welder’s name" lang=EN-GB><a name=WelderName></a></span><span lang=EN-GB></span>
						</p>
					</td>
					<td width=283 colspan=3 valign=top
						style='width:212.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="WPQ certificate number" lang=EN-GB><a name=WPQCertNumber></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:6.0pt'>
					<td width=143 colspan=2 valign=top
						style='width:107.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=271 colspan=4 valign=top
						style='width:202.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=283 colspan=3 valign=top
						style='width:212.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr height=0>
					<td width=1308 style='border:none'></td>
					<td width=840 style='border:none'></td>
					<td width=1200 style='border:none'></td>
					<td width=1040 style='border:none'></td>
					<td width=1040 style='border:none'></td>
					<td width=778 style='border:none'></td>
					<td width=262 style='border:none'></td>
					<td width=2572 style='border:none'></td>
					<td width=1418 style='border:none'></td>
				</tr>
			</table>

		</div>

		<span lang=EN-GB
			style='font-size:8.0pt;font-family:"Frutiger LT 65 Bold",sans-serif'><br
			clear=all style='page-break-before:always'> </span>

		<div class=WordSection6>

			<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
				width=697 style='width:522.9pt;border-collapse:collapse'>
				<tr style='page-break-inside:avoid;height:12.0pt'>
					<td width=697 colspan=18 valign=top
						style='width:522.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:12.0pt'>
						<p class=LRTableHeading>
							<span lang=EN-GB>Non-Destructive Examination (state
								acceptable, unacceptable, or none)</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=111 colspan=2 valign=top
						style='width:83.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Visual</span>
						</p>
					</td>
					<td width=114 colspan=3 valign=top
						style='width:85.15pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Magnetic particle</span>
						</p>
					</td>
					<td width=161 colspan=6 valign=top
						style='width:120.45pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Liquid penetrant</span>
						</p>
					</td>
					<td width=113 colspan=4 valign=top
						style='width:3.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Radiography</span>
						</p>
					</td>
					<td width=198 colspan=3 valign=top
						style='width:148.85pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Ultrasonics</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=111 colspan=2 valign=top
						style='width:83.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Visual" lang=EN-GB><a name=Dropdown1></a></span>
						</p>
					</td>
					<td width=114 colspan=3 valign=top
						style='width:85.15pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Magnetic particle" lang=EN-GB><a name=Dropdown3></a></span>
						</p>
					</td>
					<td width=161 colspan=6 valign=top
						style='width:120.45pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Liquid penetrant" lang=EN-GB><a name=Dropdown4></a></span>
						</p>
					</td>
					<td width=113 colspan=4 valign=top
						style='width:3.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Radiography" lang=EN-GB><a name=Dropdown5></a></span>
						</p>
					</td>
					<td width=198 colspan=3 valign=top
						style='width:148.85pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Ultrasonics" lang=EN-GB><a name=Dropdown6></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:6.0pt'>
					<td width=111 colspan=2 valign=top
						style='width:83.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=114 colspan=3 valign=top
						style='width:85.15pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=161 colspan=6 valign=top
						style='width:120.45pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=113 colspan=4 valign=top
						style='width:3.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=198 colspan=3 valign=top
						style='width:148.85pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:12.0pt'>
					<td width=697 colspan=18 valign=top
						style='width:522.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:12.0pt'>
						<p class=LRTableHeading>
							<span lang=EN-GB>Destructive Tests</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=111 colspan=2 valign=top
						style='width:83.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Test</span>
						</p>
					</td>
					<td width=114 colspan=3 valign=top
						style='width:85.15pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Tensile</span>
						</p>
					</td>
					<td width=66 colspan=2 valign=top
						style='width:49.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Yield</span>
						</p>
					</td>
					<td width=94 colspan=4 valign=top
						style='width:70.85pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>% Elongation</span>
						</p>
					</td>
					<td width=113 colspan=4 valign=top
						style='width:3.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>%Reduction of area</span>
						</p>
					</td>
					<td width=113 colspan=2 valign=top
						style='width:3.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Fracture</span>
						</p>
					</td>
					<td width=85 valign=top
						style='width:63.8pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Test Temp °C</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=111 colspan=2 valign=top
						style='width:83.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Units</span>
						</p>
					</td>
					<td width=114 colspan=3 valign=top
						style='width:85.15pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="UTensile" lang=EN-GB><a name=UTensile></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=66 colspan=2 valign=top
						style='width:49.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="UYield" lang=EN-GB><a name=UYield></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=94 colspan=4 valign=top
						style='width:70.85pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="UPercentElong" lang=EN-GB><a name=UPercentElong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=113 colspan=4 valign=top
						style='width:3.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="UPercentAreaRed" lang=EN-GB><a name=UPercentAreaRed></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=113 colspan=2 valign=top
						style='width:3.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTextIN>
							<span id="UFracture" lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=85 valign=top
						style='width:63.8pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="UTest" lang=EN-GB><a name=UTest></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=111 colspan=2 valign=top
						style='width:83.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Transverse tensile</span>
						</p>
					</td>
					<td width=114 colspan=3 valign=top
						style='width:85.15pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="TTTensile" lang=EN-GB><a name=TTTensile></a></span><span lang=EN-GB></span>
						</p>
					</td>
					<td width=66 colspan=2 valign=top
						style='width:49.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTextIN>
							<span id="TTYield" lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=94 colspan=4 valign=top
						style='width:70.85pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTextIN>
							<span id="TTPercentElong" lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=113 colspan=4 valign=top
						style='width:3.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTextIN>
							<span id="TTPercentAreaRed" lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=113 colspan=2 valign=top
						style='width:3.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="TTFracture" lang=EN-GB><a name=TTFracture></a></span>
						</p>
					</td>
					<td width=85 valign=top
						style='width:63.8pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="TTTest" lang=EN-GB><a name=TTTest></a></span><span
								style='font-family:宋体'>℃</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=111 colspan=2 valign=top
						style='width:83.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>All-weld tensile</span>
						</p>
					</td>
					<td width=114 colspan=3 valign=top
						style='width:85.15pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="AWTTensile" lang=EN-GB><a name=AWTTensile></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=66 colspan=2 valign=top
						style='width:49.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="AWTYield" lang=EN-GB><a name=AWTYield></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=94 colspan=4 valign=top
						style='width:70.85pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="AWTPercentElong" lang=EN-GB><a name=AWTPercentElong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=113 colspan=4 valign=top
						style='width:3.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="AWTPercentAreaRed" lang=EN-GB><a name=AWTPercentAreaRed></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=113 colspan=2 valign=top
						style='width:3.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="AWTFracture" lang=EN-GB><a name=AWTFracture></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=85 valign=top
						style='width:63.8pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="AWTTest" lang=EN-GB><a name=AWTTest></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:6.0pt'>
					<td width=111 colspan=2 valign=top
						style='width:83.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=114 colspan=3 valign=top
						style='width:85.15pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=66 colspan=2 valign=top
						style='width:49.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=94 colspan=4 valign=top
						style='width:70.85pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=113 colspan=4 valign=top
						style='width:3.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=113 colspan=2 valign=top
						style='width:3.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=85 valign=top
						style='width:63.8pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:12.0pt'>
					<td width=385 colspan=11 valign=top
						style='width:289.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:12.0pt'>
						<p class=LRTableHeading>
							<span lang=EN-GB>Bend Tests</span>
						</p>
					</td>
					<td width=312 colspan=7 valign=top
						style='width:233.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:12.0pt'>
						<p class=LRTableHeading>
							<span lang=EN-GB>Fillet Weld Fracture (Results)</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=111 colspan=2
						style='width:83.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Orientation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</span>
						</p>
					</td>
					<td width=57 colspan=2
						style='width:42.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Former </span>
						</p>
					</td>
					<td width=57
						style='width:42.55pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Angle°</span>
						</p>
					</td>
					<td width=161 colspan=6
						style='width:120.45pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Results</span>
						</p>
					</td>
					<td width=28
						style='width:21.3pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>1</span>
						</p>
					</td>
					<td width=283 colspan=6
						style='width:212.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Fillet Weld Fracture1" lang=EN-GB><a name=FillWeldFractRes1></a></span><span
								lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=111 colspan=2
						style='width:83.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB><a name=Dropdown2></a></span>
						</p>
					</td>
					<td width=57 colspan=2
						style='width:42.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Former1" lang=EN-GB><a name=FormerDiam1></a></span>
						</p>
					</td>
					<td width=57
						style='width:42.55pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Angle1" lang=EN-GB><a name=Text2></a></span>
						</p>
					</td>
					<td width=161 colspan=6
						style='width:120.45pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Results1" lang=EN-GB><a name=Result1></a></span>
						</p>
					</td>
					<td width=28
						style='width:21.3pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>2</span>
						</p>
					</td>
					<td width=283 colspan=6
						style='width:212.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Fillet Weld Fracture2" lang=EN-GB><a name=FillWeldFractRes2></a></span><span
								lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=111 colspan=2
						style='width:83.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar></p>
					</td>
					<td width=57 colspan=2
						style='width:42.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Former2" lang=EN-GB><a name=FormerDiam2></a></span>
						</p>
					</td>
					<td width=57
						style='width:42.55pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Angle2" lang=EN-GB><a name=Text3></a></span>
						</p>
					</td>
					<td width=161 colspan=6
						style='width:120.45pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Results2" lang=EN-GB><a name=Result2></a></span>
						</p>
					</td>
					<td width=28
						style='width:21.3pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>3</span>
						</p>
					</td>
					<td width=283 colspan=6
						style='width:212.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Fillet Weld Fracture3" lang=EN-GB><a name=FillWeldFractRes3></a></span><span
								lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=111 colspan=2
						style='width:83.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar></p>
					</td>
					<td width=57 colspan=2
						style='width:42.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Former3" lang=EN-GB><a name=FormerDiam3></a></span>
						</p>
					</td>
					<td width=57
						style='width:42.55pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Angle3" lang=EN-GB><a name=Text4></a></span>
						</p>
					</td>
					<td width=161 colspan=6
						style='width:120.45pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Results3" lang=EN-GB><a name=Result3></a></span>
						</p>
					</td>
					<td width=312 colspan=7 rowspan=3 valign=top
						style='width:233.9pt;padding:
  0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Macro examination</span>
						</p>
						<p class=LRTableData>
							<span lang=EN-GB><a name=MacroExam></a>No cracks and&nbsp;
								non-fusing defects were found through&nbsp; metallographic
								examination,a Macrosection is shown in attachments a photo is
								shown in attachments</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=111 colspan=2
						style='width:83.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar></p>
					</td>
					<td width=57 colspan=2
						style='width:42.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Former4" lang=EN-GB><a name=FormerDiam4></a></span>
						</p>
					</td>
					<td width=57
						style='width:42.55pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="Angle4" lang=EN-GB><a name=Text5></a></span>
						</p>
					</td>
					<td width=161 colspan=6
						style='width:120.45pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Results4" lang=EN-GB><a name=Result4></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=111 colspan=2
						style='width:83.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>Longitudinal</span>
						</p>
					</td>
					<td width=57 colspan=2
						style='width:42.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=LongFormerDiam></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=57
						style='width:42.55pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text6></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=161 colspan=6
						style='width:120.45pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=LongResult></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:6.0pt'>
					<td width=111 colspan=2 valign=top
						style='width:83.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableTextCharChar>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=114 colspan=3 valign=top
						style='width:85.15pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=66 colspan=2 valign=top
						style='width:49.6pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=94 colspan=4 valign=top
						style='width:70.85pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=113 colspan=4 valign=top
						style='width:3.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=113 colspan=2 valign=top
						style='width:3.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=85 valign=top
						style='width:63.8pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=697 colspan=18 valign=top
						style='width:522.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'><span
						lang=EN-GB
						style='font-size:8.0pt;font-family:"Frutiger LT 65 Bold",sans-serif'><br
							clear=all style='page-break-before:always'> </span>
						<p class=LRTableHeading>
							<span lang=EN-GB>Impact tests</span>
						</p></td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=143 colspan=3 rowspan=2 valign=top
						style='width:107.4pt;padding:
  0cm 5.4pt 0cm 5.4pt;height:11.0pt'>
						<p class=LRCaption2>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=112 colspan=3 rowspan=2 valign=top
						style='width:84.0pt;padding:
  0cm 5.4pt 0cm 5.4pt;height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Notch location/orientation</span>
						</p>
					</td>
					<td width=48 colspan=2 rowspan=2 valign=top
						style='width:36.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Temp</span>
						</p>
						<p class=LRTableText>
							<span lang=EN-GB>°C</span>
						</p>
					</td>
					<td width=184 colspan=6 valign=top
						style='width:138.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Values(J)</span>
						</p>
					</td>
					<td width=56 colspan=2 rowspan=2 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Average</span>
						</p>
						<p class=LRTableText>
							<span lang=EN-GB>(J)</span>
						</p>
					</td>
					<td width=154 colspan=2 rowspan=2 valign=top
						style='width:115.5pt;padding:
  0cm 5.4pt 0cm 5.4pt;height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Remarks</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=64 colspan=2 valign=top
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>1</span>
						</p>
					</td>
					<td width=64 colspan=3 valign=top
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>2</span>
						</p>
					</td>
					<td width=56 valign=top
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>3</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=47
						style='width:35.4pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Size</span>
						</p>
					</td>
					<td width=96 colspan=2
						style='width:72.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Size" lang=EN-GB><a name=Text15></a></span>
						</p>
					</td>
					<td width=112 colspan=3
						style='width:84.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=SNotchLoc></a>Centre&nbsp;
								of&nbsp; weld</span>
						</p>
					</td>
					<td width=48 colspan=2
						style='width:36.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="STemp1" lang=EN-GB><a name=STemp></a></span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="SValue11" lang=EN-GB><a name=SValue1></a></span><span lang=EN-GB></span>
						</p>
					</td>
					<td width=64 colspan=3
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="SValue12" lang=EN-GB><a name=SValue2></a></span><span lang=EN-GB></span>
						</p>
					</td>
					<td width=56
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="SValue13" lang=EN-GB><a name=SValue3></a></span><span lang=EN-GB></span>
						</p>
					</td>
					<td width=56 colspan=2
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="SAverage1" lang=EN-GB><a name=SAverage></a></span><span lang=EN-GB></span>
						</p>
					</td>
					<td width=154 colspan=2
						style='width:115.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="SRemarks1" lang=EN-GB><a name=SRemarks></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=47
						style='width:35.4pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Type</span>
						</p>
					</td>
					<td width=96 colspan=2
						style='width:72.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Type" lang=EN-GB><a name=Text16></a></span>
						</p>
					</td>
					<td width=112 colspan=3
						style='width:84.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=TNotchLoc></a>Fusion line(FL)</span>
						</p>
					</td>
					<td width=48 colspan=2
						style='width:36.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="TTemp2" lang=EN-GB><a name=TTemp></a>-40</span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="TValue21" lang=EN-GB><a name=TValue1></a></span><span lang=EN-GB></span>
						</p>
					</td>
					<td width=64 colspan=3
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="TValue22" lang=EN-GB><a name=TValue2></a></span><span lang=EN-GB></span>
						</p>
					</td>
					<td width=56
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="TValue23" lang=EN-GB><a name=TValue3></a></span><span lang=EN-GB></span>
						</p>
					</td>
					<td width=56 colspan=2
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="TAverage2" lang=EN-GB><a name=TAverage></a></span><span lang=EN-GB></span>
						</p>
					</td>
					<td width=154 colspan=2
						style='width:115.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="TRemarks2" lang=EN-GB><a name=TRemarks></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=47
						style='width:35.4pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=96 colspan=2
						style='width:72.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=112 colspan=3
						style='width:84.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text18></a></span><span lang=EN-GB>2</span><span
								lang=EN-GB>mm from&nbsp; the FL</span>
						</p>
					</td>
					<td width=48 colspan=2
						style='width:36.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="STemp3" lang=EN-GB><a name=Text19></a></span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="SValue31" lang=EN-GB><a name=Text20></a></span><span lang=EN-GB></span>
						</p>
					</td>
					<td width=64 colspan=3
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="SValue32" lang=EN-GB><a name=Text21></a></span><span lang=EN-GB></span>
						</p>
					</td>
					<td width=56
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span id="SValue33" lang=EN-GB><a name=Text22></a></span><span lang=EN-GB></span>
						</p>
					</td>
					<td width=56 colspan=2
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="SAverage3" lang=EN-GB><a name=Text23></a></span><span lang=EN-GB></span>
						</p>
					</td>
					<td width=154 colspan=2
						style='width:115.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="SRemarks3" lang=EN-GB><a name=Text24></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=47
						style='width:35.4pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=96 colspan=2
						style='width:72.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=112 colspan=3
						style='width:84.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text25></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=48 colspan=2
						style='width:36.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text26></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text27></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=64 colspan=3
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text28></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text29></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 colspan=2
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text30></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=154 colspan=2
						style='width:115.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text31></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=47
						style='width:35.4pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=96 colspan=2
						style='width:72.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=112 colspan=3
						style='width:84.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text32></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=48 colspan=2
						style='width:36.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text33></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text34></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=64 colspan=3
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text35></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text36></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 colspan=2
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text37></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=154 colspan=2
						style='width:115.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text38></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=47
						style='width:35.4pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=96 colspan=2
						style='width:72.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=112 colspan=3
						style='width:84.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text39></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=48 colspan=2
						style='width:36.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text40></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text41></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=64 colspan=3
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text42></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text43></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 colspan=2
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text44></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=154 colspan=2
						style='width:115.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text45></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=47
						style='width:35.4pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=96 colspan=2
						style='width:72.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=112 colspan=3
						style='width:84.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text206></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=48 colspan=2
						style='width:36.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text207></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text208></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=64 colspan=3
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text209></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text210></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 colspan=2
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text211></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=154 colspan=2
						style='width:115.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text212></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=47
						style='width:35.4pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=96 colspan=2
						style='width:72.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=112 colspan=3
						style='width:84.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text213></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=48 colspan=2
						style='width:36.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text214></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text215></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=64 colspan=3
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text216></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text217></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=56 colspan=2
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text218></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td width=154 colspan=2
						style='width:115.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=Text219></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:6.0pt'>
					<td width=47
						style='width:35.4pt;padding:0cm 5.4pt 0cm 5.4pt;height:6.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=96 colspan=2
						style='width:72.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=112 colspan=3
						style='width:84.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=48 colspan=2
						style='width:36.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=64 colspan=2
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=64 colspan=3
						style='width:48.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=56
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=56 colspan=2
						style='width:42.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=154 colspan=2
						style='width:115.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:12.0pt'>
					<td width=697 colspan=18 valign=top
						style='width:522.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:12.0pt'>
						<p class=LRTableHeading>
							<span lang=EN-GB>Hardness Survey</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=349 colspan=9 valign=top
						style='width:261.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Type</span>
						</p>
					</td>
					<td width=349 colspan=9 valign=top
						style='width:261.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB style='layout-grid-mode:line'>Load</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=349 colspan=9 valign=top
						style='width:261.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Hardness Survey Type" lang=EN-GB><a name=HardType></a></span>
						</p>
					</td>
					<td width=349 colspan=9 valign=top
						style='width:261.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Load" lang=EN-GB><a name=HardLoad></a></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=697 colspan=18 valign=top
						style='width:522.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB style='layout-grid-mode:line'>Hardness</span><span
								lang=EN-GB style='layout-grid-mode:line'>Range</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=349 colspan=9 valign=top
						style='width:261.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Parent material</span>
						</p>
					</td>
					<td width=349 colspan=9 valign=top
						style='width:261.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Weld</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=349 colspan=9 valign=top
						style='width:261.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="HardnessRangeParent material" lang=EN-GB><a name=ParentMat></a></span><span lang=EN-GB></span>
						</p>
					</td>
					<td width=349 colspan=9 valign=top
						style='width:261.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Weld" lang=EN-GB><a name=Weld></a></span><span lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=697 colspan=18 valign=top
						style='width:522.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>H.A.Z.</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=697 colspan=18 valign=top
						style='width:522.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="H.A.Z." lang=EN-GB><a name=HAZ></a></span><span lang=EN-GB></span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:6.0pt'>
					<td width=697 colspan=18 valign=top
						style='width:522.9pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:6.0pt'>
						<p class=LRTableData>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='page-break-inside:avoid;height:14.0pt'>
					<td width=349 colspan=9 valign=top
						style='width:261.4pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:14.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Location of hardness measurements
								(sketch)</span>
						</p>
					</td>
					<td width=349 colspan=9 valign=top
						style='width:261.5pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:14.0pt'>
						<p class=LRTableText align=right style='text-align:right'>
							<span lang=EN-GB style='color:white'>Double-click to edit
								sketch</span>
						</p>
					</td>
				</tr>
				<tr height=0>
					<td width=47 style='border:none'></td>
					<td width=64 style='border:none'></td>
					<td width=32 style='border:none'></td>
					<td width=25 style='border:none'></td>
					<td width=57 style='border:none'></td>
					<td width=30 style='border:none'></td>
					<td width=36 style='border:none'></td>
					<td width=12 style='border:none'></td>
					<td width=45 style='border:none'></td>
					<td width=19 style='border:none'></td>
					<td width=18 style='border:none'></td>
					<td width=28 style='border:none'></td>
					<td width=17 style='border:none'></td>
					<td width=56 style='border:none'></td>
					<td width=12 style='border:none'></td>
					<td width=44 style='border:none'></td>
					<td width=69 style='border:none'></td>
					<td width=85 style='border:none'></td>
				</tr>
			</table>

			<p class=MsoFootnoteText>
				<span lang=EN-GB>&nbsp;</span>
			</p>

		</div>

		<span lang=EN-GB
			style='font-size:10.0pt;font-family:"Times New Roman",serif'><br
			clear=all style='page-break-before:auto'> </span>

		<div class=WordSection7>

			<p class=MsoFootnoteText>
				<span lang=EN-GB>&nbsp;</span>
			</p>

			<p class=MsoFootnoteText
				style='margin-left:72.0pt;text-indent:36.0pt'>
				<span lang=EN-GB><img width=314 height=189
					src="resources/js/CCS-510%20Welding_Procedure_Qualification_Record.files/image004.png"></span>
			</p>

			<p class=MsoFootnoteText>
				<a name="_MON_1170329853"></a><a name="_MON_1170338023"></a><span
					lang=EN-GB>&nbsp;</span>
			</p>

			<p class=MsoFootnoteText>
				<span lang=EN-GB>&nbsp;</span>
			</p>

		</div>

		<span lang=EN-GB
			style='font-size:10.0pt;font-family:"Times New Roman",serif'><br
			clear=all style='page-break-before:auto'> </span>

		<div class=WordSection8>

			<p class=MsoFootnoteText>
				<span lang=EN-GB>&nbsp;</span>
			</p>

		</div>

		<span lang=EN-GB
			style='font-size:7.0pt;font-family:"Frutiger LT 45 Light",sans-serif'><br
			clear=all style='page-break-before:always'> </span>

		<div class=WordSection9>

			<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
				width=697 style='width:522.8pt;border-collapse:collapse'>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=697 colspan=3 valign=top
						style='width:522.8pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Additional test(s) and result(s) e.g.
								chemical analysis, micro examination, ferrite measurement</span>
						</p>
					</td>
					<td style='height:11.0pt;border:none' width=0 height=15></td>
				</tr>
				<tr style='page-break-inside:avoid;height:50.4pt'>
					<td width=697 colspan=3 valign=top
						style='width:522.8pt;border:none;
  border-bottom:solid silver 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:50.4pt'>
						<p class=LRTableData>
							<span lang=EN-GB><a name=AddTestResults></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</p>
					</td>
					<td style='height:50.4pt;border:none' width=0 height=67></td>
				</tr>
				<tr style='page-break-inside:avoid'>
					<td width=697 colspan=3 valign=top
						style='width:522.8pt;border:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRCaption2>
							<span lang=EN-GB style='font-size:5.0pt'>&nbsp;</span>
						</p>
					</td>
					<td style='border:none' width=0><p class='MsoNormal'>&nbsp;</td>
				</tr>
				<tr style='page-break-inside:avoid;height:20.0pt'>
					<td width=697 colspan=3 valign=top
						style='width:522.8pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:20.0pt'>
						<p class=LRStatements>
							<span lang=EN-GB>We certify that the foregoing statements
								are correct and the test welds were prepared, welded and tested
								in accordance with the specified Codes or Standards.</span>
						</p>
					</td>
					<td style='height:20.0pt;border:none' width=0 height=27></td>
				</tr>
				<tr style='page-break-inside:avoid'>
					<td width=697 colspan=3 valign=top
						style='width:522.8pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=LRCaption2>
							<span lang=EN-GB style='font-size:5.0pt'>&nbsp;</span>
						</p>
					</td>
					<td style='border:none' width=0><p class='MsoNormal'>&nbsp;</td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=232 valign=top
						style='width:174.25pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Manufacturer (signature)</span>
						</p>
					</td>
					<td width=276 valign=top
						style='width:206.8pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Name in block capitals</span>
						</p>
					</td>
					<td width=189 valign=top
						style='width:5.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Date</span>
						</p>
					</td>
					<td style='height:11.0pt;border:none' width=0 height=15></td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=232 valign=top
						style='width:174.25pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td width=276 rowspan=2 valign=top
						style='width:206.8pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Name in block capitals1" lang=EN-GB><a name=PrintedName1></a></span>
						</p>
					</td>
					<td width=189 rowspan=2 valign=top
						style='width:5.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTableData>
							<span id="Date1" lang=EN-GB><a name=DocumentIssue2></a></span>
						</p>
					</td>
					<td style='height:13.0pt;border:none' width=0 height=17></td>
				</tr>
				<tr style='page-break-inside:avoid;height:13.0pt'>
					<td width=232 valign=top
						style='width:174.25pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:13.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td style='height:13.0pt;border:none' width=0 height=17></td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=232 rowspan=2 valign=top
						style='width:174.25pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Surveyor to </span><span lang=EN-GB><a
								name="LR_O_Represents"></a>Lloyd's Register Classification
								Society (China) Co., Ltd.</span>
						</p>
					</td>
					<td width=276 valign=top
						style='width:206.8pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Name in block capitals</span>
						</p>
					</td>
					<td width=189 valign=top
						style='width:5.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>Date</span>
						</p>
					</td>
					<td style='height:11.0pt;border:none' width=0 height=15></td>
				</tr>
				<tr style='page-break-inside:avoid;height:9.95pt'>
					<td width=276 rowspan=3 valign=top
						style='width:206.8pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:9.95pt'>
						<p class=LRTableData>
							<span id="Name in block capitals2" lang=EN-GB><a name="LR_M_Surveyor"></a></span>
						</p>
					</td>
					<td width=189 rowspan=3 valign=top
						style='width:5.0cm;padding:0cm 5.4pt 0cm 5.4pt;
  height:9.95pt'>
						<p class=LRTableData>
							<span id=Date2 lang=EN-GB><a name=DocumentIssue3></a></span>
						</p>
					</td>
					<td style='height:9.95pt;border:none' width=0 height=13></td>
				</tr>
				<tr style='page-break-inside:avoid;height:11.0pt'>
					<td width=232 valign=top
						style='width:174.25pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:11.0pt'>
						<p class=LRTableText>
							<span lang=EN-GB>(signature)</span>
						</p>
					</td>
					<td style='height:11.0pt;border:none' width=0 height=15></td>
				</tr>
				<tr style='page-break-inside:avoid;height:15.0pt'>
					<td width=232 valign=top
						style='width:174.25pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:15.0pt'>
						<p class=LRTextIN>
							<span lang=EN-GB>&nbsp;</span>
						</p>
					</td>
					<td style='height:15.0pt;border:none' width=0 height=20></td>
				</tr>
			</table>

			<p class=MsoNormal>
				<span lang=EN-GB>&nbsp;</span>
			</p>

		</div>

	</div>

</body>

</html>
