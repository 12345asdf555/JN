/**
 * 
 */
var websocketUrl;
var selectflag;
var wpslibindex;
$(function() {
	$.ajax({
		type : "post",
		async : false,
		url : "td/AllTdbf",
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				websocketUrl = eval(result.web_socket);
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});

	$('#smwdlg').dialog({
		onClose : function() {
			$('#mainWpsTable').datagrid('clearSelections');
			$('#weldingmachineTable').datagrid('clearSelections');
		}
	})
})

//选择工艺
function selectMainWps(value){
	$('#smwfm').form('clear');
	$('#smwdlg').window( {
		title : "选择工艺",
		modal : true
	});
	$("#mainWpsTable").datagrid( {
		height : $("#smwdlg").height(),
		width : $("#smwdlg").width(),
		idField : 'id',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		url : "wps/getMainwpsList?parent="+value,
		singleSelect : false,
		rownumbers : true,
		showPageList : false, 
        columns : [ [ {
		    field:'ck',
			checkbox:true
		},{ 
			field : 'fid',
			title : 'id',
			halign : "center",
			align : "left",
			width : 30,
			hidden:true
		},{ 
			field : 'fchanel',
			title : '通道号',
			halign : "center",
			align : "left"
		},{ 
			field : 'finitial',
			title : '初期条件',
			halign : "center",
			align : "left"
		},{ 
			field : 'fcontroller',
			title : '熔深控制',
			halign : "center",
			align : "left"
		}, {
			field : 'fselectname',
			title : '一元/个别',
			halign : "center",
			align : "left"
		}, {
			field : 'fselect',
			title : '一元/个别id',
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'farc',
			title : '收弧id',
			halign : "center",
			align : "left",
			hidden: true
		},{
			field : 'farcname',
			title : '收弧',
			halign : "center",
			align : "left"
		}, {
			field : 'fcharacter',
			title : '电弧特性',
			halign : "center",
			align : "left"
		}, {
			field : 'fmode',
			title : '柔软电弧模式',
			halign : "center",
			align : "left"
		}, {
			field : 'fmaterialname',
			title : '焊丝材质',
			halign : "center",
			align : "left"
		},{
			field : 'fmaterial',
			title : '焊丝材质id',
			halign : "center",
			align : "left",
			hidden : true
		},{
			field : 'fgasname',
			title : '气体',
			halign : "center",
			align : "left"
		},{
			field : 'fgas',
			title : '气体id',
			halign : "center",
			align : "left",
			hidden : true
		},{
			field : 'fdiametername',
			title : '焊丝直径',
			halign : "center",
			align : "left"
		},{
			field : 'fdiameter',
			title : '焊丝直径id',
			halign : "center",
			align : "left",
			hidden : true
		},{
			field : 'ftime',
			title : '点焊时间',
			halign : "center",
			align : "left"
		},{
			field : 'fadvance',
			title : '提前送气',
			halign : "center",
			align : "left"
		},{
			field : 'fhysteresis',
			title : '滞后送气',
			halign : "center",
			align : "left"
		},{
			field : 'fini_ele',
			title : '初期电流',
			halign : "center",
			align : "left"
		},{
			field : 'fini_vol',
			title : '初期电压',
			halign : "center",
			align : "left"
		},{
			field : 'fini_vol1',
			title : '初期电压一元',
			halign : "center",
			align : "left"
		},{
			field : 'fweld_ele',
			title : '焊接电流',
			halign : "center",
			align : "left"
		},{
			field : 'fweld_vol',
			title : '焊接电压',
			halign : "center",
			align : "left"
		},{
			field : 'fweld_vol1',
			title : '焊接电压一元',
			halign : "center",
			align : "left"
		},{
			field : 'farc_ele',
			title : '收弧电流',
			halign : "center",
			align : "left"
		},{
			field : 'farc_vol',
			title : '收弧电压',
			halign : "center",
			align : "left"
		},{
			field : 'farc_vol1',
			title : '收弧电压一元',
			halign : "center",
			align : "left"
		},{
			field : 'fweld_tuny_ele',
			title : '焊接电流微调',
			halign : "center",
			align : "left"
		},{
			field : 'fweld_tuny_vol',
			title : '焊接电压微调',
			halign : "center",
			align : "left"
		},{
			field : 'farc_tuny_ele',
			title : '收弧电流微调',
			halign : "center",
			align : "left"
		},{
			field : 'farc_tuny_vol',
			title : '收弧电压微调',
			halign : "center",
			align : "left"
		}
		] ],
		pagination : true,
		rowStyler: function(index,row){
            if ((index % 2)!=0){
            	//处理行代背景色后无法选中
            	var color=new Object();
//	                color.class="rowColor";
                return color;
            }
        }
	});
	$('#smwdlg').window('open');
/*	if($('#ddv-'+value).datagrid()){
		var rows = $('#ddv-'+value).datagrid('getSelections');
		if(rows.length==0){
			alert("请先选择工艺!!!");
		}else{
			selectMachineList(1);
		}
	}*/
}

