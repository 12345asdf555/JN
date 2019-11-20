<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>工序计划管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="" />
	<link rel="stylesheet" type="text/css" href="resources/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/datagrid.css" />
	<link rel="stylesheet" type="text/css" href="resources/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
	
	<script type="text/javascript" src="resources/js/weldingtask/json2.js"></script>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
<!-- 	<script type="text/javascript" src="resources/js/datagrid-detailview.js" charset="utf-8"></script> -->
	<script type="text/javascript" src="resources/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="resources/js/easyui-extend-check.js"></script>
	<script type="text/javascript" src="resources/js/weldingtask/weldtask.js"></script>
	<script type="text/javascript" src="resources/js/search/search.js"></script>
	<script type="text/javascript" src="resources/js/weldingtask/addeditweldtask.js"></script>
	<script type="text/javascript" src="resources/js/weldingtask/removeweldtask.js"></script>
	<script type="text/javascript" src="resources/js/weldingtask/print.js"></script>
	
  </head>
  
  <body>
  <input type="hidden" id="turnFlag" value="${turnFlag }"/>
  <input type="hidden" id="pwpsLibName" value="${pwpsLibName }"/>
  	<div class="functiondiv">
		<div>
			任务状态：
			<select class="easyui-combobox" name="status" id="status" data-options="editable:false">
				<option value="999">请选择</option>
				<option value="1">已完成</option>
				<option value="0">进行中</option>
				<option value="3">未领取</option>
			</select>
			<a href="javascript:addWeldedjunction();" class="easyui-linkbutton" iconCls="icon-newadd">新增</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- <a href="javascript:importclick();" class="easyui-linkbutton" iconCls="icon-import">导入</a>&nbsp;&nbsp;&nbsp;&nbsp; -->
			<a href="javascript:exportDg();" class="easyui-linkbutton" iconCls="icon-export">导出</a>&nbsp;&nbsp;&nbsp;&nbsp;	
