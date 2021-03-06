var insfid;
var websocketURL, symbol=0, welderName, taskNum, socket;
var showflag = 0,timeflag;
var liveary = new Array(), machine = new Array();
var off = new Array(), on = new Array(), warn = new Array(), stand = new Array(), cleardata = new Array();
$(function(){
	loadtree();
	websocketUrl();
	websocket();
	//状态发生改变
	$("#status").combobox({
		onChange : function(newValue, oldValue){
			statusClick(newValue);
		}
	});
})
function loadtree() {
	$("#myTree").tree({
		url : 'insframework/getConmpany', //请求路径
		onLoadSuccess : function(node, data) {
			var tree = $(this);
			if (data) {
				$(data).each(function(index, d) {
					if (this.state == 'closed') {
						tree.tree('expandAll');
					}
					$('#_easyui_tree_1 .tree-icon').css("background", "url(resources/images/menu_1.png) no-repeat center center");
					var nownodes = $('#myTree').tree('find', data[0].id);
					//判断是否拥有子节点,改变子节点图标
					if (nownodes.children != null) {
						for(var i=0;i<nownodes.children.length;i++){
							var nextnodes1 = nownodes.children[i];
							$('#' + nextnodes1.domId + ' .tree-icon').css("background", "url(resources/images/menu_2.png) no-repeat center center");
							if(nextnodes1.children != null){
								for(var j=0;j<nextnodes1.children.length;j++){
									var nextnodes2 = nextnodes1.children[j];
									$('#' + nextnodes2.domId + ' .tree-icon').css("background", "url(resources/images/menu_3.png) no-repeat center center");
									if(nextnodes2.children != null){
										for(var x=0;x<nextnodes2.children.length;x++){
											var nextnodes3 = nextnodes2.children[x];
											$('#' + nextnodes3.domId + ' .tree-icon').css("background", "url(resources/images/menu_3.png) no-repeat center center");
										}
									}
								}
							}
							
						}
					}
				});
			}
			if (data.length > 0) {
				//找到第一个元素
				var nownodes = $('#myTree').tree('find', data[0].id);
				insfid = nownodes.id;
				//默认选中第一个项目部
				$('#myTree').tree('select', nownodes.target);
				getMachine(insfid);
			}

		},
		//树形菜单点击事件,获取项目部id，默认选择当前组织机构下的第一个
		onClick : function(node) {
			showflag = 0;
/*			document.getElementById("load").style.display="block";
			var sh = '<div id="show" style="align="center""><img src="resources/images/load.gif"/>正在加载，请稍等...</div>';
			$("#bodydiv").append(sh);
			document.getElementById("show").style.display="block";*/
			var nownodes = $('#myTree').tree('find', node.id);
			insfid = nownodes.id;
			$("#bodydiv").html("");
			getMachine(insfid);
		}
	});
}