//选择焊机
function selectMachineList(value){
	if(value==1){
		var rows = $('#mainWpsTable').datagrid('getSelections');
		if(rows.length==0){
			alert("请先选择工艺!!!");
			return;
		}
	}
	var url = "";
	if(value==0&&value==1){
		var wpslibrow = $('#wpslibTable').datagrid('getSelected');
		url = "weldingMachine/getWedlingMachineList?searchStr="+"w.fmodel="+wpslibrow.model;
	}else if(value==2){
		url = "weldingMachine/getWedlingMachineList?searchStr="+"w.fmanufacturer_id="+147;
		if(parseInt($('#passwd').numberbox('getValue'))<1||parseInt($('#passwd').numberbox('getValue'))>999){
			alert("密码范围是1~999");
			return;
		}
	}else{
		url = "weldingMachine/getWedlingMachineList?searchStr="+"w.fmanufacturer_id="+147;
	}
	$('#smfm').form('clear');
	$('#smdlg').window( {
		title : "选择焊机",
		modal : true
	});
	$("#weldingmachineTable").datagrid( {
		height : $("#smdlg").height(),
		width : $("#smdlg").width(),
		idField : 'id',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		url : url,
		singleSelect : true,
		rownumbers : true,
		showPageList : false, 
        columns : [ [ {
		    field:'ck',
			checkbox:true
		},{
			field : 'id',
			title : '序号',
			width : 50,
			halign : "center",
			align : "left",
			hidden:true
		}, {
			field : 'equipmentNo',
			title : '固定资产编号',
//				width : 80,
			halign : "center",
			align : "left"
		}, {
			field : 'typeName',
			title : '设备类型',
//				width : 80,
			halign : "center",
			align : "left"
		}, /*{
				field : 'joinTime',
				title : '入厂时间',
//				width : 150,
				halign : "center",
				align : "left"
			}, {
				field : 'insframeworkName',
				title : '所属项目',
//				width : 80,
				halign : "center",
				align : "left"
			},*/ {
			field : 'statusName',
			title : '状态',
//				width : 80,
			halign : "center",
			align : "left"
		} , {
			field : 'manufacturerName',
			title : '厂家',
//				width : 150,
			halign : "center",
			align : "left"
		}, /*{
				field : 'isnetworking',
				title : '是否在网',
//				width : 80,
				halign : "center",
				align : "left"
			},*/ {
			field : 'gatherId',
			title : '采集序号',
//				width : 100,
			halign : "center",
			align : "left"
		}, /*{
				field : 'position',
				title : '位置',
//				width : 100,
				halign : "center",
				align : "left"
			}, {
				field : 'ip',
				title : 'ip地址',
//				width : 100,
				halign : "center",
				align : "left"
			}, {
				field : 'model',
				title : '设备型号',
//				width : 100,
				halign : "center",
				align : "left"
			},*/ {
			field : 'statusId',
			title : '状态id',
			width : 100,
			halign : "center",
			align : "left",
			hidden: true
		}, {
			field : 'isnetworkingId',
			title : '是否联网id',
			width : 100,
			halign : "center",
			align : "left",
			hidden: true
		}, {
			field : 'manuno',
			title : '厂商id',
			width : 100,
			halign : "center",
			align : "left",
			hidden: true
		}, {
			field : 'typeId',
			title : '类型id',
			width : 100,
			halign : "center",
			align : "left",
			hidden: true
		}, {
			field : 'iId',
			title : '项目id',
			width : 100,
			halign : "center",
			align : "left",
			hidden: true
		}, {
			field : 'gid',
			title : '采集id',
			width : 100,
			halign : "center",
			align : "left",
			hidden: true
		}
		] ],
		pagination : true,
//			fitColumns : true,
		rowStyler: function(index,row){
            if ((index % 2)!=0){
            	//处理行代背景色后无法选中
            	var color=new Object();
//	                color.class="rowColor";
                return color;
            }
        }
	});
	if(value==1){
		$("#weldingmachineTable").datagrid({
			singleSelect: false
		});
		selectflag=1;
	}else if(value==2){
		$("#weldingmachineTable").datagrid({
			singleSelect: true
		});
		selectflag=2;
	}else if(value==3){
		$("#weldingmachineTable").datagrid({
			singleSelect: true
		});
		selectflag=3;
	}else{
		$("#weldingmachineTable").datagrid({
			singleSelect: true
		});
		selectflag=0;
	}
	$('#smdlg').window('open');
}

function selectModel(){
	if(selectflag==0){
		requestWps();
	}else if(selectflag==1){
		giveMainWps();
	}else if(selectflag==2){
		passfun();
	}else if(selectflag==3){
		controlfun();
	}else{
		return;
	}
}