<!-- 			<a href="javascript:openDayin();" class="easyui-linkbutton" iconCls="icon-print">打印</a>&nbsp;&nbsp;&nbsp;&nbsp; -->
			<a href="javascript:insertsearchWT();" class="easyui-linkbutton" iconCls="icon-select" >查找</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="javascript:turnPage();" class="easyui-linkbutton" iconCls="icon-back">返回</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- <a href="javascript:complete();" class="easyui-linkbutton" iconCls="icon-ok">批量完成</a> -->
		</div>
	</div>
  	<div id="body">
	  	<input id="userinsall"  name="userinsall" value="${userinsall}" type="hidden" />
		<div id="importdiv" class="easyui-dialog" style="width:300px; height:200px;" closed="true">
			<form id="importfm" method="post" class="easyui-form" data-options="novalidate:true" enctype="multipart/form-data"> 
				<div>
					<span><input type="file" name="file" id="file"></span>
					<input type="button" value="上传" onclick="importWeldingMachine()" class="upButton"/>
				</div>
			</form>
		</div>
	    <table id="weldTaskTable" style="table-layout: fixed; width:100%;"></table>
	    
	    <!-- 自定义多条件查询 -->
	    <div id="searchdiv" class="easyui-dialog" style="width:800px; height:400px;" closed="true" buttons="#searchButton" title="自定义条件查询">
	    	<div id="div0">
		    	<select class="fields" id="fields"></select>
		    	<select class="condition" id="condition"></select>
		    	<input class="content" id="content"/>
		    	<select class="joint" id="joint"></select>
		    	<a href="javascript:newSearchWT();" class="easyui-linkbutton" iconCls="icon-add"></a>
		    	<a href="javascript:removeSerach();" class="easyui-linkbutton" iconCls="icon-remove"></a>
	    	</div>
	    </div>
	    <div id="searchButton">
			<a href="javascript:searchWT();" class="easyui-linkbutton" iconCls="icon-ok">查询</a>
			<a href="javascript:close();" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
		</div>
		<!-- 添加修改 -->
		<div id="dlg" class="easyui-dialog" style="width: 700px; height: 500px; padding:3px 6px" closed="true" buttons="#dlg-buttons">
			<form id="fm" class="easyui-form" method="post" data-options="novalidate:true">
				<div class="fitem">
					<lable><span class="required">*</span>任务编号</lable>
					<input type="hidden" id="oldno" />
					<input class="easyui-textbox" id="weldedJunctionno"  name="weldedJunctionno" data-options="validType:['wjNoValidate'],required:true" />
					<lable><span class="required"></span>计划开始时间</lable>
					<input class="easyui-datetimebox" name="startTime" id="startTime"/>
				</div>
				<div class="fitem">
					<lable><span class="required"></span>工程符号</lable>
					<input class="easyui-textbox" id="fengineering_symbol"  name="fengineering_symbol" />
					<lable><span class="required"></span>焊接方法</lable>
					<select class="easyui-combobox" name="fweld_method" id="fweld_method" data-options="required:true,editable:false"></select>
				</div>
				<div class="fitem">
					<lable><span class="required"></span>焊接位置</lable>
					<select class="easyui-combobox" name="fweld_position" id="fweld_position" data-options="required:true,editable:false"></select>
					<lable><span class="required"></span>母材型号</lable>
					<select class="easyui-combobox" name="fbase_material_type" id="fbase_material_type" data-options="required:true,editable:false"></select>
				</div>
				<div class="fitem">
					<lable><span class="required"></span>焊材型号</lable>
					<select class="easyui-combobox" name="fweld_material_model" id="fweld_material_model" data-options="required:true,editable:false"></select>
					<lable><span class="required"></span>工艺设计</lable>
					<input class="easyui-textbox" id="ftechnological_design"  name="ftechnological_design" />
				</div>
				<div class="fitem">
					<lable><span class="required"></span>预热要求</lable>
					<input class="easyui-textbox" id="fwarm_up_requirement"  name="fwarm_up_requirement" />
					<lable><span class="required"></span>道间温度</lable>
					<input class="easyui-textbox" id="finter_channel_temperature"  name="finter_channel_temperature" />
				</div>
				<div class="fitem">
					<lable><span class="required"></span>碳刨要求</lable>
					<input class="easyui-textbox" id="fcarbon_requirement"  name="fcarbon_requirement" />
					<lable><span class="required"></span>后热要求</lable>
					<input class="easyui-textbox" id="fpost_heat_requirement"  name="fpost_heat_requirement" />
				</div>
				<div class="fitem">
					<lable><span class="required"></span>退火焊道</lable>
					<input class="easyui-textbox" id="fannealed_weld"  name="fannealed_weld" />
					<lable><span class="required"></span>装配间隙</lable>
					<input class="easyui-textbox" id="fassembly_clearance"  name="fassembly_clearance" />
				</div>
				<div class="fitem">
					<lable><span class="required"></span>碳刨深度</lable>
					<input class="easyui-textbox" id="fcarbon_depth"  name="fcarbon_depth" />
					<lable><span class="required"></span>碳刨宽度</lable>
					<input class="easyui-textbox" id="fcarbon_width"  name="fcarbon_width" />
				</div>
				<div class="fitem">
					<lable><span class="required"></span>后热温度</lable>
					<input class="easyui-textbox" id="fpost_heat_temperature"  name="fpost_heat_temperature" />
					<lable><span class="required"></span>后热时间</lable>
					<input class="easyui-textbox" id="fafter_hot_time"  name="fafter_hot_time" />
				</div>
				<div class="fitem">
					<lable><span class="required">*</span>pwps库名称</lable>
					<select class="easyui-combobox" id="fwpslib_id"  name="fwpslib_id" data-options="editable:false,required:true"></select>
					<lable><span class="required">*</span>分配焊工</lable>
					<select class="easyui-combobox" id="fwelder_id"  name="fwelder_id" data-options="editable:false,required:true"></select>
				</div>
