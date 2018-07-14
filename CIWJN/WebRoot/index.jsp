<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%response.setHeader("Cache-Control","no-store");%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>云智能焊接管控系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" href="resources/images/title.ico" type="img/x-icon" />
	<link rel="stylesheet" type="text/css" href="resources/css/base.css" />
	<link rel="stylesheet" type="text/css" href="resources/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="resources/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="resources/css/iconfont.css">
	
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="resources/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="resources/js/index.js"></script>
	<script type="text/javascript" src="resources/js/indexFauit.js"></script>
<!-- 	<script type="text/javascript" src="resources/js/indexFauit2.js"></script> -->
	<style type="text/css">
		a{text-decoration:none;color:inherit;outline:none;}
	</style>
  </head>

  <body class="easyui-layout">
  	<!-- 头部 -->
  	<div region="north" style="height: 98px;" id="north">
		<div class="head-wrap">
			<a href="" class="logo"><img src="resources/images/weldmeslog.png" /></a>
			<div class="search-wrap">
                    <img src="resources/images/1_06.png" />
					<a href="user/logout" id="username">欢迎您，</a>&nbsp;|
					<a href="user/logout">注销</a>
			</div>					
		</div>
	</div>
  	
  	<div region="west" hide="true" split="true" title="导航菜单" style="width: 200px;" id="west" data-options="iconCls:'icon-navigation'">
	  	<div class="easyui-accordion" border="false" id="accordiondiv">
			<div title="生产设备管理" data-options="iconCls:'icon-manager'">
				<ul>
			        <li onclick="changeColor(this)"><a href="javascript:openGather()" ><div><img src="resources/images/c-13.png" />&nbsp;&nbsp;采集模块管理</div></a></li>
					<li onclick="changeColor(this)"><a href="javascript:openWeldingMachine()"><div><img src="resources/images/c-12.png" />&nbsp;&nbsp;焊机设备管理</div></a></li>
				    <li onclick="changeColor(this)"><a href="javascript:openMachine()"><div><img src="resources/images/c-10.png" />&nbsp;&nbsp;维修记录管理</div></a></li>
			        <li class="libottom"  onclick="changeColor(this)"><a href="javascript:openParameter()"><div><img src="resources/images/c-14.png" />&nbsp;&nbsp;参数设置</div></a></li>
				</ul>
			</div>
			<div title="生产数据统计" data-options="iconCls:'icon-num'">
				<ul>
			        <li onclick="changeColor(this)"><a href="javascript:openItemData()" ><div><img src="resources/images/c-11.png" />&nbsp;&nbsp;班组生产数据</div></a></li>
					<li onclick="changeColor(this)"><a href="javascript:openMachineData()"><div><img src="resources/images/c-12.png" />&nbsp;&nbsp;设备生产数据</div></a></li>
				    <li onclick="changeColor(this)"><a href="javascript:openPersonData()"><div><img src="resources/images/c-6.png" />&nbsp;&nbsp;人员生产数据</div></a></li>
			        <li onclick="changeColor(this)"><a href="javascript:openWorkpieceData()"><div><img src="resources/images/c-7.png" />&nbsp;&nbsp;工件生产数据</div></a></li>
			        <li class="libottom"  onclick="changeColor(this)"><a href="javascript:openFauit()"><div><img src="resources/images/s-10.png" />&nbsp;&nbsp;故障报表</div></a></li>
				</ul>
			</div>
			<div title="焊接数据统计" data-options="iconCls:'icon-num'">
				<ul>
			        <li onclick="changeColor(this)"><a href="javascript:openWeldItemData()" ><div><img src="resources/images/c-11.png" />&nbsp;&nbsp;班组焊接数据</div></a></li>
					<li onclick="changeColor(this)"><a href="javascript:openWeldMachineData()"><div><img src="resources/images/c-12.png" />&nbsp;&nbsp;设备焊接数据</div></a></li>
				    <li onclick="changeColor(this)"><a href="javascript:openWeldPersonData()"><div><img src="resources/images/c-6.png" />&nbsp;&nbsp;人员焊接数据</div></a></li>
			        <li class="libottom"  onclick="changeColor(this)"><a href="javascript:openWeldWorkpieceData()"><div><img src="resources/images/c-7.png" />&nbsp;&nbsp;工件焊接数据</div></a></li>
				</ul>
			</div>
			<div title="生产数据分析" data-options="iconCls:'icon-num'">
				<ul>
			        <li onclick="changeColor(this)">
			        	<a href="javascript:openPersonChart()">
			        		<div>
			        			<img src="resources/images/c-6.png" />&nbsp;&nbsp;焊工
			        			<div class="menudiv"><img src="resources/images/arrow.png" id="personimg"/></div>
			        		</div>
			        	</a>
			        </li>
					<li>
						<div id="persondiv">
							<ul>
			    				<li onclick="changeColor(this)"><a href="javascript:openCompanytEfficiency()"><div><img src="resources/images/s-3.png" />&nbsp;&nbsp;焊工工效</div></a></li>
						        <li onclick="changeColor(this)"><a href="javascript:openWelderReport()"><div><img src="resources/images/s-7.png" />&nbsp;&nbsp;焊工维度表</div></a></li>
			    				<li onclick="changeColor(this)"><a href="javascript:openCompanyovertime()"><div><img src="resources/images/s-9.png" />&nbsp;&nbsp;超时待机统计</div></a></li>
								<li onclick="changeColor(this)"><a href="javascript:openCompanyoverproof()"><div><img src="resources/images/s-10.png" />&nbsp;&nbsp;焊接工艺超标</div></a></li>
				    			<li onclick="changeColor(this)"><a href="javascript:openHistory()"><div><img src="resources/images/s-2.png" />&nbsp;&nbsp;历史曲线</div></a></li>
							</ul>
						</div>
					</li>
			        <li onclick="changeColor(this)">
			        	<a href="javascript:openJunctionChart()">
			        		<div>
			        			<img src="resources/images/c-7.png" />&nbsp;&nbsp;焊缝
			        			<div class="menudiv"><img src="resources/images/arrow.png" id="junctionimg"/></div>
			        		</div>
			        	</a>
			        </li>
			        <li>
						<div id="junctiondiv">
							<ul>
								<li onclick="changeColor(this)"><a href="javascript:openCompanyHour()"><div><img src="resources/images/s-8.png" />&nbsp;&nbsp;焊缝焊接工时</div></a></li>
				    			<li onclick="changeColor(this)"><a href="javascript:openHistoryJunction()"><div><img src="resources/images/s-2.png" />&nbsp;&nbsp;历史曲线</div></a></li>
							</ul>
						</div>
					</li>
			        <li onclick="changeColor(this)">
			        	<a href="javascript:openMachineChart()">
			        		<div>
			        			<img src="resources/images/c-12.png" />&nbsp;&nbsp;焊机
			        			<div class="menudiv"><img src="resources/images/arrow.png" id="machineimg"/></div>
			        		</div>
			        	</a>
			        </li>
				    <li>
						<div id="machinediv">
							<ul>
								<li onclick="changeColor(this)"><a href="javascript:openCompanyLoads()"><div><img src="resources/images/s-4.png" />&nbsp;&nbsp;焊机负荷率</div></a></li>
								<li onclick="changeColor(this)"><a href="javascript:openCompanyNoLoads()"><div><img src="resources/images/s-5.png" />&nbsp;&nbsp;焊机空载率</div></a></li>
			    				<li onclick="changeColor(this)"><a href="javascript:openCompanyIdle()"><div><img src="resources/images/s-6.png" />&nbsp;&nbsp;设备闲置率</div></a></li>
						        <li onclick="changeColor(this)"><a href="javascript:openWeldParameter()"><div><img src="resources/images/s-15.png" />&nbsp;&nbsp;焊接参数维度表</div></a></li>
						        <li onclick="changeColor(this)"><a href="javascript:openWireUse()"><div><img src="resources/images/s-16.png" />&nbsp;&nbsp;焊丝用量维度表</div></a></li>
			    				<li onclick="changeColor(this)"><a href="javascript:openCompanyUse()"><div><img src="resources/images/s-17.png" />&nbsp;&nbsp;单台设备数据统计</div></a></li>
							</ul>
						</div>
					</li>
				    <li onclick="changeColor(this)"><a href="javascript:openMaxMin()"><div><img src="resources/images/s-11.png" />&nbsp;&nbsp;对照分析</div></a></li>
				</ul>
			</div>
			<div title="生产过程管理" data-options="iconCls:'icon-statement'">
				<ul>
			        <li onclick="changeColor(this)"><a href="javascript:openPerson()" ><div><img src="resources/images/c-6.png" />&nbsp;&nbsp;焊工管理</div></a></li>
			        <li onclick="changeColor(this)"><a href="javascript:openWedJunction()"><div><img src="resources/images/c-7.png" />&nbsp;&nbsp;焊缝管理</div></a></li>
			        <li onclick="changeColor(this)"><a href="javascript:openProduct()"><div><img src="resources/images/c-8.png" />&nbsp;&nbsp;产品管理</div></a></li>
			        <li onclick="changeColor(this)"><a href="javascript:openWps()"><div><img src="resources/images/c-9.png" />&nbsp;&nbsp;工艺管理</div></a></li>
			        <li class="libottom" onclick="changeColor(this)"><a href="javascript:openSpe()"><div><img src="resources/images/c-14.png" />&nbsp;&nbsp;焊机参数管理</div></a></li>
				</ul>
			</div>
			<div title="系统配置管理" data-options="iconCls:'icon-sys'">
				<ul>
					<li onclick="changeColor(this)"><a href="javascript:openUser()"><div><img src="resources/images/c-1.png" />&nbsp;&nbsp;用户管理</div></a></li>
					<li onclick="changeColor(this)"><a href="javascript:openRole()"><div><img src="resources/images/c-2.png" />&nbsp;&nbsp;角色管理</div></a></li>
					<li onclick="changeColor(this)"><a href="javascript:openAuthority()"><div><img src="resources/images/c-3.png" />&nbsp;&nbsp;权限管理</div></a></li>
					<li onclick="changeColor(this)"><a href="javascript:openResource()"><div><img src="resources/images/c-4.png" />&nbsp;&nbsp;资源管理</div></a></li>
			        <li onclick="changeColor(this)"><a href="javascript:openDictionary()"><div><img src="resources/images/c-5.png" />&nbsp;&nbsp;字典管理</div></a></li>
			        <li class="libottom" onclick="changeColor(this)"><a href="javascript:openInsframework()"><div><img src="resources/images/c-11.png" />&nbsp;&nbsp;组织机构管理</div></a></li>
				</ul>
			</div>
			<div title="实时监控管理" data-options="iconCls:'icon-live'">
				<ul>
					<li class="libottom" onclick="changeColor(this)"><a href="javascript:openCompanyTd()"><div><img src="resources/images/s-1.png" />&nbsp;&nbsp;实时监控</div></a></li>
				</ul>
			</div>
	    </div>
	</div>
    
	<div id="mainPanle" region="center" style="background: white; overflow-y: hidden;width:400px">
		<div id="tabs" class="easyui-tabs" fit="true" border="false"></div>
		<div id="tabMenu" class="easyui-menu" style="width:150px">
			<div id="refreshtab">刷新</div>
			<div id="closetab">关闭标签页</div>
			<div id="closeLeft">关闭左侧标签页</div>
			<div id="closeRight">关闭右侧标签页</div>
			<div id="closeOther">关闭其他标签页</div>
			<div id="closeAll">关闭全部标签页</div>
	    </div>
	</div>
	
	<div data-options="region:'south',split:true" style="height:40px;">
   		<div class="tenghan-bottom">
   			<div id="fauitContent"><div id="content"></div></div>
			<div style="margin-right:30px;float:right;" id="bottomlog"><a href="javascript:void(0)" class="logo"><img src="resources/images/weldmesbottom.png" /></a></div>
		</div>
	</div>

  </body>
</html>