function  showResult(){
	$('#resultfm').form('clear');
	$('#resultdlg').window( {
		title : "下发中，请稍等。。。",
		modal : true
	});
	$("#giveResultTable").datagrid( {
		height : $("#resultdlg").height(),
		width : $("#resultdlg").width(),
		idField : 'id',
/*		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],*/
		url : "/",
		singleSelect : true,
		rownumbers : false,
//		showPageList : false, 
        columns : [ [ {
			field : 'machineNo',
			title : '焊机编号',
			width : 80,
			halign : "center",
			align : "left"
		}, {
			field : 'gatherNo',
			title : '采集序号',
			width : 80,
			halign : "center",
			align : "left"
		}, {
			field : 'successNum',
			title : '成功通道',
			width : 300,
			halign : "center",
			align : "left"
		}, {
			field : 'failNum',
			title : '失败通道',
			width : 300,
			halign : "center",
			align : "left"
		}, {
			field : 'noNum',
			title : '未响应通道',
			width : 300,
			halign : "center",
			align : "left"
		}
		] ],
//		pagination : true,
		rowStyler: function(index,row){
            if ((index % 2)!=0){
            	//处理行代背景色后无法选中
            	var color=new Object();
                return color;
            }
        }
	});
	$('#resultdlg').window('open');
}

//索取规范
function requestWps() {
	var selectMachine = $('#weldingmachineTable').datagrid('getSelected');
	if (selectMachine) {
		if (!selectMachine.gatherId) {
			alert("该焊机未绑定采集模块");
			return;
		}
	} else {
		alert("请选择焊机");
		return;
	}
	var flag = 0;
	var websocket = null;
	if (typeof (WebSocket) == "undefined") {
		WEB_SOCKET_SWF_LOCATION = "resources/js/WebSocketMain.swf";
		WEB_SOCKET_DEBUG = true;
	}
	websocket = new WebSocket(websocketUrl);
	websocket.onopen = function() {
		var chanel = $('#fchanel').combobox('getValue').toString(16);
		if (chanel.length < 2) {
			var length = 2 - chanel.length;
			for (var i = 0; i < length; i++) {
				chanel = "0" + chanel;
			}
		}
		var mach = selectMachine.gatherId;
		if (mach.length < 4) {
			var length = 4 - mach.length;
			for (var i = 0; i < length; i++) {
				mach = "0" + mach;
			}
			;
		}
		var xxx = "7E0901010156" + mach + chanel;
		var check = 0;
		for (var i = 0; i < (xxx.length / 2); i++) {
			var tstr1 = xxx.substring(i * 2, i * 2 + 2);
			var k = parseInt(tstr1, 16);
			check += k;
		}

		var checksend = parseInt(check).toString(16);
		var a2 = checksend.length;
		checksend = checksend.substring(a2 - 2, a2);
		checksend = checksend.toUpperCase();
		websocket.send(xxx + checksend + "7D");
		if (flag == 0) {
			var jctimer = window.setTimeout(function() {
				if (flag == 0) {
					websocket.close();
					alert("焊机长时间未响应，索取失败!!!");
				}
			}, 60000)
		}
		websocket.onmessage = function(msg) {
			var da = msg.data;
			if (da.substring(0, 2) == "7E" && da.substring(10, 12) == "56") {
				if (da.substring(18, 20) == "FF") {
					flag++;
					websocket.close();
					if (websocket.readyState != 1) {
						alert("此通道没有规范!!!");
						flag = 0;
					}
				} else {
					var wpslibrow = $('#wpslibTable').datagrid("getSelected");
					if (wpslibrow.model == 174) {
						EPWGET(da);
					} else if (wpslibrow.model == 175) {
						EPSGET(da);
					} else if (wpslibrow.model == 176) {
						WBMLGET(da);
					} else if (wpslibrow.model == 177) {
						WBPGET(da);
					} else if (wpslibrow.model == 178) {
						WBLGET(da);
					} else if (wpslibrow.model == 171) {
						CPVEWGET(da);
					}
					flag++;
					websocket.close();
					if (websocket.readyState != 1) {
						window.clearTimeout(jctimer);
						alert("索取成功");
						flag = 0;
						$('#smdlg').window('close');
						$('#weldingmachineTable').datagrid('clearSelections');
						$('#smdlg').form('clear');
					}
				}
			}
		}
	}
}

//下发规范
function giveMainWps(){
	var wpslibrow = $('#wpslibTable').datagrid("getSelected");
	if(wpslibrow.model==174){
		if(EPW()==false){
			return;
		}
	}else if(wpslibrow.model==175){
		if(EPS()==false){
			return;
		}
	}else if(wpslibrow.model==176){
		if(WBML()==false){
			return;
		}
	}else if(wpslibrow.model==177){
		if(WBP()==false){
			return;
		}
	}else if(wpslibrow.model==178){
		if(WBL()==false){
			return;
		}
	}else if(wpslibrow.model==171){
		if(CPVEW()==false){
			return;
		}
	}
}

//控制命令下发
function openCondlg(){
	$('#condlg').window( {
		title : "控制命令下发",
		modal : true
	});
	$('#condlg').window("open");
}