<!-- 				<div class="fitem">
					<lable><span class="required"></span>所属班组</lable>
					<select class="easyui-combobox" id="iid"  name="iid" data-options="editable:false"></select>
				</div> -->
			</form>
		</div>
		<div id="dlg-buttons">
			<a href="javascript:save();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
			<a href="javascript:close1();" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
		</div>
		
		<!-- 添加修改工艺库 -->
		<div id="wltdlg" class="easyui-dialog" style="width: 700px; height: 400px; padding:10px 20px" closed="true" buttons="#wltdlg-buttons">
			<form id="wltfm" class="easyui-form" method="post" data-options="novalidate:true">
				<div class="fitem">
					<lable><span class="required"></span>板长</lable>
					<input class="easyui-numberbox" id="board_length"  name="board_length" data-options="required:true"/>
				</div>
				<div class="fitem">
					<lable><span class="required"></span>名称</lable>
					<input class="easyui-textbox" id="fname"  name="fname" style="width: 145px;" data-options="editable:false"/>
					<lable><span class="required"></span>日期</lable>
					<input class="easyui-datetimebox" id="fcreatedate"  name="fcreatedate" style="width: 145px; "/>
				</div>
				<div class="fitem">
					<lable>焊接地点</lable>
					<input class="easyui-textbox" id="fweld_place"  name="fweld_place" />
					<lable>焊接厂商名称</lable>
					<select class="easyui-combobox" id="fmanufacturer_id"  name="fmanufacturer_name" data-options="editable:false,required:true" ></select>
				</div>
				<div class="fitem">
					<lable><span class="required"></span>焊接厂商地址</lable>
					<input class="easyui-textbox" id="fmanufacturer_address"  name="fmanufacturer_address" />
					<lable><span class="required"></span>母材</lable>
					<select class="easyui-combogrid" id="fbase_material_id"  name="fbase_material_id" data-options="editable:false,required:true" style="width: 108px; "></select>
				</div>
					<div class="fitem">
					<lable><span class="required"></span>焊接方法</lable>
					<select class="easyui-combobox" id="sfweld_method"  name="sfweld_method" data-options="editable:false,required:true"></select>
					<lable><span class="required"></span>焊接位置</lable>
					<select class="easyui-combobox" id="sfweld_position"  name="sfweld_position" data-options="editable:false,required:true" style="width: 116px; "></select>
				</div><div class="fitem">
					<lable><span class="required"></span>板厚</lable>
					<input class="easyui-textbox" id="fthickness"  name="fthickness" />
					<lable><span class="required"></span>管子外径</lable>
					<input class="easyui-textbox" id="fouter_diameter"  name="fouter_diameter" />
				</div>
								
				<div class="fitem">
					<lable><span class="required"></span>接头形式</lable>
					<input class="easyui-textbox" id="fjoint_form"  name="fjoint_form" />
					<lable><span class="required"></span>保护气</lable>
					<input class="easyui-textbox" id="fprotective_gas"  name="fprotective_gas" />
				</div>
				<div class="fitem">

					<lable><span class="required"></span>流量</lable>
					<input class="easyui-textbox" id="fflow"  name="fflow" />
					<lable><span class="required"></span>气体成分</lable>
					<input class="easyui-textbox" id="fingredient"  name="fingredient" />
				</div>
				<div class="fitem">
					<lable><span class="required"></span>焊材厂商和直径</lable>
					<input class="easyui-textbox" id="fmanufacturer_diameter"  name="fmanufacturer_diameter" />
					<lable><span class="required"></span>焊材</lable>
					<select class="easyui-combobox" id="fweld_material_id"  name="fweld_material_name" data-options="editable:false,required:true" style="width: 99px; "></select>
					
				</div>
				<div class="fitem">
					<lable><span class="required"></span>预热温度</lable>
					<input class="easyui-textbox" id="fwarm_up_temperature"  name="fwarm_up_temperature" />
					<lable><span class="required"></span>道间温度</lable>
					<input class="easyui-textbox" id="finter_channel_temperature"  name="finter_channel_temperature" />
				</div>
				<div class="fitem">
					<lable><span class="required"></span>其它信息</lable>
					<input class="easyui-textbox" id="fother_information"  name="fother_information" />
					<lable><span class="required"></span>坡口图</lable>
					<select class="easyui-combogrid" id="fgroove_id"  name="fgroove_id" data-options="editable:false,required:true" style="width: 98px; "></select>
				</div>
				<div class="fitem">
					<lable><span class="required"></span>焊接日期</lable>
					<input class="easyui-datetimebox" id="fwelddate"  name="fwelddate" />
					<lable><span class="required"></span>焊工名字</lable>
					<select class="easyui-combobox" id="welder_id"  name="welder_id" data-options="editable:false,required:true" style="width: 99px; "></select>
				</div>
				<div class="fitem">
					<lable><span class="required"></span>无损检测</lable>
					<input class="easyui-textbox" id="fnondestructive_test"  name="fnondestructive_test" />
				</div>
				<div class="fitem">
					<lable><span class="required"></span>破环性检测</lable>
					<input class="easyui-textbox" id="fdamage_test"  name="fdamage_test" />
					<lable><span class="required"></span>硬度检测</lable>
					<input class="easyui-textbox" id="fhardness_test"  name="fhardness_test" />
				</div>
				<div class="fitem">
					<lable><span class="required"></span>额外信息</lable>
					<input class="easyui-textbox" id="fextra_information"  name="fextra_information" />
					<lable><span class="required"></span>编辑人</lable>
					<input class="easyui-textbox" id="fedit_user"  name="fedit_user" />
				</div>
				<div class="fitem">
					<lable><span class="required"></span>验船师</lable>
					<input class="easyui-textbox" id="fsurveyor"  name="fsurveyor" />
					<lable><span class="required"></span>编辑日期</lable>
					<input class="easyui-datetimebox" id="feditdate"  name="feditdate" />
				</div>
				<div class="fitem">
					<lable><span class="required"></span>验证日期</lable>
					<input class="easyui-datetimebox" id="ftestdate"  name="ftestdate" />
					<lable><span class="required"></span>最后导出日期</lable>
					<input class="easyui-datetimebox" id="fexpotdate"  name="fexpotdate" />
				</div>
