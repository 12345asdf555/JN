<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>实时界面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="resources/css/main.css">
	<link rel="stylesheet" type="text/css" href="resources/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="resources/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/iconfont.css">
	
	<script type="text/javascript" src="resources/js/loading.js"></script>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="resources/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="resources/js/easyui-extend-check.js"></script>
	<script type="text/javascript" src="resources/js/session-overdue.js"></script>
	<script type="text/javascript" src="resources/js/highcharts.js"></script>
	<script type="text/javascript" src="resources/js/exporting.js"></script>
	<script type="text/javascript" src="resources/js/td/nextCurve.js"></script>
	<script type="text/javascript" src="resources/js/swfobject.js"></script>
	<script type="text/javascript" src="resources/js/web_socket.js"></script>
	<style type="text/css">
		table tr td{
			font-size: 14px;
		}
		#attrtable tr td{
			height:30px;
		}
		.panel-title,.panel-header {
		    background: #474960;
		    color:#fff;
		}
		.textbox-text{
			width:100px;
		}
	</style>
  </head>
  
<body class="easyui-layout" style="overflow:auto;">
	<input  id="machineid" type="hidden" value="${value }"/>
	<input id="type" type="hidden" value="${type }"/>
	<input name="afresh" id="afresh" type="hidden" value="${afreshLogin }"/>
	<div style="float:left; width:100%;height:30px;background-color: #474960;color:#ffffff;font-size:14px;">设备运行参数监控
		<div style="float:right;"><a href="td/AllTd"><img src="resources/images/history.png" style="height:30px;width:40px;padding-top:3px;"></a></div>
		<div style="float:right;padding-top:5px;margin-right:30px;"><span id="systemtime"></span></div>
	</div>
	<div style="width:32%;height:150px;float:left;margin-left:20px;position: relative;">
		<fieldset>
			<legend>设备信息</legend>
			<div style="float:left;width:40%;height:150px;margin-left:10px;"><a href="td/AllTd"><img id="mrjpg" src="resources/images/welder_40.png" style="height:90%;width:80%;padding-top:10px;"></a></div>
			<div style="float:left;width:60%;height:150px;top:30px;left:45%;font-size:14px;position:absolute;">
				<ul>
					<li style="width:100%;height:22px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis">
					设备编号：<span id="l1"></span>${valuename}</li>
					<li style="width:100%;height:22px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis">
					设备类型：<span id="l2"></span></li>
					<li style="width:100%;height:22px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis">
					任务编号：<span id="l3"></span></li>
					<li style="width:100%;height:22px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis">
					操作人员：<span id="l4"></span></li>
					<li style="width:100%;height:22px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis">
					设备状态：<input type="text" readonly="readonly" id="l5" value="关机" style="border-radius: 5px;width:110px;height:20px;text-align:center;color:#ffffff;background: #818181"></li>
				</ul>
			</div>
		</fieldset>
	</div>
	<div style="width:38%;height:150px;float:left;margin-left:10px;position: relative;">
		<fieldset>
			<legend>焊接参数</legend>
			<div style="float:left;width:45%;height:150px;margin-left:20px;">
				<div style="float:left;width:70%;height:90px;border:1px solid #888a85;padding-left:20px;font-size:18px;margin:20px;margin-right:0px;padding-top:20px;">
					预置电流：<span id="r13">0</span><br/><br/>
					焊接电流：<span id="c1" style="color:#f05e0e">0</span><br/>
				</div>
				<div style="float:left;width:10%;height:80px;margin-left:-20px;margin-bottom:20px;margin-top:20px;padding-top:30px;">
					<div style="width:35px;height:35px;border-radius: 60px;font-size:22pt;text-align:center;padding:3px;background-color: #37d512;color: #fff;">A</div>
				</div>
			</div>
			<div style="float:left;width:45%;height:150px;margin-left:20px;">
				<div style="float:left;width:70%;height:90px;border:1px solid #888a85;padding-left:20px;font-size:18px;margin:20px;margin-right:0px;padding-top:20px;">
					预置电压：<span id="r14">0</span><br/><br/>
					焊接电压：<span id="c2" style="color:#f05e0e">0</span><br/>
				</div>
				<div style="float:left;width:10%;height:80px;margin-left:-20px;margin-bottom:20px;margin-top:20px;padding-top:30px;">
					<div style="width:35px;height:35px;border-radius: 60px;font-size:22pt;text-align:center;padding:3px;background-color: #f05e0e;color: #fff;">V</div>
				</div>
			</div>
		</fieldset>
	</div>
	<div style="width:25%;height:100%;float:right;margin-left:10px;border:1px solid #888a85;margin-right:10px;margin-top:8px;">
		<div style="float:left; width:100%;height:20px;margin-bottom:20px;background-color: #474960;color:#ffffff;font-size:14px;">设备特征</div>
		<div style="float:left; width:100%;padding-left:40px;">
			<lable>开机时长：</lable>
			<input class="easyui-textbox" id="r1" readonly="readonly"/><br/><br/>
			<lable>离线时长：</lable>
			<input class="easyui-textbox" id="r2" readonly="readonly"/><br/><br/>
			<lable>工作时长：</lable>
			<input class="easyui-textbox" id="r3" value="00:00:00" readonly="readonly"/><br/><br/>
			<lable>焊接时长：</lable>
			<input class="easyui-textbox" id="r4" value="00:00:00" readonly="readonly"/><br/><br/>
			<lable>通道总数：</lable>
			<input class="easyui-textbox" id="r5" readonly="readonly"/><br/><br/>
			<lable>当前通道：</lable>
			<input class="easyui-textbox" id="r6" readonly="readonly"/><br/><br/>
			<lable>焊接控制：</lable>
			<input class="easyui-textbox" id="r7" readonly="readonly"/><br/><br/>
			<lable>焊接方式：</lable>
			<input class="easyui-textbox" id="r8" readonly="readonly"/><br/><br/>
			<lable>气体流量：</lable>
			<input class="easyui-textbox" id="r9" readonly="readonly"/><br/><br/>
			<lable>瞬时功率：</lable>
			<input class="easyui-textbox" id="r10" readonly="readonly"/><br/><br/>
			<lable>初期电流：</lable>
			<input class="easyui-textbox" id="r15" readonly="readonly"/><br/><br/>
			<lable>收弧电流：</lable>
			<input class="easyui-textbox" id="r16" readonly="readonly"/><br/><br/>
			<lable>提前送气时间：</lable>
			<input class="easyui-textbox" id="r11" readonly="readonly"/><br/><br/>
			<lable>滞后停气时间：</lable>
			<input class="easyui-textbox" id="r12" readonly="readonly"/>
		</div>
	</div>
	<div style="float:left; width:72%;height:20px;margin-top:25px;background-color: #474960;color:#fff;text-align:center;">焊接曲线</div>
	<div id="livediv" style="width:72%;height:68%;float:left;top:26%;">
		<div style="float:left; padding-top:2%;width:40px;height:42%;background-color: #37d512;border-radius: 6px;font-size:16pt;color:#ffffff;margin:10px;text-align: center;">
		电流曲线<div style="width:25px;height:25px;border-radius: 60px;font-size:14pt;background-color: #ffffff;color: #000;margin-left:7px;">A</div></div>
		<div id="body31" style="float:left;width:90%;height:48%;"></div>
		<div style="float:left; width:100%;height:8px;background-color: #C4C4C4;"></div>
		<div style="float:left; padding-top:2%;width:40px;height:42%;background-color: #f05e0e;border-radius: 6px;font-size:16pt;color:#ffffff;margin:10px;text-align: center;">
		电压曲线<div style="width:25px;height:25px;border-radius: 60px;font-size:14pt;background-color: #ffffff;color: #000;margin-left:7px;">V</div></div>
		<div id="body32" style="float:left;width:90%;height:48%;"></div>
	</div>
</body>
</html>
 
 