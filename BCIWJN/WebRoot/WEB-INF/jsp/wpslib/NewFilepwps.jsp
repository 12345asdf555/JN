<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html xmlns:v="urn:schemas-microsoft-com:vml"
	xmlns:o="urn:schemas-microsoft-com:office:office"
	xmlns:w="urn:schemas-microsoft-com:office:word"
	xmlns:m="http://schemas.microsoft.com/office/2004/12/omml"
	xmlns="http://www.w3.org/TR/REC-html40">

<head>
<base href="<%=basePath%>">
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 15">
<meta name=Originator content="Microsoft Word 15">
<link rel=File-List href="PWPS.files/filelist.xml">
<link rel=Edit-Time-Data href="PWPS.files/editdata.mso">

<link rel=themeData href="PWPS.files/themedata.thmx">
<link rel=colorSchemeMapping href="PWPS.files/colorschememapping.xml">

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
			url : "wps/outputPwpsliblist?wpsid=" + wpsid,
			data : {},
			dataType : "json", //返回数据形式为json  
			success : function(result) {
				if (result) {
					document.getElementById("location").innerText = "Welding La";
					document.getElementById("Examiner or test body").innerText = "CCS-201";
					document.getElementById("Reference No").innerText = result.ary[0].wpslibName;
					document.getElementById("Method of Preparation and Cleaning").innerText = "Cutting + Grinding";
					document.getElementById("Manufacturer").innerText = "Jiangnan Shipyard (Group) Co.,Ltd";
					document.getElementById("Welder's Name").innerText = "joint";
					document.getElementById("Parent Material Specification").innerText = "5083H116";
					document.getElementById("Welding Process").innerText = result.ary[0].materialname;
					document.getElementById("Material Thickness").innerText = result.ary[0].dianame;
					document.getElementById("Joint Type").innerText = "Butt joint";
					document.getElementById("Outside Diameter").innerText = "//";
					document.getElementById("Weld Prepatation Details").innerText = "//";
					document.getElementById("Welding Position").innerText = "PA (F)";
					
					for (var i = 0; i < 10; i++) {
						if (i < result.dary.length) {
							document.getElementById("Run" + (i + 1).toString()).innerText = i + 1;
							document.getElementById("Process" + (i + 1).toString()).innerText = result.dary[i].fweld_method;
							document.getElementById("Filler Metal" + (i + 1).toString()).innerText = result.dary[i].dianame;
							document.getElementById("Current" + (i + 1).toString()).innerText = result.dary[i].fpreset_ele_bottom + "~" + result.dary[i].fpreset_ele_top;
							document.getElementById("Voltage" + (i + 1).toString()).innerText = result.dary[i].fpreset_vol_bottom + "~" + result.dary[i].fpreset_vol_top;
							document.getElementById("Type" + (i + 1).toString()).innerText = result.dary[i].fpower_polarity;
							document.getElementById("Wire Feed Speed" + (i + 1).toString()).innerText = "//";
							document.getElementById("Travel Speed" + (i + 1).toString()).innerText = result.dary[i].fweld_speed;
							document.getElementById("Heat Input" + (i + 1).toString()).innerText = "//";
						} else {
							document.getElementById("Run" + (i + 1).toString()).innerText = "-";
							document.getElementById("Process" + (i + 1).toString()).innerText = "-";
							document.getElementById("Filler Metal" + (i + 1).toString()).innerText = "-";
							document.getElementById("Current" + (i + 1).toString()).innerText = "-";
							document.getElementById("Voltage" + (i + 1).toString()).innerText = "-";
							document.getElementById("Type" + (i + 1).toString()).innerText = "-";
							document.getElementById("Wire Feed Speed" + (i + 1).toString()).innerText = "-";
							document.getElementById("Travel Speed" + (i + 1).toString()).innerText = "-";
							document.getElementById("Heat Input" + (i + 1).toString()).innerText = "-";
						}
					}
					
					/* document.getElementById("Run1").innerText = "1";
					document.getElementById("Process1").innerText = "MIG";
					document.getElementById("Filler Metal1").innerText = "φ1.2";
					document.getElementById("Current1").innerText = "181~201";
					document.getElementById("Voltage1").innerText = "22~24";
					document.getElementById("Travel Speed1").innerText = "31~36";
					document.getElementById("Run2").innerText = "2";
					document.getElementById("Run3").innerText = "3";
					document.getElementById("Process2").innerText = "MIG";
					document.getElementById("Process3").innerText = "MIG";
					document.getElementById("Filler Metal2").innerText = "φ1.2";
					document.getElementById("Filler Metal3").innerText = "φ1.2";
					document.getElementById("Current2").innerText = "171~190";
					document.getElementById("Current3").innerText = "171~190";
					document.getElementById("Voltage2").innerText = "21~22";
					document.getElementById("Voltage3").innerText = "21~22";
					document.getElementById("Type").innerText = "DCEN";
					document.getElementById("Wire Feed Speed").innerText = "//";
					document.getElementById("Travel Speed2").innerText = "21~25";
					document.getElementById("Travel Speed3").innerText = "21~25";
					document.getElementById("Heat Input").innerText = "//"; */
					document.getElementById("Filler Metal Classification and Trade Name").innerText = "AlcoTec ER5183(φ1.2mm)";
					document.getElementById("Shielding").innerText = "99.99%Ar";
					document.getElementById("Other information").innerText = "Shop primer was not applied before welding";
					document.getElementById("Backing1").innerText = "//";
					document.getElementById("Shielding").innerText = "16~25 L/min";
					document.getElementById("e.g.Weaving").innerText = "//";
					document.getElementById("Backing2").innerText = "//";
					document.getElementById("Oscillation").innerText = "//";
					document.getElementById("Tungsten Electrode").innerText = "//";
					document.getElementById("Details of Back Gouging/Backing").innerText = "Split groove";
					document.getElementById("Pulse welding details").innerText = "//";
					document.getElementById("Preheat Temperature").innerText = "When the base metal temperature is below 0℃, the base metal  shall be preheated to at least 20 ℃";
					document.getElementById("Interpass Temperature").innerText = "≤60℃";
					document.getElementById("Plasma welding details").innerText = "//";
					document.getElementById("Post Weld Heat Treatment and/or Aging").innerText = "//";
					document.getElementById("Torch angle").innerText = "//";
					document.getElementById("Time, Temperature, Method").innerText = "//";
					document.getElementById("Stand of distance").innerText = "//";
					document.getElementById("Heating and Cooling Rates").innerText = "//";
					document.getElementById("Manufacturer").innerText = "Jiangnan Shipyard (Group) Co.,Ltd";
					document.getElementById("Name, date and signature").innerText = "Hao Chen 23 .Aug . 2019";
					document.getElementById("Reference No2").innerText = result.ary[0].wpslibName;
					document.getElementById("Number1").innerText = "Full length";
					document.getElementById("Specimen mark1").innerText = "788V1~V2";
					document.getElementById("Number2").innerText = "Full length";
					document.getElementById("Specimen mark2").innerText = "788RT";
					document.getElementById("Number3").innerText = "Full length";
					document.getElementById("Specimen mark3").innerText = "788RT";
					document.getElementById("Number4").innerText = "2";
					document.getElementById("Specimen mark4").innerText = "788J1~J2";
					document.getElementById("Number5").innerText = "2";
					document.getElementById("Specimen mark5").innerText = "788J1~F2";
					document.getElementById("Number6").innerText = "2";
					document.getElementById("Specimen mark6").innerText = "788J1~R2";
					document.getElementById("Number7").innerText = "//";
					document.getElementById("Specimen mark7").innerText = "//";
					document.getElementById("Number8").innerText = "1";
					document.getElementById("Specimen mark8").innerText = "788M1";
					document.getElementById("Test standard").innerText = "CCS材料与焊接规范2019";
				}
			},
			error : function(errorMsg) {
				alert("数据请求失败，请联系系统管理员!");
			}
		});
	});
</script>

<style>
</style>

</head>

