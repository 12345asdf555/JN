<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>任务确认评价</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="resources/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/datagrid.css" />
	<link rel="stylesheet" type="text/css" href="resources/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
	
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="resources/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="resources/js/easyui-extend-check.js"></script>
	<script type="text/javascript" src="resources/js/weldingtask/taskevaluate.js"></script>
	<script type="text/javascript" src="resources/js/search/search.js"></script>
<!-- 	<script type="text/javascript" src="resources/js/weldingtask/addedittaskresult.js"></script>
	<script type="text/javascript" src="resources/js/weldingtask/removetaskresult.js"></script> -->
	
  </head>
  <body>
  	<div id="body">
  			<div id="load" style="width:100%;height:100%;"></div>
  		<div class="functiondiv">
			<div>
				<a href="javascript:complete();" class="easyui-linkbutton" iconCls="icon-ok">确认完成</a>
				 <lable><span class="required"></span>班组信息</lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 <input class="easyui-textbox" id="XXX"  name="XXX" value="${userinsframework}" readonly="readonly"/>
			</div>
		</div>
	    <table id="weldTaskTable" style="table-layout: fixed; width:100%;"></table>
	    	<!-- 选择任务编号-->
			<div id="fdlg" class="easyui-dialog" style="width: 650px; height: 450px;" title="选择任务编号" closed="true" buttons="#fdlg-buttons">
    			<table id="dg" style="table-layout: fixed; width:100%;"></table>
			</div>
			<div id="fdlg-buttons">
				<a href="javascript:saveWeldingMachine();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
				<a href="javascript:$('#fdlg').dialog('close');" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
			</div> 
		<!-- 确认完成-->
			<div id="sdlg" class="easyui-dialog" style="width: 650px; height: 450px;" title="任务状态更改" closed="true" buttons="#sdlg-buttons">
    			<table id="weg" style="table-layout: fixed; width:100%;"></table>
			</div>
			<div id="sdlg-buttons">
				<a href="javascript:saveWeldingnumber();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
				<a href="javascript:$('#sdlg').dialog('close');" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
			</div>
		<!--评价 -->
		<div id="mdlg" class="easyui-dialog" style="width: 450px; height: 400px; padding:3px 6px" closed="true" buttons="#mdlg-buttons">
			<form id="fm" class="easyui-form" method="post" data-options="novalidate:true">
				<div class="fitem">
          			<lable><span class="required">*</span>评价</lable>
          			<textarea name="result" id="result" style="height:60px;width:150px"></textarea>
       			 </div>  
				<div class="fitem">
					<lable><span class="required">*</span>评价等级</lable>
<!-- 					<input type="hidden" id="resultid" /> -->
					<select class="easyui-combobox" id="resultid"  name="resultid" data-options="required:true,editable:false"></select>
				</div>
			</form>
		</div>
		<div id="mdlg-buttons">
			<a href="javascript:saveconment();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
			<a href="javascript:$('#mdlg').dialog('close');" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
		</div>
		</div>
		<style type="text/css">
		    #load{ display: none; position: absolute; left:0; top:0;width: 100%; height: 40%; background-color: #555753; z-index:10001; -moz-opacity: 0.4; opacity:0.5; filter: alpha(opacity=70);}
			#show{display: none; position: absolute; top: 45%; left: 45%; width: 10%; height: 5%; padding: 8px; border: 8px solid #E8E9F7; background-color: white; z-index:10002; overflow: auto;}
		</style>
  </body>
</html>