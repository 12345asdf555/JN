/**
 * 
 */
var websocketUrl;
var selectflag;
var wpslibindex;
$(function(){
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
		url : "weldingMachine/getWedlingMachineList",
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
	}else{
		return;
	}
}

//索取规范
function requestWps(){
	var selectMachine = $('#weldingmachineTable').datagrid('getSelected');
	if(selectMachine){
		if(!selectMachine.gatherId){
			alert("该焊机未绑定采集模块");
			return;
		}
	}else{
		alert("请选择焊机");
		return;
	}
	var flag=0;
	var websocket=null;
	if(typeof(WebSocket) == "undefined") {
    	WEB_SOCKET_SWF_LOCATION = "resources/js/WebSocketMain.swf";
    	WEB_SOCKET_DEBUG = true;
	}
	websocket = new WebSocket(websocketUrl);
	websocket.onopen = function() {
	var chanel = $('#fchanel').combobox('getValue').toString(16);
	if(chanel.length<2){
        var length = 2 - chanel.length;
        for(var i=0;i<length;i++){
        	chanel = "0" + chanel;
        }
    }
	var mach = selectMachine.gatherId;
	if(mach.length<4){
		var length = 4 - mach.length;
        for(var i=0;i<length;i++){
        	mach = "0" + mach;
        };
	}
	var xxx = "7E0901010156"+mach+chanel;
	var check = 0;
	for (var i = 0; i < (xxx.length/2); i++)
	{
		var tstr1=xxx.substring(i*2, i*2+2);
		var k=parseInt(tstr1,16);
		check += k;
	}

	var checksend = parseInt(check).toString(16);
	var a2 = checksend.length;
	checksend = checksend.substring(a2-2,a2);
	checksend = checksend.toUpperCase();
	websocket.send(xxx+checksend+"7D");
	if(flag==0){
		var jctimer = window.setTimeout(function() {
			if(flag==0){
				websocket.close();
				alert("焊机长时间未响应，索取失败!!!");
			}
		}, 10000)
	}
	websocket.onmessage = function(msg) {
		var da=msg.data;
		if(da.substring(0,2)=="7E"&&da.substring(10,12)=="56"){
        if(da.substring(18,20)=="FF"){
    		flag++;
    		websocket.close();
    		if(websocket.readyState!=1){
        		alert("此通道没有规范!!!");
        		flag=0;
    			}
        }else{
		$('#fchanel').combobox('select',parseInt(da.substring(18,20),16));
		$("#ftime").numberbox('setValue',parseInt(da.substring(20,24),16));
		$("#fadvance").numberbox('setValue',parseInt(da.substring(24,28),16));
		$("#fini_ele").numberbox('setValue',parseInt(da.substring(28,32),16));
		$("#fini_vol").numberbox('setValue',(parseInt(da.substring(32,36),16)/10).toFixed(1));
		$("#fini_vol1").numberbox('setValue',(parseInt(da.substring(36,40),16)/10).toFixed(1));
		$("#fweld_ele").numberbox('setValue',parseInt(da.substring(40,44),16));
		$("#fweld_vol").numberbox('setValue',(parseInt(da.substring(44,48),16)/10).toFixed(1));
		$("#fweld_vol1").numberbox('setValue',(parseInt(da.substring(48,52),16)/10).toFixed(1));
		$("#farc_ele").numberbox('setValue',parseInt(da.substring(52,56),16));
		$("#farc_vol").numberbox('setValue',(parseInt(da.substring(56,60),16)/10).toFixed(1));
		$("#farc_vol1").numberbox('setValue',(parseInt(da.substring(60,64),16)/10).toFixed(1));
		$("#fhysteresis").numberbox('setValue',parseInt(da.substring(64,68),16));
		$("#fcharacter").numberbox('setValue',parseInt(da.substring(68,72),16));
		if(parseInt(da.substring(72,74),16)==0){
			$('#fgas').combobox('select',121);
		}else if(parseInt(da.substring(72,74),16)==1){
			$('#fgas').combobox('select',122);
		}else{
			$('#fgas').combobox('select',122);
		}
		if(parseInt(da.substring(74,76),16)==10){
			$('#fdiameter').combobox('select',131);
		}else if(parseInt(da.substring(74,76),16)==12){
			$('#fdiameter').combobox('select',132);
		}else if(parseInt(da.substring(74,76),16)==14){
			$('#fdiameter').combobox('select',133);
		}else{
			$('#fdiameter').combobox('select',134);
		}
		if(parseInt(da.substring(76,78),16)==0){
			$('#fmaterial').combobox('select',91);
		}else if(parseInt(da.substring(76,78),16)==1){
			$('#fmaterial').combobox('select',92);
		}else if(parseInt(da.substring(76,78),16)==4){
			$('#fmaterial').combobox('select',93);
		}else{
			$('#fmaterial').combobox('select',94);
		}
		var sconx = parseInt(da.substring(82,84),16);
		sconx = sconx.toString(2);
		if(sconx.length<8){
	        var length = 8 - sconx.length;
	        for(var i=0;i<length;i++){
	        	sconx = "0" + sconx;
	        }
	    }
		if(sconx.substring(7,8)=="1"){
			$("#finitial").prop("checked",true);
		}else{
			$("#finitial").prop("checked",false);
		}
		if(sconx.substring(6,7)=="0"){
			$('#farc').combobox('select',111);
		}else{
			$('#farc').combobox('select',112);
		}
		if(sconx.substring(5,6)=="1"){
			$('#farc').combobox('select',113);
		}
		if(sconx.substring(4,5)=="1"){
			$('#farc').combobox('select',114);
		}
		if(sconx.substring(2,3)=="0"){
			$('#fselect').combobox('select',102);
		}else{
			$('#fselect').combobox('select',101);
		}
		if(sconx.substring(1,2)=="1"){
			$("#fcontroller").prop("checked",true);
		}else{
			$("#fcontroller").prop("checked",false);
		}
		if(sconx.substring(0,1)=="1"){
			$("#fmode").prop("checked",true);
		}else{
			$("#fmode").prop("checked",false);
		}
		$("#fweld_tuny_ele").numberbox('setValue',parseInt(da.substring(84,86),16));
		$("#farc_tuny_ele").numberbox('setValue',parseInt(da.substring(88,90),16));
		$("#fweld_tuny_vol").numberbox('setValue',(parseInt(da.substring(86,88),16)/10).toFixed(1));
		$("#farc_tuny_vol").numberbox('setValue',(parseInt(da.substring(90,92),16)/10).toFixed(1));
		$("#fweld_tuny_vol1").numberbox('setValue',(parseInt(da.substring(86,88),16)/10).toFixed(1));
		$("#farc_tuny_vol1").numberbox('setValue',(parseInt(da.substring(90,92),16)/10).toFixed(1));
		
		flag++;
		websocket.close();
		if(websocket.readyState!=1){
			window.clearTimeout(jctimer);
			alert("索取成功");
			flag=0;
			$('#smdlg').window('close');
			$('#weldingmachineTable').datagrid('clearSelections'); 
			$('#smdlg').form('clear');
			}
		}}
		}
	}
}

