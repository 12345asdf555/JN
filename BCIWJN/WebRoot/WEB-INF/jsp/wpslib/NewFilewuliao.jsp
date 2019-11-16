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
<link rel=File-List href="NewFilewuliao.files/filelist.xml">
<link rel=Edit-Time-Data href="NewFilewuliao.files/editdata.mso">

<link rel=themeData href="NewFilewuliao.files/themedata.thmx">
<link rel=colorSchemeMapping
	href="NewFilewuliao.files/colorschememapping.xml">

<script type="text/javascript" src="resources/js/FileSaver.js"></script>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="resources/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="resources/js/jquery.wordexport.js"></script>

<script>
	$(document).ready(function() {
		document.getElementById("bianhao1").innerText = "AA1";
		document.getElementById("cailiao1").innerText = "XX40钢";
		document.getElementById("chicun1").innerText = "4×150×701";
		document.getElementById("shuliang1").innerText = "11";
		document.getElementById("bianhao2").innerText = "AA2";
		document.getElementById("cailiao2").innerText = "XX41钢";
		document.getElementById("chicun2").innerText = "4×150×702";
		document.getElementById("shuliang2").innerText = "12";
		document.getElementById("bianhao3").innerText = "AA3";
		document.getElementById("cailiao3").innerText = "XX41钢";
		document.getElementById("chicun3").innerText = "4×150×702";
		document.getElementById("shuliang3").innerText = "12";
		document.getElementById("bianhao4").innerText = "AA4";
		document.getElementById("cailiao4").innerText = "XX41钢";
		document.getElementById("chicun4").innerText = "4×150×702";
		document.getElementById("shuliang4").innerText = "12";
		document.getElementById("bianhao5").innerText = "AA5";
		document.getElementById("cailiao5").innerText = "XX41钢";
		document.getElementById("chicun5").innerText = "4×150×702";
		document.getElementById("shuliang5").innerText = "12";
		document.getElementById("bianhao6").innerText = "AA6";
		document.getElementById("cailiao6").innerText = "XX41钢";
		document.getElementById("chicun6").innerText = "4×150×702";
		document.getElementById("shuliang6").innerText = "12";
		document.getElementById("bianhao7").innerText = "AA7";
		document.getElementById("cailiao7").innerText = "XX41钢";
		document.getElementById("chicun7").innerText = "4×150×702";
		document.getElementById("shuliang7").innerText = "12";
		document.getElementById("bianhao8").innerText = "AA8";
		document.getElementById("cailiao8").innerText = "XX41钢";
		document.getElementById("chicun8").innerText = "4×150×702";
		document.getElementById("shuliang8").innerText = "12";
		document.getElementById("bianhao9").innerText = "AA9";
		document.getElementById("cailiao9").innerText = "XX41钢";
		document.getElementById("chicun9").innerText = "4×150×702";
		document.getElementById("shuliang9").innerText = "12";
		document.getElementById("bianhao10").innerText = "AA10";
		document.getElementById("cailiao10").innerText = "XX41钢";
		document.getElementById("chicun10").innerText = "4×150×702";
		document.getElementById("shuliang10").innerText = "12";
		document.getElementById("bianhao11").innerText = "AA11";
		document.getElementById("cailiao11").innerText = "XX41钢";
		document.getElementById("chicun11").innerText = "4×150×702";
		document.getElementById("shuliang11").innerText = "12";
		document.getElementById("bianhao12").innerText = "AA12";
		document.getElementById("cailiao12").innerText = "XX41钢";
		document.getElementById("chicun12").innerText = "4×150×702";
		document.getElementById("shuliang12").innerText = "12";
		document.getElementById("bianhao13").innerText = "AA13";
		document.getElementById("cailiao13").innerText = "XX41钢";
		document.getElementById("chicun13").innerText = "4×150×702";
		document.getElementById("shuliang13").innerText = "12";
		document.getElementById("bianhao14").innerText = "AA14";
		document.getElementById("cailiao14").innerText = "XX41钢";
		document.getElementById("chicun14").innerText = "4×150×702";
		document.getElementById("shuliang14").innerText = "12";
		document.getElementById("bianhao15").innerText = "AA15";
		document.getElementById("cailiao15").innerText = "XX41钢";
		document.getElementById("chicun15").innerText = "4×150×702";
		document.getElementById("shuliang15").innerText = "12";
		document.getElementById("bianhao16").innerText = "AA16";
		document.getElementById("cailiao16").innerText = "XX41钢";
		document.getElementById("chicun16").innerText = "4×150×702";
		document.getElementById("shuliang16").innerText = "12";
		document.getElementById("bianhao17").innerText = "AA17";
		document.getElementById("cailiao17").innerText = "XX41钢";
		document.getElementById("chicun17").innerText = "4×150×702";
		document.getElementById("shuliang17").innerText = "12";
		document.getElementById("bianzhiname").innerText = "黄天滢";
		document.getElementById("bianzhitime").innerText = "19.1.9";
		document.getElementById("qianshouname1").innerText = "xxx";
		document.getElementById("qianshoutime1").innerText = "19.1.9";
		document.getElementById("jiaoduiname").innerText = "xxx";
		document.getElementById("jiaoduitime").innerText = "19.1.9";
		document.getElementById("qianshouname2").innerText = "xxx";
		document.getElementById("qianshoutime2").innerText = "19.1.9";
		document.getElementById("phone").innerText = "66995587";
	});
</script>

<style>
</style>

</head>

<body lang=ZH-CN style='tab-interval:21.0pt'>
	<input name="wpsid" id="wpsid" type="hidden" value="${wpsid}" />
	<button onclick="outputTextwuliao()">导出</button>
	<a href="wps/goPwpslib;" class="easyui-linkbutton" iconCls="icon-newadd">返回</a>

	<div id="export_wordwuliao">

		<div class=WordSection1>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:0cm;margin-bottom:.05pt;
margin-left:159.2pt;text-indent:-.5pt'>
				<span class=GramE><span
					style='font-family:宋体;mso-bidi-font-family:宋体'>焊接试板下料</span></span><span
					style='font-family:宋体;mso-bidi-font-family:宋体'>清单<span
					class=GramE>及坡口加工</span>简图
				</span>
			</p>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:0cm;margin-bottom:.05pt;
margin-left:-4.6pt;text-indent:-.5pt'>
				<span lang=EN-US style='font-family:宋体;
mso-bidi-font-family:宋体'><span
					style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span></span><span style='font-family:宋体;mso-bidi-font-family:宋体'>工程总号<span
					lang=EN-US> 18-LQ1-3000-0011<span style='mso-spacerun:yes'>&nbsp;
					</span></span>产品名称<span lang=EN-US> X40</span>模拟分段
				</span>
			</p>

			<p class=MsoNormal align=right
				style='margin-top:0cm;margin-right:27.3pt;
margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:right'>
				
			</p>

			<table class=TableGrid border=0 cellspacing=0 cellpadding=0 width=665
				style='width:498.45pt;margin-left:-6.25pt;border-collapse:collapse;mso-yfti-tbllook:
 1184;mso-padding-alt:2.7pt 5.75pt 0cm 6.9pt'>
				<tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:26.15pt'>
					<td width=68 valign=top
						style='width:50.9pt;border:solid black 1.0pt;
  padding:2.7pt 5.75pt 0cm 6.9pt;height:26.15pt'>
						<p class=MsoNormal align=center
							style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:center'>
							<span class=GramE><span
								style='font-size:9.0pt;mso-bidi-font-size:
  11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:宋体'>评定试板编号</span></span>
						</p>
					</td>
					<td width=133
						style='width:99.85pt;border:solid black 1.0pt;border-left:none;
  mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:26.15pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:6.75pt;margin-bottom:.0001pt'>
							<span
								style='font-size:9.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
  宋体'>材料牌号（厂家）</span>
						</p>
					</td>
					<td width=128 valign=top
						style='width:95.8pt;border:solid black 1.0pt;
  border-left:none;mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:26.15pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.4pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span
								style='font-size:9.0pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:
  宋体;mso-bidi-font-family:宋体'>规格尺寸</span>
						</p>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.5pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span lang=EN-US
								style='font-size:9.0pt;mso-bidi-font-size:11.0pt;line-height:107%;
  font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>(mm)</span>
						</p>
					</td>
					<td width=68 valign=top
						style='width:50.9pt;border:solid black 1.0pt;
  border-left:none;mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:26.15pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:9.4pt;margin-bottom:.0001pt'>
							<span
								style='font-size:9.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
  宋体'>数量</span>
						</p>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:4.85pt;margin-bottom:.0001pt'>
							<span
								style='font-size:9.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
  宋体'>（件）</span>
						</p>
					</td>
					<td width=268
						style='width:200.95pt;border:solid black 1.0pt;border-left:
  none;mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:26.15pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.9pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span
								style='font-size:9.0pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:
  宋体;mso-bidi-font-family:宋体'>坡口型式加工简图</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:1;height:99.9pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.9pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.9pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="bianhao1" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'></span>
						</p>
					</td>
					<td width=133
						style='width:99.85pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.9pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.15pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="cailiao1" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'></span>
						</p>
					</td>
					<td width=128
						style='width:95.8pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.9pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.1pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="chicun1" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'></span>
						</p>
					</td>
					<td width=68
						style='width:50.9pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.9pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.15pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="shuliang1" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'></span>
						</p>
					</td>
					<td width=268 valign=top
						style='width:200.95pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:2.7pt 5.75pt 0cm 6.9pt;height:99.9pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:.95pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=237 height=73
								src="resources/js/NewFilewuliao.files/image001.gif"
								v:shapes="Group_x0020_6881 Shape_x0020_64 Shape_x0020_65 Shape_x0020_66 Shape_x0020_67 Shape_x0020_68 Shape_x0020_69 Shape_x0020_70 Shape_x0020_71 Shape_x0020_72 Shape_x0020_73 Shape_x0020_74 Rectangle_x0020_75 Shape_x0020_76 Shape_x0020_77 Shape_x0020_78 Shape_x0020_79 Shape_x0020_80 Shape_x0020_81 Shape_x0020_82 Shape_x0020_83 Rectangle_x0020_84 Shape_x0020_85 Shape_x0020_86 Shape_x0020_87">
								<![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:2;height:99.85pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.9pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="bianhao2" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>A2</span>
						</p>
					</td>
					<td width=133
						style='width:99.85pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.15pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="cailiao2" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'></span>
						</p>
					</td>
					<td width=128
						style='width:95.8pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.1pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="chicun2" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>4×150×700</span>
						</p>
					</td>
					<td width=68
						style='width:50.9pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.15pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="shuliang2" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>10</span>
						</p>
					</td>
					<td width=268 valign=top
						style='width:200.95pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:2.7pt 5.75pt 0cm 6.9pt;height:99.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:6.2pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=235 height=86
								src="resources/js/NewFilewuliao.files/image002.gif"
								v:shapes="Group_x0020_7014 Shape_x0020_88 Shape_x0020_89 Shape_x0020_90 Shape_x0020_91 Shape_x0020_92 Shape_x0020_93 Shape_x0020_94 Shape_x0020_95 Shape_x0020_96 Shape_x0020_97 Shape_x0020_98 Rectangle_x0020_99 Shape_x0020_100 Shape_x0020_101 Shape_x0020_102 Shape_x0020_103 Shape_x0020_104 Shape_x0020_105 Shape_x0020_106 Shape_x0020_107 Rectangle_x0020_108 Shape_x0020_109 Shape_x0020_110 Shape_x0020_111 Shape_x0020_112 Shape_x0020_113 Shape_x0020_114 Shape_x0020_115 Shape_x0020_116 Shape_x0020_117 Rectangle_x0020_6046 Rectangle_x0020_6047 Shape_x0020_119 Shape_x0020_120 Shape_x0020_121 Shape_x0020_122 Shape_x0020_123">
								<![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:3;height:99.85pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.9pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="bianhao3" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>A3</span>
						</p>
					</td>
					<td width=133
						style='width:99.85pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.15pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="cailiao3" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>X40</span>
						</p>
					</td>
					<td width=128
						style='width:95.8pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.1pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="chicun3" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>8×150×700</span>
						</p>
					</td>
					<td width=68
						style='width:50.9pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.15pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="shuliang3" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>16</span>
						</p>
					</td>
					<td width=268 valign=top
						style='width:200.95pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:2.7pt 5.75pt 0cm 6.9pt;height:99.85pt'>
						<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=251 height=99
								src="resources/js/NewFilewuliao.files/image003.gif"
								v:shapes="Group_x0020_7121 Shape_x0020_124 Shape_x0020_125 Shape_x0020_126 Shape_x0020_127 Shape_x0020_128 Shape_x0020_129 Shape_x0020_130 Shape_x0020_131 Shape_x0020_132 Shape_x0020_133 Shape_x0020_134 Shape_x0020_135 Rectangle_x0020_6048 Rectangle_x0020_6049 Shape_x0020_137 Shape_x0020_138 Shape_x0020_139 Shape_x0020_140 Shape_x0020_141 Shape_x0020_142 Shape_x0020_143 Shape_x0020_144 Shape_x0020_145 Shape_x0020_146 Shape_x0020_147 Shape_x0020_148 Rectangle_x0020_149 Shape_x0020_150 Shape_x0020_151 Shape_x0020_152 Shape_x0020_153 Shape_x0020_154 Shape_x0020_155 Shape_x0020_156 Shape_x0020_157 Rectangle_x0020_158 Shape_x0020_159 Shape_x0020_160 Shape_x0020_161 Shape_x0020_162 Shape_x0020_163 Shape_x0020_164 Shape_x0020_165 Shape_x0020_166 Shape_x0020_167 Shape_x0020_168 Rectangle_x0020_169 Shape_x0020_170 Shape_x0020_171 Shape_x0020_172">
								<![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:4;height:99.85pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.9pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="bianhao4" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>A4</span>
						</p>
					</td>
					<td width=133
						style='width:99.85pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.15pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="cailiao4" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>X40</span>
						</p>
					</td>
					<td width=128
						style='width:95.8pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.1pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="chicun4" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>8×150×700</span>
						</p>
					</td>
					<td width=68
						style='width:50.9pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.9pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="shuliang4" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>2</span>
						</p>
					</td>
					<td width=268 valign=top
						style='width:200.95pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:2.7pt 5.75pt 0cm 6.9pt;height:99.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:.95pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=251 height=102
								src="resources/js/NewFilewuliao.files/image004.gif"
								v:shapes="Group_x0020_7269 Shape_x0020_197 Shape_x0020_198 Shape_x0020_199 Shape_x0020_200 Shape_x0020_201 Shape_x0020_202 Shape_x0020_203 Shape_x0020_204 Shape_x0020_205 Shape_x0020_206 Shape_x0020_207 Shape_x0020_208 Rectangle_x0020_6050 Rectangle_x0020_6051 Shape_x0020_210 Shape_x0020_211 Shape_x0020_212 Shape_x0020_213 Shape_x0020_214 Shape_x0020_215 Shape_x0020_216 Shape_x0020_217 Shape_x0020_218 Shape_x0020_219 Shape_x0020_220 Shape_x0020_221 Rectangle_x0020_222 Shape_x0020_223 Shape_x0020_224 Shape_x0020_225 Shape_x0020_226 Shape_x0020_227 Shape_x0020_228 Shape_x0020_229 Shape_x0020_230 Rectangle_x0020_231 Shape_x0020_232 Shape_x0020_233 Shape_x0020_234 Shape_x0020_235 Shape_x0020_236 Shape_x0020_237 Shape_x0020_238 Shape_x0020_239 Shape_x0020_240 Shape_x0020_241 Rectangle_x0020_242 Shape_x0020_243 Shape_x0020_244 Shape_x0020_245">
								<![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:5;height:99.85pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.9pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="bianhao5" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>A5</span>
						</p>
					</td>
					<td width=133
						style='width:99.85pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.15pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="cailiao5" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>X40</span>
						</p>
					</td>
					<td width=128
						style='width:95.8pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.1pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="chicun5" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>8×150×700</span>
						</p>
					</td>
					<td width=68
						style='width:50.9pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:99.85pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.9pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="shuliang5" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>2</span>
						</p>
					</td>
					<td width=268 valign=top
						style='width:200.95pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:2.7pt 5.75pt 0cm 6.9pt;height:99.85pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.1pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=250 height=97
								src="resources/js/NewFilewuliao.files/image005.gif"
								v:shapes="Group_x0020_7424 Shape_x0020_246 Shape_x0020_247 Shape_x0020_248 Shape_x0020_249 Shape_x0020_250 Shape_x0020_251 Shape_x0020_252 Shape_x0020_253 Shape_x0020_254 Shape_x0020_255 Rectangle_x0020_6052 Rectangle_x0020_6053 Shape_x0020_257 Shape_x0020_258 Shape_x0020_259 Shape_x0020_260 Shape_x0020_261 Shape_x0020_262 Shape_x0020_263 Shape_x0020_264 Shape_x0020_265 Shape_x0020_266 Shape_x0020_267 Shape_x0020_268 Rectangle_x0020_269 Shape_x0020_270 Shape_x0020_271 Shape_x0020_272 Shape_x0020_273 Shape_x0020_274 Shape_x0020_275 Shape_x0020_276 Shape_x0020_277 Rectangle_x0020_278 Shape_x0020_279 Shape_x0020_280 Shape_x0020_281 Shape_x0020_282 Shape_x0020_283 Shape_x0020_284 Shape_x0020_285 Shape_x0020_286 Shape_x0020_287 Shape_x0020_288 Rectangle_x0020_289 Shape_x0020_290 Shape_x0020_291 Shape_x0020_292">
								<![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:6;mso-yfti-lastrow:yes;height:108.75pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.9pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="bianhao6" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>A6</span>
						</p>
					</td>
					<td width=133
						style='width:99.85pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.15pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="cailiao6" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>X40</span>
						</p>
					</td>
					<td width=128
						style='width:95.8pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:1.1pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="chicun6" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>8×150×500</span>
						</p>
					</td>
					<td width=68
						style='width:50.9pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:2.7pt 5.75pt 0cm 6.9pt;
  height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:.9pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:center'>
							<span id="shuliang6" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>8</span>
						</p>
					</td>
					<td width=268 valign=top
						style='width:200.95pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:2.7pt 5.75pt 0cm 6.9pt;height:108.75pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:17.7pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=223 height=85
								src="resources/js/NewFilewuliao.files/image006.gif"
								v:shapes="Group_x0020_7526 Shape_x0020_173 Shape_x0020_174 Shape_x0020_175 Shape_x0020_176 Shape_x0020_177 Shape_x0020_178 Shape_x0020_179 Shape_x0020_180 Shape_x0020_181 Shape_x0020_182 Rectangle_x0020_183 Shape_x0020_184 Shape_x0020_185 Shape_x0020_186 Shape_x0020_187 Shape_x0020_188 Shape_x0020_189 Shape_x0020_190 Shape_x0020_191 Rectangle_x0020_192 Shape_x0020_193 Shape_x0020_194 Shape_x0020_195 Shape_x0020_196">
								<![endif]></span>
						</p>
					</td>
				</tr>
			</table>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:441.7pt;margin-bottom:
0cm;margin-left:-80.45pt;margin-bottom:.0001pt'>
				<span lang=EN-US><o:p>&nbsp;</o:p></span>
			</p>

			<table class=TableGrid border=0 cellspacing=0 cellpadding=0 width=665
				style='width:498.45pt;margin-left:-6.25pt;border-collapse:collapse;mso-yfti-tbllook:
 1184;mso-padding-alt:4.95pt 0cm 0cm 0cm'>
				<tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:108.75pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;
  height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:.25pt;margin-bottom:.0001pt;text-align:center'>
							<span id="bianhao7" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>A7</span>
						</p>
					</td>
					<td width=133 colspan=2
						style='width:99.85pt;border:solid black 1.0pt;
  border-left:none;mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;
  height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:center'>
							<span id="cailiao7" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:
  11.0pt;line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>X40</span>
						</p>
					</td>
					<td width=128 colspan=2
						style='width:95.8pt;border:solid black 1.0pt;
  border-left:none;mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;
  height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:.3pt;margin-bottom:.0001pt;text-align:center'>
							<span id="chicun7" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>12×150×500</span>
						</p>
					</td>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-left:none;
  mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:center'>
							<span id="shuliang7" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:
  11.0pt;line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>16</span>
						</p>
					</td>
					<td width=268 colspan=2 valign=top
						style='width:200.95pt;border:solid black 1.0pt;
  border-left:none;mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;
  height:108.75pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:23.2pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=228 height=87
								src="resources/js/NewFilewuliao.files/image007.gif"
								v:shapes="Group_x0020_7646 Shape_x0020_575 Shape_x0020_576 Shape_x0020_577 Shape_x0020_578 Shape_x0020_579 Shape_x0020_580 Shape_x0020_581 Shape_x0020_582 Shape_x0020_583 Shape_x0020_584 Rectangle_x0020_585 Shape_x0020_586 Shape_x0020_587 Shape_x0020_588 Shape_x0020_589 Shape_x0020_590 Shape_x0020_591 Shape_x0020_592 Shape_x0020_593 Rectangle_x0020_594 Shape_x0020_595 Shape_x0020_596 Shape_x0020_597 Shape_x0020_598">
								<![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:1;height:108.75pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:.25pt;margin-bottom:.0001pt;text-align:center'>
							<span id="bianhao8" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>A8</span>
						</p>
					</td>
					<td width=133 colspan=2
						style='width:99.85pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:center'>
							<span id="cailiao8" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:
  11.0pt;line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>X40</span>
						</p>
					</td>
					<td width=128 colspan=2
						style='width:95.8pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;
  height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:.3pt;margin-bottom:.0001pt;text-align:center'>
							<span id="chicun8" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>12×150×900</span>
						</p>
					</td>
					<td width=68
						style='width:50.9pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:center'>
							<span id="shuliang8" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:
  11.0pt;line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>16</span>
						</p>
					</td>
					<td width=268 colspan=2 valign=top
						style='width:200.95pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:8.05pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=246 height=97
								src="resources/js/NewFilewuliao.files/image008.gif"
								v:shapes="Group_x0020_7684 Shape_x0020_353 Shape_x0020_354 Shape_x0020_355 Shape_x0020_356 Shape_x0020_357 Shape_x0020_358 Shape_x0020_359 Shape_x0020_360 Shape_x0020_361 Shape_x0020_362 Shape_x0020_363 Shape_x0020_364 Rectangle_x0020_6054 Rectangle_x0020_6055 Shape_x0020_366 Shape_x0020_367 Shape_x0020_368 Shape_x0020_369 Shape_x0020_370 Shape_x0020_371 Shape_x0020_372 Shape_x0020_373 Shape_x0020_374 Shape_x0020_375 Shape_x0020_376 Shape_x0020_377 Rectangle_x0020_378 Shape_x0020_379 Shape_x0020_380 Shape_x0020_381 Shape_x0020_382 Shape_x0020_383 Shape_x0020_384 Shape_x0020_385 Shape_x0020_386 Rectangle_x0020_387 Shape_x0020_388 Shape_x0020_389 Shape_x0020_390 Shape_x0020_391 Shape_x0020_392 Shape_x0020_393 Shape_x0020_394 Shape_x0020_395 Shape_x0020_396 Shape_x0020_397 Rectangle_x0020_398 Shape_x0020_399 Shape_x0020_400 Shape_x0020_401">
								<![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:2;height:108.75pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:.25pt;margin-bottom:.0001pt;text-align:center'>
							<span id="bianhao9" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>A9</span>
						</p>
					</td>
					<td width=133 colspan=2
						style='width:99.85pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:center'>
							<span id="cailiao9" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:
  11.0pt;line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>X40</span>
						</p>
					</td>
					<td width=128 colspan=2
						style='width:95.8pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;
  height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:.3pt;margin-bottom:.0001pt;text-align:center'>
							<span id="chicun9" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>12×150×900</span>
						</p>
					</td>
					<td width=68
						style='width:50.9pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:.25pt;margin-bottom:.0001pt;text-align:center'>
							<span id="shuliang9" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>2</span>
						</p>
					</td>
					<td width=268 colspan=2 valign=top
						style='width:200.95pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:9.9pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=246 height=100
								src="resources/js/NewFilewuliao.files/image009.gif"
								v:shapes="Group_x0020_7722 Shape_x0020_599 Shape_x0020_600 Shape_x0020_601 Shape_x0020_602 Shape_x0020_603 Shape_x0020_604 Shape_x0020_605 Shape_x0020_606 Shape_x0020_607 Shape_x0020_608 Shape_x0020_609 Shape_x0020_610 Rectangle_x0020_6056 Rectangle_x0020_6057 Shape_x0020_612 Shape_x0020_613 Shape_x0020_614 Shape_x0020_615 Shape_x0020_616 Shape_x0020_617 Shape_x0020_618 Shape_x0020_619 Shape_x0020_620 Shape_x0020_621 Shape_x0020_622 Shape_x0020_623 Rectangle_x0020_624 Shape_x0020_625 Shape_x0020_626 Shape_x0020_627 Shape_x0020_628 Shape_x0020_629 Shape_x0020_630 Shape_x0020_631 Shape_x0020_632 Rectangle_x0020_633 Shape_x0020_634 Shape_x0020_635 Shape_x0020_636 Shape_x0020_637 Shape_x0020_638 Shape_x0020_639 Shape_x0020_640 Shape_x0020_641 Shape_x0020_642 Shape_x0020_643 Rectangle_x0020_644 Shape_x0020_645 Shape_x0020_646 Shape_x0020_647">
								<![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:3;height:108.75pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:center'>
							<span id="bianhao10" lang=EN-US
								style='font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>A10</span>
						</p>
					</td>
					<td width=133 colspan=2
						style='width:99.85pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:center'>
							<span id="cailiao10" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:
  11.0pt;line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>X40</span>
						</p>
					</td>
					<td width=128 colspan=2
						style='width:95.8pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;
  height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:.3pt;margin-bottom:.0001pt;text-align:center'>
							<span id="chicun10" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>12×150×900</span>
						</p>
					</td>
					<td width=68
						style='width:50.9pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:.25pt;margin-bottom:.0001pt;text-align:center'>
							<span id="shuliang10" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>2</span>
						</p>
					</td>
					<td width=268 colspan=2 valign=top
						style='width:200.95pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:8.2pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=248 height=96
								src="resources/js/NewFilewuliao.files/image010.gif"
								v:shapes="Group_x0020_7761 Shape_x0020_648 Shape_x0020_649 Shape_x0020_650 Shape_x0020_651 Shape_x0020_652 Shape_x0020_653 Shape_x0020_654 Shape_x0020_655 Shape_x0020_656 Shape_x0020_657 Rectangle_x0020_6059 Rectangle_x0020_6058 Shape_x0020_659 Shape_x0020_660 Shape_x0020_661 Shape_x0020_662 Shape_x0020_663 Shape_x0020_664 Shape_x0020_665 Shape_x0020_666 Shape_x0020_667 Shape_x0020_668 Shape_x0020_669 Shape_x0020_670 Rectangle_x0020_671 Shape_x0020_672 Shape_x0020_673 Shape_x0020_674 Shape_x0020_675 Shape_x0020_676 Shape_x0020_677 Shape_x0020_678 Shape_x0020_679 Rectangle_x0020_680 Shape_x0020_681 Shape_x0020_682 Shape_x0020_683 Shape_x0020_684 Shape_x0020_685 Shape_x0020_686 Shape_x0020_687 Shape_x0020_688 Shape_x0020_689 Shape_x0020_690 Rectangle_x0020_691 Shape_x0020_692 Shape_x0020_693 Shape_x0020_694">
								<![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:4;height:151.95pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:151.95pt'>
						<p class=MsoNormal align=center
							style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:center'>
							<span id="bianhao11" lang=EN-US
								style='font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>A11</span>
						</p>
					</td>
					<td width=133 colspan=2
						style='width:99.85pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:151.95pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:.25pt;margin-bottom:.0001pt;text-align:center'>
							<span id="cailiao11" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>10#X40</span>
						</p>
					</td>
					<td width=128 colspan=2
						style='width:95.8pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;
  height:151.95pt'>
						<p class=MsoNormal align=center
							style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:center'>
							<span id="chicun11" lang=EN-US
								style='font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>150</span>
						</p>
					</td>
					<td width=68
						style='width:50.9pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:151.95pt'>
						<p class=MsoNormal align=center
							style='margin-bottom:1.3pt;text-align:center'>
							<span id="shuliang11" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>96</span>
						</p>
					</td>
					<td width=142 valign=top
						style='width:106.4pt;border:none;border-bottom:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:151.95pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.95pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=130 height=155
								src="resources/js/NewFilewuliao.files/image011.gif"
								v:shapes="Group_x0020_7833 Shape_x0020_406 Shape_x0020_407 Shape_x0020_408 Shape_x0020_409 Shape_x0020_410 Shape_x0020_411 Shape_x0020_412 Shape_x0020_415 Shape_x0020_431 Shape_x0020_432 Shape_x0020_433 Shape_x0020_434 Shape_x0020_435 Shape_x0020_436 Shape_x0020_437 Shape_x0020_438 Shape_x0020_439 Shape_x0020_440 Shape_x0020_441 Shape_x0020_442 Shape_x0020_443 Shape_x0020_444 Shape_x0020_445 Shape_x0020_446 Rectangle_x0020_449 Rectangle_x0020_450 Rectangle_x0020_6079 Shape_x0020_453 Shape_x0020_454 Shape_x0020_455 Shape_x0020_456 Shape_x0020_459 Shape_x0020_460 Shape_x0020_461 Shape_x0020_462 Shape_x0020_463 Shape_x0020_464 Shape_x0020_465 Shape_x0020_466 Shape_x0020_467 Shape_x0020_468 Shape_x0020_469 Shape_x0020_470 Shape_x0020_471 Shape_x0020_472 Shape_x0020_473 Rectangle_x0020_6065 Rectangle_x0020_6066 Shape_x0020_475 Shape_x0020_476 Shape_x0020_477 Shape_x0020_478 Shape_x0020_479 Shape_x0020_480 Shape_x0020_481 Shape_x0020_483 Shape_x0020_484 Shape_x0020_485 Shape_x0020_486 Rectangle_x0020_6081 Shape_x0020_488 Shape_x0020_489 Shape_x0020_490 Shape_x0020_491 Shape_x0020_492 Shape_x0020_493 Shape_x0020_494 Shape_x0020_495 Shape_x0020_496 Shape_x0020_497 Rectangle_x0020_498 Shape_x0020_499 Shape_x0020_500 Shape_x0020_501 Shape_x0020_502 Shape_x0020_503 Shape_x0020_504 Shape_x0020_505 Shape_x0020_506 Rectangle_x0020_6067 Rectangle_x0020_6068 Shape_x0020_508 Shape_x0020_509 Shape_x0020_510 Shape_x0020_511 Shape_x0020_512 Rectangle_x0020_571">
								<![endif]></span>
						</p>
					</td>
					<td width=126 valign=top
						style='width:94.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:151.95pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:-33.55pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=172 height=185
								src="resources/js/NewFilewuliao.files/image012.gif"
								v:shapes="Group_x0020_7857 Shape_x0020_402 Shape_x0020_403 Shape_x0020_404 Shape_x0020_405 Shape_x0020_413 Shape_x0020_414 Shape_x0020_416 Shape_x0020_417 Shape_x0020_418 Shape_x0020_419 Shape_x0020_420 Shape_x0020_421 Shape_x0020_422 Shape_x0020_423 Shape_x0020_424 Shape_x0020_425 Shape_x0020_426 Shape_x0020_427 Shape_x0020_428 Shape_x0020_429 Shape_x0020_430 Rectangle_x0020_447 Rectangle_x0020_448 Rectangle_x0020_6080 Shape_x0020_513 Shape_x0020_514 Shape_x0020_515 Shape_x0020_516 Shape_x0020_517 Shape_x0020_518 Shape_x0020_519 Shape_x0020_520 Shape_x0020_521 Shape_x0020_522 Shape_x0020_523 Shape_x0020_524 Shape_x0020_525 Shape_x0020_526 Shape_x0020_527 Shape_x0020_528 Shape_x0020_529 Rectangle_x0020_6063 Rectangle_x0020_6064 Shape_x0020_531 Shape_x0020_532 Shape_x0020_533 Shape_x0020_534 Shape_x0020_535 Shape_x0020_536 Shape_x0020_537 Shape_x0020_539 Shape_x0020_540 Shape_x0020_541 Shape_x0020_542 Rectangle_x0020_6082 Shape_x0020_544 Shape_x0020_545 Shape_x0020_546 Shape_x0020_547 Shape_x0020_548 Shape_x0020_549 Shape_x0020_550 Shape_x0020_551 Shape_x0020_552 Shape_x0020_553 Rectangle_x0020_554 Shape_x0020_555 Shape_x0020_556 Shape_x0020_557 Shape_x0020_558 Shape_x0020_559 Shape_x0020_560 Shape_x0020_561 Shape_x0020_562 Shape_x0020_563 Shape_x0020_564 Rectangle_x0020_6069 Rectangle_x0020_6070 Shape_x0020_566 Shape_x0020_567 Shape_x0020_568 Shape_x0020_569 Shape_x0020_570 Rectangle_x0020_572 Rectangle_x0020_573 Rectangle_x0020_574">
								<![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:5;height:108.75pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:center'>
							<span id="bianhao12" lang=EN-US
								style='font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>A12</span>
						</p>
					</td>
					<td width=133 colspan=2
						style='width:99.85pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:.25pt;margin-bottom:.0001pt;text-align:center'>
							<span id="cailiao12" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>10#X40</span>
						</p>
					</td>
					<td width=128 colspan=2
						style='width:95.8pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;
  height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:center'>
							<span id="chicun12" lang=EN-US
								style='font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>500</span>
						</p>
					</td>
					<td width=68
						style='width:50.9pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:.25pt;margin-bottom:.0001pt;text-align:center'>
							<span id="shuliang12" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>8</span>
						</p>
					</td>
					<td width=142 valign=top
						style='width:106.4pt;border:none;border-bottom:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:-45.2pt;margin-bottom:
  0cm;margin-left:14.5pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=186 height=130
								src="resources/js/NewFilewuliao.files/image013.gif"
								v:shapes="Group_x0020_7925 Shape_x0020_695 Shape_x0020_696 Shape_x0020_697 Shape_x0020_698 Shape_x0020_699 Shape_x0020_700 Shape_x0020_701 Shape_x0020_702 Shape_x0020_703 Shape_x0020_704 Shape_x0020_705 Shape_x0020_706 Shape_x0020_707 Shape_x0020_713 Shape_x0020_717 Shape_x0020_720 Shape_x0020_723 Shape_x0020_726 Shape_x0020_727 Shape_x0020_728 Shape_x0020_729 Rectangle_x0020_730 Shape_x0020_731 Shape_x0020_732 Shape_x0020_733 Shape_x0020_734">
								<![endif]></span>
						</p>
					</td>
					<td width=126 valign=top
						style='width:94.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:-39.95pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=146 height=123
								src="resources/js/NewFilewuliao.files/image014.gif"
								v:shapes="Group_x0020_7935 Shape_x0020_708 Shape_x0020_709 Shape_x0020_710 Shape_x0020_711 Shape_x0020_712 Shape_x0020_714 Shape_x0020_715 Shape_x0020_716 Shape_x0020_718 Shape_x0020_719 Shape_x0020_721 Rectangle_x0020_722 Shape_x0020_724 Shape_x0020_725">
								<![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:6;height:108.75pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:2.1pt;margin-bottom:.0001pt;text-align:center'>
							<span id="bianhao13" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>A13</span>
						</p>
					</td>
					<td width=133 colspan=2
						style='width:99.85pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:2.15pt;margin-bottom:.0001pt;text-align:center'>
							<span id="cailiao13" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>X40</span>
						</p>
					</td>
					<td width=128
						style='width:50.2pt;border:none;border-bottom:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=right
							style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:right'>
							<span id="chicun13" lang=EN-US align=center
								style='font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>8×150</span>
						</p>
					</td>
					<td width=61
						style='width:45.6pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:-2.15pt;margin-bottom:.0001pt'>
							
						</p>
					</td>
					<td width=68
						style='width:50.9pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:2.35pt;margin-bottom:.0001pt;text-align:center'>
							<span id="shuliang13" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>3</span>
						</p>
					</td>
					<td width=268 colspan=2 valign=top
						style='width:200.95pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:24.6pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=222 height=86
								src="resources/js/NewFilewuliao.files/image015.gif"
								v:shapes="Group_x0020_6796 Shape_x0020_961 Shape_x0020_962 Shape_x0020_963 Shape_x0020_964 Shape_x0020_965 Shape_x0020_966 Shape_x0020_967 Shape_x0020_968 Shape_x0020_969 Shape_x0020_970 Rectangle_x0020_971 Shape_x0020_972 Shape_x0020_973 Shape_x0020_974 Shape_x0020_975 Shape_x0020_976 Shape_x0020_977 Shape_x0020_978 Shape_x0020_979 Rectangle_x0020_980 Shape_x0020_981 Shape_x0020_982 Shape_x0020_983 Shape_x0020_984">
								<![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:7;height:108.75pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:2.1pt;margin-bottom:.0001pt;text-align:center'>
							<span id="bianhao14" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>A14</span>
						</p>
					</td>
					<td width=133 colspan=2
						style='width:99.85pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:2.15pt;margin-bottom:.0001pt;text-align:center'>
							<span id="cailiao14" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>X40</span>
						</p>
					</td>
					<td width=128
						style='width:50.2pt;border:none;border-bottom:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0pt;
  margin-bottom:0cm;margin-left:0cm;margin-bottom:.0001pt;text-align:right'>
							<span id="chicun14" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>12×15</span>
						</p>
					</td>
					<td width=61
						style='width:45.6pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
					</td>
					<td width=68
						style='width:50.9pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:2.35pt;margin-bottom:.0001pt;text-align:center'>
							<span id="shuliang14" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>3</span>
						</p>
					</td>
					<td width=268 colspan=2 valign=top
						style='width:200.95pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:23.2pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=228 height=87
								src="resources/js/NewFilewuliao.files/image016.gif"
								v:shapes="Group_x0020_6958 Shape_x0020_985 Shape_x0020_986 Shape_x0020_987 Shape_x0020_988 Shape_x0020_989 Shape_x0020_990 Shape_x0020_991 Shape_x0020_992 Shape_x0020_993 Shape_x0020_994 Rectangle_x0020_995 Shape_x0020_996 Shape_x0020_997 Shape_x0020_998 Shape_x0020_999 Shape_x0020_1000 Shape_x0020_1001 Shape_x0020_1002 Shape_x0020_1003 Rectangle_x0020_1004 Shape_x0020_1005 Shape_x0020_1006 Shape_x0020_1007 Shape_x0020_1008">
								<![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:8;height:121.75pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:121.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:2.35pt;margin-bottom:.0001pt;text-align:center'>
							<span id="bianhao15" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>B1</span>
						</p>
					</td>
					<td width=133 colspan=2
						style='width:99.85pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:121.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:2.15pt;margin-bottom:.0001pt;text-align:center'>
							<span id="cailiao15" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>X40</span>
						</p>
					</td>
					<td width=67
						style='width:50.2pt;border:none;border-bottom:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:121.75pt'>
						<p class=MsoNormal align=right
							style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:right'>
							<span id="chicun15" lang=EN-US
								style='font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>12×15</span>
						</p>
					</td>
					<td width=61
						style='width:45.6pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:121.75pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:-2.15pt;margin-bottom:.0001pt'>
						</p>
					</td>
					<td width=68
						style='width:50.9pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:121.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:2.1pt;margin-bottom:.0001pt;text-align:center'>
							<span id="shuliang15" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>36</span>
						</p>
					</td>
					<td width=268 colspan=2 valign=top
						style='width:200.95pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:121.75pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:9.0pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=245 height=97
								src="resources/js/NewFilewuliao.files/image017.gif"
								v:shapes="Group_x0020_7083 Shape_x0020_816 Shape_x0020_817 Shape_x0020_818 Shape_x0020_819 Shape_x0020_820 Shape_x0020_821 Shape_x0020_822 Shape_x0020_823 Shape_x0020_824 Shape_x0020_825 Shape_x0020_826 Shape_x0020_827 Rectangle_x0020_6038 Rectangle_x0020_6037 Shape_x0020_829 Shape_x0020_830 Shape_x0020_831 Shape_x0020_832 Shape_x0020_833 Shape_x0020_834 Shape_x0020_835 Shape_x0020_836 Shape_x0020_837 Shape_x0020_838 Shape_x0020_839 Shape_x0020_840 Rectangle_x0020_841 Shape_x0020_842 Shape_x0020_843 Shape_x0020_844 Shape_x0020_845 Shape_x0020_846 Shape_x0020_847 Shape_x0020_848 Shape_x0020_849 Rectangle_x0020_850 Shape_x0020_851 Shape_x0020_852 Shape_x0020_853 Shape_x0020_854 Shape_x0020_855 Shape_x0020_856 Shape_x0020_857 Shape_x0020_858 Shape_x0020_859 Shape_x0020_860 Rectangle_x0020_861 Shape_x0020_862 Shape_x0020_863 Shape_x0020_864">
								<![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:9;height:108.75pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:2.35pt;margin-bottom:.0001pt;text-align:center'>
							<span id="bianhao16" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>B2</span>
						</p>
					</td>
					<td width=133 colspan=2
						style='width:99.85pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:2.15pt;margin-bottom:.0001pt;text-align:center'>
							<span id="cailiao16" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>X40</span>
						</p>
					</td>
					<td width=67
						style='width:50.2pt;border:none;border-bottom:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=right
							style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:right'>
							<span id="chicun16" lang=EN-US
								style='font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>12×15</span>
						</p>
					</td>
					<td width=61
						style='width:45.6pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:-2.15pt;margin-bottom:.0001pt'>
						</p>
					</td>
					<td width=68
						style='width:50.9pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:2.35pt;margin-bottom:.0001pt;text-align:center'>
							<span id="shuliang16" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>4</span>
						</p>
					</td>
					<td width=268 colspan=2 valign=top
						style='width:200.95pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:10.65pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=247 height=99
								src="resources/js/NewFilewuliao.files/image018.gif"
								v:shapes="Group_x0020_7218 Shape_x0020_865 Shape_x0020_866 Shape_x0020_867 Shape_x0020_868 Shape_x0020_869 Shape_x0020_870 Shape_x0020_871 Shape_x0020_872 Shape_x0020_873 Shape_x0020_874 Shape_x0020_875 Shape_x0020_876 Rectangle_x0020_6039 Rectangle_x0020_6040 Shape_x0020_878 Shape_x0020_879 Shape_x0020_880 Shape_x0020_881 Shape_x0020_882 Shape_x0020_883 Shape_x0020_884 Shape_x0020_885 Shape_x0020_886 Shape_x0020_887 Shape_x0020_888 Shape_x0020_889 Rectangle_x0020_890 Shape_x0020_891 Shape_x0020_892 Shape_x0020_893 Shape_x0020_894 Shape_x0020_895 Shape_x0020_896 Shape_x0020_897 Shape_x0020_898 Rectangle_x0020_899 Shape_x0020_900 Shape_x0020_901 Shape_x0020_902 Shape_x0020_903 Shape_x0020_904 Shape_x0020_905 Shape_x0020_906 Shape_x0020_907 Shape_x0020_908 Shape_x0020_909 Rectangle_x0020_910 Shape_x0020_911 Shape_x0020_912 Shape_x0020_913">
								<![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:10;height:108.75pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:2.35pt;margin-bottom:.0001pt;text-align:center'>
							<span id="bianhao17" lang=EN-US
								style='font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>B3</span>
						</p>
					</td>
					<td width=133 colspan=2
						style='width:99.85pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:2.15pt;margin-bottom:.0001pt;text-align:center'>
							<span id="cailiao17" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>X40</span>
						</p>
					</td>
					<td width=67
						style='width:50.2pt;border:none;border-bottom:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=right
							style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:right'>
							<span id="chicun17" lang=EN-US
								style='font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>12×15</span>
						</p>
					</td>
					<td width=61
						style='width:45.6pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:-2.15pt;margin-bottom:.0001pt'>
						</p>
					</td>
					<td width=68
						style='width:50.9pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal align=center
							style='margin-top:0cm;margin-right:0cm;
  margin-bottom:0cm;margin-left:2.35pt;margin-bottom:.0001pt;text-align:center'>
							<span id="shuliang17" lang=EN-US
								style='font-size:10.0pt;mso-bidi-font-size:11.0pt;line-height:
  107%;font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roman"'>4</span>
						</p>
					</td>
					<td width=268 colspan=2 valign=top
						style='width:200.95pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:108.75pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:8.9pt;margin-bottom:.0001pt'>
							<span lang=EN-US><![if !vml]><img width=248 height=96
								src="resources/js/NewFilewuliao.files/image019.gif"
								v:shapes="Group_x0020_7398 Shape_x0020_914 Shape_x0020_915 Shape_x0020_916 Shape_x0020_917 Shape_x0020_918 Shape_x0020_919 Shape_x0020_920 Shape_x0020_921 Shape_x0020_922 Shape_x0020_923 Rectangle_x0020_6041 Rectangle_x0020_6042 Shape_x0020_925 Shape_x0020_926 Shape_x0020_927 Shape_x0020_928 Shape_x0020_929 Shape_x0020_930 Shape_x0020_931 Shape_x0020_932 Shape_x0020_933 Shape_x0020_934 Shape_x0020_935 Shape_x0020_936 Rectangle_x0020_937 Shape_x0020_938 Shape_x0020_939 Shape_x0020_940 Shape_x0020_941 Shape_x0020_942 Shape_x0020_943 Shape_x0020_944 Shape_x0020_945 Rectangle_x0020_946 Shape_x0020_947 Shape_x0020_948 Shape_x0020_949 Shape_x0020_950 Shape_x0020_951 Shape_x0020_952 Shape_x0020_953 Shape_x0020_954 Shape_x0020_955 Shape_x0020_956 Rectangle_x0020_957 Shape_x0020_958 Shape_x0020_959 Shape_x0020_960">
								<![endif]></span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:11;height:24.0pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:24.0pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:14.4pt;margin-bottom:.0001pt'>
							<span style='font-family:宋体;
  mso-bidi-font-family:宋体'>编制</span>
						</p>
					</td>
					<td width=79
						style='width:59.3pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:24.0pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:14.65pt;margin-bottom:.0001pt'>
							<span id="bianzhiname"
								style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
  宋体'>黄天滢</span>
						</p>
					</td>
					<td width=54
						style='width:40.55pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;
  height:24.0pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:7.9pt;margin-bottom:.0001pt'>
							<span id="bianzhitime" lang=EN-US
								style='font-size:
  10.0pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>19.1.9</span>
						</p>
					</td>
					<td width=67
						style='width:50.2pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:24.0pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:14.45pt;margin-bottom:.0001pt'>
							<span style='font-family:宋体;
  mso-bidi-font-family:宋体'>签收</span>
						</p>
					</td>
					<td width=61 valign=top
						style='width:45.6pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;
  height:24.0pt'>
						<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:14.65pt;margin-bottom:.0001pt'>
							<span style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
  宋体' id="qianshouname1" lang=EN-US><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=68 valign=top
						style='width:50.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;
  height:24.0pt'>
						<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:12.65pt;margin-bottom:.0001pt'>
							<span style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
  宋体' id="qianshoutime1" lang=EN-US><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=268 colspan=2 rowspan=2 valign=top
						style='width:200.95pt;
  border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:
  solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:
  solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:24.0pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.95pt;margin-bottom:.0001pt'>
							<span
								style='font-size:8.5pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
  宋体'>备注：</span>
						</p>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:.05pt;
  margin-left:3.95pt'>
							<span lang=EN-US
								style='font-size:8.5pt;mso-bidi-font-size:
  11.0pt;line-height:107%'>1)</span><span
								class=GramE><span
								style='font-size:
  8.5pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
  宋体'>试板的</span></span><span
								style='font-size:8.5pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:宋体;mso-bidi-font-family:宋体'>长度方向为钢板的轧制方向</span>
						</p>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:3.95pt;margin-bottom:.0001pt'>
							<span lang=EN-US
								style='font-size:
  8.5pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>2)</span><span
								style='font-size:
  8.5pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
  宋体'>请<span
								class=GramE>在试板</span></span><span lang=EN-US
								style='font-size:
  8.5pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:"Times New Roman",serif;
  mso-fareast-font-family:"Times New Roman"'>(</span><span
								style='font-size:
  8.5pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
  宋体'>管</span><span
								lang=EN-US
								style='font-size:8.5pt;mso-bidi-font-size:11.0pt;
  line-height:107%;font-family:"Times New Roman",serif;mso-fareast-font-family:
  "Times New Roman"'>)</span><span
								style='font-size:8.5pt;mso-bidi-font-size:
  11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:宋体'>上打上钢号、合格号、编号</span>
						</p>
					</td>
				</tr>
				<tr style='mso-yfti-irow:12;mso-yfti-lastrow:yes;height:25.45pt'>
					<td width=68
						style='width:50.9pt;border:solid black 1.0pt;border-top:none;
  mso-border-top-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:25.45pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:14.4pt;margin-bottom:.0001pt'>
							<span style='font-family:宋体;
  mso-bidi-font-family:宋体'>校对</span>
						</p>
					</td>
					<td width=79 valign=top
						style='width:59.3pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;
  height:25.45pt'>
						<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:14.65pt;margin-bottom:.0001pt'>
							<span style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
  宋体' id="jiaoduiname" lang=EN-US><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=54 valign=top
						style='width:40.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;
  padding:4.95pt 0cm 0cm 0cm;height:25.45pt'>
						<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:10.65pt;margin-bottom:.0001pt'>
							<span style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
  宋体'  id="jiaoduitime" lang=EN-US><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=67
						style='width:50.2pt;border-top:none;border-left:none;border-bottom:
  solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:solid black 1.0pt;
  mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;height:25.45pt'>
						<p class=MsoNormal
							style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:14.45pt;margin-bottom:.0001pt'>
							<span style='font-family:宋体;
  mso-bidi-font-family:宋体'>签收</span>
						</p>
					</td>
					<td width=61 valign=top
						style='width:45.6pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;
  height:25.45pt'>
						<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:14.65pt;margin-bottom:.0001pt'>
							<span style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
  宋体'  id="qianshouname2" lang=EN-US><o:p>&nbsp;</o:p></span>
						</p>
					</td>
					<td width=68 valign=top
						style='width:50.9pt;border-top:none;border-left:none;
  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt:
  solid black 1.0pt;mso-border-left-alt:solid black 1.0pt;padding:4.95pt 0cm 0cm 0cm;
  height:25.45pt'>
						<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
  margin-left:14.65pt;margin-bottom:.0001pt'>
							<span style='font-size:10.0pt;
  mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
  宋体'  id="qianshoutime2" lang=EN-US><o:p>&nbsp;</o:p></span>
						</p>
					</td>
				</tr>
			</table>

			<p class=MsoNormal
				style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:-4.55pt;margin-bottom:.0001pt'>
				<span lang=EN-US
					style='font-size:
9.0pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
宋体'><span
					style='mso-spacerun:yes'>&nbsp;</span></span><span
					style='font-size:
9.0pt;mso-bidi-font-size:11.0pt;line-height:107%;font-family:宋体;mso-bidi-font-family:
宋体'>联系电话：<span id="phone"
					lang=EN-US>66995587</span></span>
			</p>

		</div>

	</div>
</body>

</html>