function websocketUrl() {
	$.ajax({
		type : "post",
		async : false,
		url : "td/AllTdbf",
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				websocketURL = eval(result.web_socket);
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}

//获取焊机，任务及焊工信息
function getMachine(insfid) {
	var url,welderurl;
	if (insfid == "" || insfid == null) {
		url = "td/getLiveMachine";
		welderurl = "td/getLiveWelder";
	} else {
		url = "td/getLiveMachine?parent=" + insfid;
		welderurl = "td/getLiveWelder?parent=" + insfid;
	}
	$.ajax({
		type : "post",
		async : false,
		url : url,
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				machine = eval(result.rows);
				for(var i=0;i<machine.length;i++){
					var type = machine[i].type,imgnum=0;
					if(type==41){
						imgnum = 1;
					}else if(type==42){
						imgnum = 3;
					}else if(type==43){
						imgnum = 2;
					}
					if(machine[i].fequipment_no=="6666"){
						imgnum = 4;
					}
					off.push(machine[i].fid);
					var str = '<div id="machine'+machine[i].fid+'" style="width:240px;height:120px;float:left;margin-right:10px;display:none">'+
					'<div style="float:left;width:40%;height:100%;"><a href="td/goNextcurve?value='+machine[i].fid+'&valuename='+machine[i].fequipment_no+'&type='+machine[i].type+'&model='+machine[i].model+'"><img id="img'+machine[i].fid+'" src="resources/images/welder_4'+imgnum+'.png" style="height:110px;width:100%;padding-top:10px;"></a></div>'+
					'<div style="float:left;width:60%;height:100%;">'+
					'<ul><li style="width:100%;height:19px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis">设备编号：<span id="m1'+machine[i].fid+'">'+machine[i].fequipment_no+'</span></li>'+
					'<li style="width:100%;height:19px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis">任务编号：<span id="m2'+machine[i].fid+'">--</span></li>'+
					'<li style="width:100%;height:19px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis">操作人员：<span id="m3'+machine[i].fid+'">--</span></li>'+
					'<li style="width:100%;height:19px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis">焊接电流：<span id="m4'+machine[i].fid+'">--A</span></li>'+
					'<li style="width:100%;height:19px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis">焊接电压：<span id="m5'+machine[i].fid+'">--V</span></li>'+
					'<li style="width:100%;height:19px;">焊机状态：<span id="m6'+machine[i].fid+'">关机</span></li></ul><input id="status'+machine[i].fid+'" type="hidden" value="3"></div></div>';
					$("#bodydiv").append(str);
					$("#machine"+machine[i].fid).show();
				}
				showflag=1;
				$("#off").html(off.length);
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
	
	//获取焊工信息
	$.ajax({  
	      type : "post",  
	      async : false,
	      url : welderurl,  
	      data : {},  
	      dataType : "json", //返回数据形式为json  
	      success : function(result) {
	          if (result) {
	        	  welderName=eval(result.rows);
	          }  
	      },
	      error : function(errorMsg) {  
	          alert("数据请求失败，请联系系统管理员!");
		}
	});
	//任务
	$.ajax({
		type : "post",
		async : false,
		url : "weldtask/getWeldTask",
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				taskNum = eval(result.rows);
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}
function websocket() {
	if (typeof (WebSocket) == "undefined") {
		WEB_SOCKET_SWF_LOCATION = "resources/js/WebSocketMain.swf";
		WEB_SOCKET_DEBUG = true;
	}
	webclient();
}

function webclient() {
	try {
		socket = new WebSocket(websocketURL);
	} catch (err) {
		alert("地址请求错误，请清除缓存重新连接！！！")
	}
	setTimeout(function() {
		if (socket.readyState != 1) {
			alert("与服务器连接失败,请检查网络设置!");
		}
	}, 10000);
	socket.onopen = function() {
		//			datatable();
		//监听加载状态改变  
		document.onreadystatechange = completeLoading();

		//加载状态为complete时移除loading效果 
		function completeLoading() {
			var loadingMask = document.getElementById('loadingDiv');
			loadingMask.parentNode.removeChild(loadingMask);
		}
		/*setTimeout(function(){
			if(symbol==0){
				alert("连接成功，但未接收到任何数据");
			}
		},5000);*/
	};
	socket.onmessage = function(msg) {
		redata = msg.data;
		//没有数据时默认显示全部
		if(redata==null || redata=="" && showflag==0){
			for(var i=0;i<machine.length;i++){
				$("#machine"+machine[i].fid).show();
			}
			showflag = 1;
		}
		iview();
		if(symbol==0){
			clearData();
		}
		symbol++;
	};
	//关闭事件
	socket.onclose = function(e) {
		if (e.code == 4001 || e.code == 4002 || e.code == 4003 || e.code == 4005 || e.code == 4006) {
			//如果断开原因为4001 , 4002 , 4003 不进行重连.
			return;
		} else {
			return;
		}
		// 重试3次，每次之间间隔5秒
		if (tryTime < 3) {
			setTimeout(function() {
				socket = null;
				tryTime++;
				var _PageHeight = document.documentElement.clientHeight,
					_PageWidth = document.documentElement.clientWidth;
				var _LoadingTop = _PageHeight > 61 ? (_PageHeight - 61) / 2 : 0,
					_LoadingLeft = _PageWidth > 215 ? (_PageWidth - 215) / 2 : 0;
				var _LoadingHtml = '<div id="loadingDiv" style="position:absolute;left:0;width:100%;height:' + _PageHeight + 'px;top:0;background:#f3f8ff;opacity:0.8;filter:alpha(opacity=80);z-index:10000;"><div style="position: absolute; cursor1: wait; left: ' + _LoadingLeft + 'px; top:' + _LoadingTop + 'px; width: auto; height: 57px; line-height: 57px; padding-left: 50px; padding-right: 5px; background: #fff url(resources/images/load.gif) no-repeat scroll 5px 10px; border: 2px solid #95B8E7; color: #696969;">""正在尝试第"' + tryTime + '"次重连，请稍候..."</div></div>';
				document.write(_LoadingHtml);
				ws();
			}, 5000);
		} else {
			tryTime = 0;
		}
	};
	//发生了错误事件
	socket.onerror = function(e) {
		alert("发生异常，正在尝试重新连接服务器！！！");
	}
}

function iview(){
	if(redata.substring(0, 3)=="02:"){
		for(var f=0;f<machine.length;f++){
			if(machine[f].fequipment_no=="6666"){
				var type = machine[f].type,imgnum=0;
				if(type==41){
					imgnum = 1;
				}else if(type==42){
					imgnum = 3;
				}else if(type==43){
					imgnum = 2;
				}
				imgnum = 4;
				$("#m3"+machine[f].fid).html("--");
				$("#m2"+machine[f].fid).html("--");
				var liveele = parseFloat(redata.substring(3).split(",")[0]).toFixed(0);
	            var livevol = parseFloat(redata.substring(3).split(",")[1]).toFixed(1);
	            $("#m4"+machine[f].fid).html(liveele+"A");
				$("#m5"+machine[f].fid).html(livevol+"V");
				var mstatus;
				if(liveele!=0){
					mstatus = "03"
				}else{
					mstatus = "00"
				}
				var livestatus,livestatusid,liveimg;
				if(mstatus=="00"){
					var num;
					num = $.inArray(machine[f].fid, stand);
					if(num==(-1)){
						stand.push(machine[f].fid);
					}
					num = $.inArray(machine[f].fid, warn);
					if(num!=(-1)){
						warn.splice(num, 1);
					}
					num = $.inArray(machine[f].fid, off);
					if(num!=(-1)){
						off.splice(num, 1);
					}
					num = $.inArray(machine[f].fid, on);
					if(num!=(-1)){
						on.splice(num, 1);
					}
				}else if(mstatus=="03"||mstatus=="05"||mstatus=="07"){
					var num;
					num = $.inArray(machine[f].fid, on);
					if(num==(-1)){
						on.push(machine[f].fid);
					}
					num = $.inArray(machine[f].fid, warn);
					if(num!=(-1)){
						warn.splice(num, 1);
					}
					num = $.inArray(machine[f].fid, off);
					if(num!=(-1)){
						off.splice(num, 1);
					}
					num = $.inArray(machine[f].fid, stand);
					if(num!=(-1)){
						stand.splice(num, 1);
					}
				}else{
					var num;
					num = $.inArray(machine[f].fid, warn);
					if(num==(-1)){
						warn.push(machine[f].fid);
					}
					num = $.inArray(machine[f].fid, on);
					if(num!=(-1)){
						on.splice(num, 1);
					}
					num = $.inArray(machine[f].fid, off);
					if(num!=(-1)){
						off.splice(num, 1);
					}
					num = $.inArray(machine[f].fid, stand);
					if(num!=(-1)){
						stand.splice(num, 1);
					}
				}
				$("#standby").html(stand.length);
				$("#work").html(on.length);
				$("#off").html(off.length);
				$("#warn").html(warn.length);
				switch (mstatus){
				case "00":
					livestatus = "待机";
					liveimg = "resources/images/welder_2"+imgnum+".png";
					break;
				case "01":
					livestatus = "E-010 焊枪开关OFF等待";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				case "02":
					livestatus = "E-000工作停止";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				case "03":
					livestatus = "工作";
					liveimg = "resources/images/welder_1"+imgnum+".png";
					break;
				case "04":
					livestatus = "电流过低";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				case "05":
					livestatus = "收弧";
					liveimg = "resources/images/welder_1"+imgnum+".png";
					break;
				case "06":
					livestatus = "电流过高";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				case "07":
					livestatus = "启弧";
					liveimg = "resources/images/welder_1"+imgnum+".png";
					break;
				case "08":
					livestatus = "电压过低";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				case "09":
					livestatus = "电压过高";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				case "10":
					livestatus = "E-100控制电源异常";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				case "15":
					livestatus = "E-150一次输入电压过高";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				case "16":
					livestatus = "E-160一次输入电压过低";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				case "20":
					livestatus = "E-200一次二次电流检出异常";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				case "21":
					livestatus = "E-210电压检出异常";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				case "22":
					livestatus = "E-220逆变电路反馈异常";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				case "30":
					livestatus = "E-300温度异常";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				case "70":
					livestatus = "E-700输出过流异常";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				case "71":
					livestatus = "E-710输入缺相异常";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				case "98":
					livestatus = "超规范停机";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				case "99":
					livestatus = "超规范报警";
					liveimg = "resources/images/welder_3"+imgnum+".png";
					break;
				}
				$("#m6"+machine[f].fid).html(livestatus);
				$("#img"+machine[f].fid).attr("src",liveimg);
				$("#machine"+machine[f].fid).show();
			}
		}
	}
	if(redata.length==333||redata.length==111){
		for(var i = 0;i < redata.length;i+=111){
//			if(redata.substring(8+i, 12+i)!="0000"){
				for(var f=0;f<machine.length;f++){
					if(machine[f].fid==(parseInt(redata.substring(4+i, 8+i),10))){
						var type = machine[f].type,imgnum=0;
						if(type==41){
							imgnum = 1;
						}else if(type==42){
							imgnum = 3;
						}else if(type==43){
							imgnum = 2;
						}
						var cleardataIndex = $.inArray(parseInt(redata.substring(4+i, 8+i),10), cleardata);
						if(cleardataIndex==(-1)){
							cleardata.push(parseInt(redata.substring(4+i, 8+i),10));
							cleardata.push(new Date().getTime());
						}else{
							cleardata.splice(cleardataIndex+1, 1, new Date().getTime());
						}
						$("#m3"+machine[f].fid).html("--");
						$("#m2"+machine[f].fid).html("--");
						for(var k=0;k<welderName.length;k++){
							if(welderName[k].fid==parseInt(redata.substring(0+i, 4+i),10)){
								$("#m3"+machine[f].fid).html(welderName[k].fwelder_no);
							}
						}
						for(var t=0;t<taskNum.length;t++){
							if(taskNum[t].id==parseInt(redata.substring(12+i, 16+i),10)){
								$("#m2"+machine[f].fid).html(taskNum[t].weldedJunctionno);
							}
						}
						var liveele = parseInt(redata.substring(38+i, 42+i),10);
			            var livevol = parseFloat((parseInt(redata.substring(42+i, 46+i),10)/10).toFixed(2));
			            $("#m4"+machine[f].fid).html(liveele+"A");
						$("#m5"+machine[f].fid).html(livevol+"V");
						var mstatus = redata.substring(36 + i, 38 + i);
						var livestatus,livestatusid,liveimg;
						if(mstatus=="00"){
							var num;
							num = $.inArray(parseInt(redata.substring(4+i, 8+i),10), stand);
							if(num==(-1)){
								stand.push(parseInt(redata.substring(4+i, 8+i),10));
							}
							num = $.inArray(parseInt(redata.substring(4+i, 8+i),10), warn);
							if(num!=(-1)){
								warn.splice(num, 1);
							}
							num = $.inArray(parseInt(redata.substring(4+i, 8+i),10), off);
							if(num!=(-1)){
								off.splice(num, 1);
							}
							num = $.inArray(parseInt(redata.substring(4+i, 8+i),10), on);
							if(num!=(-1)){
								on.splice(num, 1);
							}
						}else if(mstatus=="03"||mstatus=="05"||mstatus=="07"){
							var num;
							num = $.inArray(parseInt(redata.substring(4+i, 8+i),10), on);
							if(num==(-1)){
								on.push(parseInt(redata.substring(4+i, 8+i),10));
							}
							num = $.inArray(parseInt(redata.substring(4+i, 8+i),10), warn);
							if(num!=(-1)){
								warn.splice(num, 1);
							}
							num = $.inArray(parseInt(redata.substring(4+i, 8+i),10), off);
							if(num!=(-1)){
								off.splice(num, 1);
							}
							num = $.inArray(parseInt(redata.substring(4+i, 8+i),10), stand);
							if(num!=(-1)){
								stand.splice(num, 1);
							}
						}else{
							var num;
							num = $.inArray(parseInt(redata.substring(4+i, 8+i),10), warn);
							if(num==(-1)){
								warn.push(parseInt(redata.substring(4+i, 8+i),10));
							}
							num = $.inArray(parseInt(redata.substring(4+i, 8+i),10), on);
							if(num!=(-1)){
								on.splice(num, 1);
							}
							num = $.inArray(parseInt(redata.substring(4+i, 8+i),10), off);
							if(num!=(-1)){
								off.splice(num, 1);
							}
							num = $.inArray(parseInt(redata.substring(4+i, 8+i),10), stand);
							if(num!=(-1)){
								stand.splice(num, 1);
							}
						}
						$("#standby").html(stand.length);
						$("#work").html(on.length);
						$("#off").html(off.length);
						$("#warn").html(warn.length);
						switch (mstatus){
						case "00":
							livestatus = "待机";
							liveimg = "resources/images/welder_2"+imgnum+".png";
							break;
						case "01":
							livestatus = "E-010 焊枪开关OFF等待";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						case "02":
							livestatus = "E-000工作停止";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						case "03":
							livestatus = "工作";
							liveimg = "resources/images/welder_1"+imgnum+".png";
							break;
						case "04":
							livestatus = "电流过低";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						case "05":
							livestatus = "收弧";
							liveimg = "resources/images/welder_1"+imgnum+".png";
							break;
						case "06":
							livestatus = "电流过高";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						case "07":
							livestatus = "启弧";
							liveimg = "resources/images/welder_1"+imgnum+".png";
							break;
						case "08":
							livestatus = "电压过低";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						case "09":
							livestatus = "电压过高";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						case "10":
							livestatus = "E-100控制电源异常";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						case "15":
							livestatus = "E-150一次输入电压过高";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						case "16":
							livestatus = "E-160一次输入电压过低";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						case "20":
							livestatus = "E-200一次二次电流检出异常";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						case "21":
							livestatus = "E-210电压检出异常";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						case "22":
							livestatus = "E-220逆变电路反馈异常";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						case "30":
							livestatus = "E-300温度异常";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						case "70":
							livestatus = "E-700输出过流异常";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						case "71":
							livestatus = "E-710输入缺相异常";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						case "98":
							livestatus = "超规范停机";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						case "99":
							livestatus = "超规范报警";
							liveimg = "resources/images/welder_3"+imgnum+".png";
							break;
						}
						$("#m6"+machine[f].fid).html(livestatus);
						$("#img"+parseInt(redata.substring(4+i, 8+i),10)).attr("src",liveimg);
						$("#machine"+parseInt(redata.substring(4+i, 8+i),10)).show();
					}
				}
//			}
		};
	}
}
  	
function clearData(){
	window.setInterval(function() {
		timeflag = new Date().getTime();
		for(var i=0;i<cleardata.length;i=i+2){
			if(timeflag-cleardata[i+1]>=30000){
				cleardata.splice(i+1, 1);
				$("#img"+cleardata[i]).attr("src","resources/images/welder_42.png");
				var num;
				num = $.inArray(cleardata[i], stand);
				if(num!=(-1)){
					stand.splice(num, 1);
				}
				num = $.inArray(cleardata[i], warn);
				if(num!=(-1)){
					warn.splice(num, 1);
				}
				num = $.inArray(cleardata[i], on);
				if(num!=(-1)){
					on.splice(num, 1);
				}
				num = $.inArray(cleardata[i], off);
				if(num==(-1)){
					off.push(cleardata[i]);
				}
				$("#standby").html(stand.length);
				$("#work").html(on.length);
				$("#off").html(off.length);
				$("#warn").html(warn.length);
				$("#machine"+cleardata[i]).show();
				cleardata.splice(i, 1);
			}
		}
	}, 30000)
}