//下发规范
function giveMainWps(){
/*	var ddv = $("#wpslibTable").datagrid('getRowDetail',wpslibindex).find('#ddv-'+wpslibindex);
	var selectMainWpsRows = ddv.datagrid('getChecked');*/
	var selectMainWpsRows = $('#mainWpsTable').datagrid('getSelections');
	var selectMachine = $('#weldingmachineTable').datagrid('getSelections');
	if(selectMachine.length==0){
		alert("请先选择焊机!!!");
		return;
	}
	for(var m=0;m<selectMachine.length;m++){
		if(!selectMachine[m].gatherId){
			alert(selectMachine[m].equipmentNo+"未绑定采集模块，请重新选择!!!");
			return;
		}
	}
	for(var w=0;w<selectMainWpsRows.length;w++){
		if(parseInt(selectMainWpsRows[w].fadvance)<0||parseInt(selectMainWpsRows[w].fadvance)>100){
			alert("提前送气范围：0~100");
			return;
		}
		if(parseInt(selectMainWpsRows[w].fini_ele)<30||parseInt(selectMainWpsRows[w].fini_ele)>550){
			alert("初期电流范围：30~550");
			return;
		}
		if(parseInt(selectMainWpsRows[w].fini_vol)<12||parseInt(selectMainWpsRows[w].fini_vol)>50){
			alert("初期电压范围：12~50");
			return;
		}
		if(parseInt(selectMainWpsRows[w].fini_vol1)<(-30)||parseInt(selectMainWpsRows[w].fini_vol1)>(30)){
			alert("初期电压一元范围：-30~30");
			return;
		}
		if(parseInt(selectMainWpsRows[w].fweld_ele)<30||parseInt(selectMainWpsRows[w].fweld_ele)>550){
			alert("焊接电流范围：30~550");
			return;
		}
		if(parseInt(selectMainWpsRows[w].fweld_vol)<12||parseInt(selectMainWpsRows[w].fweld_vol)>50){
			alert("焊接电压范围：12~50");
			return;
		}
		if(parseInt(selectMainWpsRows[w].fweld_vol1)<(-30)||parseInt(selectMainWpsRows[w].fweld_vol1)>(30)){
			alert("焊接电压一元范围：-30~30");
			return;
		}
		if(parseInt(selectMainWpsRows[w].farc_ele)<30||parseInt(selectMainWpsRows[w].farc_ele)>550){
			alert("收弧电流范围：30~550");
			return;
		}
		if(parseInt(selectMainWpsRows[w].farc_vol)<12||parseInt(selectMainWpsRows[w].farc_vol)>50){
			alert("收弧电压范围：12~50");
			return;
		}
		if(parseInt(selectMainWpsRows[w].farc_vol1)<(-30)||parseInt(selectMainWpsRows[w].farc_vol1)>(30)){
			alert("收弧电压一元范围：-30~30");
			return;
		}
		if(parseInt(selectMainWpsRows[w].fhysteresis)<0||parseInt(selectMainWpsRows[w].fhysteresis)>100){
			alert("滞后送气范围：0~100");
			return;
		}
		if(parseInt(selectMainWpsRows[w].fcharacter)<(-99)||parseInt(selectMainWpsRows[w].fcharacter)>(99)){
			alert("电弧特性范围：-99~99");
			return;
		}
	}
	var symbol=0,count=0;
	var websocket=null;
	if(typeof(WebSocket) == "undefined") {
    	WEB_SOCKET_SWF_LOCATION = "resources/js/WebSocketMain.swf";
    	WEB_SOCKET_DEBUG = true;
	}
	symbol=0;
	websocket = new WebSocket(websocketUrl);
	if(symbol==0){
	var xftimer = window.setTimeout(function() {
		if(symbol==0){
			alert("下发失败");
			websocket.close();
		}
	}, 10000)
	}
	var sochet_send_data=new Array();
	websocket.onopen = function() {
		for(var mwindex=0;mwindex<selectMainWpsRows.length;mwindex++){
			for(var smindex=0;smindex<selectMachine.length;smindex++){
				var chanel = parseInt(selectMainWpsRows[mwindex].fchanel).toString(16);
				if(chanel.length<2){
			        var length = 2 - chanel.length;
			        for(var i=0;i<length;i++){
			        	chanel = "0" + chanel;
			        }
			      }
				var ftime = parseInt(selectMainWpsRows[mwindex].ftime).toString(16);
				if(ftime.length<4){
					var length = 4 - ftime.length;
			        for(var i=0;i<length;i++){
			        	ftime = "0" + ftime;
			        }
			      }
				var fadvance = parseInt(selectMainWpsRows[mwindex].fadvance).toString(16);
				if(fadvance.length<4){
					var length = 4 - fadvance.length;
			        for(var i=0;i<length;i++){
			        	fadvance = "0" + fadvance;
			        }
			      }
				var fini_ele = parseInt(selectMainWpsRows[mwindex].fini_ele).toString(16);
				if(fini_ele.length<4){
					var length = 4 - fini_ele.length;
			        for(var i=0;i<length;i++){
			        	fini_ele = "0" + fini_ele;
			        }
			      }
				var fini_vol = (parseInt(selectMainWpsRows[mwindex].fini_vol)*10).toString(16);
				if(fini_vol.length<4){
					var length = 4 - fini_vol.length;
			        for(var i=0;i<length;i++){
			        	fini_vol = "0" + fini_vol;
			        }
			      }
				var fini_vol1 = parseInt(selectMainWpsRows[mwindex].fini_vol1).toString(16);
				if(fini_vol1.length<4){
					var length = 4 - fini_vol1.length;
			        for(var i=0;i<length;i++){
			        	fini_vol1 = "0" + fini_vol1;
			        }
			      }
				var fweld_ele = parseInt(selectMainWpsRows[mwindex].fweld_ele).toString(16);
				if(fweld_ele.length<4){
					var length = 4 - fweld_ele.length;
			        for(var i=0;i<length;i++){
			        	fweld_ele = "0" + fweld_ele;
			        }
			      }
				var fweld_vol = (parseInt(selectMainWpsRows[mwindex].fweld_vol)*10).toString(16);
				if(fweld_vol.length<4){
					var length = 4 - fweld_vol.length;
			        for(var i=0;i<length;i++){
			        	fweld_vol = "0" + fweld_vol;
			        }
			      }
				var fweld_vol1 = parseInt(selectMainWpsRows[mwindex].fweld_vol1).toString(16);
				if(fweld_vol1.length<4){
					var length = 4 - fweld_vol1.length;
			        for(var i=0;i<length;i++){
			        	fweld_vol1 = "0" + fweld_vol1;
			        }
			      }
				var farc_ele = parseInt(selectMainWpsRows[mwindex].farc_ele).toString(16);
				if(farc_ele.length<4){
					var length = 4 - farc_ele.length;
			        for(var i=0;i<length;i++){
			        	farc_ele = "0" + farc_ele;
			        }
			      }
				var farc_vol = (parseInt(selectMainWpsRows[mwindex].farc_vol)*10).toString(16);
				if(farc_vol.length<4){
					var length = 4 - farc_vol.length;
			        for(var i=0;i<length;i++){
			        	farc_vol = "0" + farc_vol;
			        }
			      }
				var farc_vol1 = parseInt(selectMainWpsRows[mwindex].farc_vol1).toString(16);
				if(farc_vol1.length<4){
					var length = 4 - farc_vol1.length;
			        for(var i=0;i<length;i++){
			        	farc_vol1 = "0" + farc_vol1;
			        }
			      }
				var fhysteresis = parseInt(selectMainWpsRows[mwindex].fhysteresis).toString(16);
				if(fhysteresis.length<4){
					var length = 4 - fhysteresis.length;
			        for(var i=0;i<length;i++){
			        	fhysteresis = "0" + fhysteresis;
			        }
			      }
				var fcharacter = parseInt(selectMainWpsRows[mwindex].fcharacter).toString(16);
				if(fcharacter.length<4){
					var length = 4 - fcharacter.length;
			        for(var i=0;i<length;i++){
			        	fcharacter = "0" + fcharacter;
			        }
			      }
//				alert($('#fgas').combobox('getValue'));
				var fgas = parseInt(selectMainWpsRows[mwindex].fgas).toString(16);
				if(fgas==parseInt(121).toString(16)){
					fgas="0";
				}else if(fgas==parseInt(122).toString(16)){
					fgas="1";
				}else{
					fgas="3";
				}
				if(fgas.length<2){
					var length = 2 - fgas.length;
			        for(var i=0;i<length;i++){
			        	fgas = "0" + fgas;
			        }
			      }
//				alert($('#fdiameter').combobox('getValue'));
				var fdiameter = parseInt(selectMainWpsRows[mwindex].fdiameter).toString(16);
				if(fdiameter==parseInt(131).toString(16)){
					fdiameter="A";
				}else if(fdiameter==parseInt(132).toString(16)){
					fdiameter="C";
				}else if(fdiameter==parseInt(133).toString(16)){
					fdiameter="E";
				}else{
					fdiameter="10";
				}
				if(fdiameter.length<2){
					var length = 2 - fdiameter.length;
			        for(var i=0;i<length;i++){
			        	fdiameter = "0" + fdiameter;
			        }
			      }
//				alert($('#fmaterial').combobox('getValue'));
				var fmaterial = parseInt(selectMainWpsRows[mwindex].fmaterial).toString(16);
				if(fmaterial==parseInt(91).toString(16)){
					fmaterial="0";
				}else if(fmaterial==parseInt(92).toString(16)){
					fmaterial="1";
				}else if(fmaterial==parseInt(93).toString(16)){
					fmaterial="4";
				}else{
					fmaterial="5";
				}
				if(fmaterial.length<2){
			        var length = 2 - fmaterial.length;
			        for(var i=0;i<length;i++){
			        	fmaterial = "0" + fmaterial;
			        }
			      }
				var fweld_tuny_ele = parseInt(selectMainWpsRows[mwindex].fweld_tuny_ele).toString(16);
				if(fweld_tuny_ele.length<2){
					var length = 2 - fweld_tuny_ele.length;
			        for(var i=0;i<length;i++){
			        	fweld_tuny_ele = "0" + fweld_tuny_ele;
			        }
			      }
				var fweld_tuny_vol = (parseInt(selectMainWpsRows[mwindex].fweld_tuny_vol)*10).toString(16);
				if(fweld_tuny_vol.length<2){
					var length = 2 - fweld_tuny_vol.length;
			        for(var i=0;i<length;i++){
			        	fweld_tuny_vol = "0" + fweld_tuny_vol;
			        }
			      }
				var farc_tuny_ele = parseInt(selectMainWpsRows[mwindex].farc_tuny_ele).toString(16);
				if(farc_tuny_ele.length<2){
					var length = 2 - farc_tuny_ele.length;
			        for(var i=0;i<length;i++){
			        	farc_tuny_ele = "0" + farc_tuny_ele;
			        }
			      }
				var farc_tuny_vol = (parseInt(selectMainWpsRows[mwindex].farc_tuny_vol)*10).toString(16);
				if(farc_tuny_vol.length<2){
					var length = 2 - farc_tuny_vol.length;
			        for(var i=0;i<length;i++){
			        	farc_tuny_vol = "0" + farc_tuny_vol;
			        }
			      }
				var con="";
				if(selectMainWpsRows[mwindex].finitial=="是"){
					con="1"+con;
				}else{
					con="0"+con;
				}
				if(selectMainWpsRows[mwindex].farc==111){
					con="0000"+con;
				}else if($('#farc').combobox('getValue')==112){
					con="0001"+con;
				}else if($('#farc').combobox('getValue')==113){
					con="0010"+con;
				}else{
					con="0100"+con;
				}
				if(selectMainWpsRows[mwindex].fselect==101){
					con="1"+con;
				}else{
					con="0"+con;
				}
				if(selectMainWpsRows[mwindex].fcontroller=="是"){
					con="1"+con;
				}else{
					con="0"+con;
				}
				if(selectMainWpsRows[mwindex].fmode=="是"){
					con="1"+con;
				}else{
					con="0"+con;
				}
				con = parseInt(con,2);
				con = parseInt(con).toString(16);
				if(con.length<2){
					var length = 2 - con.length;
			        for(var i=0;i<length;i++){
			        	con = "0" + con;
			        }
			      }
				
				var mach = parseInt(selectMachine[smindex].gatherId).toString(16);
				if(mach.length<4){
					var length = 4 - mach.length;
			        for(var i=0;i<length;i++){
			        	mach = "0" + mach;
			        };
				}
				
			var xiafasend1 = mach+chanel+ftime+fadvance+fini_ele+fini_vol+fini_vol1+fweld_ele+fweld_vol+fweld_vol1+farc_ele+farc_vol+farc_vol1+fhysteresis+fcharacter+fgas
			+fdiameter+fmaterial+"0000"+con+fweld_tuny_ele+fweld_tuny_vol+farc_tuny_ele+farc_tuny_vol;

			var xxx = xiafasend1.toUpperCase();
			var data_length = ((parseInt(xxx.length)+12)/2).toString(16);
			if(data_length.length<2){
				var length = 2 - data_length.length;
		        for(var i=0;i<length;i++){
		        	data_length = "0" + data_length;
		        }
		    };
		    xxx="7E"+data_length+"01010152"+xiafasend1;
		    var check = 0;
			for (var i = 0; i < (xxx.length/2); i++)
			{
				var tstr1=xxx.substring(i*2, i*2+2);
				var k=parseInt(tstr1,16);
				check += k;
			}

			var checksend = parseInt(check).toString(16);
			var a2 = checksend.length;
			checksend = checksend.substring(a2-2,a2);
			checksend = checksend.toUpperCase();
			
			var xiafasend2 = (xxx+checksend).substring(2);
			sochet_send_data.push("7E"+xiafasend2+"7D")
			}
		}
		var timer = window.setInterval(function() {
			if(sochet_send_data.length!=0){
				var popdata = sochet_send_data.pop();
				websocket.send(popdata);
			}else{
				window.clearInterval(timer);
			}
		}, 300)
//	websocket.send("7E"+xiafasend2+"7D");
	websocket.onmessage = function(msg) {
		var fan = msg.data;
		if(fan.substring(0,2)=="7E"&&fan.substring(10,12)=="52"){
			if(parseInt(fan.substring(18,20),16)==1){
				websocket.close();
				if(websocket.readyState!=1){
					alert("下发失败");
					}
			}else{
				count++;
				if(count==selectMachine.length*selectMainWpsRows.length){
					websocket.close();
					if(websocket.readyState!=1){
						alert("下发成功");
						window.clearTimeout(xftimer);
						$('#smdlg').window('close');
						$('#smwdlg').window('close');
						$('#weldingmachineTable').datagrid('clearSelections'); 
						$('#mainWpsTable').datagrid('clearSelections'); 
						count=0;
						selectMainWpsRows.length=0;
						selectMachine.length=0;
					}
				}
			}
		}
	}
}
}