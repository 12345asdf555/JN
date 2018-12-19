<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>工艺管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="resources/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/datagrid.css" />
	<link rel="stylesheet" type="text/css" href="resources/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
	
	<script type="text/javascript" src="resources/js/weldingtask/json2.js"></script>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="resources/js/datagrid-detailview.js" charset="utf-8"></script>
	<script type="text/javascript" src="resources/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="resources/js/easyui-extend-check.js"></script>
	<script type="text/javascript" src="resources/js/wpslib/allWpslib.js"></script>
	<script type="text/javascript" src="resources/js/wpslib/addeditWpslib.js"></script>
	<script type="text/javascript" src="resources/js/wpslib/removeWpslib.js"></script>
	<script type="text/javascript" src="resources/js/wpslib/giveWpslib.js"></script>
	<script type="text/javascript" src="resources/js/wpslib/differentMachine.js"></script>
	<style type="text/css">
		table tr td{
			font-size:12px;
			/* height:30px; */
		}
		.leftTd{
			text-align: right;
			/* width : 150px; */
		}
		.textbox-text{
			width:85px;
		}
	</style>
  </head>
  
  <body>
  	<div class="functiondiv">
		<div>
			<a href="javascript:addWpslib();" class="easyui-linkbutton" iconCls="icon-newadd">新增工艺库</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
  	<div id="body" >
	    <table id="wpslibTable" style="table-layout: fixed; width:100%;"></table>

	    <!-- 添加修改工艺库 -->
		<div id="wltdlg" class="easyui-dialog" style="width: 400px; height: 225px; padding:10px 20px" closed="true" buttons="#wltdlg-buttons">
			<form id="wltfm" class="easyui-form" method="post" data-options="novalidate:true">
				<div class="fitem">
					<lable><span class="required">*</span>工艺库名称</lable>
					<input type="hidden" id="validwl">
					<input class="easyui-textbox" name="wpslibName" id="wpslibName"  data-options="validType:['wpslibValidate'],required:true"/>
				</div>
				<div class="fitem">
					<lable><span class="required">*</span>焊机型号</lable>
					<select class="easyui-combobox" name="model" id="model" data-options="required:true,editable:false""></select>
				</div>
				<div class="fitem">
					<lable>状态</lable>
	   				<span id="radios"></span>
				</div>
			</form>
		</div>
		<div id="wltdlg-buttons">
			<a href="javascript:saveWpslib();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
			<a href="javascript:closedlg();" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
		</div>
		
		<!-- 删除工艺库 -->
		<div id="rmwltdlg" class="easyui-dialog" style="width: 400px; height: 170px; padding:10px 20px" closed="true" buttons="#rmwltdlg-buttons">
			<form id="rmwltfm" class="easyui-form" method="post" data-options="novalidate:true">
				<div class="fitem">
					<lable><span class="required">*</span>工艺库名称</lable>
					<input type="hidden" id="validwl">
					<input class="easyui-textbox" name="wpslibName" id="wpslibName"/>
				</div>
				<div class="fitem">
					<lable>状态</lable>
	   				<span id="radios"></span>
				</div>
			</form>
		</div>
		<div id="rmwltdlg-buttons">
			<a href="javascript:removeWpslib();" class="easyui-linkbutton" iconCls="icon-ok">删除</a>
			<a href="javascript:closedlg();" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
		</div>
		
		<!-- 添加修改工艺 -->
		<div id="mwdlg" class="easyui-dialog" style="width: 900px; height: 510px; padding:10px 20px" closed="true" buttons="#mwdlg-buttons">
			<form id="mwfm" class="easyui-form" method="post" data-options="novalidate:true">
	        	<div region="left" style="padding-left:20px;">
	            	<table>
	            		<tr>
			  				<td class="leftTd"><lable>通道号：</lable></td>
			  				<td class="rightTd">
			  					<select class="easyui-combobox" id="fchanel" name="fchanel" style="width:85px;" id="chanel" data-options="editable:false">
				                	<option value="1">通道号1</option>
								    <option value="2">通道号2</option>
								    <option value="3">通道号3</option>
								    <option value="4">通道号4</option>
								    <option value="5">通道号5</option>
								    <option value="6">通道号6</option>
								    <option value="7">通道号7</option>
								    <option value="8">通道号8</option>
								    <option value="9">通道号9</option>
								    <option value="10">通道号10</option>
								    <option value="11">通道号11</option>
								    <option value="12">通道号12</option>
								    <option value="13">通道号13</option>
								    <option value="14">通道号14</option>
								    <option value="15">通道号15</option>
								    <option value="16">通道号16</option>
								    <option value="17">通道号17</option>
								    <option value="18">通道号18</option>
								    <option value="19">通道号19</option>
								    <option value="20">通道号20</option>
								    <option value="21">通道号21</option>
								    <option value="22">通道号22</option>
								    <option value="23">通道号23</option>
								    <option value="24">通道号24</option>
								    <option value="25">通道号25</option>
								    <option value="26">通道号26</option>
								    <option value="27">通道号27</option>
								    <option value="28">通道号28</option>
								    <option value="29">通道号29</option>
								    <option value="30">通道号30</option>
				                </select>
				            </td>
			  				<td></td>
			  				<td></td>
			  			</tr>
	            	</table>
	            </div>
        	    <div style="border:1px solid green;border-radius: 8px;padding:15px;">
	            	<table>
	            		<tr>
			  				<td class="leftTd" width="50"><lable><span class="required">*</span>收弧：</lable></td>
			  				<td class="rightTd" width="90">
			  					<select class="easyui-combobox" style="width:85px;" name="farc" id="farc" data-options="editable:false">
				                	<option value="111">无</option>
								    <option value="112">有</option>
								    <option value="113">反复</option>
								    <option value="114">点焊</option>
				                </select>
			  				</td>
			  				<td class="leftTd" width="90"><lable><span class="required">*</span>一元/个别：</lable></td>
			  				<td class="rightTd" width="90">
			  					<select class="easyui-combobox" name="fselect" style="width:85px;" id="fselect" data-options="editable:false" onChange="changeValue(current,old)">
				                    <option value="102">个别</option>
								    <option value="101">一元</option>
				                </select>
			  				</td>
			  				<td class="leftTd" width="70"><lable>初期条件：</lable></td>
			  				<td class="rightTd" width="20"><input name="finitial" id="finitial" type="checkbox" value="1" style="width:30px;"/></td>
			  				<td class="leftTd" width="70"><lable>熔深控制：</lable></td>
			  				<td class="rightTd" width="20"><input style="width:30px;" name="fcontroller" id="fcontroller" type="checkbox" value="1"/></td>
			  				<td class="leftTd" width="100"><lable>柔软电弧模式：</lable></td>
			  				<td class="rightTd" width="30"><input style="width:30px;" name="fmode" id="fmode" type="checkbox" value="1"></td>
			  			</tr>
	            	</table>
	            </div>
	            <div style="border:1px solid green;border-radius: 8px;padding:15px;margin-top:5px;">
	            	<table>
	            		<tr>
			  				<td class="leftTd" width="70"><lable><span class="required">*</span>电弧特性：</lable></td>
			  				<td class="rightTd" width="130"><input style="width:85px;" id="fcharacter" name="fcharacter" class="easyui-numberbox">(±1)</td>
			  				<td class="leftTd" width="70"><lable><span class="required">*</span>焊丝材质：</lable></td>
			  				<td class="rightTd">
			  					<select class="easyui-combobox" style="width:85px;" name="fmaterial" id="fmaterial" data-options="editable:false">
				                	<option value="91">低碳钢实心</option>
								    <option value="92">不锈钢实心</option>
								    <option value="93">低碳钢药芯</option>
								    <option value="94">不锈钢药芯</option>
				                </select>
				            </td>
				            <td class="leftTd" width="70"><lable><span class="required">*</span>提前送气：</lable></td>
			  				<td class="rightTd" width="130"><input style="width:85px;" name="fadvance" id="fadvance" class="easyui-numberbox" data-options="precision:1">(0.1s)</td>
			  				<td class="leftTd" width="50"><lable><span class="required">*</span>气体：</lable></td>
			  				<td class="rightTd" width="70">
			  					<select class="easyui-combobox" style="width:85px;" name="fgas" id="fgas" data-options="editable:false">
				                	<option value="121">CO2</option>
								    <option value="122">MAG</option>
								    <option value="123">MIG</option>
				                </select>
				            </td>
			  			</tr>
	            		<tr>
			  				<td class="leftTd" width="70"><lable><span class="required">*</span>点焊时间：</lable></td>
			  				<td class="rightTd" width="130"><input style="width:85px;" name="ftime" id="ftime" class="easyui-numberbox" data-options="precision:1">(0.1s)</td>
			  				<td class="leftTd" width="70"><lable><span class="required">*</span>焊丝直径：</lable></td>
			  				<td class="rightTd" width="70">
			  					<select class="easyui-combobox" style="width:85px;" name="fdiameter" id="fdiameter" data-options="editable:false">
				                	<option value="131">Φ1.0</option>
				                	<option value="132">Φ1.2</option>
				                	<option value="133">Φ1.4</option>
				                	<option value="134">Φ1.6</option>
				                </select>
			  				</td>
			  				<td class="leftTd" width="70"><lable><span class="required">*</span>滞后送气：</lable></td>
			  				<td class="rightTd" width="130"><input style="width:85px;" name="fhysteresis" id="fhysteresis" class="easyui-numberbox" data-options="precision:1">(0.1s)</td>
			  				<td></td>
			  				<td></td>
		  				</tr>
	            	</table>
	            </div>
	            
	            <div style="border:1px solid green;border-radius: 8px;padding:15px;margin-top:5px;">
	            	<div>
	            		<table>
		            		<tr>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>初期电流：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="fini_ele" id="fini_ele" class="easyui-numberbox" data-options="required:true">(A)</td>
				  				<td class="leftTd" width="120"><lable><lable><span class="required">*</span>收弧电流：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="farc_ele" id="farc_ele" class="easyui-numberbox" data-options="required:true">(A)</td>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>焊接电流：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="fweld_ele" id="fweld_ele" class="easyui-numberbox" data-options="required:true">(A)</td>
				  			</tr>
		            		<tr>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>初期电压：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="fini_vol" id="fini_vol" class="easyui-numberbox" data-options="required:true,precision:1">(V)</td>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>焊接电压：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="fweld_vol" id="fweld_vol" class="easyui-numberbox" data-options="required:true,precision:1">(V)</td>
				  			    <td class="leftTd" width="120"><lable><span class="required">*</span>收弧电压：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="farc_vol" id="farc_vol" class="easyui-numberbox" data-options="required:true,precision:1">(V)</td>
				  			</tr>
		            		<tr>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>焊接电压（一元）：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="fweld_vol1" id="fweld_vol1" class="easyui-numberbox" data-options="required:true">(±1)</td>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>收弧电压（一元）：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="farc_vol1" id="farc_vol1" class="easyui-numberbox" data-options="required:true">(±1)</td>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>初期电压（一元）：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="fini_vol1" id="fini_vol1" class="easyui-numberbox" data-options="required:true">(±1)</td>
				  			</tr>
			            	<tr>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>焊接电流微调：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="fweld_tuny_ele" id="fweld_tuny_ele" class="easyui-numberbox" data-options="required:true">(A)</td>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>收弧电流微调：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="farc_tuny_ele" id="farc_tuny_ele" class="easyui-numberbox" data-options="required:true">(A)</td>
				  				<td></td>
				  				<td></td>
				  			</tr>
		            		<tr>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>焊接电压微调：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="fweld_tuny_vol" id="fweld_tuny_vol" class="easyui-numberbox" data-options="required:true,precision:1">(V)</td>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>收弧电压微调：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="farc_tuny_vol" id="farc_tuny_vol" class="easyui-numberbox" data-options="required:true,precision:1">(V)</td>
				  				<td></td>
				  				<td></td>
				  			</tr>
		            	</table>
		            </div>
	            </div>
			</form>
		</div>
		<div id="mwdlg-buttons">
			<a href="javascript:selectMachineList(0);" class="easyui-linkbutton" iconCls="icon-getwps">索取规范</a>
			<a href="javascript:saveMainWps();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
			<a href="javascript:closedlg();" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
		</div>
		
		<!-- 删除工艺 -->
		<div id="rmmwdlg" class="easyui-dialog" style="width: 900px; height: 510px; padding:10px 20px" closed="true" buttons="#rmmwdlg-buttons">
			<form id="rmmwfm" class="easyui-form" method="post" data-options="novalidate:true">
	        	<div region="left" style="padding-left:20px;">
	            	<table>
	            		<tr>
			  				<td class="leftTd"><lable>通道号：</lable></td>
			  				<td class="rightTd">
			  					<select class="easyui-combobox" id="fchanel" name="fchanel" style="width:85px;" id="chanel" data-options="editable:false">
				                	<option value="1">通道号1</option>
								    <option value="2">通道号2</option>
								    <option value="3">通道号3</option>
								    <option value="4">通道号4</option>
								    <option value="5">通道号5</option>
								    <option value="6">通道号6</option>
								    <option value="7">通道号7</option>
								    <option value="8">通道号8</option>
								    <option value="9">通道号9</option>
								    <option value="10">通道号10</option>
								    <option value="11">通道号11</option>
								    <option value="12">通道号12</option>
								    <option value="13">通道号13</option>
								    <option value="14">通道号14</option>
								    <option value="15">通道号15</option>
								    <option value="16">通道号16</option>
								    <option value="17">通道号17</option>
								    <option value="18">通道号18</option>
								    <option value="19">通道号19</option>
								    <option value="20">通道号20</option>
								    <option value="21">通道号21</option>
								    <option value="22">通道号22</option>
								    <option value="23">通道号23</option>
								    <option value="24">通道号24</option>
								    <option value="25">通道号25</option>
								    <option value="26">通道号26</option>
								    <option value="27">通道号27</option>
								    <option value="28">通道号28</option>
								    <option value="29">通道号29</option>
								    <option value="30">通道号30</option>
				                </select>
				            </td>
			  				<td></td>
			  				<td></td>
			  			</tr>
	            	</table>
	            </div>
        	    <div style="border:1px solid green;border-radius: 8px;padding:15px;">
	            	<table>
	            		<tr>
			  				<td class="leftTd" width="50"><lable><span class="required">*</span>收弧：</lable></td>
			  				<td class="rightTd" width="90">
			  					<select class="easyui-combobox" style="width:85px;" name="farc" id="farc" data-options="editable:false">
				                	<option value="111">无</option>
								    <option value="112">有</option>
								    <option value="113">反复</option>
								    <option value="114">点焊</option>
				                </select>
			  				</td>
			  				<td class="leftTd" width="90"><lable><span class="required">*</span>一元/个别：</lable></td>
			  				<td class="rightTd" width="90">
			  					<select class="easyui-combobox" name="fselect" style="width:85px;" id="fselect" data-options="editable:false" onChange="changeValue(current,old)">
				                    <option value="102">个别</option>
								    <option value="101">一元</option>
				                </select>
			  				</td>
			  				<td class="leftTd" width="70"><lable>初期条件：</lable></td>
			  				<td class="rightTd" width="20"><input name="finitial" id="finitial" type="checkbox" value="1" style="width:30px;"/></td>
			  				<td class="leftTd" width="70"><lable>熔深控制：</lable></td>
			  				<td class="rightTd" width="20"><input style="width:30px;" name="fcontroller" id="fcontroller" type="checkbox" value="1"/></td>
			  				<td class="leftTd" width="100"><lable>柔软电弧模式：</lable></td>
			  				<td class="rightTd" width="30"><input style="width:30px;" name="fmode" id="fmode" type="checkbox" value="1"></td>
			  			</tr>
	            	</table>
	            </div>
	            <div style="border:1px solid green;border-radius: 8px;padding:15px;margin-top:5px;">
	            	<table>
	            		<tr>
			  				<td class="leftTd" width="70"><lable><span class="required">*</span>电弧特性：</lable></td>
			  				<td class="rightTd" width="130"><input style="width:85px;" id="fcharacter" name="fcharacter" class="easyui-numberbox">(±1)</td>
			  				<td class="leftTd" width="70"><lable><span class="required">*</span>焊丝材质：</lable></td>
			  				<td class="rightTd">
			  					<select class="easyui-combobox" style="width:85px;" name="fmaterial" id="fmaterial" data-options="editable:false">
				                	<option value="91">低碳钢实心</option>
								    <option value="92">不锈钢实心</option>
								    <option value="93">低碳钢药芯</option>
								    <option value="94">不锈钢药芯</option>
				                </select>
				            </td>
				            <td class="leftTd" width="70"><lable><span class="required">*</span>提前送气：</lable></td>
			  				<td class="rightTd" width="130"><input style="width:85px;" name="fadvance" id="fadvance" class="easyui-numberbox" data-options="precision:1">(0.1s)</td>
			  				<td class="leftTd" width="50"><lable><span class="required">*</span>气体：</lable></td>
			  				<td class="rightTd" width="70">
			  					<select class="easyui-combobox" style="width:85px;" name="fgas" id="fgas" data-options="editable:false">
				                	<option value="121">CO2</option>
								    <option value="122">MAG</option>
								    <option value="123">MIG</option>
				                </select>
				            </td>
			  			</tr>
	            		<tr>
			  				<td class="leftTd" width="70"><lable><span class="required">*</span>点焊时间：</lable></td>
			  				<td class="rightTd" width="130"><input style="width:85px;" name="ftime" id="ftime" class="easyui-numberbox" data-options="precision:1">(0.1s)</td>
			  				<td class="leftTd" width="70"><lable><span class="required">*</span>焊丝直径：</lable></td>
			  				<td class="rightTd" width="70">
			  					<select class="easyui-combobox" style="width:85px;" name="fdiameter" id="fdiameter" data-options="editable:false">
				                	<option value="131">Φ1.0</option>
				                	<option value="132">Φ1.2</option>
				                	<option value="133">Φ1.4</option>
				                	<option value="134">Φ1.6</option>
				                </select>
			  				</td>
			  				<td class="leftTd" width="70"><lable><span class="required">*</span>滞后送气：</lable></td>
			  				<td class="rightTd" width="130"><input style="width:85px;" name="fhysteresis" id="fhysteresis" class="easyui-numberbox" data-options="precision:1">(0.1s)</td>
			  				<td></td>
			  				<td></td>
		  				</tr>
	            	</table>
	            </div>
	            
	            <div style="border:1px solid green;border-radius: 8px;padding:15px;margin-top:5px;">
	            	<div>
	            		<table>
		            		<tr>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>初期电流：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="fini_ele" id="fini_ele" class="easyui-numberbox" data-options="required:true">(A)</td>
				  				<td class="leftTd" width="120"><lable><lable><span class="required">*</span>收弧电流：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="farc_ele" id="farc_ele" class="easyui-numberbox" data-options="required:true">(A)</td>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>焊接电流：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="fweld_ele" id="fweld_ele" class="easyui-numberbox" data-options="required:true">(A)</td>
				  			</tr>
		            		<tr>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>初期电压：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="fini_vol" id="fini_vol" class="easyui-numberbox" data-options="required:true,precision:1">(V)</td>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>焊接电压：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="fweld_vol" id="fweld_vol" class="easyui-numberbox" data-options="required:true,precision:1">(V)</td>
				  			    <td class="leftTd" width="120"><lable><span class="required">*</span>收弧电压：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="farc_vol" id="farc_vol" class="easyui-numberbox" data-options="required:true,precision:1">(V)</td>
				  			</tr>
		            		<tr>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>焊接电压（一元）：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="fweld_vol1" id="fweld_vol1" class="easyui-numberbox" data-options="required:true">(±1)</td>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>收弧电压（一元）：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="farc_vol1" id="farc_vol1" class="easyui-numberbox" data-options="required:true">(±1)</td>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>初期电压（一元）：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="fini_vol1" id="fini_vol1" class="easyui-numberbox" data-options="required:true">(±1)</td>
				  			</tr>
			            	<tr>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>焊接电流微调：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="fweld_tuny_ele" id="fweld_tuny_ele" class="easyui-numberbox" data-options="required:true">(A)</td>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>收弧电流微调：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="farc_tuny_ele" id="farc_tuny_ele" class="easyui-numberbox" data-options="required:true">(A)</td>
				  				<td></td>
				  				<td></td>
				  			</tr>
		            		<tr>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>焊接电压微调：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="fweld_tuny_vol" id="fweld_tuny_vol" class="easyui-numberbox" data-options="required:true,precision:1">(V)</td>
				  				<td class="leftTd" width="120"><lable><span class="required">*</span>收弧电压微调：</lable></td>
				  				<td class="rightTd" width="120"><input style="width:85px;" name="farc_tuny_vol" id="farc_tuny_vol" class="easyui-numberbox" data-options="required:true,precision:1">(V)</td>
				  				<td></td>
				  				<td></td>
				  			</tr>
		            	</table>
		            </div>
	            </div>
			</form>
		</div>
		<div id="rmmwdlg-buttons">
			<a href="javascript:removeMainwps();" class="easyui-linkbutton" iconCls="icon-ok">删除</a>
			<a href="javascript:closedlg();" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
		</div>
		
		<!-- 选择工艺 -->
		<div id="smwdlg" class="easyui-dialog" style="width: 600px; height: 400px; padding:10px 20px" closed="true" buttons="#smwdlg-buttons">
			<form id="smwfm" class="easyui-form" method="post" data-options="novalidate:true">
				<table id="mainWpsTable" style="table-layout: fixed; width:100%;"></table>
			</form>
		</div>
		<div id="smwdlg-buttons">
			<a href="javascript:selectMachineList(1);" class="easyui-linkbutton" iconCls="icon-ok">下一步</a>
			<a href="javascript:closedlg();" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
		</div>
		
		<!-- 选择焊机 -->
		<div id="smdlg" class="easyui-dialog" style="width: 600px; height: 400px; padding:10px 20px" closed="true" buttons="#smdlg-buttons">
			<form id="smfm" class="easyui-form" method="post" data-options="novalidate:true">
				<table id="weldingmachineTable" style="table-layout: fixed; width:100%;"></table>
			</form>
		</div>
		<div id="smdlg-buttons">
			<a href="javascript:selectModel();" class="easyui-linkbutton" iconCls="icon-ok">确认</a>
			<a href="javascript:closedlg();" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
		</div>
		
		<!-- 下发结果表格 -->
		<div id="resultdlg" class="easyui-dialog" style="width: 1120px; height: 600px; padding:10px 20px" closed="true" buttons="#resultdlg-buttons">
			<form id="resultfm" class="easyui-form" method="post" data-options="novalidate:true">
				<table id="giveResultTable" style="table-layout: fixed; width:100%;"></table>
			</form>
		</div>
		<div id="resultdlg-buttons">
			<a href="javascript:closedlg();" class="easyui-linkbutton" iconCls="icon-ok">确认</a>
			<a href="javascript:closedlg();" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
		</div>
	</div>
  </body>
</html>