<!-- 				<div class="fitem"> -->
<!-- 					<lable>状态</lable> -->
<!-- 	   				<span id="radios"></span> -->
<!-- 				</div> -->
			</form>
		</div>
		<div id="wltdlg-buttons">
			<a href="javascript:saveWpslib();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
			<a href="javascript:closeDialog('wltdlg');" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
		</div>
		
		<!-- 导入检测表格 -->
		<div id="exportdlg" class="easyui-dialog" style="width: 800px; height: 400px; padding:3px 6px" closed="true" buttons="#exportdlg-buttons">
			<table id="exporttable" style="table-layout: fixed; width:100%;"></table>
		</div>
		<div id="exportdlg-buttons">
	      <a id="imexcel" href="javascript:saveExportdlg();" class="easyui-linkbutton" iconCls="icon-ok">确认导入</a>
	      <a href="javascript:closeExportdlg()" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
	    </div>
		
		<!-- 选择焊工 -->
	    <div id="fdlg" class="easyui-dialog" style="width: 700px; height: 530px;" title="选择焊工" closed="true" buttons="#fdlg-buttons">
	      <div id="fdlgSearch">
	        焊工编号：<input class="easyui-textbox" id="searchname"/>
	        <a href="javascript:dlgSearchGather();" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	        <a href="javascript:cancelWelder();" class="easyui-linkbutton" iconCls="icon-search">取消焊工选择</a>
	      </div>
	        <table id="welderTable" style="table-layout: fixed; width:100%;"></table>
	    </div>
	    <div id="fdlg-buttons">
	      <a href="javascript:saveWelder();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	      <a href="javascript:closeFdlog()" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
	    </div>
	    
	    <!-- 打印 -->
	    <div id="dayin" class="easyui-dialog" style="width: 700px; height: 530px;" title="表格打印" closed="true" buttons="#dayin-buttons">
	    	<table id="dayintable" style="table-layout: fixed; width:100%;"></table>
	    </div>
	    <div id="dayin-buttons">
	      <a href="javascript:printWeldedjunction();" class="easyui-linkbutton" iconCls="icon-ok">打印</a>
	      <a href="javascript:closeDayin()" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
	    </div>
	    
		<!-- 删除 -->
		<div id="rdlg" class="easyui-dialog" style="width: 700px; height: 500px; padding:3px 6px" closed="true" buttons="#remove-buttons">
			<form id="rfm" class="easyui-form" method="post" data-options="novalidate:true"><br/>
								<div class="fitem">
					<lable><span class="required">*</span>任务编号</lable>
					<input type="hidden" id="oldno" />
					<input class="easyui-textbox" id="weldedJunctionno"  name="weldedJunctionno" data-options="validType:['wjNoValidate'],required:true" />
					<lable><span class="required">*</span>计划开始时间</lable>
					<input class="easyui-datetimebox" name="startTime" id="startTime"/>
				</div>
				<div class="fitem">
					<lable><span class="required">*</span>工程符号</lable>
					<input class="easyui-textbox" id="fengineering_symbol"  name="fengineering_symbol" />
					<lable><span class="required">*</span>焊接方法</lable>
					<input class="easyui-textbox" id="fweld_method_name"  name="fweld_method_name" />
				</div>
				<div class="fitem">
					<lable><span class="required">*</span>焊接位置</lable>
					<input class="easyui-textbox" id="fweld_position_name"  name="fweld_position_name" />
					<lable><span class="required">*</span>母材型号</lable>
					<input class="easyui-textbox" id="fbase_material_name"  name="fbase_material_name" />
				</div>
				<div class="fitem">
					<lable><span class="required">*</span>焊材型号</lable>
					<input class="easyui-textbox" id="fweld_material_name"  name="fweld_material_name" />
					<lable><span class="required">*</span>工艺设计</lable>
					<input class="easyui-textbox" id="ftechnological_design"  name="ftechnological_design" />
				</div>
				<div class="fitem">
					<lable><span class="required">*</span>预热要求</lable>
					<input class="easyui-textbox" id="fwarm_up_requirement"  name="fwarm_up_requirement" />
					<lable><span class="required">*</span>道间温度</lable>
					<input class="easyui-textbox" id="finter_channel_temperature"  name="finter_channel_temperature" />
				</div>
				<div class="fitem">
					<lable><span class="required">*</span>碳刨要求</lable>
					<input class="easyui-textbox" id="fcarbon_requirement"  name="fcarbon_requirement" />
					<lable><span class="required">*</span>后热要求</lable>
					<input class="easyui-textbox" id="fpost_heat_requirement"  name="fpost_heat_requirement" />
				</div>
				<div class="fitem">
					<lable><span class="required">*</span>退火焊道</lable>
					<input class="easyui-textbox" id="fannealed_weld"  name="fannealed_weld" />
					<lable><span class="required">*</span>装配间隙</lable>
					<input class="easyui-textbox" id="fassembly_clearance"  name="fassembly_clearance" />
				</div>
				<div class="fitem">
					<lable><span class="required">*</span>碳刨深度</lable>
					<input class="easyui-textbox" id="fcarbon_depth"  name="fcarbon_depth" />
					<lable><span class="required">*</span>碳刨宽度</lable>
					<input class="easyui-textbox" id="fcarbon_width"  name="fcarbon_width" />
				</div>
				<div class="fitem">
					<lable><span class="required">*</span>后热温度</lable>
					<input class="easyui-textbox" id="fpost_heat_temperature"  name="fpost_heat_temperature" />
					<lable><span class="required">*</span>后热时间</lable>
					<input class="easyui-textbox" id="fafter_hot_time"  name="fafter_hot_time" />
				</div>
				<div class="fitem">
					<lable><span class="required"></span>pwps名称</lable>
					<input class="easyui-textbox" id="fwps_lib_name"  name="fwps_lib_name" data-options="editable:false"></select>
					<lable><span class="required"></span>分配焊工</lable>
					<input class="easyui-textbox" id="fwelder_name"  name="fwelder_name" data-options="editable:false"></select>
				</div>
			</form>
		</div>
		<div id="remove-buttons">
			<a href="javascript:remove();" class="easyui-linkbutton" iconCls="icon-ok">删除</a>
			<a href="javascript:close2();" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
		</div>
		
		<!--评价 -->
		<div id="mdlg" class="easyui-dialog" style="width: 380px; height: 400px; padding:3px 6px" closed="true" buttons="#mdlg-buttons">
			<form id="mfm" class="easyui-form" method="post" data-options="novalidate:true"> 
				<div class="fitem">
					<lable><span class="required">*</span>评价等级</lable>
					<select class="easyui-combobox" id="resultid"  name="resultid" data-options="required:true,editable:false"></select>
				</div>
				<div class="fitem">
          			<lable>评价</lable>
          			<textarea name="result" id="result" style="height:60px;width:150px"></textarea>
       			</div> 
			</form>
		</div>
		<div id="mdlg-buttons">
			<a href="javascript:saveconment();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
			<a href="javascript:dlgclose('mdlg');" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
		</div>
		
		<!-- 批量完成 -->
		<div id="sdlg" class="easyui-dialog" style="width: 500px; height: 450px;" title="任务状态更改" closed="true" buttons="#sdlg-buttons">
   			<table id="weg" style="table-layout: fixed; width:100%;"></table>
		</div>
		<div id="sdlg-buttons">
			<a href="javascript:saveWeldingnumber();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
			<a href="javascript:dlgclose('sdlg');" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
		</div>
		
		<div id="load" style="width:100%;height:100%;"></div>
	</div>
	<style type="text/css">
	    #load{ display: none; position: absolute; left:0; top:0;width: 100%; height: 40%; background-color: #555753; z-index:10001; -moz-opacity: 0.4; opacity:0.5; filter: alpha(opacity=70);}
		#show{display: none; position: absolute; top: 45%; left: 45%; width: 180px; height: 5%; padding: 8px; border: 8px solid #E8E9F7; background-color: white; z-index:10002; overflow: auto;}
	</style>
  </body>
</html>