<body lang=ZH-CN style='tab-interval:21.0pt'>
	<input name="wpsid" id="wpsid" type="hidden" value="${wpsid}" />
	<button onclick="outputTextpwps()">导出</button>
	<a href="wps/goPwpslib;" class="easyui-linkbutton" iconCls="icon-newadd">返回</a>

	<div id="export_wordpwps">

		<div class=WordSection1>

			<table class=TableGrid border=0 cellspacing=0 cellpadding=0 width=616
				style='width:462.2pt;margin-left:5.55pt;border-collapse:collapse;mso-yfti-tbllook:
 1184;mso-padding-alt:.85pt 1.5pt 0cm 2.15pt'>
				<tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:598.5pt'>
					<td width=52 valign=top
						style='width:39.05pt;border:solid black 1.5pt;
  border-right:none;padding:.85pt 1.5pt 0cm 2.15pt;height:598.5pt'>
						<p class=MsoNormal style='margin-left:15.15pt'>
							<span
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
  宋体'>送：</span>
						</p>
						<p class=MsoNormal align=right
							style='margin-top:0cm;margin-right:11.45pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:right'>
							<span lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%'>To<span
								style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>
						</p>
					</td>
					<td width=564 colspan=6 valign=top
						style='width:423.2pt;border:solid black 1.5pt;
  border-left:none;padding:.85pt 1.5pt 0cm 2.15pt;height:598.5pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:90.05pt;
  margin-left:11.15pt'>
							<span lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:
  11.0pt;line-height:107%'>CCS</span>
						</p>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:11.05pt;
  margin-left:106.25pt'>
							<span lang=EN-US
								style='font-size:11.5pt;mso-bidi-font-size:
  11.0pt;line-height:107%'>PROCEDURE<span
								style='mso-spacerun:yes'>&nbsp; </span>APPROVAL<span
								style='mso-spacerun:yes'>&nbsp; </span>TEST<span
								style='mso-spacerun:yes'>&nbsp; </span>PLAN
							</span>
						</p>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:38.85pt;
  margin-bottom:11.05pt;margin-left:0cm;text-align:center'>
							<span lang=EN-US
								style='font-size:11.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>FOR</span>
						</p>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:11.1pt;
  margin-left:60.6pt'>
							<span lang=EN-US
								style='font-size:11.5pt;mso-bidi-font-size:
  11.0pt;line-height:107%'>BUTT<span
								style='mso-spacerun:yes'>&nbsp; </span>JOINT<span
								style='mso-spacerun:yes'>&nbsp; </span>OF<span
								style='mso-spacerun:yes'>&nbsp; </span>TWO-SIDE<span
								style='mso-spacerun:yes'>&nbsp; </span>GAS METAL<span
								style='mso-spacerun:yes'>&nbsp; </span>ARC<span
								style='mso-spacerun:yes'>&nbsp; </span>WELDING
							</span>
						</p>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:38.85pt;
  margin-bottom:11.05pt;margin-left:0cm;text-align:center'>
							<span lang=EN-US
								style='font-size:11.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>FOR</span>
						</p>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:113.95pt;margin-bottom:
  272.0pt;margin-left:147.55pt;text-align:justify;text-justify:inter-ideograph;
  text-indent:-1.0cm;line-height:188%'>
							<span lang=EN-US
								style='font-size:11.5pt;
  mso-bidi-font-size:11.0pt;line-height:188%'>ALUMINIUM
								ALLOY<span style='mso-spacerun:yes'>&nbsp; </span>5083H116
								(δ=10mm<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;
							</span>PA (F))
							</span>
						</p>
						<p class=MsoNormal align=center
							style='margin-left:88.25pt;text-align:center'>
							<span
								style='font-size:7.5pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:
  "Microsoft YaHei UI",sans-serif;mso-bidi-font-family:"Microsoft YaHei UI"'>验船师：</span>
						</p>
						<p class=MsoNormal align=center
							style='margin-left:88.05pt;text-align:center'>
							<span lang=EN-US
								style='font-size:7.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>Surveyor</span>
						</p>
						<p class=MsoNormal style='margin-left:270.5pt'>
							<span lang=EN-US><![if !vml]><img width=120 height=1
								src="resources/js/PWPS.files/image001.gif"
								v:shapes="Group_x0020_1168 Shape_x0020_1528"> <![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:1;height:26.05pt'>
					<td width=52 valign=top
						style='width:39.05pt;border-top:none;border-left:
  solid black 1.5pt;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.5pt;mso-border-top-alt:1.5pt;mso-border-left-alt:
  1.5pt;mso-border-bottom-alt:.75pt;mso-border-right-alt:.75pt;mso-border-color-alt:
  black;mso-border-style-alt:solid;padding:.85pt 1.5pt 0cm 2.15pt;height:26.05pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:2.25pt;
  margin-left:10.8pt'>
							<span style='font-family:宋体;mso-bidi-font-family:宋体'>编制</span>
						</p>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.65pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span lang=EN-US
								style='font-size:5.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>COMPILER</span>
						</p>
					</td>
					<td width=55 valign=top
						style='width:41.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.5pt;mso-border-left-alt:solid black .75pt;
  mso-border-alt:solid black .75pt;mso-border-top-alt:solid black 1.5pt;
  padding:.85pt 1.5pt 0cm 2.15pt;height:26.05pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=52 valign=top
						style='width:38.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.5pt;mso-border-left-alt:solid black .75pt;mso-border-alt:solid black .75pt;
  mso-border-top-alt:solid black 1.5pt;padding:.85pt 1.5pt 0cm 2.15pt;
  height:26.05pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:2.0pt;
  margin-left:10.7pt'>
							<span style='font-family:宋体;mso-bidi-font-family:宋体'>复审</span>
						</p>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.6pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span lang=EN-US
								style='font-size:5.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>REVIEW</span>
						</p>
					</td>
					<td width=54 valign=top
						style='width:40.45pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.5pt;
  mso-border-top-alt:solid black 1.5pt;mso-border-left-alt:solid black .75pt;
  mso-border-top-alt:1.5pt;mso-border-left-alt:.75pt;mso-border-bottom-alt:
  .75pt;mso-border-right-alt:1.5pt;mso-border-color-alt:black;mso-border-style-alt:
  solid;padding:.85pt 1.5pt 0cm 2.15pt;height:26.05pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=157 rowspan=4
						style='width:118.1pt;border-top:none;border-left:
  none;border-bottom:solid black 1.5pt;border-right:solid black 1.5pt;
  mso-border-top-alt:solid black 1.5pt;mso-border-left-alt:solid black 1.5pt;
  padding:.85pt 1.5pt 0cm 2.15pt;height:26.05pt'>
						<p class=MsoNormal align=center
							style='margin-left:0cm;text-align:center'>
							<span
								style='font-size:8.5pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:
  宋体;mso-bidi-font-family:宋体'>铝合金<span
								lang=EN-US>MIG</span>半自动平对接焊工艺计划书
							</span>
						</p>
					</td>
					<td width=120 valign=top
						style='width:89.95pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.5pt;mso-border-left-alt:solid black 1.5pt;
  mso-border-top-alt:1.5pt;mso-border-left-alt:1.5pt;mso-border-bottom-alt:
  .75pt;mso-border-right-alt:.75pt;mso-border-color-alt:black;mso-border-style-alt:
  solid;padding:.85pt 1.5pt 0cm 2.15pt;height:26.05pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:2.25pt;margin-left:.2pt;text-align:center'>
							<span style='font-family:宋体;mso-bidi-font-family:宋体'>文件类型</span>
						</p>
						<p class=MsoNormal align=center
							style='margin-left:.2pt;text-align:center'>
							<span lang=EN-US
								style='font-size:5.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>FILE
								TYPE</span>
						</p>
					</td>
					<td width=126
						style='width:94.75pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.5pt;mso-border-top-alt:
  solid black 1.5pt;mso-border-left-alt:solid black .75pt;mso-border-top-alt:
  1.5pt;mso-border-left-alt:.75pt;mso-border-bottom-alt:.75pt;mso-border-right-alt:
  1.5pt;mso-border-color-alt:black;mso-border-style-alt:solid;padding:.85pt 1.5pt 0cm 2.15pt;
  height:26.05pt'>
						<p class=MsoNormal align=center
							style='margin-left:.2pt;text-align:center'>
							<span lang=EN-US
								style='font-size:8.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>PWPS</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:2;height:25.9pt'>
					<td width=52 valign=top
						style='width:39.05pt;border-top:none;border-left:
  solid black 1.5pt;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black .75pt;mso-border-alt:solid black .75pt;
  mso-border-left-alt:solid black 1.5pt;padding:.85pt 1.5pt 0cm 2.15pt;
  height:25.9pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:2.0pt;
  margin-left:10.8pt'>
							<span style='font-family:宋体;mso-bidi-font-family:宋体'>校对</span>
						</p>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.55pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span lang=EN-US
								style='font-size:5.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>CHECK</span>
						</p>
					</td>
					<td width=55 valign=top
						style='width:41.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black .75pt;mso-border-left-alt:solid black .75pt;
  mso-border-alt:solid black .75pt;padding:.85pt 1.5pt 0cm 2.15pt;height:25.9pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=52 valign=top
						style='width:38.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black .75pt;mso-border-left-alt:solid black .75pt;mso-border-alt:solid black .75pt;
  padding:.85pt 1.5pt 0cm 2.15pt;height:25.9pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:2.0pt;
  margin-left:10.7pt'>
							<span style='font-family:宋体;mso-bidi-font-family:宋体'>标检</span>
						</p>
						<p class=MsoNormal style='margin-left:1.55pt'>
							<span lang=EN-US
								style='font-size:5.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>STANDARDIZE</span>
						</p>
					</td>
					<td width=54 valign=top
						style='width:40.45pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.5pt;
  mso-border-top-alt:solid black .75pt;mso-border-left-alt:solid black .75pt;
  mso-border-alt:solid black .75pt;mso-border-right-alt:solid black 1.5pt;
  padding:.85pt 1.5pt 0cm 2.15pt;height:25.9pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=120 valign=top
						style='width:89.95pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black .75pt;mso-border-left-alt:solid black 1.5pt;
  mso-border-alt:solid black .75pt;mso-border-left-alt:solid black 1.5pt;
  padding:.85pt 1.5pt 0cm 2.15pt;height:25.9pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:2.2pt;margin-left:.2pt;text-align:center'>
							<span style='font-family:宋体;mso-bidi-font-family:宋体'>文件编号</span>
						</p>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.15pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span lang=EN-US
								style='font-size:5.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>FILE
								NO.</span>
						</p>
					</td>
					<td width=126
						style='width:94.75pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.5pt;mso-border-top-alt:
  solid black .75pt;mso-border-left-alt:solid black .75pt;mso-border-alt:solid black .75pt;
  mso-border-right-alt:solid black 1.5pt;padding:.85pt 1.5pt 0cm 2.15pt;
  height:25.9pt'>
						<p class=MsoNormal align=center
							style='margin-left:0cm;text-align:center'>
							<span lang=EN-US
								style='font-size:8.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>JS-HY-06-788A-2019Y</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:3;height:25.9pt'>
					<td width=52 valign=top
						style='width:39.05pt;border-top:none;border-left:
  solid black 1.5pt;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black .75pt;mso-border-alt:solid black .75pt;
  mso-border-left-alt:solid black 1.5pt;padding:.85pt 1.5pt 0cm 2.15pt;
  height:25.9pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:2.0pt;
  margin-left:10.8pt'>
							<span style='font-family:宋体;mso-bidi-font-family:宋体'>会签</span>
						</p>
						<p class=MsoNormal style='margin-left:.7pt'>
							<span lang=EN-US
								style='font-size:5.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>COUNTERSIGN</span>
						</p>
					</td>
					<td width=55 valign=top
						style='width:41.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black .75pt;mso-border-left-alt:solid black .75pt;
  mso-border-alt:solid black .75pt;padding:.85pt 1.5pt 0cm 2.15pt;height:25.9pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=52 valign=top
						style='width:38.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black .75pt;mso-border-left-alt:solid black .75pt;mso-border-alt:solid black .75pt;
  padding:.85pt 1.5pt 0cm 2.15pt;height:25.9pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:2.0pt;
  margin-left:10.7pt'>
							<span style='font-family:宋体;mso-bidi-font-family:宋体'>审定</span>
						</p>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.8pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span lang=EN-US
								style='font-size:5.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>CONFIRM</span>
						</p>
					</td>
					<td width=54 valign=top
						style='width:40.45pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.5pt;
  mso-border-top-alt:solid black .75pt;mso-border-left-alt:solid black .75pt;
  mso-border-alt:solid black .75pt;mso-border-right-alt:solid black 1.5pt;
  padding:.85pt 1.5pt 0cm 2.15pt;height:25.9pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=120 valign=top
						style='width:89.95pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black .75pt;mso-border-left-alt:solid black 1.5pt;
  mso-border-alt:solid black .75pt;mso-border-left-alt:solid black 1.5pt;
  padding:.85pt 1.5pt 0cm 2.15pt;height:25.9pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:.95pt;margin-left:.2pt;text-align:center'>
							<span
								style='font-size:8.5pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:
  宋体;mso-bidi-font-family:宋体'>共</span><span
								lang=EN-US
								style='font-size:8.5pt;
  mso-bidi-font-size:11.0pt;line-height:107%'><span
								style='mso-spacerun:yes'>&nbsp;&nbsp; </span>3<span
								style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span></span><span
								style='font-size:8.5pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:
  宋体;mso-bidi-font-family:宋体'>页</span>
						</p>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.2pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span lang=EN-US
								style='font-size:7.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>TOTAL<span
								style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>SHEETS
							</span>
						</p>
					</td>
					<td width=126 valign=top
						style='width:94.75pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.5pt;
  mso-border-top-alt:solid black .75pt;mso-border-left-alt:solid black .75pt;
  mso-border-alt:solid black .75pt;mso-border-right-alt:solid black 1.5pt;
  padding:.85pt 1.5pt 0cm 2.15pt;height:25.9pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.1pt;
  margin-bottom:.95pt;margin-left:0cm;text-align:center'>
							<span
								style='font-size:8.5pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:
  宋体;mso-bidi-font-family:宋体'>第</span><span
								lang=EN-US
								style='font-size:8.5pt;
  mso-bidi-font-size:11.0pt;line-height:107%'><span
								style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1<span
								style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span></span><span
								style='font-size:8.5pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:
  宋体;mso-bidi-font-family:宋体'>页</span>
						</p>
						<p class=MsoNormal align=center
							style='margin-left:.05pt;text-align:center'>
							<span lang=EN-US
								style='font-size:7.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>SHEET</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:4;mso-yfti-lastrow:yes;height:25.8pt'>
					<td width=52 valign=top
						style='width:39.05pt;border-top:none;border-left:
  solid black 1.5pt;border-bottom:solid black 1.5pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black .75pt;mso-border-top-alt:.75pt;mso-border-left-alt:
  1.5pt;mso-border-bottom-alt:1.5pt;mso-border-right-alt:.75pt;mso-border-color-alt:
  black;mso-border-style-alt:solid;padding:.85pt 1.5pt 0cm 2.15pt;height:25.8pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:2.0pt;
  margin-left:10.8pt'>
							<span style='font-family:宋体;mso-bidi-font-family:宋体'>审核</span>
						</p>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.75pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span lang=EN-US
								style='font-size:5.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>EXAMINE</span>
						</p>
					</td>
					<td width=55 valign=top
						style='width:41.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.5pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black .75pt;mso-border-left-alt:solid black .75pt;
  mso-border-alt:solid black .75pt;mso-border-bottom-alt:solid black 1.5pt;
  padding:.85pt 1.5pt 0cm 2.15pt;height:25.8pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=52 valign=top
						style='width:38.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.5pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black .75pt;mso-border-left-alt:solid black .75pt;mso-border-alt:solid black .75pt;
  mso-border-bottom-alt:solid black 1.5pt;padding:.85pt 1.5pt 0cm 2.15pt;
  height:25.8pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:2.0pt;
  margin-left:10.7pt'>
							<span style='font-family:宋体;mso-bidi-font-family:宋体'>批准</span>
						</p>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.9pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span lang=EN-US
								style='font-size:5.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>APPROVE</span>
						</p>
					</td>
					<td width=54 valign=top
						style='width:40.45pt;border-top:none;border-left:
  none;border-bottom:solid black 1.5pt;border-right:solid black 1.5pt;
  mso-border-top-alt:solid black .75pt;mso-border-left-alt:solid black .75pt;
  padding:.85pt 1.5pt 0cm 2.15pt;height:25.8pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=246 colspan=2 valign=top
						style='width:184.65pt;border-top:none;
  border-left:none;border-bottom:solid black 1.5pt;border-right:solid black 1.5pt;
  mso-border-top-alt:solid black .75pt;mso-border-left-alt:solid black 1.5pt;
  padding:.85pt 1.5pt 0cm 2.15pt;height:25.8pt'>
						<p class=MsoNormal style='margin-left:24.75pt;text-indent:11.75pt'>
							<![if !vml]>
							<img width=80 height=21
								src="resources/js/PWPS.files/image003.jpg" align=left hspace=12
								v:shapes="Picture_x0020_81">
							<![endif]>
							<span lang=EN-US
								style='font-size:7.5pt;mso-bidi-font-size:11.0pt;line-height:107%'><span
								style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</span></span><span
								style='font-size:7.5pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:宋体;mso-bidi-font-family:宋体'>江南造船（集团）有限责任公司
							</span><span lang=EN-US
								style='font-size:7.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>JIANGNAN
								SHIPYARD</span><span
								style='font-size:7.5pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:宋体;mso-bidi-font-family:宋体'>（</span><span
								lang=EN-US
								style='font-size:7.5pt;mso-bidi-font-size:11.0pt;line-height:107%'>GROUP</span><span
								style='font-size:7.5pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:
  宋体;mso-bidi-font-family:宋体'>）</span><span
								lang=EN-US
								style='font-size:7.5pt;
  mso-bidi-font-size:11.0pt;line-height:107%'>CO.,LTD.</span>
						</p>
					</td>
				</tr>
			</table>

			<p class=MsoNormal>
				<span lang=EN-US>Fax: +86-021-66994753<span
					style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>E-mail:jit@jnshipyard.com.cn<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>4
				</span><span style='font-family:宋体;mso-bidi-font-family:宋体'>号</span><span
					lang=EN-US> 297x210=0.06m<sup>2</sup></span><sup><span
					style='font-family:宋体;mso-bidi-font-family:
宋体'>、</span></sup><sup><span
					lang=EN-US
					style='mso-fareast-font-family:等线;
mso-fareast-theme-font:minor-fareast'><o:p></o:p></span></sup>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:106.85pt;margin-bottom:
.95pt;margin-left:195.25pt;text-indent:24.0pt;mso-char-indent-count:2.0;
line-height:112%'>
				<span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:
11.0pt;line-height:112%;font-family:"Times New Roman",serif;mso-fareast-font-family:
"Times New Roman"'>Page
				</span><span lang=EN-US
					style='font-size:12.0pt;
mso-bidi-font-size:11.0pt;line-height:112%;font-family:等线;mso-ascii-theme-font:
minor-fareast;mso-fareast-theme-font:minor-fareast;mso-hansi-theme-font:minor-fareast;
mso-bidi-font-family:"Times New Roman"'>1</span><span
					lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;font-family:
"Times New Roman",serif;mso-fareast-font-family:等线;mso-fareast-theme-font:minor-fareast'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:106.85pt;margin-bottom:
.95pt;margin-left:0cm;line-height:112%'>
				<span lang=EN-US
					style='font-size:12.0pt;
mso-bidi-font-size:11.0pt;line-height:112%;font-family:"Times New Roman",serif;
mso-fareast-font-family:等线;mso-fareast-theme-font:minor-fareast'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:106.85pt;margin-bottom:
.95pt;margin-left:0cm;line-height:112%'>
				<span lang=EN-US
					style='font-size:12.0pt;
mso-bidi-font-size:11.0pt;line-height:112%;font-family:"Times New Roman",serif;
mso-fareast-font-family:等线;mso-fareast-theme-font:minor-fareast'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal>
				<span lang=EN-US
					style='mso-fareast-font-family:等线;
mso-fareast-theme-font:minor-fareast'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:0cm;margin-bottom:16.1pt;
margin-left:0cm;text-indent:112.45pt;mso-char-indent-count:8.0'>
				<b style='mso-bidi-font-weight:normal'><span lang=EN-US
					style='font-size:14.0pt;
mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
mso-fareast-font-family:"Times New Roman"'>Preliminary
						Welding Procedure Specification(PWPS)</span></b><span lang=EN-US
					style='font-size:11.0pt;
line-height:107%'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:0cm;margin-bottom:4.55pt;
margin-left:-.5pt;line-height:112%;tab-stops:center 116.45pt 312.75pt 431.55pt'>
				<span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>location:<span
					style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span></span><i style='mso-bidi-font-style:normal'><span id="location"
					lang=EN-US
					style='font-size:10.0pt;
mso-bidi-font-size:11.0pt;line-height:112%;font-family:"Times New Roman",serif;
mso-fareast-font-family:"Times New Roman"'>Welding
						Lab. </span><span style='mso-tab-count:
1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span></i><span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Examiner
					or test body:<span style='mso-spacerun:yes'>&nbsp; </span><span
					style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
				</span><i style='mso-bidi-font-style:normal'><span
					id="Examiner or test body" lang=EN-US
					style='font-size:10.0pt;
mso-bidi-font-size:11.0pt;line-height:112%;font-family:"Times New Roman",serif;
mso-fareast-font-family:"Times New Roman"'>CCS-2018</span></i><span
					lang=EN-US style='font-size:11.0pt;line-height:112%'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:106.85pt;margin-bottom:
3.6pt;margin-left:0cm;text-indent:-.5pt;line-height:112%'>
				<span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;font-family:
"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Manufacturer<sup>'</sup>s
					Welding Procedure
				</span><span lang=EN-US style='font-size:11.0pt;line-height:
112%'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:0cm;margin-bottom:2.05pt;
margin-left:-.5pt;tab-stops:center 135.8pt'>
				<span lang=EN-US
					style='font-size:
12.0pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
mso-fareast-font-family:"Times New Roman"'>Reference
					No:<span style='mso-tab-count:
1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
				</span><i style='mso-bidi-font-style:
normal'><span id="Reference No"
					lang=EN-US
					style='font-size:10.0pt;mso-bidi-font-size:11.0pt;
line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
"Times New Roman"'>JS-HY-06-788A-2019Y</span></i><span
					lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:48.0pt;margin-bottom:
2.35pt;margin-left:252.0pt'>
				<span lang=EN-US
					style='font-size:12.0pt;
mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
mso-fareast-font-family:"Times New Roman"'>Method
					of Preparation and Cleaning:</span><i style='mso-bidi-font-style:normal'><span
					id="Method of Preparation and Cleaning" lang=EN-US
					style='font-size:10.0pt;
mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
mso-fareast-font-family:"Times New Roman"'>Cutting+Grinding</span></i><span
					lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:0cm;margin-bottom:2.05pt;
margin-left:-.5pt;tab-stops:center 161.75pt'>
				<span lang=EN-US
					style='font-size:
12.0pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
mso-fareast-font-family:"Times New Roman"'>Manufacturer:<span
					style='mso-tab-count:
1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span></span><i style='mso-bidi-font-style:normal'><span id="Manufacturer"
					lang=EN-US
					style='font-size:10.0pt;
mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
mso-fareast-font-family:"Times New Roman"'>Jiangnan
						Shipyard (Group) Co.,Ltd</span></i><span lang=EN-US
					style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:16.75pt;margin-bottom:
.95pt;margin-left:0cm;text-indent:-.5pt;line-height:112%'>
				<span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;font-family:
"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Welder's
					Name: </span><span id="Welder's Name" lang=EN-US
					style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>joint
				</span><span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;font-family:
"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Parent
					Material Specification: </span><i style='mso-bidi-font-style:normal'><span
					id="Parent Material Specification" lang=EN-US
					style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>5083H116
				</span></i><span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;
line-height:112%;font-family:"Times New Roman",serif;mso-fareast-font-family:
"Times New Roman"'>Welding
					Process: </span><i style='mso-bidi-font-style:normal'><span
					id="Welding Process" lang=EN-US
					style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>MIG
				</span></i><span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;
line-height:112%;font-family:"Times New Roman",serif;mso-fareast-font-family:
"Times New Roman"'>Material
					Thickness(mm): </span><i style='mso-bidi-font-style:
normal'><span
					id="Material Thickness" lang=EN-US
					style='font-size:10.0pt;mso-bidi-font-size:11.0pt;
line-height:112%;font-family:"Times New Roman",serif;mso-fareast-font-family:
"Times New Roman"'>10mm<o:p></o:p></span></i>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:16.75pt;margin-bottom:
.95pt;margin-left:0cm;text-indent:-.5pt;line-height:112%'>
				<span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;font-family:
"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Joint
					Type:<span id="Joint Type" style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>Outside Diameter(mm):<span id="Outside Diameter"
					style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
				<o:p></o:p>
				</span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:16.75pt;margin-bottom:
.95pt;margin-left:0cm;text-indent:-.5pt;line-height:112%'>
				<span lang=EN-US
					style='font-size:11.0pt;line-height:112%;mso-fareast-font-family:等线;mso-fareast-theme-font:
minor-fareast'>Weld
					Prepatation Details(Sketch):<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span><span id="Weld Prepatation Details" style='mso-spacerun:yes'></span><span
					style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>Welding Position:<span id="Welding Position"
					style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
				<o:p></o:p>
				</span>
			</p>

			<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
				style='border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;
 mso-yfti-tbllook:1184;mso-padding-alt:0cm 5.4pt 0cm 5.4pt'>
				<tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes'>
					<td width=340 valign=top
						style='width:254.75pt;border:solid windowtext 1.5pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:16.75pt;
  margin-bottom:.95pt;margin-left:0cm;text-align:center;line-height:112%'>
							<span lang=EN-US
								style='font-size:11.0pt;line-height:112%;mso-fareast-font-family:
  等线;mso-fareast-theme-font:minor-fareast'>Joint
								Design<o:p></o:p>
							</span>
						</p>
					</td>
					<td width=350 valign=top
						style='width:262.25pt;border:solid windowtext 1.5pt;
  border-left:none;mso-border-left-alt:solid windowtext 1.5pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:16.75pt;
  margin-bottom:.95pt;margin-left:0cm;text-align:center;line-height:112%'>
							<span lang=EN-US
								style='font-size:11.0pt;line-height:112%;mso-fareast-font-family:
  等线;mso-fareast-theme-font:minor-fareast'>Welding
								Sequences<o:p></o:p>
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:1;mso-yfti-lastrow:yes'>
					<td width=340 valign=top
						style='width:254.75pt;border:solid windowtext 1.5pt;
  border-top:none;mso-border-top-alt:solid windowtext 1.5pt;padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:16.75pt;
  margin-bottom:.95pt;margin-left:0cm;text-align:center;line-height:112%'>
							<span lang=EN-US style='mso-no-proof:yes'><![if !vml]><img
								width=262 height=166 src="resources/js/PWPS.files/image005.jpg"
								v:shapes="图片_x0020_1"> <![endif]></span><span lang=EN-US
								style='font-size:11.0pt;line-height:112%;mso-fareast-font-family:
  等线;mso-fareast-theme-font:minor-fareast'><o:p></o:p></span>
						</p>
					</td>
					<td width=350 valign=top
						style='width:262.25pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.5pt;border-right:solid windowtext 1.5pt;
  mso-border-top-alt:solid windowtext 1.5pt;mso-border-left-alt:solid windowtext 1.5pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:16.75pt;
  margin-bottom:.95pt;margin-left:0cm;text-align:center;line-height:112%'>
							<span lang=EN-US
								style='font-size:11.0pt;line-height:112%;mso-fareast-font-family:
  等线;mso-fareast-theme-font:minor-fareast'><o:p>&nbsp;</o:p></span>
						</p>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:16.75pt;
  margin-bottom:.95pt;margin-left:0cm;text-align:center;line-height:112%'>
							<span lang=EN-US
								style='font-size:11.0pt;line-height:112%;mso-fareast-font-family:
  等线;mso-fareast-theme-font:minor-fareast'><span
								style='mso-spacerun:yes'>&nbsp;</span><span
								style='mso-spacerun:yes'>&nbsp;&nbsp; </span></span><span lang=EN-US
								style='mso-no-proof:yes'><![if !vml]><img width=255
								height=106 src="resources/js/PWPS.files/image007.jpg"
								v:shapes="图片_x0020_2"> <![endif]></span><span lang=EN-US
								style='font-size:11.0pt;line-height:112%;mso-fareast-font-family:
  等线;mso-fareast-theme-font:minor-fareast'><o:p></o:p></span>
						</p>
					</td>
				</tr>
			</table>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:-6.0pt;margin-bottom:
1.25pt;margin-left:0cm'>
				<span lang=EN-US style='font-size:11.0pt;line-height:
107%'><o:p>&nbsp;</o:p></span>
			</p>

			<table class=TableGrid border=0 cellspacing=0 cellpadding=0 width=689
				style='width:516.95pt;margin-left:-1.9pt;border-collapse:collapse;mso-yfti-tbllook:
 1184;mso-padding-alt:1.15pt 1.6pt 0cm 2.4pt'>
				<tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:16.0pt'>
					<td width=40 valign=top
						style='width:30.0pt;border:solid black 1.0pt;
  border-bottom:none;padding:1.15pt 1.6pt 0cm 2.4pt;height:16.0pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=79 valign=top
						style='width:59.3pt;border-top:solid black 1.0pt;
  border-left:none;border-bottom:none;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.0pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=83 valign=top
						style='width:62.2pt;border-top:solid black 1.0pt;
  border-left:none;border-bottom:none;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.0pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:2.55pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Size
								of </span><span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=73 valign=top
						style='width:54.75pt;border-top:solid black 1.0pt;
  border-left:none;border-bottom:none;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.0pt'>
						<p class=MsoNormal style='margin-left:5.55pt'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Current
							</span><span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:51.85pt;border-top:solid black 1.0pt;
  border-left:none;border-bottom:none;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.0pt'>
						<p class=MsoNormal style='margin-left:5.05pt'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Voltage</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=125 valign=top
						style='width:93.9pt;border-top:solid black 1.0pt;
  border-left:none;border-bottom:none;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.0pt'>
						<p class=MsoNormal style='margin-left:3.1pt'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Type
								of Current/ </span><span lang=EN-US
								style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=78 valign=top
						style='width:58.6pt;border-top:solid black 1.0pt;
  border-left:none;border-bottom:none;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.0pt'>
						<p class=MsoNormal
							style='margin-left:2.65pt;text-align:justify;text-justify:
  inter-ideograph'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:
  11.0pt;line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>Wire
								Feed</span><span lang=EN-US
								style='font-size:11.0pt;
  line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=67 valign=top
						style='width:50.2pt;border-top:solid black 1.0pt;
  border-left:none;border-bottom:none;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.0pt'>
						<p class=MsoNormal style='margin-left:6.25pt'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Travel
							</span><span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=75 valign=top
						style='width:56.2pt;border-top:solid black 1.0pt;
  border-left:none;border-bottom:none;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.0pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.35pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Heat</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:1;height:16.1pt'>
					<td width=40 valign=top
						style='width:30.0pt;border-top:none;border-left:solid black 1.0pt;
  border-bottom:none;border-right:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.1pt'>
						<p class=MsoNormal
							style='margin-left:1.7pt;text-align:justify;text-justify:
  inter-ideograph'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:
  11.0pt;line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>Run
							</span><span lang=EN-US style='font-size:11.0pt;
  line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=79 valign=top
						style='width:59.3pt;border:none;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.1pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:3.15pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Process
							</span><span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=83 valign=top
						style='width:62.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.1pt'>
						<p class=MsoNormal
							style='margin-left:0cm;text-align:justify;text-justify:
  inter-ideograph'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:
  11.0pt;line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>Filler
								Metal </span><span lang=EN-US
								style='font-size:
  11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=73 valign=top
						style='width:54.75pt;border:none;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.1pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:51.85pt;border:none;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.1pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=125 valign=top
						style='width:93.9pt;border:none;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.1pt'>
						<p class=MsoNormal align=center
							style='margin-left:.6pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Polarity</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=78 valign=top
						style='width:58.6pt;border:none;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.1pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:3.2pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Speed
							</span><span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=67 valign=top
						style='width:50.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.1pt'>
						<p class=MsoNormal style='margin-left:6.95pt'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Speed
							</span><span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=75 valign=top
						style='width:56.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.1pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.1pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Input</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:2;height:16.2pt'>
					<td width=40 valign=top
						style='width:30.0pt;border:solid black 1.0pt;
  border-top:none;padding:1.15pt 1.6pt 0cm 2.4pt;height:16.2pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=79 valign=top
						style='width:59.3pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-left-alt:
  solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;height:16.2pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=83 valign=top
						style='width:62.2pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-left-alt:
  solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;height:16.2pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=73 valign=top
						style='width:54.75pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.2pt'>
						<p class=MsoNormal align=center
							style='margin-left:.25pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>A</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:51.85pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.2pt'>
						<p class=MsoNormal align=center
							style='margin-left:.2pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>V</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=125 valign=top
						style='width:93.9pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:16.2pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=78 valign=top
						style='width:58.6pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-left-alt:
  solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;height:16.2pt'>
						<p class=MsoNormal align=center
							style='margin-left:.4pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>cm/min</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=67 valign=top
						style='width:50.2pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-left-alt:
  solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;height:16.2pt'>
						<p class=MsoNormal style='margin-left:5.5pt'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>cm/min</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=75 valign=top
						style='width:56.2pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-left-alt:
  solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;height:16.2pt'>
						<p class=MsoNormal align=center
							style='margin-left:.4pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>kJ/cm</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:3;height:14.85pt'>
					<td width=40 valign=top
						style='width:30.0pt;border-top:none;border-left:solid black 1.0pt;
  border-bottom:none;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.75pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Run1" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>1</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=79 valign=top
						style='width:59.3pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-left:.95pt;text-align:center'>
							<span id="Process1" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:宋体;mso-bidi-font-family:宋体'>MIG</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=83 valign=top
						style='width:62.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:15.15pt'>
							<span id="Filler Metal1" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:宋体;mso-bidi-font-family:宋体'>φ1.2</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=73 valign=top
						style='width:54.75pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:6.75pt'>
							<i style='mso-bidi-font-style:
  normal'><span id="Current1" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>180~200</span></i><span
								lang=EN-US style='font-size:11.0pt;
  line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:51.85pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.5pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Voltage1" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>21~23</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=125 valign=top
						style='width:93.9pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Type1" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=78 valign=top
						style='width:58.6pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Wire Feed Speed1" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=67 valign=top
						style='width:50.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.8pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Travel Speed1" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>30~35</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=75 valign=top
						style='width:56.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Heat Input1" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
				</tr>
				
				<tr style='mso-yfti-irow:4;height:14.85pt'>
					<td width=40 valign=top
						style='width:30.0pt;border-top:none;border-left:solid black 1.0pt;
  border-bottom:none;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.75pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Run2" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>1</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=79 valign=top
						style='width:59.3pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-left:.95pt;text-align:center'>
							<span id="Process2" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:宋体;mso-bidi-font-family:宋体'>MIG</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=83 valign=top
						style='width:62.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:15.15pt'>
							<span id="Filler Metal2" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:宋体;mso-bidi-font-family:宋体'>φ1.2</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=73 valign=top
						style='width:54.75pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:6.75pt'>
							<i style='mso-bidi-font-style:
  normal'><span id="Current2" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>180~200</span></i><span
								lang=EN-US style='font-size:11.0pt;
  line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:51.85pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.5pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Voltage2" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>21~23</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=125 valign=top
						style='width:93.9pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Type2" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=78 valign=top
						style='width:58.6pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Wire Feed Speed2"  lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=67 valign=top
						style='width:50.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.8pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Travel Speed2" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>30~35</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=75 valign=top
						style='width:56.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Heat Input2" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
				</tr>
				
				<tr style='mso-yfti-irow:5;height:14.85pt'>
					<td width=40 valign=top
						style='width:30.0pt;border-top:none;border-left:solid black 1.0pt;
  border-bottom:none;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.75pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Run3" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>1</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=79 valign=top
						style='width:59.3pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-left:.95pt;text-align:center'>
							<span id="Process3" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:宋体;mso-bidi-font-family:宋体'>MIG</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=83 valign=top
						style='width:62.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:15.15pt'>
							<span id="Filler Metal3" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:宋体;mso-bidi-font-family:宋体'>φ1.2</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=73 valign=top
						style='width:54.75pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:6.75pt'>
							<i style='mso-bidi-font-style:
  normal'><span id="Current3" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>180~200</span></i><span
								lang=EN-US style='font-size:11.0pt;
  line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:51.85pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.5pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Voltage3" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>21~23</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=125 valign=top
						style='width:93.9pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Type3" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=78 valign=top
						style='width:58.6pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Wire Feed Speed3" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=67 valign=top
						style='width:50.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.8pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Travel Speed3" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>30~35</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=75 valign=top
						style='width:56.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Heat Input3" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
				</tr>
				
				<tr style='mso-yfti-irow:6;height:14.85pt'>
					<td width=40 valign=top
						style='width:30.0pt;border-top:none;border-left:solid black 1.0pt;
  border-bottom:none;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.75pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Run4" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>1</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=79 valign=top
						style='width:59.3pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-left:.95pt;text-align:center'>
							<span id="Process4" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:宋体;mso-bidi-font-family:宋体'>MIG</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=83 valign=top
						style='width:62.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:15.15pt'>
							<span id="Filler Metal4" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:宋体;mso-bidi-font-family:宋体'>φ1.2</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=73 valign=top
						style='width:54.75pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:6.75pt'>
							<i style='mso-bidi-font-style:
  normal'><span id="Current4" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>180~200</span></i><span
								lang=EN-US style='font-size:11.0pt;
  line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:51.85pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.5pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Voltage4" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>21~23</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=125 valign=top
						style='width:93.9pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Type4" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=78 valign=top
						style='width:58.6pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Wire Feed Speed4" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=67 valign=top
						style='width:50.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.8pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Travel Speed4" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>30~35</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=75 valign=top
						style='width:56.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Heat Input4" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
				</tr>
				
				<tr style='mso-yfti-irow:7;height:14.85pt'>
					<td width=40 valign=top
						style='width:30.0pt;border-top:none;border-left:solid black 1.0pt;
  border-bottom:none;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.75pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Run5" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>1</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=79 valign=top
						style='width:59.3pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-left:.95pt;text-align:center'>
							<span id="Process5" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:宋体;mso-bidi-font-family:宋体'>MIG</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=83 valign=top
						style='width:62.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:15.15pt'>
							<span id="Filler Metal5" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:宋体;mso-bidi-font-family:宋体'>φ1.2</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=73 valign=top
						style='width:54.75pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:6.75pt'>
							<i style='mso-bidi-font-style:
  normal'><span id="Current5" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>180~200</span></i><span
								lang=EN-US style='font-size:11.0pt;
  line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:51.85pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.5pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Voltage5" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>21~23</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=125 valign=top
						style='width:93.9pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Type5" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=78 valign=top
						style='width:58.6pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Wire Feed Speed5" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=67 valign=top
						style='width:50.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.8pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Travel Speed5" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>30~35</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=75 valign=top
						style='width:56.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Heat Input5" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
				</tr>
				
				<tr style='mso-yfti-irow:8;height:14.85pt'>
					<td width=40 valign=top
						style='width:30.0pt;border-top:none;border-left:solid black 1.0pt;
  border-bottom:none;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.75pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Run6" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>1</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=79 valign=top
						style='width:59.3pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-left:.95pt;text-align:center'>
							<span id="Process6" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:宋体;mso-bidi-font-family:宋体'>MIG</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=83 valign=top
						style='width:62.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:15.15pt'>
							<span id="Filler Metal6" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:宋体;mso-bidi-font-family:宋体'>φ1.2</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=73 valign=top
						style='width:54.75pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:6.75pt'>
							<i style='mso-bidi-font-style:
  normal'><span id="Current6" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>180~200</span></i><span
								lang=EN-US style='font-size:11.0pt;
  line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:51.85pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.5pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Voltage6" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>21~23</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=125 valign=top
						style='width:93.9pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Type6" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=78 valign=top
						style='width:58.6pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Wire Feed Speed6" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=67 valign=top
						style='width:50.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.8pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Travel Speed6" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>30~35</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=75 valign=top
						style='width:56.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Heat Input6" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
				</tr>
				
				<tr style='mso-yfti-irow:9;height:14.85pt'>
					<td width=40 valign=top
						style='width:30.0pt;border-top:none;border-left:solid black 1.0pt;
  border-bottom:none;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.75pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Run7" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>1</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=79 valign=top
						style='width:59.3pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-left:.95pt;text-align:center'>
							<span id="Process7" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:宋体;mso-bidi-font-family:宋体'>MIG</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=83 valign=top
						style='width:62.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:15.15pt'>
							<span id="Filler Metal7" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:宋体;mso-bidi-font-family:宋体'>φ1.2</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=73 valign=top
						style='width:54.75pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:6.75pt'>
							<i style='mso-bidi-font-style:
  normal'><span id="Current7" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>180~200</span></i><span
								lang=EN-US style='font-size:11.0pt;
  line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:51.85pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.5pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Voltage7" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>21~23</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=125 valign=top
						style='width:93.9pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Type7" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=78 valign=top
						style='width:58.6pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Wire Feed Speed7" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=67 valign=top
						style='width:50.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.8pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Travel Speed7" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>30~35</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=75 valign=top
						style='width:56.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Heat Input7" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
				</tr>
				
				<tr style='mso-yfti-irow:10;height:14.85pt'>
					<td width=40 valign=top
						style='width:30.0pt;border-top:none;border-left:solid black 1.0pt;
  border-bottom:none;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.75pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Run8" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>1</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=79 valign=top
						style='width:59.3pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-left:.95pt;text-align:center'>
							<span id="Process8" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:宋体;mso-bidi-font-family:宋体'>MIG</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=83 valign=top
						style='width:62.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:15.15pt'>
							<span id="Filler Metal8" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:宋体;mso-bidi-font-family:宋体'>φ1.2</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=73 valign=top
						style='width:54.75pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:6.75pt'>
							<i style='mso-bidi-font-style:
  normal'><span id="Current8" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>180~200</span></i><span
								lang=EN-US style='font-size:11.0pt;
  line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:51.85pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.5pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Voltage8" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>21~23</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=125 valign=top
						style='width:93.9pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Type8" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=78 valign=top
						style='width:58.6pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Wire Feed Speed8" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=67 valign=top
						style='width:50.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.8pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Travel Speed8" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>30~35</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=75 valign=top
						style='width:56.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Heat Input8" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
				</tr>
				
				<tr style='mso-yfti-irow:11;height:14.85pt'>
					<td width=40 valign=top
						style='width:30.0pt;border-top:none;border-left:solid black 1.0pt;
  border-bottom:none;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.75pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Run9" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>1</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=79 valign=top
						style='width:59.3pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-left:.95pt;text-align:center'>
							<span id="Process9" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:宋体;mso-bidi-font-family:宋体'>MIG</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=83 valign=top
						style='width:62.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:15.15pt'>
							<span id="Filler Metal9" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:宋体;mso-bidi-font-family:宋体'>φ1.2</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=73 valign=top
						style='width:54.75pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal style='margin-left:6.75pt'>
							<i style='mso-bidi-font-style:
  normal'><span id="Current9" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>180~200</span></i><span
								lang=EN-US style='font-size:11.0pt;
  line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:51.85pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.5pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Voltage9" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>21~23</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=125 valign=top
						style='width:93.9pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Type9" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=78 valign=top
						style='width:58.6pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Wire Feed Speed9" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=67 valign=top
						style='width:50.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.8pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Travel Speed9" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>30~35</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=75 valign=top
						style='width:56.2pt;border:none;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:1.15pt 1.6pt 0cm 2.4pt;height:14.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span id="Heat Input9" lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
				</tr>
				
				<tr style='mso-yfti-irow:12;mso-yfti-lastrow:yes;height:58.35pt'>
					<td width=40 valign=top
						style='width:30.0pt;border:solid black 1.0pt;
  border-top:none;padding:1.15pt 1.6pt 0cm 2.4pt;height:58.35pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.75pt;
  margin-bottom:2.05pt;margin-left:0cm;text-align:center'>
							<i style='mso-bidi-font-style:
  normal'><span id="Run2" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'></span></i><span
								lang=EN-US style='font-size:11.0pt;
  line-height:107%'><o:p></o:p></span>
						</p>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.75pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Run10" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'></span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=79 valign=top
						style='width:59.3pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-left-alt:
  solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;height:58.35pt'>
						<p class=MsoNormal align=center
							style='margin-left:.7pt;text-align:center'>
							<span id="Process10" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:宋体;mso-bidi-font-family:宋体'></span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
						<p class=MsoNormal align=center
							style='margin-left:.7pt;text-align:center'>
							
						</p>
					</td>
					<td width=83 valign=top
						style='width:62.2pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-left-alt:
  solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;height:58.35pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.2pt;
  margin-bottom:0cm;margin-left:.85pt;margin-bottom:.0001pt;text-align:center'>
							<span id="Filler Metal10" lang=EN-US
								style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:宋体;mso-bidi-font-family:宋体'></span><span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p><p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.2pt;
  margin-bottom:0cm;margin-left:.85pt;margin-bottom:.0001pt;text-align:center'>
							<span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=73 valign=top
						style='width:54.75pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:58.35pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:2.05pt;
  margin-left:6.75pt'>
							<i style='mso-bidi-font-style:normal'><span id="Current10" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>170~190</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
						<p class=MsoNormal style='margin-left:6.75pt'>
							<i style='mso-bidi-font-style:
  normal'></i><span
								lang=EN-US style='font-size:11.0pt;
  line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=69 valign=top
						style='width:51.85pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:58.35pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.5pt;
  margin-bottom:2.05pt;margin-left:0cm;text-align:center'>
							<i style='mso-bidi-font-style:
  normal'><span id="Voltage10" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'></span></i><span
								lang=EN-US style='font-size:11.0pt;
  line-height:107%'><o:p></o:p></span>
						</p>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.5pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Voltage3" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'></span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=125 valign=top
						style='width:93.9pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;
  height:58.35pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.5pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span id="Type10" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>DCEN</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=78 valign=top
						style='width:58.6pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-left-alt:
  solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;height:58.35pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.1pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="Wire Feed Speed10" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:宋体;mso-bidi-font-family:宋体'>/</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=67 valign=top
						style='width:50.2pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-left-alt:
  solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;height:58.35pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.8pt;
  margin-bottom:2.05pt;margin-left:0cm;text-align:center'>
							<i style='mso-bidi-font-style:
  normal'><span id="Travel Speed10" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>20~25</span></i><span
								lang=EN-US style='font-size:11.0pt;
  line-height:107%'><o:p></o:p></span>
						</p>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.8pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=75 valign=top
						style='width:56.2pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-left-alt:
  solid black 1.0pt;padding:1.15pt 1.6pt 0cm 2.4pt;height:58.35pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.55pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="Heat Input10" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:宋体;mso-bidi-font-family:宋体'></span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
				</tr>
			</table>

			<p class=MsoNormal style='margin-left:0cm;tab-stops:center 260.95pt'>
				<span lang=EN-US
					style='font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
mso-fareast-font-family:"Times New Roman"'>Filler
					Metal Classification and Trade Name:<span style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
				</span><i style='mso-bidi-font-style:normal'><span id="Filler Metal Classification and Trade Name" lang=EN-US
					style='font-size:10.0pt;
mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
mso-fareast-font-family:"Times New Roman"'>AlcoTec ER5183(φ1.2mm)</span></i><span lang=EN-US
					style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
			</p>

			<table class=TableGrid border=0 cellspacing=0 cellpadding=0 width=660
				style='width:495.0pt;border-collapse:collapse;mso-yfti-tbllook:1184;
 mso-padding-alt:0cm 0cm 0cm 0cm'>
				<tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:14.7pt'>
					<td width=275 valign=top
						style='width:206.25pt;padding:0cm 0cm 0cm 0cm;
  height:14.7pt'>
						<p class=MsoNormal style='margin-left:.25pt'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Any
								Special Baking or Drying:</span><span lang=EN-US
								style='font-size:11.0pt;
  line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=385 valign=top
						style='width:288.75pt;padding:0cm 0cm 0cm 0cm;
  height:14.7pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;
  margin-left:0cm'>
							<span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p>&nbsp;</o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:1;height:16.1pt'>
					<td width=275 valign=top
						style='width:206.25pt;padding:0cm 0cm 0cm 0cm;
  height:16.1pt'>
						<p class=MsoNormal
							style='margin-left:0cm;tab-stops:center 171.8pt'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Gas/Flux
								- Shielding:<span style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</span>
							</span><i style='mso-bidi-font-style:normal'><span id="Shielding" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>99.99%Ar</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=385 valign=top
						style='width:288.75pt;padding:0cm 0cm 0cm 0cm;
  height:16.1pt'>
						<p class=MsoNormal style='margin-left:52.1pt'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Other
								information: </span><i style='mso-bidi-font-style:normal'><span id="Other information"
								lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Shop
									primer</span></i><span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:2;height:16.1pt'>
					<td width=275 valign=top
						style='width:206.25pt;padding:0cm 0cm 0cm 0cm;
  height:16.1pt'>
						<p class=MsoNormal
							style='margin-left:0cm;tab-stops:center 152.9pt'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'><span
								style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</span>-Backing:<span style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</span></span><i style='mso-bidi-font-style:normal'><span id="Backing1" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>/</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=385 valign=top
						style='width:288.75pt;padding:0cm 0cm 0cm 0cm;
  height:16.1pt'>
						<p class=MsoNormal align=center
							style='margin-left:70.8pt;text-align:center'>
							<i style='mso-bidi-font-style:normal'><span lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'></i><span lang=EN-US
								style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:3;height:16.1pt'>
					<td width=275 valign=top
						style='width:206.25pt;padding:0cm 0cm 0cm 0cm;
  height:16.1pt'>
						<p class=MsoNormal
							style='margin-left:0cm;tab-stops:right 206.25pt'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Gas
								flow Rate -Shielding:<span style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</span>
							</span><i style='mso-bidi-font-style:normal'><span id="Gas flow Rate -Shielding" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>15~25
									L/min</span></i><span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=385 valign=top
						style='width:288.75pt;padding:0cm 0cm 0cm 0cm;
  height:16.1pt'>
						<p class=MsoNormal style='margin-left:52.1pt'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>e.g.Weaving
								(maximum width of run):<span id="e.g.Weaving" style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;
							</span>
							</span><span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:4;height:32.15pt'>
					<td width=275 valign=top
						style='width:206.25pt;padding:0cm 0cm 0cm 0cm;
  height:32.15pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:1.45pt;
  margin-left:0cm;tab-stops:center 152.9pt'>
							<span lang=EN-US
								style='font-size:
  12.0pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'><span
								style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</span>-Backing:<span style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</span></span><i style='mso-bidi-font-style:normal'><span id="Backing2" lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>/</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
						<p class=MsoNormal style='margin-left:.25pt'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Tungsten
								Electrode Type/Size: </span><i style='mso-bidi-font-style:normal'><span id="Tungsten Electrode"
								lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>/</span></i><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=385 valign=top
						style='width:288.75pt;padding:0cm 0cm 0cm 0cm;
  height:32.15pt'>
						<p class=MsoNormal align=right
							style='margin-left:0cm;text-align:right'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Oscillation
								(amplitude, frequency, dwell time):<span id="Oscillation"
								style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>
							</span><span lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:5;mso-yfti-lastrow:yes;height:14.7pt'>
					<td width=275 valign=top
						style='width:206.25pt;padding:0cm 0cm 0cm 0cm;
  height:14.7pt'>
						<p class=MsoNormal style='margin-left:0cm'>
							<span lang=EN-US
								style='font-size:
  11.0pt;line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>Details
								of Back Gouging/Backing:</span><i style='mso-bidi-font-style:normal'><span id="Details of Back Gouging/Backing"
								lang=EN-US
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>Split
									groove</span></i><span lang=EN-US
								style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
					<td width=385 valign=top
						style='width:288.75pt;padding:0cm 0cm 0cm 0cm;
  height:14.7pt'>
						<p class=MsoNormal
							style='margin-left:0cm;tab-stops:center 103.55pt 207.55pt'>
							<span lang=EN-US style='font-size:11.0pt;line-height:107%'><span
								style='mso-tab-count:
  1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</span></span><span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Pulse
								welding details:<span style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</span>
							</span><span id="Pulse welding details" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:宋体;mso-bidi-font-family:宋体'>/</span><span
								lang=EN-US style='font-size:11.0pt;line-height:107%'><o:p></o:p></span>
						</p>
					</td>
				</tr>
			</table>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:82.7pt;margin-bottom:
2.05pt;margin-left:150.75pt;text-indent:-151.25pt'>
				<span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:
"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Preheat
					Temperature:<span style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
				</span><i style='mso-bidi-font-style:normal'><span id="Preheat Temperature" lang=EN-US
					style='font-size:10.0pt;
mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
mso-fareast-font-family:"Times New Roman"'>When
						the base metal temperature is below 0℃, the base metal<span
						style='mso-spacerun:yes'>&nbsp; </span>shall be preheated to at
						least 20
				</span></i><span
					lang=EN-US
					style='font-size:10.0pt;mso-bidi-font-size:11.0pt;
line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
"Times New Roman"'>.</span><span
					lang=EN-US style='font-size:11.0pt;line-height:
107%'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:0cm;margin-bottom:.95pt;
margin-left:-.5pt;line-height:112%;tab-stops:center 170.35pt 313.85pt'>
				<![if !vml]>
				<img width=42 height=57 src="resources/js/PWPS.files/image008.gif"
					align=left v:shapes="Group_x0020_4039 Shape_x0020_166">
				<![endif]>
				<span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Interpass
					Temperature:<span style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
				</span><span id="Interpass Temperature" lang=EN-US
					style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:宋体;mso-bidi-font-family:宋体'>≤6</span><i
					style='mso-bidi-font-style:
normal'></i></span><span id="Interpass Temperature" lang=EN-US
					style='font-size:10.5pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:宋体;mso-bidi-font-family:宋体'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Plasma
					welding details:</span><span id="Plasma welding details" lang=EN-US
					style='font-size:11.0pt;line-height:
112%'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:0cm;margin-bottom:.95pt;
margin-left:-.5pt;line-height:112%;tab-stops:center 207.65pt 288.55pt'>
				<span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Post
					Weld Heat Treatment and/or Aging:<span style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;
				</span>
				</span><i style='mso-bidi-font-style:normal'><span id="Post Weld Heat Treatment and/or Aging" lang=EN-US
					style='font-size:10.0pt;
mso-bidi-font-size:11.0pt;line-height:112%;font-family:"Times New Roman",serif;
mso-fareast-font-family:"Times New Roman"'>/<span
						style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></i><span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Torch
					angle:</span><span id="Torch angle" lang=EN-US style='font-size:11.0pt;line-height:112%'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:0cm;margin-bottom:.95pt;
margin-left:-.5pt;line-height:112%;tab-stops:center 152.9pt 301.0pt'>
				<span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Time,
					Temperature, Method:<span style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
				</span><i style='mso-bidi-font-style:normal'><span id="Time, Temperature, Method" lang=EN-US
					style='font-size:10.0pt;
mso-bidi-font-size:11.0pt;line-height:112%;font-family:"Times New Roman",serif;
mso-fareast-font-family:"Times New Roman"'>/<span
						style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span></span></i><span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Stand
					of distance:</span><span id="Stand of distance" lang=EN-US
					style='font-size:11.0pt;line-height:112%'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:0cm;margin-bottom:.95pt;
margin-left:-.5pt;line-height:112%;tab-stops:center 152.9pt'>
				<span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;font-family:
"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Heating
					and Cooling Rates:<span id="Heating and Cooling Rates" style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
				</span><i style='mso-bidi-font-style:normal'><span lang=EN-US
					style='font-size:10.0pt;
mso-bidi-font-size:11.0pt;line-height:112%;font-family:"Times New Roman",serif;
mso-fareast-font-family:"Times New Roman"'>/</span></i><span
					lang=EN-US style='font-size:11.0pt;line-height:112%'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:0cm;margin-bottom:.95pt;
margin-left:-.5pt;line-height:112%;tab-stops:center 161.75pt 311.3pt'>
				<span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Manufacturer:<span
					style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span></span><i style='mso-bidi-font-style:normal'><span id="Manufacturer" lang=EN-US
					style='font-size:10.0pt;
mso-bidi-font-size:11.0pt;line-height:112%;font-family:"Times New Roman",serif;
mso-fareast-font-family:"Times New Roman"'>Jiangnan
						Shipyard (Group) Co.,Ltd<span style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span>
				</span></i><span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Examiner
					or test body</span><span lang=EN-US
					style='font-size:11.0pt;line-height:112%'><o:p></o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:106.85pt;margin-bottom:
.95pt;margin-left:240.1pt;text-indent:-240.6pt;line-height:112%'>
				<span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Name,
					date and signature<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;
				</span>
				</span><i style='mso-bidi-font-style:normal'><span id="Name, date and signature" lang=EN-US
					style='font-size:10.0pt;
mso-bidi-font-size:11.0pt;line-height:112%;font-family:"Times New Roman",serif;
mso-fareast-font-family:"Times New Roman"'>Hao
						Chen<span style='mso-spacerun:yes'>&nbsp; </span>
				</span></i><span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:
11.0pt;line-height:112%;font-family:"Times New Roman",serif;mso-fareast-font-family:
"Times New Roman"'>Name,
					date and signature <o:p></o:p>
				</span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:106.85pt;margin-bottom:
.95pt;margin-left:240.1pt;text-indent:-9.1pt;line-height:112%'>
				<span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:112%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Page
					2<o:p></o:p>
				</span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:106.85pt;margin-bottom:
.95pt;margin-left:240.1pt;text-indent:-9.1pt;line-height:112%'>
				<span lang=EN-US
					style='font-size:11.0pt;line-height:112%;mso-fareast-font-family:
等线;mso-fareast-theme-font:minor-fareast'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:106.85pt;margin-bottom:
.95pt;margin-left:240.1pt;text-indent:-9.1pt;line-height:112%'>
				<span lang=EN-US
					style='font-size:11.0pt;line-height:112%;mso-fareast-font-family:
等线;mso-fareast-theme-font:minor-fareast'><o:p>&nbsp;</o:p></span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:48.0pt;margin-bottom:
1.6pt;margin-left:357.0pt;text-indent:12.0pt;mso-char-indent-count:1.0'>
				<span id="Reference No2" lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:107%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>JS-HY-06-788A-2019Y</span>
			</p>

			<p class=MsoNormal style='margin-bottom:19.4pt'>
				<b style='mso-bidi-font-weight:
normal'><span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;
line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
"Times New Roman"'>Addenda</span></b><span
					style='font-size:12.0pt;mso-bidi-font-size:
11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:宋体'>：</span>
			</p>

			<table class=TableGrid border=0 cellspacing=0 cellpadding=0 width=649
				style='width:486.45pt;margin-left:-2.15pt;border-collapse:collapse;mso-yfti-tbllook:
 1184;mso-padding-alt:4.9pt 18.05pt 0cm 2.15pt'>
				<tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:23.5pt'>
					<td width=449 colspan=3
						style='width:336.4pt;border:solid black 1.0pt;
  border-right:none;padding:4.9pt 18.05pt 0cm 2.15pt;height:23.5pt'>
						<p class=MsoNormal>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:
  11.0pt;line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'><span
								style='mso-spacerun:yes'>&nbsp;&nbsp; </span>Test examination</span>
						</p>
					</td>
					<td width=200 valign=top
						style='width:150.05pt;border:solid black 1.0pt;
  border-left:none;padding:4.9pt 18.05pt 0cm 2.15pt;height:23.5pt'>
						<p class=MsoNormal>
							<span lang=EN-US><o:p>&nbsp;</o:p></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:1;height:29.3pt'>
					<td width=331 colspan=2
						style='width:248.5pt;border:solid black 1.0pt;
  border-top:none;mso-border-top-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:29.3pt'>
						<p class=MsoNormal align=center
							style='margin-left:17.3pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Item</span>
						</p>
					</td>
					<td width=117
						style='width:87.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:29.3pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.5pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Number</span>
						</p>
					</td>
					<td width=200
						style='width:150.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:29.3pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.8pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Specimen<span
								style='mso-spacerun:yes'>&nbsp; </span>mark
							</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:2;height:23.75pt'>
					<td width=331 colspan=2 valign=top
						style='width:248.5pt;border:solid black 1.0pt;
  border-top:none;mso-border-top-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.75pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.55pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Visual<span
								style='mso-spacerun:yes'>&nbsp; </span>testing
							</span>
						</p>
					</td>
					<td width=117
						style='width:87.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.75pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.8pt;text-align:center'>
							<span id="Number1" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Full
								length</span>
						</p>
					</td>
					<td width=200
						style='width:150.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.75pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.6pt;text-align:center'>
							<span id="Specimen mark1" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>788V1~V2</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:3;height:23.8pt'>
					<td width=331 colspan=2 valign=top
						style='width:248.5pt;border:solid black 1.0pt;
  border-top:none;mso-border-top-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.8pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.75pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Radiographic<span
								style='mso-spacerun:yes'>&nbsp; </span>testing
							</span>
						</p>
					</td>
					<td width=117
						style='width:87.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.8pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.8pt;text-align:center'>
							<span id="Number2" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Full
								length</span>
						</p>
					</td>
					<td width=200
						style='width:150.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.8pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.7pt;text-align:center'>
							<span id="Specimen mark2" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>788RT</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:4;height:23.75pt'>
					<td width=331 colspan=2 valign=top
						style='width:248.5pt;border:solid black 1.0pt;
  border-top:none;mso-border-top-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.75pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.5pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Surface
								crack detection(penetrant testing)</span>
						</p>
					</td>
					<td width=117
						style='width:87.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.75pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.8pt;text-align:center'>
							<span id="Number3" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Full
								length</span>
						</p>
					</td>
					<td width=200
						style='width:150.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.75pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.45pt;text-align:center'>
							<span id="Specimen mark3" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>788PT</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:5;height:23.75pt'>
					<td width=331 colspan=2 valign=top
						style='width:248.5pt;border:solid black 1.0pt;
  border-top:none;mso-border-top-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.75pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.2pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Transverse<span
								style='mso-spacerun:yes'>&nbsp; </span>tensile<span
								style='mso-spacerun:yes'>&nbsp; </span>test
							</span>
						</p>
					</td>
					<td width=117
						style='width:87.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.75pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.6pt;text-align:center'>
							<span id="Number4" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>2</span>
						</p>
					</td>
					<td width=200
						style='width:150.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.75pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.6pt;text-align:center'>
							<span id="Specimen mark4" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>788J1~J2</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:6;height:23.8pt'>
					<td width=161 valign=top
						style='width:120.75pt;border:solid black 1.0pt;
  border-top:none;mso-border-top-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.8pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.5pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Face<span
								style='mso-spacerun:yes'>&nbsp; </span>bend<span
								style='mso-spacerun:yes'>&nbsp; </span>test
							</span>
						</p>
					</td>
					<td width=170 rowspan=3
						style='width:127.75pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.9pt 18.05pt 0cm 2.15pt;height:23.8pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.9pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>D=90mm
							</span><span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:宋体;mso-bidi-font-family:宋体'>α</span><span
								lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>=180°</span>
						</p>
					</td>
					<td width=117
						style='width:87.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.8pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.6pt;text-align:center'>
							<span id="Number5" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>2</span>
						</p>
					</td>
					<td width=200
						style='width:150.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.8pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.6pt;text-align:center'>
							<span id="Specimen mark5" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>788F1~F2</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:7;height:23.75pt'>
					<td width=161 valign=top
						style='width:120.75pt;border:solid black 1.0pt;
  border-top:none;mso-border-top-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.75pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.2pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Root<span
								style='mso-spacerun:yes'>&nbsp; </span>bend<span
								style='mso-spacerun:yes'>&nbsp; </span>test
							</span>
						</p>
					</td>
					<td width=117
						style='width:87.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.75pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.6pt;text-align:center'>
							<span id="Number6" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>2</span>
						</p>
					</td>
					<td width=200
						style='width:150.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.75pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.6pt;text-align:center'>
							<span id="Specimen mark6" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>788R1~R2</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:8;height:23.75pt'>
					<td width=161 valign=top
						style='width:120.75pt;border:solid black 1.0pt;
  border-top:none;mso-border-top-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.75pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.45pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Side<span
								style='mso-spacerun:yes'>&nbsp; </span>bend<span
								style='mso-spacerun:yes'>&nbsp; </span>test
							</span>
						</p>
					</td>
					<td width=117
						style='width:87.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.75pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.8pt;text-align:center'>
							<span id="Number7" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>/</span>
						</p>
					</td>
					<td width=200
						style='width:150.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.75pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.55pt;text-align:center'>
							<span id="Specimen mark7" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>/</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:9;height:23.8pt'>
					<td width=331 colspan=2 valign=top
						style='width:248.5pt;border:solid black 1.0pt;
  border-top:none;mso-border-top-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.8pt'>
						<p class=MsoNormal align=center
							style='margin-left:17.05pt;text-align:center'>
							<span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Macrosection</span>
						</p>
					</td>
					<td width=117
						style='width:87.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.8pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.6pt;text-align:center'>
							<span id="Number8" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>1</span>
						</p>
					</td>
					<td width=200
						style='width:150.05pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:23.8pt'>
						<p class=MsoNormal align=center
							style='margin-left:16.6pt;text-align:center'>
							<span id="Specimen mark8" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>788M1</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:10;mso-yfti-lastrow:yes;height:147.15pt'>
					<td width=449 colspan=3 valign=top
						style='width:336.4pt;border-top:none;
  border-left:solid black 1.0pt;border-bottom:solid black 1.0pt;border-right:
  none;mso-border-top-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:147.15pt'>
						<p class=MsoNormal style='margin-bottom:25.1pt'>
							<b style='mso-bidi-font-weight:
  normal'><span lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'><span
									style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>Test<span
									style='mso-spacerun:yes'>&nbsp; </span>standard</span></b>
						</p>
						<p class=MsoNormal align=right
							style='margin-right:9.8pt;text-align:right'>
							<span id="Test standard" lang=EN-US
								style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>CCS</span>
						</p>
					</td>
					<td width=200 valign=top
						style='width:150.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;padding:4.9pt 18.05pt 0cm 2.15pt;
  height:147.15pt'>
						<p class=MsoNormal>
							<span lang=EN-US><o:p>&nbsp;</o:p></span>
						</p>
					</td>
				</tr>
			</table>

			<p class=MsoNormal style='margin-left:210.75pt;text-indent:20.25pt'>
				<span lang=EN-US
					style='font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:107%;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>Page
					3</span><span lang=EN-US
					style='mso-fareast-font-family:等线;mso-fareast-theme-font:
minor-fareast'><o:p></o:p></span>
			</p>

		</div>

	</div>
</body>

</html>
