/**
 * 
 */
function back() {
	var url = "td/AllTd";
	var img = new Image();
	img.src = url; // 设置相对路径给Image, 此时会发送出请求
	url = img.src; // 此时相对路径已经变成绝对路径
	img.src = null; // 取消请求
	window.location.href = url;
}
;

var machine = new Array();
var time = new Array();
var ele = new Array();
var vol = new Array();
var machstatus = new Array();
var work = new Array();
var wait = new Array();
var worktime = new Array();
var dglength;
var websocketURL;
var welderName;
var taskNum;
var symbol = 0;
var symbol1 = 0;
var sym = 0;
var timerele;
var timervol;
var socket;
var redata;
var rowdex = 0;
var maxele = 0;
var minele = 0;
var maxvol = 0;
var minvol = 0;
var rows;
var fmch;
var tongdao;
var sint = 0;
var series;
var chart;
var series1;
var chart1;
var time1 = 0,time2 = 0;
var led = [ "0,1,2,4,5,6", "2,5", "0,2,3,4,6", "0,2,3,5,6", "1,2,3,5", "0,1,3,5,6", "0,1,3,4,5,6", "0,2,5", "0,1,2,3,4,5,6", "0,1,2,3,5,6" ];
$(function() {
	var livewidth = $("#livediv").width() * 0.9;
	var liveheight = $("#livediv").height() / 2;
	$("#body31").width(livewidth);
	$("#body31").height(liveheight);
	$("#body32").width(livewidth);
	$("#body32").height(liveheight);
	var width = $("#treeDiv").width();
	$(".easyui-layout").layout({
		onCollapse : function() {
			$("#dg").datagrid({
				height : $("#body").height(),
				width : $("#body").width()
			})
		},
		onExpand : function() {
			$("#dg").datagrid({
				height : $("#body").height(),
				width : $("#body").width()
			})
		}
	});
	$("#myTree").tree({
		onClick : function(node) {
			$("#dg").datagrid('load', {
				"parent" : node.id
			})
		}
	})
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
	$.ajax({
		type : "post",
		async : false,
		url : "td/getLiveWelder",
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				welderName = eval(result.rows);
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
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
	//获取工作、焊接时间以及设备类型
	$.ajax({
		type : "post",
		async : false,
		url : "td/getLiveTime?machineid="+$("#machineid").val(),
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				worktime = eval(result);
				if(worktime.worktime!=null && worktime.worktime!=''){
					time1 = worktime.worktime;
				}
				if(worktime.time!=null && worktime.time!=''){
					time2 = worktime.time;
				}
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
	/*		$.ajax({  
			      type : "post",  
			      async : false,
			      url : "wps/Spe?machine="+document.getElementById("in2")+"&chanel="+"",  
			      data : {},  
			      dataType : "json", //返回数据形式为json  
			      success : function(result) {
			          if (result) {
			        	tongdao = eval(result.rows);
			        	}else{
			        		alert("未查询到相关数据，请尝试索取保存。");
			        	}
			      },
			      error : function(errorMsg) {  
			          alert("数据请求失败，请联系系统管理员!");  
			      }  
			 });*/
	websocket();
})

function websocket() {
	if (typeof (WebSocket) == "undefined") {
		WEB_SOCKET_SWF_LOCATION = "resources/js/WebSocketMain.swf";
		WEB_SOCKET_DEBUG = true;
	}
	webclient();
}
;
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
		//				datatable();
		//监听加载状态改变  
		document.onreadystatechange = completeLoading();

		//加载状态为complete时移除loading效果 
		function completeLoading() {
			var loadingMask = document.getElementById('loadingDiv');
			loadingMask.parentNode.removeChild(loadingMask);
		}
	/*				setTimeout(function(){
						if(symbol==0){
							alert("连接成功，但未接收到任何数据");
						}
					},5000);*/
	};
	socket.onmessage = function(msg) {
		redata = msg.data;
		iview();
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
	socket.onerror = function() {
		aler("发生异常，正在尝试重新连接服务器！！！");
	}
}


function elecurve() {
	Highcharts.setOptions({
		global : {
			useUTC : false
		}
	});

	$('#body31').highcharts({
		chart : {
			type : 'spline',
			animation : false, // don't animate in old IE
			marginRight : 70,
			events : {
				load : function() {
					// set up the updating of the chart each second
					series = this.series[0],
					chart = this,
					timerele = window.setInterval(function() {}, 1000);
				}
			}
		},
		title : {
			text : ''
		},
		xAxis : {
			type : 'datetime',
			tickPixelInterval : 150,
			lineColor : '#FFFFFF',
			tickWidth : 0,
			labels : {
				enabled : false
			}
		},
		yAxis : [ {
			max : 500, // 定义Y轴 最大值  
			min : 0, // 定义最小值  
			minPadding : 0.2,
			maxPadding : 0.2,
			tickInterval : 100,
			color : '#A020F0',
			title : {
				text : '',
				style : {
					color : '#A020F0'
				}
			}
		} ],
		tooltip : {
			formatter : function() {
				return '<b>' + this.series.name + '</b><br/>' +
					Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
					Highcharts.numberFormat(this.y, 2);
			}
		},
		legend : {
			enabled : false
		},
		exporting : {
			enabled : false
		},
		credits : {
			enabled : false // 禁用版权信息
		},
		series : [ {
			color : '#A020F0',
			name : '电流',

			data : (function() {
				// generate an array of random data
				var data = [],
					/*time = new Date(Date.parse("0000-00-00 00:00:00")),*/
					i;
				for (i = -19; i <= 0; i += 1) {
					data.push({
						x : time[0] - 1000 + i * 1000,
						/*x: time + i*1000,*/
						y : 0
					});
				}
				return data;
			}())
		} ]
	}, function(c) {
		activeLastPointToolip(c)
	});

	activeLastPointToolip(chart);
}

function volcurve() {
	Highcharts.setOptions({
		global : {
			useUTC : false
		}
	});

	$('#body32').highcharts({
		chart : {
			type : 'spline',
			animation : false, // don't animate in old IE
			marginRight : 70,
			events : {
				load : function() {
					// set up the updating of the chart each second
					series1 = this.series[0],
					chart1 = this;
				}
			}
		},
		title : {
			text : false
		},
		xAxis : {
			type : 'datetime',
			tickPixelInterval : 150 /*,
	  		        tickWidth:0,
		  		    labels:{
		  		    	enabled:false
		  		    }*/
		},
		yAxis : [ {
			max : 50, // 定义Y轴 最大值  
			min : 0, // 定义最小值  
			minPadding : 0.2,
			maxPadding : 0.2,
			tickInterval : 10,
			color : '#87CEFA',
			title : {
				text : '',
				style : {
					color : '#87CEFA'
				}
			}
		} ],
		tooltip : {
			formatter : function() {
				return '<b>' + this.series.name + '</b><br/>' +
					Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
					Highcharts.numberFormat(this.y, 2);
			}
		},
		legend : {
			enabled : false
		},
		exporting : {
			enabled : false
		},
		credits : {
			enabled : false // 禁用版权信息
		},
		series : [ {
			name : '电压',
			data : (function() {
				// generate an array of random data
				var data = [],
					/*			                time = new Date(Date.parse("0000-00-00 00:00:00")),*/
					i;
				for (i = -19; i <= 0; i += 1) {
					data.push({
						x : time[0] - 1000 + i * 1000,
						y : 0
					});
				}
				return data;
			}())
		} ]
	}, function(c) {
		activeLastPointToolip1(c)
	});

	activeLastPointToolip1(chart1);

}
function iview() {
	var z = 0;
	time.length = 0;
	vol.length = 0;
	ele.length = 0;
	for (var i = 0; i < redata.length; i += 77) {
		//				if(redata.substring(8+i, 12+i)!="0000"){
		if (parseInt(redata.substring(4 + i, 8 + i)) == $("#machineid").val()) {
			ele.push(parseInt(redata.substring(12 + i, 16 + i), 10));
			vol.push(parseFloat((parseInt(redata.substring(16 + i, 20 + i), 10) / 10).toFixed(2)));
			var ttme = redata.substring(20 + i, 39 + i);
			//						time.push(Date.parse(redata.substring(20+i, 39+i)));
			ttme = ttme.replace(/-/g, '/');
			time.push(Date.parse(new Date(ttme)));
			machstatus.push(redata.substring(0 + i, 2 + i));
			maxele = parseInt(redata.substring(41 + i, 44 + i), 10);
			minele = parseInt(redata.substring(44 + i, 47 + i), 10);
			maxvol = parseInt(redata.substring(47 + i, 50 + i), 10);
			minvol = parseInt(redata.substring(50 + i, 53 + i), 10);
			if (symbol == 0) {
				elecurve();
				volcurve();
				symbol++;
			}
			$("#r13").html((maxele + minele) / 2);
			$("#r14").html((maxvol + minvol) / 2);
			$("#c1").html(parseInt(redata.substring(12 + i, 16 + i), 10));
			$("#c2").html((parseInt(redata.substring(16 + i, 20 + i), 10) / 10).toFixed(1));
			/*document.getElementById("in5").value=(maxele+minele)/2;
			document.getElementById("in6").value=(maxvol+minvol)/2;
			document.getElementById("in7").value=parseInt(redata.substring(12+i, 16+i),10);
			document.getElementById("in8").value=parseFloat((parseInt(redata.substring(16+i, 20+i),10)/10).toFixed(2));*/
			for (var k = 0; k < welderName.length; k++) {
				if (welderName[k].fid == parseInt(redata.substring(8 + i, 12 + i))) {
					/*document.getElementById("in13").value=welderName[k].fwelder_no;*/
					$("#l4").html(welderName[k].fwelder_no);
				}
			}
			for (var t = 0; t < taskNum.length; t++) {
				if (taskNum[t].id == parseInt(redata.substring(69 + i, 77 + i))) {
					$("#l3").html(taskNum[t].weldedJunctionno);
				/*document.getElementById("in14").value=taskNum[t].weldedJunctionno;*/
				}
			}
			/*document.getElementById("in11").value=redata.substring(53+i, 61+i);
			document.getElementById("in12").value=redata.substring(61+i, 69+i);*/
			$("#l2").html(worktime.machineno);
			if (time.length != 0 && z < time.length) {
				var mstatus = redata.substring(0 + i, 2 + i);
				switch (mstatus) {
				case "00":
					$("#l5").val("待机");
					$("#l5").css("background-color", "#55a7f3");
					$("#mrjpg").attr("src", "resources/images/welder_02.png");
					break;
				case "01":
					$("#l5").val("E-010 焊枪开关OFF等待");
					$("#l5").css("background-color", "#fe0002");
					$("#mrjpg").attr("src", "resources/images/welder_03.png");
					break;
				case "02":
					$("#l5").val("E-000工作停止");
					$("#l5").css("background-color", "#fe0002");
					$("#mrjpg").attr("src", "resources/images/welder_03.png");
					break;
				case "03":
					$("#l5").val("焊接");
					$("#l5").css("background-color", "#7cbc16");
					$("#mrjpg").attr("src", "resources/images/welder_01.png");
					break;
				case "04":
					$("#l5").val("电流过低");
					$("#l5").css("background-color", "#fe0002");
					$("#mrjpg").attr("src", "resources/images/welder_03.png");
					break;
				case "05":
					$("#l5").val("收弧");
					$("#l5").css("background-color", "#7cbc16");
					$("#mrjpg").attr("src", "resources/images/welder_01.png");
					break;
				case "06":
					$("#l5").val("电流过高");
					$("#l5").css("background-color", "#fe0002");
					$("#mrjpg").attr("src", "resources/images/welder_03.png");
					break;
				case "07":
					$("#l5").val("启弧");
					$("#l5").css("background-color", "#7cbc16");
					$("#mrjpg").attr("src", "resources/images/welder_01.png");
					break;
				case "08":
					$("#l5").val("电压过低");
					$("#l5").css("background-color", "#fe0002");
					$("#mrjpg").attr("src", "resources/images/welder_03.png");
					break;
				case "09":
					$("#l5").val("电压过高");
					$("#l5").css("background-color", "#fe0002");
					$("#mrjpg").attr("src", "resources/images/welder_03.png");
					break;
				case "10":
					$("#l5").val("E-100控制电源异常");
					$("#l5").css("background-color", "#fe0002");
					$("#mrjpg").attr("src", "resources/images/welder_03.png");
					break;
				case "15":
					$("#l5").val("E-150一次输入电压过高");
					$("#l5").css("background-color", "#fe0002");
					$("#mrjpg").attr("src", "resources/images/welder_03.png");
					break;
				case "16":
					$("#l5").val("E-160一次输入电压过低");
					$("#l5").css("background-color", "#fe0002");
					$("#mrjpg").attr("src", "resources/images/welder_03.png");
					break;
				case "20":
					$("#l5").val("E-200一次二次电流检出异常");
					$("#l5").css("background-color", "#fe0002");
					$("#mrjpg").attr("src", "resources/images/welder_03.png");
					break;
				case "21":
					$("#l5").val("E-210电压检出异常");
					$("#l5").css("background-color", "#fe0002");
					$("#mrjpg").attr("src", "resources/images/welder_03.png");
					break;
				case "22":
					$("#l5").val("E-220逆变电路反馈异常");
					$("#l5").css("background-color", "#fe0002");
					$("#mrjpg").attr("src", "resources/images/welder_03.png");
					break;
				case "30":
					$("#l5").val("E-300温度异常");
					$("#l5").css("background-color", "#fe0002");
					$("#mrjpg").attr("src", "resources/images/welder_03.png");
					break;
				case "70":
					$("#l5").val("E-700输出过流异常");
					$("#l5").css("background-color", "#fe0002");
					$("#mrjpg").attr("src", "resources/images/welder_03.png");
					break;
				case "71":
					$("#l5").val("E-710输入缺相异常");
					$("#l5").css("background-color", "#fe0002");
					$("#mrjpg").attr("src", "resources/images/welder_03.png");
					break;
				}
				var x = time[z],
					y = ele[z],
					v = vol[z];
				if (z == 0) {
					series.addPoint([ x, y ], true, true);
					activeLastPointToolip(chart);
					series1.addPoint([ x, v ], true, true);
					activeLastPointToolip1(chart1);

				} else {
					if (x > time[z - 1]) {
						series.addPoint([ x, y ], true, true);
						activeLastPointToolip(chart);
						series1.addPoint([ x, v ], true, true);
						activeLastPointToolip1(chart1);
					}
				}
			}
		}
		//				}
		z++;
	}
	;
	if ((time.length) % 3 == 1) {
		ele[time.length] = ele[time.length - 1];
		ele[time.length + 1] = ele[time.length - 1];
		vol[time.length] = vol[time.length - 1];
		vol[time.length + 1] = vol[time.length - 1];
		time[time.length] = time[time.length - 1] + 1000;
		time[time.length + 1] = time[time.length - 1] + 2000;
	}
	if (time.length % 3 == 2) {
		ele[time.length] = ele[time.length - 1];
		vol[time.length] = vol[time.length - 1];
		time[time.length] = time[time.length - 1] + 1000;
	}
}

//监听窗口大小变化
window.onresize = function() {
	setTimeout(domresize, 500);
}

//改变表格高宽
function domresize() {
	$("#dg").datagrid('resize', {
		height : $("#body").height(),
		width : $("#body").width()
	});
	var livewidth = $("body").width() * 0.9;
	var liveheight = ($("body").height()-250) / 2;
	$("#body31").width(livewidth);
	$("#body31").height(liveheight);
	$("#body32").width(livewidth);
	$("#body32").height(liveheight);
	$('#body31').highcharts().reflow();
	$('#body32').highcharts().reflow();
}


function activeLastPointToolip(chart) {
	var points = chart.series[0].points;
	chart.yAxis[0].removePlotLine('plot-line-0');
	chart.yAxis[0].removePlotLine('plot-line-1');
	chart.yAxis[0].removePlotLine('plot-line-2');
	/*  		    chart.tooltip.refresh(points[points.length -1]);
	  		    chart.tooltip.refresh(points1[points1.length -1]);*/
	chart.yAxis[0].addPlotLine({ //在y轴上增加 
		value : maxele, //在值为2的地方 
		width : 2, //标示线的宽度为2px 
		color : 'red', //标示线的颜色 
		dashStyle : 'longdashdot',
		id : 'plot-line-1', //标示线的id，在删除该标示线的时候需要该id标示 });
		label : {
			text : '最高电流', //标签的内容
			align : 'center', //标签的水平位置，水平居左,默认是水平居中center
			x : 10 //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
		}
	});
	chart.yAxis[0].addPlotLine({ //在y轴上增加 
		value : minele, //在值为2的地方 
		width : 2, //标示线的宽度为2px 
		color : 'red', //标示线的颜色 
		dashStyle : 'longdashdot',
		id : 'plot-line-2', //标示线的id，在删除该标示线的时候需要该id标示 });
		label : {
			text : '最低电流', //标签的内容
			align : 'center', //标签的水平位置，水平居左,默认是水平居中center
			x : 10 //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
		}
	})
	chart.yAxis[0].addPlotLine({ //在y轴上增加 
		value : (minele + maxele) / 2, //在值为2的地方 
		width : 2, //标示线的宽度为2px 
		color : 'red', //标示线的颜色 
		dashStyle : 'longdashdot',
		id : 'plot-line-0', //标示线的id，在删除该标示线的时候需要该id标示 });
		label : {
			text : '预置电流', //标签的内容
			align : 'center', //标签的水平位置，水平居左,默认是水平居中center
			x : 10 //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
		}
	})
}

function activeLastPointToolip1(chart) {
	var points = chart.series[0].points;
	chart.yAxis[0].removePlotLine('plot-line-3');
	chart.yAxis[0].removePlotLine('plot-line-4');
	chart.yAxis[0].removePlotLine('plot-line-5');
	/*  		    chart.tooltip.refresh(points[points.length -1]);
	  		    chart.tooltip.refresh(points1[points1.length -1]);*/
	chart.yAxis[0].addPlotLine({ //在y轴上增加 
		value : maxvol, //在值为2的地方 
		width : 2, //标示线的宽度为2px 
		color : 'black', //标示线的颜色 
		dashStyle : 'longdashdot',
		id : 'plot-line-3', //标示线的id，在删除该标示线的时候需要该id标示 });
		label : {
			text : '最高电压', //标签的内容
			align : 'center', //标签的水平位置，水平居左,默认是水平居中center
			x : 10
		}
	})
	chart.yAxis[0].addPlotLine({ //在y轴上增加 
		value : minvol, //在值为2的地方 
		width : 2, //标示线的宽度为2px 
		color : 'black', //标示线的颜色 
		dashStyle : 'longdashdot',
		id : 'plot-line-4', //标示线的id，在删除该标示线的时候需要该id标示 });
		label : {
			text : '最低电压', //标签的内容
			align : 'center', //标签的水平位置，水平居左,默认是水平居中center
			x : 10 //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
		}
	})
	chart.yAxis[0].addPlotLine({ //在y轴上增加 
		value : (minvol + maxvol) / 2, //在值为2的地方 
		width : 2, //标示线的宽度为2px 
		color : 'black', //标示线的颜色 
		dashStyle : 'longdashdot',
		id : 'plot-line-5', //标示线的id，在删除该标示线的时候需要该id标示 });
		label : {
			text : '预置电压', //标签的内容
			align : 'center', //标签的水平位置，水平居左,默认是水平居中center
			x : 10 //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
		}
	})
}


setInterval(function(){
	if($("#l5").val()!="关机"){
	    var t1 = secondToDate(time1);
	    $("#r3").html(t1);
	}
	if($("#l5").val()!="关机" && $("#l5").val()!="待机"){
	    var t2 = secondToDate(time2);
	    $("#r4").html(t2);
	}
    time1++;
    time2++;
},1000)
function secondToDate(result) {
	var h = Math.floor(result / 3600) < 10 ? '0' + Math.floor(result / 3600) : Math.floor(result / 3600);
	var m = Math.floor((result / 60 % 60)) < 10 ? '0' + Math.floor((result / 60 % 60)) : Math.floor((result / 60 % 60));
	var s = Math.floor((result % 60)) < 10 ? '0' + Math.floor((result % 60)) : Math.floor((result % 60));
	return result = h + ":" + m + ":" + s;
}